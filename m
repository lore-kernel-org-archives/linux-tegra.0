From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] regulator: Fix deadlock during regulator registration
Date: Wed, 30 Mar 2016 17:09:13 +0100
Message-ID: <1459354153-6352-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Commit 5e3ca2b349b1 ("regulator: Try to resolve regulators supplies on
registration") added a call to regulator_resolve_supply() within
regulator_register() where the regulator_list_mutex is held. This causes
the following deadlock to occur on the Tegra114 Dalmore board when the
palmas PMIC is registered because regulator_register_resolve_supply()
calls regulator_dev_lookup() which may try to acquire the
regulator_list_mutex again.

 INFO: task swapper/0:1 blocked for more than 120 seconds.
 Not tainted 4.6.0-rc1-00001-g5e3ca2b-dirty #290
 "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
 swapper/0 D c07daeac 0 1 0 0x00000000
 [<c07daeac>] (__schedule) from [<c07db454>] (schedule+0x50/0xc0)
 [<c07db454>] (schedule) from [<c07db6b0>] (schedule_preempt_disabled+0x24/0x40)
 [<c07db6b0>] (schedule_preempt_disabled) from [<c07ddd48>] (__mutex_lock_slowpath+0x17c/0x3e4)
 [<c07ddd48>] (__mutex_lock_slowpath) from [<c07ddfbc>] (mutex_lock+0xc/0x24)
 [<c07ddfbc>] (mutex_lock) from [<c03ab5f0>] (regulator_dev_lookup+0x130/0x208)
 [<c03ab5f0>] (regulator_dev_lookup) from [<c03aedd0>] (regulator_resolve_supply+0x94/0x2bc)
 [<c03aedd0>] (regulator_resolve_supply) from [<c04364e4>] (class_for_each_device+0x54/0xa8)
 [<c04364e4>] (class_for_each_device) from [<c03ae0a4>] (regulator_register+0x8cc/0xd10)
 [<c03ae0a4>] (regulator_register) from [<c03b0000>] (devm_regulator_register+0x40/0x74)
 [<c03b0000>] (devm_regulator_register) from [<c03b2ef0>] (palmas_smps_registration+0x254/0x3fc)
 [<c03b2ef0>] (palmas_smps_registration) from [<c03b3400>] (palmas_regulators_probe+0x368/0x424)
 [<c03b3400>] (palmas_regulators_probe) from [<c0436b1c>] (platform_drv_probe+0x50/0xb0)
 [<c0436b1c>] (platform_drv_probe) from [<c0435548>] (driver_probe_device+0x1f4/0x2b0)
 [<c0435548>] (driver_probe_device) from [<c0433ad0>] (bus_for_each_drv+0x44/0x8c)
 [<c0433ad0>] (bus_for_each_drv) from [<c04352cc>] (__device_attach+0x9c/0x100)
 [<c04352cc>] (__device_attach) from [<c0434958>] (bus_probe_device+0x84/0x8c)
 [<c0434958>] (bus_probe_device) from [<c0432e88>] (device_add+0x33c/0x524)
 [<c0432e88>] (device_add) from [<c05b1e48>] (of_platform_device_create_pdata+0x80/0xc4)
 [<c05b1e48>] (of_platform_device_create_pdata) from [<c05b1f5c>] (of_platform_bus_create+0xd0/0x2dc)
 [<c05b1f5c>] (of_platform_bus_create) from [<c05b21c4>] (of_platform_populate+0x5c/0xac)
 [<c05b21c4>] (of_platform_populate) from [<c04596fc>] (palmas_i2c_probe+0x324/0x580)
 [<c04596fc>] (palmas_i2c_probe) from [<c054ae1c>] (i2c_device_probe+0x140/0x1d0)
 [<c054ae1c>] (i2c_device_probe) from [<c0435548>] (driver_probe_device+0x1f4/0x2b0)
 [<c0435548>] (driver_probe_device) from [<c0433ad0>] (bus_for_each_drv+0x44/0x8c)
 [<c0433ad0>] (bus_for_each_drv) from [<c04352cc>] (__device_attach+0x9c/0x100)
 [<c04352cc>] (__device_attach) from [<c0434958>] (bus_probe_device+0x84/0x8c)
 [<c0434958>] (bus_probe_device) from [<c0432e88>] (device_add+0x33c/0x524)
 [<c0432e88>] (device_add) from [<c054b814>] (i2c_new_device+0x14c/0x184)
 [<c054b814>] (i2c_new_device) from [<c054bd0c>] (i2c_register_adapter+0x248/0x46c)
 [<c054bd0c>] (i2c_register_adapter) from [<c054fca0>] (tegra_i2c_probe+0x2d8/0x3bc)
 [<c054fca0>] (tegra_i2c_probe) from [<c0436b1c>] (platform_drv_probe+0x50/0xb0)
 [<c0436b1c>] (platform_drv_probe) from [<c0435548>] (driver_probe_device+0x1f4/0x2b0)
 [<c0435548>] (driver_probe_device) from [<c04356b0>] (__driver_attach+0xac/0xb0)
 [<c04356b0>] (__driver_attach) from [<c0433b6c>] (bus_for_each_dev+0x54/0x88)
 [<c0433b6c>] (bus_for_each_dev) from [<c0434b3c>] (bus_add_driver+0xe8/0x1f4)
 [<c0434b3c>] (bus_add_driver) from [<c0435eac>] (driver_register+0x78/0xf4)
 [<c0435eac>] (driver_register) from [<c0101768>] (do_one_initcall+0x84/0x1d4)
 [<c0101768>] (do_one_initcall) from [<c0b00d90>] (kernel_init_freeable+0x11c/0x1e8)
 [<c0b00d90>] (kernel_init_freeable) from [<c07d9350>] (kernel_init+0x8/0x118)
 [<c07d9350>] (kernel_init) from [<c0107938>] (ret_from_fork+0x14/0x3c)

Fix this by releasing the mutex before calling
regulator_register_resolve_supply() and update the error exit path to
ensure the mutex is released on an error.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---

Mark, please confirm if it is ok to move the call to release the mutex
before calling regulator_register_resolve_supply().

 drivers/regulator/core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 74e8a7a3b3e8..2786d251b1cc 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -4000,12 +4000,11 @@ regulator_register(const struct regulator_desc *regulator_desc,
 	}
 
 	rdev_init_debugfs(rdev);
+	mutex_unlock(&regulator_list_mutex);
 
 	/* try to resolve regulators supply since a new one was registered */
 	class_for_each_device(&regulator_class, NULL, NULL,
 			      regulator_register_resolve_supply);
-out:
-	mutex_unlock(&regulator_list_mutex);
 	kfree(config);
 	return rdev;
 
@@ -4016,15 +4015,16 @@ scrub:
 	regulator_ena_gpio_free(rdev);
 	device_unregister(&rdev->dev);
 	/* device core frees rdev */
-	rdev = ERR_PTR(ret);
 	goto out;
 
 wash:
 	regulator_ena_gpio_free(rdev);
 clean:
 	kfree(rdev);
-	rdev = ERR_PTR(ret);
-	goto out;
+out:
+	mutex_unlock(&regulator_list_mutex);
+	kfree(config);
+	return ERR_PTR(ret);
 }
 EXPORT_SYMBOL_GPL(regulator_register);
 
-- 
2.1.4
