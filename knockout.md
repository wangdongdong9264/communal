	##KO 依赖跟踪 如何工作的
	1. 当你声明一个依赖监控属性的时候，ko会立即调用执行函数并且获取初始化值
	2. 当你的执行函数运行时，ko会把所有的依赖属性（或者监控依赖属性）都记录到一个log列表里
	3. 执行函数结束以后，ko会向所有log里需要依赖到的对象进行订阅。订阅的collback函数是重新运行你的执行函数。然后再执行上面的第一步操作（并且注销不在使用的订阅）
	4. 最后ko会通知上游所有订阅它的订阅者，告诉他们我已经设置了一个新值



	>observable数组

		* observable 探测和相应一个对象的变化，
		* observableArray	探测和响应一个集合对象的变化

	>正确的引入顺序

		```
			<script type='text/javascript' src='jquery-1.4.2.min.js'></script>
			<script type='text/javascript' src='jquery-tmpl.js'></script>
			<script type='text/javascript' src='knockout-1.2.1.js'></script>			
		```


##绑定语法



	>说有的代码都需要添加

		```
			ko.applyBindings(viewModel);
		```


		```
			<div data-bind='html: details'></div>
			<script>
				var viewModel = {
					details: ko.observable()
				};
				viewModel.details("<em>for further details, view the report<a href='report.html'>here</a></em>");

				ko.applyBinding(viewModel);
			</script>
		```

	1. visble绑定

		>visib绑定到dom元素，使用该元素的hidden或visible状态取决于绑定的值

	2. text绑定

		>text绑定到dom元素上，使的该元素显示的文本值为你绑定的参数

	3. html绑定

		>html绑定到dom元素上，使的该元素显示的html值为你绑定的参数

	4. css绑定

		>css绑定是添加或删除一个或多个css Class 到dom上

	5. style绑定

		>style绑定是添加或删除一个或多个dom元素上的style值


	6. attr绑定

		>attr绑定提供了一种方式可以设置dom元素的任何属性



	7. click绑定

		>click绑定在dom元素上添加事件句柄以便元素点击的时候执行定义的js 代码


		```
			//阻止冒泡事件
			data-bind="clickBubble:false"
		```

	8. event绑定

		>event绑定在dom元素上添加指定的事件句柄以便触发的时候执行定义的js函数

			*　mouseBubble: false  阻止事件冒泡

			```
				<div data-bind="event: {mouseover: enableDetalis, mouseout: disabDetails}, mouseoverBubble: false"></div>
			```  	


	9. submit绑定

		>submit绑定在form表单上添加指定的事件句柄以便该from被提交的时候执行定义的js代码，只能用在from表单上

			* 当你在使用submit绑定的时候，ko会阻止from表单的默认动作。
			* 在输入框里输入回车时可以提交表单


	10. enable绑定

		>enable绑定使用dom元素只有在参数值为true的时候才能enabled.

	11. disable绑定

		>disable绑定使用dom元素只有在参数值为true的时候才disabled。

			* disbale绑定和enable绑定正好相反


	12. value绑定

		>value绑定是关联dom元素的值到view model的属性上。

			* 当用户编辑的表单控件的时候，view model对应的值会自动更新
			* 不要用在checkbox ,radio, button上 它们使用checked来读取或写入checked状态



	13. checked绑定

		>checked绑定是关联到checkable的form表单控件到view model


	14. options绑定

		>options绑定不能用于<select>之外的元素


	15. selectedOptions绑定

		>selectedOptions绑定用于控制multi-select列表已经被选择的元素，用在使用options绑定的<select>元素上

			*　控制single-select下拉菜单选择项，可以使用value


	16. uniqueName绑定

		>uniuqeName绑定确保所绑定的元素用一个非空的name属性




##模板绑定


	```
	<div data-bind="template: 'a'"></div>

    <script id="a" type="text/html">
            ${name} is ${age} year old
            <button data-bind="click: makeOlder">Make old</button>
    </script>
    <script>
        var viewModel = {
            name: ko.observable('wang'),
            age: ko.observable(24),
            makeOlder: function () {
                this.age(this.age() + 1);
            }
        };
        ko.applyBindings(viewModel);
    </script>


	```


##自定义绑定

	>添加子属性到ko.bindingHandlers来注册你的绑定

		*　没有必要把init 和 updata这两个callback都定义，你可以只定义其中的任意一个

	```
	<div data-bind="slideVisible: giftWrap, slideDuration:600">You have selected the option</div>
    <label><input type="checkbox" data-bind="checked: giftWrap" /> Gift wrap</label>


    <script>
        ko.bindingHandlers.slideVisible = {
            update: function (element, valueAccessor, allBindingsAccessor) {
                // 获取新的数据
                var value = valueAccessor(), allBindings = allBindingsAccessor();

                // Next, whether or not the supplied model property is observable, 得到当前值

                var valueUnwrapped = ko.utils.unwrapObservable(value);
                console.log(value);
                // Grab some more data from another binding property
                var duration = allBindings.slideDuration || 400;

                // 400ms is default duration unless otherwise specified

                // 操作dom

                if (valueUnwrapped == true)
                    $(element).slideDown(duration); // Make the element visible
                else
                    $(element).slideUp(duration);   // Make the element invisible
            }
        };
        var viewModel = {
            giftWrap: ko.observable(true)
        };
        ko.applyBindings(viewModel);
    </script>
	```



##转化View Model数据到JSON格式

	>ko提供了2个帮助函数

		＊ko.toJS	克隆你的view model对象，并且替换所有的observable对象为当前值，这样可以得到一个干净的和ko无关的数据copy
		* ko.toJSON	将view model对象转化成JSON字符串。原理是：先调在view model上调用ko.toJS,然后调用浏览器原生的JSON序列化器得到结果




##mapping 插件

	[下载 mapping 插件](https://github.com/SteveSanderson/knockout.mapping)






[knockout xmind](https://www.processon.com/view/571d945ce4b0794acbac1c54)


##其他

	>visual studio

	* CTRL + K, CTRL + C：注释选择的代码

	* CTRL + K, CTRL + U：取消对选择代码的注释

	* CTRL + M, CTRL + O：折叠代码定义

	* CTRL + M, CTRL + L：展开代码定义
