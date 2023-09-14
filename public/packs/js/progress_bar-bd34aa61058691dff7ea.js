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
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
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
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/progress_bar.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/progress_bar.js":
/*!**********************************************!*\
  !*** ./app/javascript/packs/progress_bar.js ***!
  \**********************************************/
/*! no static exports found */
/***/ (function(module, exports) {

throw new Error("Module build failed (from ./node_modules/babel-loader/lib/index.js):\nSyntaxError: /home/alexandr/FitTracker/app/javascript/packs/progress_bar.js: Unexpected token, expected \",\" (13:14)\n\n  11 |     new bootstrap.ProgressBar(progressBar, {\n  12 |       animated: true,\n> 13 |       width: ${progress}%\n     |               ^\n  14 |     });\n  15 |   }\n  16 | });\n    at instantiate (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:63:32)\n    at constructor (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:358:12)\n    at Parser.raise (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:3255:19)\n    at Parser.unexpected (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:3285:16)\n    at Parser.expect (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:3627:28)\n    at Parser.parseObjectLike (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:11662:14)\n    at Parser.parseExprAtom (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:11182:23)\n    at Parser.parseExprSubscripts (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:10890:23)\n    at Parser.parseUpdate (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:10873:21)\n    at Parser.parseMaybeUnary (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:10849:23)\n    at Parser.parseMaybeUnaryOrPrivate (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:10687:61)\n    at Parser.parseExprOps (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:10692:23)\n    at Parser.parseMaybeConditional (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:10669:23)\n    at Parser.parseMaybeAssign (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:10630:21)\n    at /home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:10600:39\n    at Parser.allowInAnd (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:12280:12)\n    at Parser.parseMaybeAssignAllowIn (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:10600:17)\n    at Parser.parseExprListItem (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:12032:18)\n    at Parser.parseExprList (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:12004:22)\n    at Parser.parseNew (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:11587:25)\n    at Parser.parseNewOrNewTarget (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:11582:17)\n    at Parser.parseExprAtom (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:11191:21)\n    at Parser.parseExprSubscripts (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:10890:23)\n    at Parser.parseUpdate (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:10873:21)\n    at Parser.parseMaybeUnary (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:10849:23)\n    at Parser.parseMaybeUnaryOrPrivate (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:10687:61)\n    at Parser.parseExprOps (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:10692:23)\n    at Parser.parseMaybeConditional (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:10669:23)\n    at Parser.parseMaybeAssign (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:10630:21)\n    at Parser.parseExpressionBase (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:10584:23)\n    at /home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:10580:39\n    at Parser.allowInAnd (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:12275:16)\n    at Parser.parseExpression (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:10580:17)\n    at Parser.parseStatementContent (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:12733:23)\n    at Parser.parseStatementLike (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:12584:17)\n    at Parser.parseStatementListItem (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:12564:17)\n    at Parser.parseBlockOrModuleBlockBody (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:13185:61)\n    at Parser.parseBlockBody (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:13178:10)\n    at Parser.parseBlock (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:13166:10)\n    at Parser.parseStatementContent (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:12686:21)\n    at Parser.parseStatementLike (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:12584:17)\n    at Parser.parseStatementOrSloppyAnnexBFunctionDeclaration (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:12574:17)\n    at Parser.parseIfStatement (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:12985:28)\n    at Parser.parseStatementContent (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:12615:21)\n    at Parser.parseStatementLike (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:12584:17)\n    at Parser.parseStatementListItem (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:12564:17)\n    at Parser.parseBlockOrModuleBlockBody (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:13185:61)\n    at Parser.parseBlockBody (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:13178:10)\n    at Parser.parseBlock (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:13166:10)\n    at Parser.parseFunctionBody (/home/alexandr/FitTracker/node_modules/@babel/parser/lib/index.js:11947:24)");

/***/ })

/******/ });
//# sourceMappingURL=progress_bar-bd34aa61058691dff7ea.js.map