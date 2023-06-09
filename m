Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 042F5C8300C
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jun 2023 15:56:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241981AbjFIP4l (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jun 2023 11:56:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241979AbjFIP4k (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jun 2023 11:56:40 -0400
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7B3F359E;
        Fri,  9 Jun 2023 08:56:38 -0700 (PDT)
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1686326197;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=X2D1UVa466mb6p7BhoBG3nxwbYR6HCIMlcrR96esoVk=;
        b=SoWNdJBXmqmt6caBgNd7PDmjUVLPB0TYS8ZCzW0abdzw50GOw2uMiSesmhm9E1lWzRaeB7
        H7wqMMm+BmjwKGywl/o5GV3TcI0u8BNaEV2xN/wEjmIw54TFaKb54GfIxqqJvIa9SxRH47
        VnVbyUP+5hFFP3ehKQDoCIZ+UV2p410QrPacDahIy87t5QkQgHxihmLSJInaCD6dLRQrVE
        t+8myaOAoz3kImvhQtZwHjSYIOtzntiC0zd4p+BtEWKdF14UDKYxyu92dk+YAJpcUHQCft
        2ijBT7HhKG89RkmSnYeeSxelNFXp4SGCtBzoengtaf2EFMp6yaWyEaojfzq+aQ==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 607321C0007;
        Fri,  9 Jun 2023 15:56:36 +0000 (UTC)
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
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 1/2] of: module: Export of_device_uevent()
Date:   Fri,  9 Jun 2023 17:56:33 +0200
Message-Id: <20230609155634.1495338-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230609155634.1495338-1-miquel.raynal@bootlin.com>
References: <20230609155634.1495338-1-miquel.raynal@bootlin.com>
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

