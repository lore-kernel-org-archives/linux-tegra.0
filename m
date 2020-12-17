Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87D08C2BBCD
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 09:47:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49401238E1
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Dec 2020 09:47:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726569AbgLQJqZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Dec 2020 04:46:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727993AbgLQJqK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Dec 2020 04:46:10 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEB36C061257;
        Thu, 17 Dec 2020 01:44:53 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id o19so30119897lfo.1;
        Thu, 17 Dec 2020 01:44:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SQW682SNhDsjl2P24nfgF7SWJzhlw6l3S/bWSyN4tX0=;
        b=Zz0Ic5MU75un02Irbv+4P5nyuVMS34Rn01jo5JTUhlMxrt5PUfeahRj/L9atQKClEC
         nUkZzol6MdScqj9YqT7I4uRCaq3gI7HsRHEkE/95QHo3Xxj6nL+qsOtytQyt657i0vi0
         S3Y5JATqZpo8qpMdjaD+ksvo0ng4rXhYwBb5uroEF8F+CR503w7xmPbky2awhPqMMAwA
         srqSpvATnqytTq8I+f4gLPhiFRA69q5P/qZNmKb5imA1xa5B2guX4m8RGi8abLlo7ZR8
         chDMRzePY074v0HzC6NEvJXslKuEZva7TTUBspBFe6CCCJOYJykdMDALkUmNCx1w6lrE
         luzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SQW682SNhDsjl2P24nfgF7SWJzhlw6l3S/bWSyN4tX0=;
        b=WwosMHLe/4NsLdiiTVI/1aImDQFMdv2vXT/Jx8NvE3bGnnbjM6Xyc6zC4aOnjMnPI1
         YzAT25cZ2mnTgrkQI7JIu40hQXFMlgtOqghDbfx7T2PmnfhwT+RMclP097MWYAXdvSK6
         6B5PiJSUFmhPdcTGQ50A93qs2tXuQInk2x2xK3YJH5RTR5jVnv0jT8ufNMMx0FGV3Xum
         rSIwGPVhJZeeorMmAdw2JqS5U5Sr2jCJMnal25lrwYm9TSn6cKOcibqjfJC2g+dgXhKU
         Ap2Te3aXuw6QqDSfX46vv9C4r5WslQ/QG9EzHzJUcUqQSy03FJHubn2GnDeX1QFsz2wO
         90DQ==
X-Gm-Message-State: AOAM531yhTOFKErUAyHFGgC4LnZJfB8URwumPUEGJoTuG8DbiDGrhlji
        xj3Dx3sqBwMHqll5iu+fNYg=
X-Google-Smtp-Source: ABdhPJyupW5h/9Ryo1Cq+UoYASEmri2csCVWF4e5v0NnebdUHlcMoUkLsZHXVreFzPwRG4QS2MdfXg==
X-Received: by 2002:a19:4cc:: with SMTP id 195mr14418347lfe.498.1608198292419;
        Thu, 17 Dec 2020 01:44:52 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id u19sm613917lji.2.2020.12.17.01.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 01:44:51 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>, Ion Agorria <ion@agorria.com>
Cc:     linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] usb: chipidea: tegra: Support runtime PM
Date:   Thu, 17 Dec 2020 12:40:05 +0300
Message-Id: <20201217094007.19336-7-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217094007.19336-1-digetx@gmail.com>
References: <20201217094007.19336-1-digetx@gmail.com>
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
Tested-by: Ion Agorria <ion@agorria.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 5fccdeeefc64..655671159511 100644
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
-		 CI_HDRC_OVERRIDE_PHY_CONTROL,
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

