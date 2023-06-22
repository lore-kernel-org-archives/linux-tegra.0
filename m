Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24E10C001B0
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Jun 2023 21:32:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbjFVVcW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 22 Jun 2023 17:32:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229916AbjFVVcT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 22 Jun 2023 17:32:19 -0400
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 939051BFA;
        Thu, 22 Jun 2023 14:32:18 -0700 (PDT)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1687469537;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=r3L64brw86V46M7pEkybRTkOXQNho44VnJg9P89aFHk=;
        b=HL5M7/GXUZoW1POWPH8YUV4TEkUTQDHMWoQO7HV99DKiJQVQucwCilZl1lWP76but/3evo
        aYQFZrlO3V41vOvwCwOClBugbVtm9gDRqNPMLv5+9g14fq71YaSIDfK8rMO2Yxe+eO8iYG
        MuT2zmldu1Nbx/OjK94Y82cSi4xZs/Rt6rDDnrtPXxz8i2UShBeZyyLoo/MqjIOaHANAi5
        D1CuQzo0mPqlZvJG2XjBZRkR6fgALMaRNWpFDZugigh3Ed/8A4n8XVG4kruxjBn0Fu8YeZ
        evQr0h/P6bmNnqFB1GnoN4SbBN1h4QRMSEJO/0ADyclg6Vvj2gzHCw7NdXnSew==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 236261BF205;
        Thu, 22 Jun 2023 21:32:16 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Frank Rowand <frowand.list@gmail.com>,
        linux-tegra@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/2] of: module: Export of_device_uevent()
Date:   Thu, 22 Jun 2023 23:32:13 +0200
Message-Id: <20230622213214.3586530-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230622213214.3586530-1-miquel.raynal@bootlin.com>
References: <20230622213214.3586530-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The content of of_device_uevent() is currently hardcoded in a driver
that can be compiled as a module. Nothing prevents of_device_uevent() to
be exported to modules, most of the other helpers in of/device.c
actually are. The reason why this helper was not exported is because it
has been so far only useful in drivers/base, which is built-in anyway.

With the idea of getting rid of the hardcoded implementation of
of_device_uevent() in other places in the kernel, let's export it to GPL
modules (very much like its cousins in the same file).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 drivers/of/device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/device.c b/drivers/of/device.c
index 0f00f1b80708..90131de6d75b 100644
--- a/drivers/of/device.c
+++ b/drivers/of/device.c
@@ -312,6 +312,7 @@ void of_device_uevent(const struct device *dev, struct kobj_uevent_env *env)
 	}
 	mutex_unlock(&of_mutex);
 }
+EXPORT_SYMBOL_GPL(of_device_uevent);
 
 int of_device_uevent_modalias(const struct device *dev, struct kobj_uevent_env *env)
 {
-- 
2.34.1

