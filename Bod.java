
package semestralnapraca;

public class Bod {
    double x;
    double y;
    double z;

    public Bod(double x, double y, double z){
        this.x = x;
        this.y = y;
        this.z = z;
    }

    public double vzdialenost(){
        return Math.sqrt((this.x * this.x)+(this.y * this.y)+(this.z * this.z));
    }
    
    public void vypis(){
        System.out.println(this.x + " " + this.y + " " + this.z);
    }
}