const express = require("express");
const router = express.Router();
const notificationController = require("../controllers/notificationController");
const login = require("../middleware/usuarios.middleware");

router.get('/', 
    login.required, 
    notificationController.notification
);

router.put('/:idnotifications', 
    login.required, 
    notificationController.updateNotifications);

module.exports = router;