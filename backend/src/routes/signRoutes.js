const routes = (app) => {
    //premiere route pour test
    app.route('/testEndpoint') 
    .get((req, res) =>
        res.send('demande GET avec succès')) //endpoint1

    .post((req, res) =>
        res.send('demande POST avec succès')); //endpoint2

    //deuxieme route de test
    app.route('/testEndpoint/:testId')
    .put((req, res) =>
        res.send('demande PUT avec succès')) //endpoint3

    .delete((req, res) => 
        res.send('demande DELETE avec succès')); //endpoint4
}

//acces depuis server.js
module.exports = routes;