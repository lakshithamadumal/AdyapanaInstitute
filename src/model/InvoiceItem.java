
package model;

public class InvoiceItem {
    private String InvoiceID;
    private String StudentName;
    private String TeacherName;
    private String SubjectName;
    private double Price;
    private String Month;

    /**
     * @return the InvoiceID
     */
    public String getInvoiceID() {
        return InvoiceID;
    }

    /**
     * @param InvoiceID the InvoiceID to set
     */
    public void setInvoiceID(String InvoiceID) {
        this.InvoiceID = InvoiceID;
    }

    /**
     * @return the StudentName
     */
    public String getStudentName() {
        return StudentName;
    }

    /**
     * @param StudentName the StudentName to set
     */
    public void setStudentName(String StudentName) {
        this.StudentName = StudentName;
    }

    /**
     * @return the TeacherName
     */
    public String getTeacherName() {
        return TeacherName;
    }

    /**
     * @param TeacherName the TeacherName to set
     */
    public void setTeacherName(String TeacherName) {
        this.TeacherName = TeacherName;
    }

    /**
     * @return the SubjectName
     */
    public String getSubjectName() {
        return SubjectName;
    }

    /**
     * @param SubjectName the SubjectName to set
     */
    public void setSubjectName(String SubjectName) {
        this.SubjectName = SubjectName;
    }

    /**
     * @return the Price
     */
    public double getPrice() {
        return Price;
    }

    /**
     * @param Price the Price to set
     */
    public void setPrice(double Price) {
        this.Price = Price;
    }

    /**
     * @return the Month
     */
    public String getMonth() {
        return Month;
    }

    /**
     * @param Month the Month to set
     */
    public void setMonth(String Month) {
        this.Month = Month;
    }

}
