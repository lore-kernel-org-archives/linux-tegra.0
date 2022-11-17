Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D0DC4321E
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Nov 2022 18:40:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240556AbiKQSk4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Nov 2022 13:40:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235064AbiKQSkz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Nov 2022 13:40:55 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 780AC8517D;
        Thu, 17 Nov 2022 10:40:54 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id x102so3938381ede.0;
        Thu, 17 Nov 2022 10:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9ybMF44ncbpQoXYyiY7lvPsBZDR1qvcdQC2snJ8L7M=;
        b=Z2oFSHjxMyTLeBJdW63lx3g14aObCExggZ2/c0n10fJznrPFxEocVHwSt6iy9bwPe8
         S0wHqBzjKK+YGv3M1MJ3CHLOYxsHllNyMlkWRHEARhHGBgkLPsj1qJsUq9u7p+pmSmfR
         cp2wZS2Kqmvhw+DJtpHVpk98VTrwWpAmVN60Vr2nJiVE7cDzv1cww0whTYNYnXXuBfrZ
         aBT5j3Xj2e/Vq4RYmvOGJEbxvJEp46/tZbnLZ1giRz+1tL+H88YSrvnKZi5ReJriXDUR
         HctMRqVN6IYZcWvnKQZbHdlulc3RfpQ+gflyr2n1uet4IPkmHp6RWoyN49UXrKEVT9PV
         bW3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y9ybMF44ncbpQoXYyiY7lvPsBZDR1qvcdQC2snJ8L7M=;
        b=nXEMhL161gkNQ3vgJkIj/9CAiGkLqStxxlnIwOywa2zYafCEckqAPpMuSzt+RnXYfS
         04icFnJyKdd4gjdXz0hLs1E/YVC4Jk2az5RBB1e5t3XhZeaokW7ZRnQt0ZC1ARuIRsk8
         6hBuMXPXv3mt2vhHYfFWmQ9yiFYEEE+OnanIeXAMRC8PAcRnxR14U6r8/UL6MYSzm4e0
         FcZ/rojFCvGktHblEIWI1Bs0sv6wF4PjF2LIHoKP/CvjIcr2MoZ47sioyalvMH2hHKhL
         rkbO1Jq6ZdfsD0Sj3SESDol3SqV1c8FFZZuqxigYWfMM7YNrteBsstomNZRFjNsTJJMx
         vftQ==
X-Gm-Message-State: ANoB5pm6WfKxZeVxzVAbzhqN9dS0q1aX7cSlHzGiXuH8bLDyrvGoIhKo
        vCmBFvF534WTTc/wtZkQqCM=
X-Google-Smtp-Source: AA0mqf4gKS6SyACL8go73wSupq8QD6MR3unyxjPLzc47n0ptJniRvbm/hsRn7J9GaGm2Uo5dOLADaw==
X-Received: by 2002:aa7:cb8d:0:b0:467:bc1f:ca16 with SMTP id r13-20020aa7cb8d000000b00467bc1fca16mr3339753edt.269.1668710452922;
        Thu, 17 Nov 2022 10:40:52 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id kw1-20020a170907770100b0078246b1360fsm700529ejc.131.2022.11.17.10.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 10:40:51 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 5/8] drm/simpledrm: Add support for system memory framebuffers
Date:   Thu, 17 Nov 2022 19:40:36 +0100
Message-Id: <20221117184039.2291937-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221117184039.2291937-1-thierry.reding@gmail.com>
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Simple framebuffers can be set up in system memory, which cannot be
requested and/or I/O remapped using the I/O resource helpers. Add a
separate code path that obtains system memory framebuffers from the
reserved memory region referenced in the memory-region property.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- simplify memory code and move back to simpledrm_device_create()
- extract screen_base iosys_map fix into separate patch

Changes in v2:
- make screen base a struct iosys_map to avoid sparse warnings

 drivers/gpu/drm/tiny/simpledrm.c | 99 ++++++++++++++++++++++++--------
 1 file changed, 75 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 3673a42e4bf4..7f39bc58da52 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -3,6 +3,7 @@
 #include <linux/clk.h>
 #include <linux/of_clk.h>
 #include <linux/minmax.h>
+#include <linux/of_address.h>
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
@@ -184,6 +185,31 @@ simplefb_get_format_of(struct drm_device *dev, struct device_node *of_node)
 	return simplefb_get_validated_format(dev, format);
 }
 
