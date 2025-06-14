package webservices;

import entities.RendezVous;
import metiers.RendezVousBusiness;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import java.util.List;
@Path("/rendezvous")
public class RendezVousRessources {
    static RendezVousBusiness business = new RendezVousBusiness();
    @POST
    @Path("/Add")
    @Produces(MediaType.APPLICATION_JSON)
    public static boolean addRendezVous(RendezVous rendezVous) {
        return business.addRendezVous(rendezVous);
    }

    public static void setListeRendezVous(List<RendezVous> listeRendezVous) {
        business.setListeRendezVous(listeRendezVous);
    }
    @DELETE
    @Path("/delete/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public static boolean deleteRendezVous(@PathParam("id") int id) {
        return business.deleteRendezVous(id);
    }
    @PUT
    @Path("/Put/{ref}")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public static boolean updateRendezVous(@PathParam("ref") int idRendezVous, RendezVous updatedRendezVous) {
        return business.updateRendezVous(idRendezVous, updatedRendezVous);
    }
    @GET
    @Path("/getAll")
    @Produces(MediaType.APPLICATION_JSON)
    public static List<RendezVous> getListeRendezVous() {
        return business.getListeRendezVous();
    }
    @GET
    @Path("/byLogRef/{id}")
    @Produces(MediaType.APPLICATION_JSON)

    public static List<RendezVous> getListeRendezVousByLogementReference(@PathParam("id") int reference) {
        return business.getListeRendezVousByLogementReference(reference);
    }
    @GET
    @Path("/getByID/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public static RendezVous getRendezVousById(@PathParam("id") int id) {
        return business.getRendezVousById(id);
    }

}
