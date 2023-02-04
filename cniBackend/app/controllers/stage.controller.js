const db = require("../models");
const Stage = db.stages;

// Create and Save a new Stage
exports.create = (req, res) => {
  // Validate request
  if (!req.body.type) {
    res.status(400).send({
      message: "Content can not be empty!"
    });
    return;
  }

  // Create a Stage
  const stage = {
    type: req.body.type,
    sujet: req.body.sujet,
    encadrant: req.body.encadrant,
    dateDep: req.body.dateDep,
    dateFin: req.body.dateFin,
    payer: req.body.payer,
    status: false,
    userId: req.body.userId
  };

  // Save Stage in the database
  Stage.create(stage)
    .then(data => {
      res.send(data);
    })
    .catch(err => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while creating the Stage."
      });
    });
};

// Retrieve all Stages from the database.
exports.findAll = (req, res) => {

  Stage.findAll()
    .then(data => {
      res.send(data);
    })
    .catch(err => {
      res.status(500).send({
        message:
          err.message || "Some error occurred while retrieving Stages."
      });
    });
};



// Update a Stage by the id in the request
exports.update = (req, res) => {
  const id = req.params.id;

  Stage.update(req.body, {
    where: { id: id }
  })
    .then(num => {
      if (num == 1) {
        res.send({
          message: "Stage was updated successfully."
        });
      } else {
        res.send({
          message: `Cannot update Stage with id=${id}. Maybe Stage was not found or req.body is empty!`
        });
      }
    })
    .catch(err => {
      res.status(500).send({
        message: "Error updating Stage with id=" + id
      });
    });
};

