--


INSERT INTO `oc_modification` (`name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
('İyzico Checkout Form', 'iyzico_checkout_form', 'hello@kahvedigital.com', '2.3.0.1', 'http://kahvedigital.com/', '<modification>\n	<id></id>\n	<name>İyzico Checkout Form</name>\n	<code>iyzico_checkout_form</code>\n	<version>2.3.0.1</version>\n	<author>hello@kahvedigital.com</author>\n	<link>http://kahvedigital.com</link>\n	<file path="admin/controller/common/header.php">\n		<operation>\n			<search  index="0"><![CDATA[getStores(]]></search>\n			<add position="before"><![CDATA[	   \n			$this->load->language(\'extension/payment/iyzico_checkout_form\');\n            $this->load->model(\'extension/payment/iyzico_checkout_form\');\n			$iyzico_version = "2.3.0.1";\n            $versionCheck = $this->model_extension_payment_iyzico_checkout_form->versionCheck(VERSION, $iyzico_version);\n\n            if (!empty($versionCheck[\'version_status\']) AND $versionCheck[\'version_status\'] == \'1\') {\n                $data[\'error_version\'] = $this->language->get(\'entry_error_version\');\n				$data[\'alerts\']= 1;\n				$data[\'version_status\']= $versionCheck[\'version_status\'];\n                $data[\'iyzico_or_text\'] = $this->language->get(\'entry_iyzico_or_text\');\n                $data[\'iyzico_update_button\'] = $this->language->get(\'entry_iyzico_update_button\');\n                $version_updatable = $versionCheck[\'new_version_id\'];\n                $data[\'version_update_link\'] = $this->url->link(\'extension/payment/iyzico_checkout_form/update\', \'token=\' . $this->session->data[\'token\'] . "&version=$version_updatable", true);\n            }                \n]]></add>\n		</operation>\n	</file>\n	\n<file path="admin/view/template/common/header.tpl">\n		<operation>\n			<search  index="0"><![CDATA[<ul class="nav pull-right">]]></search>\n			<add position="after"><![CDATA[\n                  <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown"><?php if($version_status > 0) { ?><span class="label label-danger pull-left"><?php echo $version_status; ?></span><?php } ?> <i class="fa fa-bell fa-lg"></i></a>\n	   <ul class="dropdown-menu dropdown-menu-right alerts-dropdown">\n	    <li class="dropdown-header"><?php echo $error_version ?><a href=\'<?php echo $version_update_link ?>\'><?php echo $iyzico_update_button ?></a><?php echo $iyzico_or_text ?></li>\n	   </ul>\n	   \n	</li>\n                   \n]]></add>\n		</operation>\n	</file>\n	\n	\n</modification>', 1, now());
