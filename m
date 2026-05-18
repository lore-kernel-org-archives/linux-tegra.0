Received: from jpms-ob01-os7.noc.sony.co.jp (jpms-ob01-os7.noc.sony.co.jp [211.125.139.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786613815F3;
	Mon, 18 May 2026 10:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.139.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779099619; cv=none; b=cBKJKFlWe8bCNe4RZU84OJ6UthQ0EqmfXhm03fHcbeAXdJjPCvFrSZXQTZ0TQLCkD+Ro9pdjtdK/Gov5oeoMTIPJ7n4wROMgsN1sLxvgAH9jVx4wR/40/arW4YW0qQelERxqJNpvRrFt1CvTK6qdsESC84b/e6o3+xclvz5TVLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779099619; c=relaxed/simple;
	bh=7RmL7RpLDjTb7OFP3+8ENtJ07SYTLx3tLFTfJEYLdO0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ihRmT+1Nj4mLe3uYxiK44hTVWz6AKFQSKXM7a8b5WVzgM6+eIvVpO4G4Fhz2leCA60R42MorXqjxnhco27meOEOdkLqGbxffOey5X4fa9Wx3e868HDpoo8S3hfgQJH74vYK1SI+TytoQsNkrDNHUiWFmu0LvCYjaEWfncJLJkig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=uK7LWmqe; arc=none smtp.client-ip=211.125.139.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="uK7LWmqe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1779099617; x=1810635617;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=bMlxrlY09I0+URao4dl7KEWZ0T0fHCJmeuASJ1zvd4E=;
  b=uK7LWmqewV7Py95oXCFoq3MpT3SjtSK4sUmuukgeMs3plMRYShNrVgLa
   j4EwGl713tnkYz33mnLNE/dXsfCUAVI22oZeJJaKnJxDBh4a9YOhNwvMM
   azmFzRbJjDlatELomsCq4j5KNdjSrgaCXQqNV5z1QLOWP68laj59wIJZd
   TC7dI6kUQp/NRxAUFzJvO/yD6iOgARU5/o6Y1IgDyIiUVR/DIRcrfBiAt
   0v7qCbtQhAcVQDlKW95m5NL9nHzuQdgMFevdnbbCqoH0/p9zVf/ZAtBA/
   8kXLLe1MYc68oMh/a1KG9ZO9UGl5FTqWks9lQVSphKEwkXNPoQtlR25ob
   w==;
X-CSE-ConnectionGUID: 74JTESDIR5+hgo5Ntldugw==
X-CSE-MsgGUID: 4McWWwJJQEWLuMA3eTdPbw==
Received: from unknown (HELO jpmta-ob02-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::7])
  by jpms-ob01-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2026 19:20:06 +0900
X-CSE-ConnectionGUID: Gv+mPeDIQ3qMzddEJ2Zy3Q==
X-CSE-MsgGUID: KtoDGItcQg60rTP0IxeYBw==
X-IronPort-AV: E=Sophos;i="6.23,241,1770562800"; 
   d="scan'208";a="56041678"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:6b3e:119e])
  by jpmta-ob02-os7.noc.sony.co.jp with ESMTP; 18 May 2026 19:20:06 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Date: Mon, 18 May 2026 19:20:00 +0900
Subject: [PATCH v5 4/4] driver core: platform: set mod_name in driver
 registration
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260518-acpi_mod_name-v5-4-705ccc430885@sony.com>
References: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
In-Reply-To: <20260518-acpi_mod_name-v5-0-705ccc430885@sony.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
 Aaron Tomlin <atomlin@atomlin.com>, Mike Leach <mike.leach@arm.com>, 
 Leo Yan <leo.yan@arm.com>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Mike Leach <mike.leach@arm.com>
Cc: Rahul Bukte <rahul.bukte@sony.com>, 
 Shashank Balaji <shashank.mahadasyam@sony.com>, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 Daniel Palmer <daniel.palmer@sony.com>, Tim Bird <tim.bird@sony.com>, 
 linux-modules@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Sumit Gupta <sumitg@nvidia.com>
