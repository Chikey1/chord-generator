/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 1);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */,
/* 1 */
/*!**********************************************!*\
  !*** ./app/javascript/packs/hello_react.jsx ***!
  \**********************************************/
/*! dynamic exports provided */
/*! all exports used */
/***/ (function(module, exports) {

throw new Error("Module build failed: ReferenceError: [BABEL] /Users/saraqi/chord_generator/app/javascript/packs/hello_react.jsx: Unknown option: /Users/saraqi/chord_generator/node_modules/react/index.js.Children. Check out http://babeljs.io/docs/usage/options/ for more information about options.\n\nA common cause of this error is the presence of a configuration options object without the corresponding preset name. Example:\n\nInvalid:\n  `{ presets: [{option: value}] }`\nValid:\n  `{ presets: [['presetName', {option: value}]] }`\n\nFor more detailed information on preset configuration, please see https://babeljs.io/docs/en/plugins#pluginpresets-options. (While processing preset: \"/Users/saraqi/chord_generator/node_modules/react/index.js\")\n    at Logger.error (/Users/saraqi/chord_generator/node_modules/babel-core/lib/transformation/file/logger.js:41:11)\n    at OptionManager.mergeOptions (/Users/saraqi/chord_generator/node_modules/babel-core/lib/transformation/file/options/option-manager.js:226:20)\n    at /Users/saraqi/chord_generator/node_modules/babel-core/lib/transformation/file/options/option-manager.js:265:14\n    at /Users/saraqi/chord_generator/node_modules/babel-core/lib/transformation/file/options/option-manager.js:323:22\n    at Array.map (<anonymous>)\n    at OptionManager.resolvePresets (/Users/saraqi/chord_generator/node_modules/babel-core/lib/transformation/file/options/option-manager.js:275:20)\n    at OptionManager.mergePresets (/Users/saraqi/chord_generator/node_modules/babel-core/lib/transformation/file/options/option-manager.js:264:10)\n    at OptionManager.mergeOptions (/Users/saraqi/chord_generator/node_modules/babel-core/lib/transformation/file/options/option-manager.js:249:14)\n    at OptionManager.init (/Users/saraqi/chord_generator/node_modules/babel-core/lib/transformation/file/options/option-manager.js:368:12)\n    at File.initOptions (/Users/saraqi/chord_generator/node_modules/babel-core/lib/transformation/file/index.js:212:65)\n    at new File (/Users/saraqi/chord_generator/node_modules/babel-core/lib/transformation/file/index.js:135:24)\n    at Pipeline.transform (/Users/saraqi/chord_generator/node_modules/babel-core/lib/transformation/pipeline.js:46:16)\n    at transpile (/Users/saraqi/chord_generator/node_modules/babel-loader/lib/index.js:50:20)\n    at /Users/saraqi/chord_generator/node_modules/babel-loader/lib/fs-cache.js:118:18\n    at ReadFileContext.callback (/Users/saraqi/chord_generator/node_modules/babel-loader/lib/fs-cache.js:31:21)\n    at FSReqWrap.readFileAfterOpen [as oncomplete] (fs.js:420:13)");

/***/ })
/******/ ]);
//# sourceMappingURL=hello_react-b836cc9b95813919e881.js.map