mongoose = require 'mongoose'
require('mongoose-long')(mongoose)
crudModelFactory = require '../crudModelFactory'

schemaFactory = (def) ->
  if def.options?
    _schema = new mongoose.Schema def.schemaDefinition, def.options
  else
    _schema = new mongoose.Schema def.schemaDefinition
  _schema

modelFactory = (def) ->
  if def.options?.collectionName?
    mongoose.model def.name, def.schema, def.options.collectionName
  else
    mongoose.model def.name, def.schema

module.exports =

  connect: (conf) ->
    port = parseInt conf.port

    opts =
      user: conf.username
      pass: conf.password

    mongoose.connect conf.host, conf.name, port, opts
    return

  crudFactory: crudModelFactory
  modelFactory: modelFactory
  schemaFactory: schemaFactory