+static struct resource *
+simplefb_get_memory_of(struct drm_device *dev, struct device_node *of_node)
+{
+	struct device_node *np;
+	struct resource *res;
+	int err;
+
+	np = of_parse_phandle(of_node, "memory-region", 0);
+	if (!np)
+		return NULL;
+
+	res = devm_kzalloc(dev->dev, sizeof(*res), GFP_KERNEL);
+	if (!res)
+		return ERR_PTR(-ENOMEM);
+
+	err = of_address_to_resource(np, 0, res);
+	if (err)
+		return ERR_PTR(err);
+
+	if (of_get_property(of_node, "reg", NULL))
+		drm_warn(dev, "preferring \"memory-region\" over \"reg\" property\n");
+
+	return res;
+}
+
 /*
  * Simple Framebuffer device
  */
@@ -623,8 +649,7 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	struct drm_device *dev;
 	int width, height, stride;
 	const struct drm_format_info *format;
-	struct resource *res, *mem;
-	void __iomem *screen_base;
+	struct resource *res, *mem = NULL;
 	struct drm_plane *primary_plane;
 	struct drm_crtc *crtc;
 	struct drm_encoder *encoder;
@@ -676,6 +701,9 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 		format = simplefb_get_format_of(dev, of_node);
 		if (IS_ERR(format))
 			return ERR_CAST(format);
+		mem = simplefb_get_memory_of(dev, of_node);
+		if (IS_ERR(mem))
+			return ERR_CAST(mem);
 	} else {
 		drm_err(dev, "no simplefb configuration found\n");
 		return ERR_PTR(-ENODEV);
@@ -698,32 +726,55 @@ static struct simpledrm_device *simpledrm_device_create(struct drm_driver *drv,
 	 * Memory management
 	 */
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return ERR_PTR(-EINVAL);
+	if (mem) {
+		void *screen_base;
 
-	ret = devm_aperture_acquire_from_firmware(dev, res->start, resource_size(res));
-	if (ret) {
-		drm_err(dev, "could not acquire memory range %pr: error %d\n", res, ret);
-		return ERR_PTR(ret);
-	}
+		ret = devm_aperture_acquire_from_firmware(dev, mem->start, resource_size(mem));
+		if (ret) {
+			drm_err(dev, "could not acquire memory range %pr: %d\n", mem, ret);
+			return ERR_PTR(ret);
+		}
 
-	mem = devm_request_mem_region(&pdev->dev, res->start, resource_size(res), drv->name);
-	if (!mem) {
-		/*
-		 * We cannot make this fatal. Sometimes this comes from magic
-		 * spaces our resource handlers simply don't know about. Use
-		 * the I/O-memory resource as-is and try to map that instead.
-		 */
-		drm_warn(dev, "could not acquire memory region %pr\n", res);
-		mem = res;
-	}
+		drm_info(dev, "using system memory framebuffer at %pr\n", mem);
 
-	screen_base = devm_ioremap_wc(&pdev->dev, mem->start, resource_size(mem));
-	if (!screen_base)
-		return ERR_PTR(-ENOMEM);
+		screen_base = devm_memremap(dev->dev, mem->start, resource_size(mem), MEMREMAP_WB);
+		if (!screen_base)
+			return ERR_PTR(-ENOMEM);
+
+		iosys_map_set_vaddr(&sdev->screen_base, screen_base);
+	} else {
+		void __iomem *screen_base;
+
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		if (!res)
+			return ERR_PTR(-EINVAL);
 
-	iosys_map_set_vaddr_iomem(&sdev->screen_base, screen_base);
+		ret = devm_aperture_acquire_from_firmware(dev, res->start, resource_size(res));
+		if (ret) {
+			drm_err(dev, "could not acquire memory range %pr: %d\n", &res, ret);
+			return ERR_PTR(ret);
+		}
+
+		drm_info(dev, "using I/O memory framebuffer at %pr\n", res);
+
+		mem = devm_request_mem_region(&pdev->dev, res->start, resource_size(res),
+					      drv->name);
+		if (!mem) {
+			/*
+			 * We cannot make this fatal. Sometimes this comes from magic
+			 * spaces our resource handlers simply don't know about. Use
+			 * the I/O-memory resource as-is and try to map that instead.
+			 */
+			drm_warn(dev, "could not acquire memory region %pr\n", res);
+			mem = res;
+		}
+
+		screen_base = devm_ioremap_wc(&pdev->dev, mem->start, resource_size(mem));
+		if (!screen_base)
+			return ERR_PTR(-ENOMEM);
+
+		iosys_map_set_vaddr_iomem(&sdev->screen_base, screen_base);
+	}
 
 	/*
 	 * Modesetting
-- 
2.38.1

