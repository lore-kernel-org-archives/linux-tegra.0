Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2684C64E7B
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Nov 2020 11:26:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69DDB22254
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Nov 2020 11:26:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="ghGn3eEA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728283AbgKTL0t (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Nov 2020 06:26:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727887AbgKTL0r (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Nov 2020 06:26:47 -0500
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F937C061A4D
        for <linux-tegra@vger.kernel.org>; Fri, 20 Nov 2020 03:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
         s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=SC5E7Xd+2HEKqAZ3mXYC+7UdIbWh5Wu0NUEnTDpO+Ho=; b=ghGn3eEAGLdJ6o6Qa3xMDF+6lt
        /yKKwf+/J+6kc/QAlTdLuvYpkjS/k1BIxmF0ys0390LMjEiHndjPBZ/J6X/1Xd9DB67QQILKj9SGK
        zwC/W805Ae543xVwVoswz1apNji5aWcgufuQf3bUz4TR2hxrv0O7vSLkAKGkYRYfeEB32knzOsAvS
        LDRuXFffT7Goyur8spVxZKktdeUQyQnFyZ2RcopoJEyAbLHq0ipnOck6/Id/UUES2+xlv+7hV/g22
        m02dAlshtPm9/ChhakIawLFDV96cswUp+fpkSKa6zXWpUrW7CJqqWbpNCOcib63JuA6KL//TmkZrc
        7gnHmAQg==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <mperttunen@nvidia.com>)
        id 1kg4Yq-0003lG-U8; Fri, 20 Nov 2020 13:26:40 +0200
From:   Mikko Perttunen <mperttunen@nvidia.com>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, digetx@gmail.com,
        airlied@linux.ie, daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com,
        Mikko Perttunen <mperttunen@nvidia.com>
Subject: [PATCH v4 08/21] gpu: host1x: Implement /dev/host1x device node
Date:   Fri, 20 Nov 2020 13:25:47 +0200
Message-Id: <20201120112600.935082-9-mperttunen@nvidia.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201120112600.935082-1-mperttunen@nvidia.com>
References: <20201120112600.935082-1-mperttunen@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: mperttunen@nvidia.com
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add the /dev/host1x device node, implementing the following
functionality:

- Reading syncpoint values
- Allocating syncpoints (providing syncpoint FDs)
- Incrementing syncpoints (based on syncpoint FD)

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v4:
* Put UAPI under CONFIG_DRM_TEGRA_STAGING
v3:
* Pass process name as syncpoint name when allocating
  syncpoint.
---
 drivers/gpu/host1x/Makefile |   1 +
 drivers/gpu/host1x/dev.c    |   9 ++
 drivers/gpu/host1x/dev.h    |   3 +
 drivers/gpu/host1x/uapi.c   | 282 ++++++++++++++++++++++++++++++++++++
 drivers/gpu/host1x/uapi.h   |  22 +++
 include/linux/host1x.h      |   2 +
 6 files changed, 319 insertions(+)
 create mode 100644 drivers/gpu/host1x/uapi.c
 create mode 100644 drivers/gpu/host1x/uapi.h

diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
index 096017b8789d..882f928d75e1 100644
--- a/drivers/gpu/host1x/Makefile
+++ b/drivers/gpu/host1x/Makefile
@@ -9,6 +9,7 @@ host1x-y = \
 	job.o \
 	debug.o \
 	mipi.o \
+	uapi.o \
 	hw/host1x01.o \
 	hw/host1x02.o \
 	hw/host1x04.o \
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index d0ebb70e2fdd..641317d23828 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -461,6 +461,12 @@ static int host1x_probe(struct platform_device *pdev)
 		goto deinit_syncpt;
 	}
 
+	err = host1x_uapi_init(&host->uapi, host);
+	if (err) {
+		dev_err(&pdev->dev, "failed to initialize uapi\n");
+		goto deinit_intr;
+	}
+
 	host1x_debug_init(host);
 
 	if (host->info->has_hypervisor)
@@ -480,6 +486,8 @@ static int host1x_probe(struct platform_device *pdev)
 	host1x_unregister(host);
 deinit_debugfs:
 	host1x_debug_deinit(host);
+	host1x_uapi_deinit(&host->uapi);
+deinit_intr:
 	host1x_intr_deinit(host);
 deinit_syncpt:
 	host1x_syncpt_deinit(host);
@@ -501,6 +509,7 @@ static int host1x_remove(struct platform_device *pdev)
 
 	host1x_unregister(host);
 	host1x_debug_deinit(host);
+	host1x_uapi_deinit(&host->uapi);
 	host1x_intr_deinit(host);
 	host1x_syncpt_deinit(host);
 	reset_control_assert(host->rst);
diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index 63010ae37a97..7b8b7e20e32b 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -17,6 +17,7 @@
 #include "intr.h"
 #include "job.h"
 #include "syncpt.h"
+#include "uapi.h"
 
 struct host1x_syncpt;
 struct host1x_syncpt_base;