X-Mailer: b4 0.16-dev-3bfbc
X-Developer-Signature: v=1; a=openpgp-sha256; l=11357;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=7RmL7RpLDjTb7OFP3+8ENtJ07SYTLx3tLFTfJEYLdO0=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhiyu5xffV1gf+bPHiPeM3eu/YszJVzVnluxZKrNU5nWU3
 zRR5bikjlIWBjEuBlkxRZZSpepfe1cELek581oRZg4rE8gQBi5OAZiIAgcjw8eJjT+mqasuem79
 ujGncmqEVEpg/9NUWxXZHSyiu/58/cDwV+aHZ4/OBrmkm6u+3f4VMEF8SljrXPbSD62nL4f+1/w
 syQoA
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55

Pass KBUILD_MODNAME through the driver registration macro so that
the driver core can create the module symlink in sysfs for built-in
drivers, and fixup all callers.

The Rust platform adapter is updated to pass the module name through to the new
parameter.

Tested on qemu with:
- x86 defconfig + CONFIG_RUST
- arm64 defconfig + CONFIG_RUST + CONFIG_CORESIGHT stuff

Examples after this patch:

    /sys/bus/platform/drivers/...
        coresight-itnoc/module		-> coresight_tnoc
        coresight-static-tpdm/module	-> coresight_tpdm
        coresight-catu-platform/module	-> coresight_catu
        serial8250/module		-> 8250
        acpi-ged/module			-> acpi
        vmclock/module			-> ptp_vmclock

Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
---
This patch depends on patches 1, 2, 3
---
 Documentation/driver-api/driver-model/platform.rst |  3 ++-
 drivers/base/platform.c                            | 21 ++++++++++++++-------
 drivers/hwtracing/coresight/coresight-core.c       |  5 +++--
 include/linux/coresight.h                          |  5 +++--
 include/linux/platform_device.h                    | 17 +++++++++--------
 rust/kernel/platform.rs                            |  4 +++-
 6 files changed, 34 insertions(+), 21 deletions(-)

diff --git a/Documentation/driver-api/driver-model/platform.rst b/Documentation/driver-api/driver-model/platform.rst
index cf5ff48d3115..9673470bded2 100644
--- a/Documentation/driver-api/driver-model/platform.rst
+++ b/Documentation/driver-api/driver-model/platform.rst
@@ -70,7 +70,8 @@ Kernel modules can be composed of several platform drivers. The platform core
 provides helpers to register and unregister an array of drivers::
 
 	int __platform_register_drivers(struct platform_driver * const *drivers,
-				      unsigned int count, struct module *owner);
+				      unsigned int count, struct module *owner,
+				      const char *mod_name);
 	void platform_unregister_drivers(struct platform_driver * const *drivers,
 					 unsigned int count);
 
diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 75b4698d0e58..2b0cc0889386 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -901,11 +901,14 @@ EXPORT_SYMBOL_GPL(platform_device_register_full);
  * __platform_driver_register - register a driver for platform-level devices
  * @drv: platform driver structure
  * @owner: owning module/driver
+ * @mod_name: module name string
  */
-int __platform_driver_register(struct platform_driver *drv, struct module *owner)
+int __platform_driver_register(struct platform_driver *drv, struct module *owner,
+			       const char *mod_name)
 {
 	drv->driver.owner = owner;
 	drv->driver.bus = &platform_bus_type;
+	drv->driver.mod_name = mod_name;
 
 	return driver_register(&drv->driver);
 }
@@ -938,6 +941,7 @@ static int is_bound_to_driver(struct device *dev, void *driver)
  * @drv: platform driver structure
  * @probe: the driver probe routine, probably from an __init section
  * @module: module which will be the owner of the driver
+ * @mod_name: module name string
  *
  * Use this instead of platform_driver_register() when you know the device
  * is not hotpluggable and has already been registered, and you want to
