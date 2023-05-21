package nhon.cnpm.it.service;

import nhon.cnpm.it.bean.Bus;
import nhon.cnpm.it.bean.Trip;
import nhon.cnpm.it.bean.Ve;
import nhon.cnpm.it.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class TripService {
    public TripService() {
    }

    private static TripService instance;

    public static TripService getInstance() {
        if (instance == null) {
            instance = new TripService();
        }
        return instance;
    }

    public List<Trip> getAllTrip() {
        List<Trip> trip = JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT id,startPoint, endPoint,placePoint,DATE(startTime) as startDate,TIME(startTime) as startTime, price FROM tuyenxe")
                        .mapToBean(Trip.class).stream()
                        .collect(Collectors.toList())
        );
        return trip;
    }

    public List<String> getAllChairInBus(String idBus) {
        List<String> list = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT chairCode FROM xe a JOIN maghe b ON a.id = b.id_xe WHERE b.id_xe = :idBus")
                        .bind("idBus", idBus)
                        .mapTo(String.class)
                        .list()
        );
        return list;
    }

    public String getIdBus(String idtuyen) {
        List<String> list = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT b.id_xe  FROM xe a JOIN tuyenxe b ON a.id = b.id_xe WHERE b.id=:idtuyen")
                        .bind("idtuyen", idtuyen)
                        .mapTo(String.class)
                        .list()
        );
        return list.get(0);
    }

    public Bus getBus(String id) {
        List<Bus> list = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT id, type, chairNumber as numberOfChair  FROM xe  WHERE id=:id")
                        .bind("id", id)
                        .mapToBean(Bus.class)
                        .list());
        return list.get(0);
    }

    public Trip getTrip(String id) {
        Trip t = null;
        List<Trip> list = getAllTrip();
        for (Trip trip : list) {
            if (id.equals(trip.getId()))
                t = trip;

        }
        return t;
    }

    public List<Ve> getlistChairCodeInCart() {
        List<Ve> list = JDBIConnector.get().withHandle(handle ->
                handle.createQuery("SELECT maghe , id_tuyen, id_xe FROM ve")
                        .mapToBean(Ve.class).list());
        return list;
    }

    public boolean checkCart(String maghe, String id_tuyen, String id_xe) {
        List<Ve> list = TripService.getInstance().getlistChairCodeInCart();
        for (Ve ve : list) {
            if (maghe.equals(ve.getMaghe()) && id_tuyen.equals(ve.getId_tuyen()) && id_xe.equals(ve.getId_xe())) {
                return false;
            }
            break;
        }
        return true;

    }

    public static void addVeToCart(String email, String phone, String chaircode, String name, String idTuyen, String idxe) {
        JDBIConnector.get().withHandle(handle -> {
            String sql = "INSERT INTO ve VALUES ( ?, ?, ?, ?, ?, ?)";
            return handle.createUpdate(sql)
                    .bind(0, email)
                    .bind(1, phone)
                    .bind(2, chaircode)
                    .bind(3, name)
                    .bind(4, idTuyen)
                    .bind(5, idxe)
                    .execute();
        });
    }

    public static void main(String[] args) {

        System.out.println(TripService.getInstance().checkCart("p009","tx007","xe001"));
    }


}
