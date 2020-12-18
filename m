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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41251C3526B
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Dec 2020 12:13:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 121E923A51
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Dec 2020 12:13:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbgLRMMh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Dec 2020 07:12:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725908AbgLRMMg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Dec 2020 07:12:36 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 625F4C0611CA;
        Fri, 18 Dec 2020 04:11:35 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id m12so4845786lfo.7;
        Fri, 18 Dec 2020 04:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SQW682SNhDsjl2P24nfgF7SWJzhlw6l3S/bWSyN4tX0=;
        b=F+66QnqOt0FOnbxjecSLHKg28YliLDvU9ywI+1HZGUX5zQQ8bgdkMXogBjx1FMLXt1
         yjFiaSF6zbiONXWaWDgk5Dq49I/pJfwNGKKmGjJB1gU/EqRrYl0B0BuKEH08LAkA4bRU
         hC9GhRiDcq2jI28qL9CsDgaUpY987ppbeafJwDeH5YRXDlFEx077OxvCB+lnxBSsFHER
         ZogeARHefNasMko2UA3/Mxw6EQCkZvCD2mPipz4XMQriRqsswhgYdnCCzK7Z2XUbbvL4
         lDZSbdmEb2Kmz+n2PFolncPiQtcfbe3T4wdLRBtZkxcWpBeeZkxAPcQg4cxGmdMydi4d
         JO7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SQW682SNhDsjl2P24nfgF7SWJzhlw6l3S/bWSyN4tX0=;
        b=WwvsG9OLQxbi/sup1+DgSkhuny8x3wk84V/aQm/5TuBfLdrgGLPyQaNriV6ImJFMgq
         HjbU62w41Sm/3ZPO27bHnO8MhUye19ngf1cX2uGH9Y+Spv19AjaWVsakAuCC9FjXvf3x
         kKVr6racONh2iEf3QJDdKzChddtNIA+o+fxYyf40uDgfij0rjUFRcwVGVZSGLQOhhmND
         1mRCbw+OuZEgFJoj49MkYDPSNHp4vecd3Fj979nMfC23LRq09CdWfakdfI0LY9pygzDp
         ektoRvI0W22dG5qHw7D8noijL7r12JQ0mWQvbIb35DWYEXUci7lwAzs4ZA9X1G5ThO9Z
         59BQ==
X-Gm-Message-State: AOAM530gPasT3Y0l0ihlR9xTFwOnokzYx5bqKYAkRDsRM1JQAKy04h7L
        bsfhQsqM7F632tnfHjof7Hw=
X-Google-Smtp-Source: ABdhPJw29PEL2FfJEAHlJ/jJIhoM+N+tqmM2jiMAoB6Jt1b25blPnYzpkeFP0KV7AB8V4X3qirfhRg==
X-Received: by 2002:a2e:b4d4:: with SMTP id r20mr1717426ljm.445.1608293493917;
        Fri, 18 Dec 2020 04:11:33 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id i9sm1036472ljn.18.2020.12.18.04.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 04:11:33 -0800 (PST)
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
Subject: [PATCH v3 6/9] usb: chipidea: tegra: Support runtime PM
Date:   Fri, 18 Dec 2020 15:02:43 +0300
Message-Id: <20201218120246.7759-7-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218120246.7759-1-digetx@gmail.com>
References: <20201218120246.7759-1-digetx@gmail.com>
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

