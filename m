Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA68AC7EE29
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jun 2023 15:56:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241128AbjFIP4p (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jun 2023 11:56:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241997AbjFIP4o (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jun 2023 11:56:44 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B413588;
        Fri,  9 Jun 2023 08:56:40 -0700 (PDT)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1686326198;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zH5i8gD2KWtLGfG2HZpAxGk9wS5MvKvPER7W/D9EpLU=;
        b=AGmRXALloLnaa8ShBCvEp/8Nfa3mGZesXB5ySaTWhkwrZcAg4sSK/ow0JMx0Kg1tOCbKvZ
        gdCc8/ZUIovVwXgT6whhBi2DXy8pflhy4FJWfcC62ytXKauRL1OEd+I40yd2S2PajAHksH
        vE3NBUbkx3JGocrsK+0lCsebm6pg4nelRpxpsGrGd2vAyoiE5JeDnmn3oOj6VgeGsF2NPL
        3li2JnelaVmEZ2vLfiQ/EZ3eOOVmGG2BlAyfi6s7BYoSQ/JhZTG8+818z6NHSI7wbfo2h/
        CGopXBe6eDxGF19bZkLi8R0aMMLNv1A89/ywSJOVX+YDWHU9c36E3t95qtIVfA==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A69DB1C0002;
        Fri,  9 Jun 2023 15:56:37 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        dri-devel@lists.freedesktop.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-tegra@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v2 2/2] gpu: host1x: Stop open-coding of_device_uevent()
Date:   Fri,  9 Jun 2023 17:56:34 +0200
Message-Id: <20230609155634.1495338-3-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609155634.1495338-1-miquel.raynal@bootlin.com>
References: <20230609155634.1495338-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

There is apparently no reasons to open-code of_device_uevent() besides:
- The helper receives a struct device while we want to use the of_node
  member of the struct device *parent*.
- of_device_uevent() could not be called by modules because of a missing
  EXPORT_SYMBOL*().

In practice, the former point is not very constraining, just calling
of_device_uevent(dev->parent, ...) would have made the trick.

The latter point is more an observation rather than a real blocking
point because nothing prevented of_uevent() (called by the inline
function of_device_uevent()) to be exported to modules. In practice,
this helper is now exported, so nothing prevent us from using
of_device_uevent() anymore.

Let's use the core helper directly instead of open-coding it.

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

---

This patch depends on the changes performed earlier in the series under
the drivers/of/ folder.
---
 drivers/gpu/host1x/bus.c | 29 ++++++-----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
index 4d16a3396c4a..dae589b83be1 100644
--- a/drivers/gpu/host1x/bus.c
+++ b/drivers/gpu/host1x/bus.c
@@ -338,32 +338,15 @@ static int host1x_device_match(struct device *dev, struct device_driver *drv)
 	return strcmp(dev_name(dev), drv->name) == 0;
 }
 
+/*
+ * Note that this is really only needed for backwards compatibility
+ * with libdrm, which parses this information from sysfs and will
+ * fail if it can't find the OF_FULLNAME, specifically.
+ */
 static int host1x_device_uevent(const struct device *dev,
 				struct kobj_uevent_env *env)
 {
-	struct device_node *np = dev->parent->of_node;
-	unsigned int count = 0;
-	struct property *p;
-	const char *compat;
-
-	/*
-	 * This duplicates most of of_device_uevent(), but the latter cannot
-	 * be called from modules and operates on dev->of_node, which is not
-	 * available in this case.
-	 *
-	 * Note that this is really only needed for backwards compatibility
-	 * with libdrm, which parses this information from sysfs and will
-	 * fail if it can't find the OF_FULLNAME, specifically.
-	 */
-	add_uevent_var(env, "OF_NAME=%pOFn", np);
-	add_uevent_var(env, "OF_FULLNAME=%pOF", np);
-
-	of_property_for_each_string(np, "compatible", p, compat) {
-		add_uevent_var(env, "OF_COMPATIBLE_%u=%s", count, compat);
-		count++;
-	}
-
-	add_uevent_var(env, "OF_COMPATIBLE_N=%u", count);
+	of_device_uevent((const struct device *)&dev->parent, env);
 
 	return 0;
 }
-- 
2.34.1

