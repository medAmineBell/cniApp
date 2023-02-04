module.exports = app => {
  const students = require("../controllers/student.controller.js");

  var router = require("express").Router();

  // Create a new Tutorial
  router.post("/", students.create);

  // Retrieve all students
  router.get("/", students.findAll);

  // Update a Tutorial with id
  router.put("/:id", students.update);

  app.use('/api/students', router);
};
