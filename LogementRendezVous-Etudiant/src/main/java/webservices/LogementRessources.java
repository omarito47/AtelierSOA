package webservices;

import entities.Logement;
import metiers.LogementBusiness;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;

@Path("/logement")
public class LogementRessources {
    static LogementBusiness help = new LogementBusiness();
    @GET
    @Path("/getAll")
    @Produces(MediaType.APPLICATION_JSON)
    public Response  getAll(){
        return Response.

                status(200).header("Access-Control-Allow-Origin", "*").
                entity(help.getLogements()).
                build();
    }
    @POST
    @Path("/Add")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public boolean addLogement(Logement logement) {
        return help.addLogement(logement);
    }
    @GET
    @Path("/getByID/{reference}")
    @Produces(MediaType.APPLICATION_JSON)
    public Logement getLogementsByReference(@PathParam("reference") int reference) {
        return help.getLogementsByReference(reference);
    }
//
//    public List<Logement> getLogementsByDeleguation(String deleguation) {
//        return help.getLogementsByDeleguation(deleguation);
//    }
//
@DELETE
@Path("/delete/{reference}")
@Produces(MediaType.APPLICATION_JSON)
    public boolean deleteLogement(@PathParam("reference") int reference) {
        return help.deleteLogement(reference);
    }
    @PUT
    @Path("/Put/{ref}")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public boolean updateLogement(@PathParam("ref") int reference, Logement logement) {
        return help.updateLogement(reference, logement);
    }
//
//    public List<Logement> getLogements() {
//        return help.getLogements();
//    }
//
//    public void setLogements(List<Logement> logements) {
//        help.setLogements(logements);
//    }
//
//    public List<Logement> getLogementsListeByref(int reference) {
//        return help.getLogementsListeByref(reference);
//    }
}
