Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA43C77B7D
	for <linux-tegra@archiver.kernel.org>; Wed, 10 May 2023 15:48:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237555AbjEJPsO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 10 May 2023 11:48:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237470AbjEJPsM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 May 2023 11:48:12 -0400
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34AF3E7C;
        Wed, 10 May 2023 08:48:11 -0700 (PDT)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id CA6E3C000B;
        Wed, 10 May 2023 15:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1683733689;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GiIl6qNilxI/2RMNtfGSfbFmkF8Ao7IWY//F7MAhvic=;
        b=Pu/WyXGfzdCJsrmdb5oy8iGLmhu5ui/4pT0SytexaZmI/s4yZRRNG5oiAo6Hsy7uTKPE6s
        VNX9AuNiDlfNYJULsgEMGfR/K+crTTQVolBSzasPXilC7nEweltsmAsq/CyriYhIBoK085
        vfJf3I5J0xJ8sW2S7X7cI7KuHf/2ZNG0K2/IYu/l/XYg+GXjoXdrIqoUBDQuIoAL4Gy+39
        6IbNTbR8nWI3YIbqwMOqDpbFzlo/RKt5eqiwGnJGmywyrWeY7xa42pfjiq9PHr2pIfZ4XV
        fxqZ5euP0ZvHd8VMEB3OLO3Tl1xy8/IF7N/IxM4xTl9VBxdTYgH3zeI/HHMG/A==
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        devicetree@vger.kernel.org, <linux-kernel@vger.kernel.org>,
        linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 4/5] of: module: Export of_uevent()
Date:   Wed, 10 May 2023 17:48:02 +0200
Message-Id: <20230510154803.189096-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230510154803.189096-1-miquel.raynal@bootlin.com>
References: <20230510154803.189096-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The content of of_uevent() is currently hardcoded in a driver that can
be compiled as a module. Nothing prevents of_uevent() to be exported to
modules, most of the other helpers in of_device.c actually are.The
reason why this helper was not exported is because it has been so far
only useful in drivers/base, which is built-in anyway.

With the idea of getting rid of the hardcoded implementation of
of_uevent() in other places in the kernel, let's export it to GPL
modules (very much like its cousins in the same file).

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/of/module.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/module.c b/drivers/of/module.c
index 874f3fb8220f..8b402a716951 100644
--- a/drivers/of/module.c
+++ b/drivers/of/module.c
@@ -132,6 +132,7 @@ int of_uevent(struct device_node *np, struct kobj_uevent_env *env)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(of_uevent);
 
 int of_uevent_modalias(const struct device_node *np, struct kobj_uevent_env *env)
 {
-- 
2.34.1