@@ -955,7 +959,8 @@ static int is_bound_to_driver(struct device *dev, void *driver)
  */
 int __init_or_module __platform_driver_probe(struct platform_driver *drv,
 					     int (*probe)(struct platform_device *),
-					     struct module *module)
+					     struct module *module,
+					     const char *mod_name)
 {
 	int retval;
 
@@ -983,7 +988,7 @@ int __init_or_module __platform_driver_probe(struct platform_driver *drv,
 
 	/* temporary section violation during probe() */
 	drv->probe = probe;
-	retval = __platform_driver_register(drv, module);
+	retval = __platform_driver_register(drv, module, mod_name);
 	if (retval)
 		return retval;
 
@@ -1011,6 +1016,7 @@ EXPORT_SYMBOL_GPL(__platform_driver_probe);
  * @data: platform specific data for this platform device
  * @size: size of platform specific data
  * @module: module which will be the owner of the driver
+ * @mod_name: module name string
  *
  * Use this in legacy-style modules that probe hardware directly and
  * register a single platform device and corresponding platform driver.
@@ -1021,7 +1027,7 @@ struct platform_device * __init_or_module
 __platform_create_bundle(struct platform_driver *driver,
 			 int (*probe)(struct platform_device *),
 			 struct resource *res, unsigned int n_res,
-			 const void *data, size_t size, struct module *module)
+			 const void *data, size_t size, struct module *module, const char *mod_name)
 {
 	struct platform_device *pdev;
 	int error;
@@ -1044,7 +1050,7 @@ __platform_create_bundle(struct platform_driver *driver,
 	if (error)
 		goto err_pdev_put;
 
-	error = __platform_driver_probe(driver, probe, module);
+	error = __platform_driver_probe(driver, probe, module, mod_name);
 	if (error)
 		goto err_pdev_del;
 
@@ -1064,6 +1070,7 @@ EXPORT_SYMBOL_GPL(__platform_create_bundle);
  * @drivers: an array of drivers to register
  * @count: the number of drivers to register
  * @owner: module owning the drivers
+ * @mod_name: module name string
  *
  * Registers platform drivers specified by an array. On failure to register a
  * driver, all previously registered drivers will be unregistered. Callers of
@@ -1073,7 +1080,7 @@ EXPORT_SYMBOL_GPL(__platform_create_bundle);
  * Returns: 0 on success or a negative error code on failure.
  */
 int __platform_register_drivers(struct platform_driver * const *drivers,
-				unsigned int count, struct module *owner)
+				unsigned int count, struct module *owner, const char *mod_name)
 {
 	unsigned int i;
 	int err;
@@ -1081,7 +1088,7 @@ int __platform_register_drivers(struct platform_driver * const *drivers,
 	for (i = 0; i < count; i++) {
 		pr_debug("registering platform driver %ps\n", drivers[i]);
 
-		err = __platform_driver_register(drivers[i], owner);
+		err = __platform_driver_register(drivers[i], owner, mod_name);
 		if (err < 0) {
 			pr_err("failed to register platform driver %ps: %d\n",
 			       drivers[i], err);
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 54ad5193b850..94ee24afdc6d 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1695,7 +1695,8 @@ module_init(coresight_init);
 module_exit(coresight_exit);
 
 int coresight_init_driver_with_owner(const char *drv, struct amba_driver *amba_drv,
-				     struct platform_driver *pdev_drv, struct module *owner)
+				     struct platform_driver *pdev_drv, struct module *owner,
+				     const char *mod_name)
 {
 	int ret;
 
@@ -1705,7 +1706,7 @@ int coresight_init_driver_with_owner(const char *drv, struct amba_driver *amba_d
 		return ret;
 	}
 
-	ret = __platform_driver_register(pdev_drv, owner);
+	ret = __platform_driver_register(pdev_drv, owner, mod_name);
 	if (!ret)
 		return 0;
 
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index cd8fb47a1192..1cf85d772bea 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -692,9 +692,10 @@ coresight_find_output_type(struct coresight_platform_data *pdata,
 			   union coresight_dev_subtype subtype);
 
 int coresight_init_driver_with_owner(const char *drv, struct amba_driver *amba_drv,
-				     struct platform_driver *pdev_drv, struct module *owner);
+				     struct platform_driver *pdev_drv, struct module *owner,
+				     const char *mod_name);
 #define coresight_init_driver(drv, amba_drv, pdev_drv) \
-	coresight_init_driver_with_owner(drv, amba_drv, pdev_drv, THIS_MODULE)
+	coresight_init_driver_with_owner(drv, amba_drv, pdev_drv, THIS_MODULE, KBUILD_MODNAME)
 
 void coresight_remove_driver(struct amba_driver *amba_drv,
 			     struct platform_driver *pdev_drv);
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 975400a472e3..26e6a43358e2 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -293,18 +293,19 @@ struct platform_driver {
  * use a macro to avoid include chaining to get THIS_MODULE
  */
 #define platform_driver_register(drv) \
-	__platform_driver_register(drv, THIS_MODULE)
+	__platform_driver_register(drv, THIS_MODULE, KBUILD_MODNAME)
 extern int __platform_driver_register(struct platform_driver *,
-					struct module *);
+					struct module *, const char *mod_name);
 extern void platform_driver_unregister(struct platform_driver *);
 
 /* non-hotpluggable platform devices may use this so that probe() and
  * its support may live in __init sections, conserving runtime memory.
  */
 #define platform_driver_probe(drv, probe) \
-	__platform_driver_probe(drv, probe, THIS_MODULE)
+	__platform_driver_probe(drv, probe, THIS_MODULE, KBUILD_MODNAME)
 extern int __platform_driver_probe(struct platform_driver *driver,
-		int (*probe)(struct platform_device *), struct module *module);
+		int (*probe)(struct platform_device *), struct module *module,
+		const char *mod_name);
 
 static inline void *platform_get_drvdata(const struct platform_device *pdev)
 {
@@ -368,19 +369,19 @@ static int __init __platform_driver##_init(void) \
 device_initcall(__platform_driver##_init); \
 
 #define platform_create_bundle(driver, probe, res, n_res, data, size) \
-	__platform_create_bundle(driver, probe, res, n_res, data, size, THIS_MODULE)
+	__platform_create_bundle(driver, probe, res, n_res, data, size, THIS_MODULE, KBUILD_MODNAME)
 extern struct platform_device *__platform_create_bundle(
 	struct platform_driver *driver, int (*probe)(struct platform_device *),
 	struct resource *res, unsigned int n_res,
-	const void *data, size_t size, struct module *module);
+	const void *data, size_t size, struct module *module, const char *mod_name);
 
 int __platform_register_drivers(struct platform_driver * const *drivers,
-				unsigned int count, struct module *owner);
+				unsigned int count, struct module *owner, const char *mod_name);
 void platform_unregister_drivers(struct platform_driver * const *drivers,
 				 unsigned int count);
 
 #define platform_register_drivers(drivers, count) \
-	__platform_register_drivers(drivers, count, THIS_MODULE)
+	__platform_register_drivers(drivers, count, THIS_MODULE, KBUILD_MODNAME)
 
 #ifdef CONFIG_SUSPEND
 extern int platform_pm_suspend(struct device *dev);
diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
index 8917d4ee499f..2d626eecc450 100644
--- a/rust/kernel/platform.rs
+++ b/rust/kernel/platform.rs
@@ -82,7 +82,9 @@ unsafe fn register(
         }
 
         // SAFETY: `pdrv` is guaranteed to be a valid `DriverType`.
-        to_result(unsafe { bindings::__platform_driver_register(pdrv.get(), module.0) })
+        to_result(unsafe {
+            bindings::__platform_driver_register(pdrv.get(), module.0, name.as_char_ptr())
+        })
     }
 
     unsafe fn unregister(pdrv: &Opaque<Self::DriverType>) {

-- 
2.43.0

