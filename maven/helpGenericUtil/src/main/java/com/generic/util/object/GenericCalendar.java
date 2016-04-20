package com.generic.util.object;

import java.security.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author Miguel Rodrigo Pazo Sánchez (http://miguelpazo.com/)
 */
public class GenericCalendar extends Calendar {

    private long tiempo;
    private String formatStandar = "dd/MM/yyyy hh:mm:ss";

    GenericCalendar(long tiempo) {
        this.setTiempo(tiempo);
        this.tiempo = tiempo;
    }

    public static GenericCalendar getInstance() {
        return new GenericCalendar();

    }

    public static GenericCalendar getInstance(long tiempo) {
        GenericCalendar calendar = new GenericCalendar(tiempo);
        calendar.setTime(new Date(tiempo));

        return calendar;
    }

    private GenericCalendar() {
        this.setTime(Calendar.getInstance().getTime());

    }

    public void setLocalDate(LocalDate olDate) {
        Date date = Date.from(olDate.atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
        this.setTime(date);
    }

    public LocalDate getLocalDate() {
        Date date = this.getTime();
        return Instant.ofEpochMilli(date.getTime()).atZone(ZoneId.systemDefault()).toLocalDate();
    }

    /**
     *
     * @param time String to set Calendar
     * @param format Input string Calendar format
     * @throws Exception
     */
    public void setFromString(String time, String format) throws Exception {
        DateFormat df = null;
        Calendar cal = Calendar.getInstance();
        df = new SimpleDateFormat(format);
        this.setTime(df.parse(time));
    }

    /**
     *
     * @param timestamp Object to convert
     * @param format Format to string result
     * @return timestamp convert to Date format
     */
    public String convertTimestampToString(Timestamp timestamp, String format) throws Exception {
        DateFormat df = new SimpleDateFormat(format);
        String string = df.format(timestamp);

        return string;
    }

    /**
     *
     * @param format Format to convert this Calendar object
     * @return this object converted to String with input format
     */
    public String toString(String format) throws Exception {
        DateFormat df = new SimpleDateFormat(format);
        String dateString = df.format(this.getTime());

        return dateString;
    }

    /**
     * @param date1 OnpeCalendar
     * @param date2 OnpeCalendar
     * @return
     */
    public int setCompareTo(GenericCalendar date1, GenericCalendar date2) throws Exception {    

        if (date2.equals(GenericCalendar.getInstance(0))) {

            String fechaSis = date1.toString("dd/MM/yyyy");
            String fechaBas = date2.toString("dd/MM/yyyy");

            if (fechaSis.equals(fechaBas)) {
                return 0;
            } else {
                return 1;
            }

        } else {
            if (date1.toString().equals(date2.toString())) {
                return 0;
            } else {
                return 1;
            }
        }

    }

    /**
     *
     * @return Calendar to String in format: dd/MM/yyyy
     */
    @Override
    public String toString() {
        String dateString = null;

        try {
            dateString = this.toString(formatStandar);
        } finally {
            return dateString;
        }
    }

    @Override
    protected void computeTime() {

    }

    @Override
    protected void computeFields() {

    }

    @Override
    public void add(int field, int amount) {

    }

    @Override
    public void roll(int field, boolean up) {

    }

    @Override
    public int getMinimum(int field) {
        return 0;
    }

    @Override
    public int getMaximum(int field) {
        return 0;
    }

    @Override
    public int getGreatestMinimum(int field) {
        return 0;
    }

    @Override
    public int getLeastMaximum(int field) {
        return 0;
    }

    public long getTiempo() {
        return tiempo;
    }

    public void setTiempo(long tiempo) {
        this.tiempo = tiempo;
    }

}
