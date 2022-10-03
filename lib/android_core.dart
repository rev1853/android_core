library android_core;

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:uuid/uuid.dart';

part './core/api/contract.dart';
part './core/api/fetcher.dart';
part './core/api/handler.dart';
part './core/api/model.dart';
part './core/api/service.dart';

part './core/core_bootstrap.dart';

part './core/helpers/booter.dart';
part './core/helpers/env.dart';
part './core/helpers/local_storage.dart';

part './core/routing/page_route.dart';

part './core/states/controller.dart';
part './core/states/property.dart';
part './core/states/data_source.dart';
part './core/states/form_source.dart';
part './core/states/listener.dart';
part './core/states/update_form_source.dart';

part './core/view/view.dart';
part './core/view/view_navigator.dart';
