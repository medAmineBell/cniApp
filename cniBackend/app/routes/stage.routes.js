module.exports = app => {
  const stages = require("../controllers/stage.controller.js");

  var router = require("express").Router();

  // Create a new Tutorial
  router.post("/", stages.create);

  // Retrieve all stages
  router.get("/", stages.findAll);

  // Update a Tutorial with id
  router.put("/:id", stages.update);

  app.use('/api/stages', router);
};
