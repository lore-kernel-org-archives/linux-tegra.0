Return-Path: <SRS0=u+5c=BE=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA00C433DF
	for <linux-tegra@archiver.kernel.org>; Sat, 25 Jul 2020 06:49:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B248320663
	for <linux-tegra@archiver.kernel.org>; Sat, 25 Jul 2020 06:49:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbJD3tqy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbgGYGtO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 25 Jul 2020 02:49:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725874AbgGYGtN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 25 Jul 2020 02:49:13 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F967C0619D3
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2020 23:49:13 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id j19so6602717pgm.11
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jul 2020 23:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AFV7XDH/YgXKegUmh6b/uhEmHTcUDP6RQlSqqYbJhi8=;
        b=CbJD3tqyQ8ITay1P85gHBf8sk0tD4maHYRoOxYhB9nk2n6W4vYLAc65nDgDCMS7dgA
         Hdnmp7MlRBOqp1d3HJ7Fc+gym10X/TnABLIkyazP4D6pX24ZC5wSD4cDiMoH74JTeRDk
         lvrs/x+j0kgzCDHAFakLO6LRZL/rP/a6IcZgedDjKs5RyY0OOTc/Lr0fSl1X2I3A7TKH
         b11w3gcRuCxleHyfbTU0n1D2t6VPPj2f7zxyXbRPq+wrDj6Wb7owxVOVoBBZ/RyGgcqI
         oe/9DBqTqGez/ZnbooQypGj9+l7otEW+4m9uWYW1ipeSvNCTeMP/xCwzHbfFzM+U9zo3
         5y4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AFV7XDH/YgXKegUmh6b/uhEmHTcUDP6RQlSqqYbJhi8=;
        b=SWDUlH3GxEMZO4k4upiaONtTIBIPsO/DZSl+MASB8JSQgoXp6qtdJcXIihpyxN+Lpa
         u541MBCnl98JpPfIfGwktGq4ABvjbLpnS7sfb0hV5ZRqCX0CBov2DEIIcNS6e7k9e3oJ
         YJEmGi2knl7/Dz0NiuF9momGun4X46I8+/03YosM1j9CKzmZRiQOBj5Yhb2RnbHE2MJu
         KeeWwkWdOLjZBl+ThYraVZeObviYUTgJywEBLLexHn5W2xumsWtVZNBA5kd2m5ZL+nHL
         2fyzqNt7HPuJSpre5PNXBAfwF9Gv1OdyG/2VhY5rc2hCQmM6hHrEZ3UdoykVm8UkIgSJ
         kEDA==
X-Gm-Message-State: AOAM5312m4tGZsYsZaUth8Zvnpp/FksJpw0ye71SKKNMH63Xa+bQ4tXA
        iR+fMUVI84Y8B9D//FqaJ0M=
X-Google-Smtp-Source: ABdhPJzE3pfqMWwqLBc1loOGUeDPJ584xUrioRvUQypfXO333D26YOvEGwKbr/wfMjEqIUzbCiUWzA==
X-Received: by 2002:a63:4b1d:: with SMTP id y29mr11753531pga.264.1595659752049;
        Fri, 24 Jul 2020 23:49:12 -0700 (PDT)
Received: from localhost.localdomain ([1.186.115.27])
        by smtp.gmail.com with ESMTPSA id z9sm8116559pgh.94.2020.07.24.23.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2020 23:49:11 -0700 (PDT)
From:   Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
To:     marvin24@posteo.de, gregkh@linuxfoundation.org,
        p.zabel@pengutronix.de
Cc:     Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>,
        ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH v4] staging: nvec: change usage of slave to secondary
Date:   Sat, 25 Jul 2020 11:59:39 +0530
Message-Id: <20200725062938.15388-1-bharadwaj.rohit8@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200724043633.7755-1-bharadwaj.rohit8@gmail.com>
References: <20200724043633.7755-1-bharadwaj.rohit8@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

changed usage of slave (which is deprecated) to secondary without breaking the driver

Tested-by: Dan Carpenter <dan.carpenter@oracle.com>
Acked-by: Marc Dietrich <marvin24@posteo.de>
Signed-off-by: Rohit K Bharadwaj <bharadwaj.rohit8@gmail.com>
---
v4: undo the changes (which broke the driver) to this line: if (of_property_read_u32(dev->of_node, "slave-addr", &nvec->i2c_addr)) 
v3: change patch subject, add version history
v2: add changelog text in body of mail
v1: fix style issues by changing usage of slave to secondary

 drivers/staging/nvec/nvec.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 360ec0407740..a7e995bfe989 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -718,7 +718,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
-static void tegra_init_i2c_slave(struct nvec_chip *nvec)
+static void tegra_init_i2c_secondary(struct nvec_chip *nvec)
 {
 	u32 val;
 
@@ -744,7 +744,7 @@ static void tegra_init_i2c_slave(struct nvec_chip *nvec)
 }
 
 #ifdef CONFIG_PM_SLEEP
-static void nvec_disable_i2c_slave(struct nvec_chip *nvec)
+static void nvec_disable_i2c_secondary(struct nvec_chip *nvec)
 {
 	disable_irq(nvec->irq);
 	writel(I2C_SL_NEWSL | I2C_SL_NACK, nvec->base + I2C_SL_CNFG);
@@ -839,7 +839,7 @@ static int tegra_nvec_probe(struct platform_device *pdev)
 	}
 	disable_irq(nvec->irq);
 
-	tegra_init_i2c_slave(nvec);
+	tegra_init_i2c_secondary(nvec);
 
 	/* enable event reporting */
 	nvec_toggle_global_events(nvec, true);
@@ -913,7 +913,7 @@ static int nvec_suspend(struct device *dev)
 	if (!err)
 		nvec_msg_free(nvec, msg);
 
-	nvec_disable_i2c_slave(nvec);
+	nvec_disable_i2c_secondary(nvec);
 
 	return 0;
 }
@@ -923,7 +923,7 @@ static int nvec_resume(struct device *dev)
 	struct nvec_chip *nvec = dev_get_drvdata(dev);
 
 	dev_dbg(nvec->dev, "resuming\n");
-	tegra_init_i2c_slave(nvec);
+	tegra_init_i2c_secondary(nvec);
 	nvec_toggle_global_events(nvec, true);
 
 	return 0;
-- 
2.25.1

