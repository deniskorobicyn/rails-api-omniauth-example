import { 
  Button, 
  ButtonGroup, 
  Row, 
  Loading, 
  MessageBox, 
  Message, 
  Notification, 
  Submenu,
  Menu, 
  MenuItem, 
  MenuItemGroup 
} from 'element-ui'
import lang from 'element-ui/lib/locale/lang/ko'
import locale from 'element-ui/lib/locale'
import 'element-ui/lib/theme-chalk/index.css';

const components = [
  Button,
  ButtonGroup,
  Row,
  Menu,
  Submenu,
  MenuItem,
  MenuItemGroup,
]

const install = function (Vue) {
  if (install.installed) return;
  locale.use(lang)
  components.map(component => {
    Vue.component(component.name, component);
  })

  Vue.use(Loading.directive);
  Vue.prototype.$msgbox = MessageBox;
  Vue.prototype.$alert = MessageBox.alert;
  Vue.prototype.$prompt = MessageBox.prompt;
  Vue.prototype.$confirm = MessageBox.confirm;
  Vue.prototype.$message = Message;
  Vue.prototype.$loading = Loading.service;
  Vue.prototype.$notify = Notification;
}

export default { install };