Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE7E4C2BB48
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 20:30:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7790C22CB8
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Dec 2020 20:30:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727863AbgLOUXp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Dec 2020 15:23:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727771AbgLOUXM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Dec 2020 15:23:12 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 330D0C0611CD;
        Tue, 15 Dec 2020 12:21:52 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id m12so42765369lfo.7;
        Tue, 15 Dec 2020 12:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fPO2YitzAj2CPVqDn2leyW4R4sSxG37QOetlSn25bO4=;
        b=Fr0xHNsXlyagMm4UTFe6ZSZJpHB9OWTuJlE2sL/0y76zWPNp8dwUhvML7bNjeVjB7o
         kL/JXRb9odA/Wzb/84ukH37LvC2Peti1QcBuWPyWXPhdg2YdeB8SzG8i3X/mjxeuAFxJ
         ThYvSnctgSmoGZ53QwTcGKPnnTGUtlHGRUyauwl5dOKwDNkfVAqm1U5vNiwVlWUctPay
         cRyimXTqyk9cgkDKeLaJx9M5N3yruluEKu3vZhIOCX2tevGUwls1o7gRmci7HUQlWGGh
         c6hBQ15V1AE/UbNCpmRk3OHxgQhZNwcAhcwfimPbQGvzokLP6moCMIhWKA4whMABv77C
         c/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fPO2YitzAj2CPVqDn2leyW4R4sSxG37QOetlSn25bO4=;
        b=oXBgfgKjQZRwaAZy0j6g1wwUP1NQWxC+rXHD/wvjwxaKyj7alMtFNzLCemL8mu7OAr
         IgznOBgoQmlKMLdxAUnm8MXFvc8KyEOe8Mtv4HwvMqDArGwGcaswP4ft5Xrkq7Xip/eI
         73vJLK/qUQ3CD08DahufRsowUPvC1STHr+DOcEV8saRll+447MrFH3rjWCDsecP8ZxHJ
         yjeTzcG4BoJnHu28QA5KwlwqVjQLAZGDJqaujLJcFD7ITZ93CTjMMRG/GZ1blAqkKH/7
         sVQFg/KjETFPBSlrBwf7UMbIgTiAFXGnz9IVgyLyVnIt4b2giVLpt0sq4dOy4OVl39uX
         0JBQ==
X-Gm-Message-State: AOAM530mtQgQtLjPP+roBb6FVfS7Eu/4DdxhRfnCx4AvX4WZ7hJFBfkD
        Bqo8yWksG1m9tJciyVPQ+jI=
X-Google-Smtp-Source: ABdhPJxKp1fGsu9gyamzn1vd6U7L2JtQUCWk6MQFwFdzuM1GIkYh9U6crWutQ+gt/h9BIVc9dBsiaw==
X-Received: by 2002:ac2:43c1:: with SMTP id u1mr11629251lfl.38.1608063710725;
        Tue, 15 Dec 2020 12:21:50 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id f3sm2873711ljp.114.2020.12.15.12.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Dec 2020 12:21:50 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/8] usb: chipidea: tegra: Support runtime PM
Date:   Tue, 15 Dec 2020 23:21:11 +0300
Message-Id: <20201215202113.30394-7-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201215202113.30394-1-digetx@gmail.com>
References: <20201215202113.30394-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra PHY driver now supports waking up controller from a low power mode.
Enable runtime PM in order to put controller into the LPM during idle.

Tested-by: Matt Merhar <mattmerhar@protonmail.com>
Tested-by: Nicolas Chauvet <kwizart@gmail.com>
Tested-by: Peter Geis <pgwipeout@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index fff130f08996..4531c2b069fe 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -38,21 +38,24 @@ struct tegra_usb_soc_info {
 
 static const struct tegra_usb_soc_info tegra20_ehci_soc_info = {
 	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA |
-		 CI_HDRC_OVERRIDE_PHY_CONTROL,
+		 CI_HDRC_OVERRIDE_PHY_CONTROL |
+		 CI_HDRC_SUPPORTS_RUNTIME_PM,
 	.dr_mode = USB_DR_MODE_HOST,
 	.txfifothresh = 10,
 };
 
 static const struct tegra_usb_soc_info tegra30_ehci_soc_info = {
 	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA |
-		 CI_HDRC_OVERRIDE_PHY_CONTROL
+		 CI_HDRC_OVERRIDE_PHY_CONTROL |
+		 CI_HDRC_SUPPORTS_RUNTIME_PM,
 	.dr_mode = USB_DR_MODE_HOST,
 	.txfifothresh = 16,
 };
 
 static const struct tegra_usb_soc_info tegra_udc_soc_info = {
 	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA |
-		 CI_HDRC_OVERRIDE_PHY_CONTROL,
+		 CI_HDRC_OVERRIDE_PHY_CONTROL |
+		 CI_HDRC_SUPPORTS_RUNTIME_PM,
 	.dr_mode = USB_DR_MODE_UNKNOWN,
 };
 
@@ -323,6 +326,10 @@ static int tegra_usb_probe(struct platform_device *pdev)
 	usb->data.hub_control = tegra_ehci_hub_control;
 	usb->data.notify_event = tegra_usb_notify_event;
 
+	/* Tegra PHY driver currently doesn't support LPM for ULPI */
+	if (of_usb_get_phy_mode(pdev->dev.of_node) == USBPHY_INTERFACE_MODE_ULPI)
+		usb->data.flags &= ~CI_HDRC_SUPPORTS_RUNTIME_PM;
+
 	usb->dev = ci_hdrc_add_device(&pdev->dev, pdev->resource,
 				      pdev->num_resources, &usb->data);
 	if (IS_ERR(usb->dev)) {
-- 
2.29.2