@@ -143,6 +144,8 @@ struct host1x {
 	struct list_head list;
 
 	struct device_dma_parameters dma_parms;
+
+	struct host1x_uapi uapi;
 };
 
 void host1x_hypervisor_writel(struct host1x *host1x, u32 r, u32 v);
diff --git a/drivers/gpu/host1x/uapi.c b/drivers/gpu/host1x/uapi.c
new file mode 100644
index 000000000000..27b8761c3f35
--- /dev/null
+++ b/drivers/gpu/host1x/uapi.c
@@ -0,0 +1,282 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * /dev/host1x syncpoint interface
+ *
+ * Copyright (c) 2020, NVIDIA Corporation.
+ */
+
+#include <linux/anon_inodes.h>
+#include <linux/cdev.h>
+#include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/host1x.h>
+#include <linux/nospec.h>
+
+#include "dev.h"
+#include "syncpt.h"
+#include "uapi.h"
+
+#include <uapi/linux/host1x.h>
+
+static int syncpt_file_release(struct inode *inode, struct file *file)
+{
+	struct host1x_syncpt *sp = file->private_data;
+
+	host1x_syncpt_put(sp);
+
+	return 0;
+}
+
+static int syncpt_file_ioctl_info(struct host1x_syncpt *sp, void __user *data)
+{
+	struct host1x_syncpoint_info args;
+	unsigned long copy_err;
+
+	copy_err = copy_from_user(&args, data, sizeof(args));
+	if (copy_err)
+		return -EFAULT;
+
+	if (args.reserved[0] || args.reserved[1] || args.reserved[2])
+		return -EINVAL;
+
+	args.id = sp->id;
+
+	copy_err = copy_to_user(data, &args, sizeof(args));
+	if (copy_err)
+		return -EFAULT;
+
+	return 0;
+}
+
+static int syncpt_file_ioctl_incr(struct host1x_syncpt *sp, void __user *data)
+{
+	struct host1x_syncpoint_increment args;
+	unsigned long copy_err;
+	u32 i;
+
+	copy_err = copy_from_user(&args, data, sizeof(args));
+	if (copy_err)
+		return -EFAULT;
+
+	for (i = 0; i < args.count; i++) {
+		host1x_syncpt_incr(sp);
+		if (signal_pending(current))
+			return -EINTR;
+	}
+
+	return 0;
+}
+
+static long syncpt_file_ioctl(struct file *file, unsigned int cmd,
+			      unsigned long arg)
+{
+	void __user *data = (void __user *)arg;
+	long err;
+
+	switch (cmd) {
+	case HOST1X_IOCTL_SYNCPOINT_INFO:
+		err = syncpt_file_ioctl_info(file->private_data, data);
+		break;
+
+	case HOST1X_IOCTL_SYNCPOINT_INCREMENT:
+		err = syncpt_file_ioctl_incr(file->private_data, data);
+		break;
+
+	default:
+		err = -ENOTTY;
+	}
+
+	return err;
+}
+
+static const struct file_operations syncpt_file_fops = {
+	.owner = THIS_MODULE,
+	.release = syncpt_file_release,
+	.unlocked_ioctl = syncpt_file_ioctl,
+	.compat_ioctl = syncpt_file_ioctl,
+};
+
+struct host1x_syncpt *host1x_syncpt_fd_get(int fd)
+{
+	struct host1x_syncpt *sp;
+	struct file *file = fget(fd);
+
+	if (!file)
+		return ERR_PTR(-EINVAL);
+
+	if (file->f_op != &syncpt_file_fops) {
+		fput(file);
+		return ERR_PTR(-EINVAL);
+	}
+
+	sp = file->private_data;
+
+	host1x_syncpt_get(sp);
+
+	fput(file);
+
+	return sp;
+}
+EXPORT_SYMBOL(host1x_syncpt_fd_get);
+
+static int dev_file_open(struct inode *inode, struct file *file)
+{
+	struct host1x_uapi *uapi =
+		container_of(inode->i_cdev, struct host1x_uapi, cdev);
+
+	file->private_data = container_of(uapi, struct host1x, uapi);
+
+	return 0;
+}
+
+static int dev_file_ioctl_read_syncpoint(struct host1x *host1x,
+					 void __user *data)
+{
+	struct host1x_read_syncpoint args;
+	unsigned long copy_err;
+
+	copy_err = copy_from_user(&args, data, sizeof(args));
+	if (copy_err)
+		return -EFAULT;
+
+	if (args.id >= host1x_syncpt_nb_pts(host1x))
+		return -EINVAL;
+
+	args.id = array_index_nospec(args.id, host1x_syncpt_nb_pts(host1x));
+	args.value = host1x_syncpt_read(&host1x->syncpt[args.id]);
+
+	copy_err = copy_to_user(data, &args, sizeof(args));
+	if (copy_err)
+		return -EFAULT;
+
+	return 0;
+}
+
+static int dev_file_ioctl_alloc_syncpoint(struct host1x *host1x,
+					  void __user *data)
+{
+	struct host1x_allocate_syncpoint args;
+	struct host1x_syncpt *sp;
+	unsigned long copy_err;
+	int err;
+
+	copy_err = copy_from_user(&args, data, sizeof(args));
+	if (copy_err)
+		return -EFAULT;
+
+	if (args.reserved[0] || args.reserved[1] || args.reserved[2])
+		return -EINVAL;
+
+	sp = host1x_syncpt_alloc(host1x, HOST1X_SYNCPT_CLIENT_MANAGED,
+				 current->comm);
+	if (!sp)
+		return -EBUSY;
+
+	err = anon_inode_getfd("host1x_syncpt", &syncpt_file_fops, sp,
+			       O_CLOEXEC);
+	if (err < 0)
+		goto free_syncpt;
+
+	args.fd = err;
+
+	copy_err = copy_to_user(data, &args, sizeof(args));
+	if (copy_err) {
+		err = -EFAULT;
+		goto put_fd;
+	}
+
+	return 0;
+
+put_fd:
+	put_unused_fd(args.fd);
+free_syncpt:
+	host1x_syncpt_put(sp);
+
+	return err;
+}
+
+static long dev_file_ioctl(struct file *file, unsigned int cmd,
+			   unsigned long arg)
+{
+	void __user *data = (void __user *)arg;
+	long err;
+
+	switch (cmd) {
+	case HOST1X_IOCTL_READ_SYNCPOINT:
+		err = dev_file_ioctl_read_syncpoint(file->private_data, data);
+		break;
+
+	case HOST1X_IOCTL_ALLOCATE_SYNCPOINT:
+		err = dev_file_ioctl_alloc_syncpoint(file->private_data, data);
+		break;
+
+	default:
+		err = -ENOTTY;
+	}
+
+	return err;
+}
+
+static const struct file_operations dev_file_fops = {
+	.owner = THIS_MODULE,
+	.open = dev_file_open,
+	.unlocked_ioctl = dev_file_ioctl,
+	.compat_ioctl = dev_file_ioctl,
+};
+
+int host1x_uapi_init(struct host1x_uapi *uapi, struct host1x *host1x)
+{
+	int err;
+	dev_t dev_num;
+
+	if (!IS_ENABLED(CONFIG_DRM_TEGRA_STAGING))
+		return 0;
+
+	err = alloc_chrdev_region(&dev_num, 0, 1, "host1x");
+	if (err)
+		return err;
+
+	uapi->class = class_create(THIS_MODULE, "host1x");
+	if (IS_ERR(uapi->class)) {
+		err = PTR_ERR(uapi->class);
+		goto unregister_chrdev_region;
+	}
+
+	cdev_init(&uapi->cdev, &dev_file_fops);
+	err = cdev_add(&uapi->cdev, dev_num, 1);
+	if (err)
+		goto destroy_class;
+
+	uapi->dev = device_create(uapi->class, host1x->dev,
+				  dev_num, NULL, "host1x");
+	if (IS_ERR(uapi->dev)) {
+		err = PTR_ERR(uapi->dev);
+		goto del_cdev;
+	}
+
+	cdev_add(&uapi->cdev, dev_num, 1);
+
+	uapi->dev_num = dev_num;
+
+	return 0;
+
+del_cdev:
+	cdev_del(&uapi->cdev);
+destroy_class:
+	class_destroy(uapi->class);
+unregister_chrdev_region:
+	unregister_chrdev_region(dev_num, 1);
+
+	return err;
+}
+
+void host1x_uapi_deinit(struct host1x_uapi *uapi)
+{
+	if (!IS_ENABLED(CONFIG_DRM_TEGRA_STAGING))
+		return;
+
+	device_destroy(uapi->class, uapi->dev_num);
+	cdev_del(&uapi->cdev);
+	class_destroy(uapi->class);
+	unregister_chrdev_region(uapi->dev_num, 1);
+}
diff --git a/drivers/gpu/host1x/uapi.h b/drivers/gpu/host1x/uapi.h
new file mode 100644
index 000000000000..7beb5e44c1b1
--- /dev/null
+++ b/drivers/gpu/host1x/uapi.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2020, NVIDIA Corporation.
+ */
+
+#ifndef HOST1X_UAPI_H
+#define HOST1X_UAPI_H
+
+#include <linux/cdev.h>
+
+struct host1x_uapi {
+	struct class *class;
+
+	struct cdev cdev;
+	struct device *dev;
+	dev_t dev_num;
+};
+
+int host1x_uapi_init(struct host1x_uapi *uapi, struct host1x *host1x);
+void host1x_uapi_deinit(struct host1x_uapi *uapi);
+
+#endif
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index c222cf61b70b..8f6d61e13e05 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -163,6 +163,8 @@ struct host1x_syncpt *host1x_syncpt_alloc(struct host1x *host,
 struct host1x_syncpt_base *host1x_syncpt_get_base(struct host1x_syncpt *sp);
 u32 host1x_syncpt_base_id(struct host1x_syncpt_base *base);
 
+struct host1x_syncpt *host1x_syncpt_fd_get(int fd);
+
 /*
  * host1x channel
  */
-- 
2.29.2

