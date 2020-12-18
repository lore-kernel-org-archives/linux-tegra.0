Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 240D6C3526C
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Dec 2020 12:13:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E510223443
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Dec 2020 12:13:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727320AbgLRMMh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Dec 2020 07:12:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727305AbgLRMMg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Dec 2020 07:12:36 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DFDFC0611CB;
        Fri, 18 Dec 2020 04:11:36 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id h205so4866492lfd.5;
        Fri, 18 Dec 2020 04:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2IsbWh1rf9RTCCWtGtGkylE20Ibu0bNbLzdUEufICpY=;
        b=Ndm1OqPIOVwxN5BKexbkPkffX1xopcaVGETou0fnTAemghPL0rfl0z5tMZ3H2G3o1S
         HCyuZ8GvplSyQwAnZnM736GAzj+XZ60T/HoodDyvOLafAqmjrKz43Vh4HY9wTtpI0Udh
         MnGqLuDEGyK1r3mSHmXf82xgxbdAAb6XTZ81b1emjfH++hVzy2jUc/2l4ZuProWWE4HM
         +WQ2pU/rEl2DYp63f2kzeMeeg/7A6+MyRrAX31WwCyBcabodJtPqdGCK65JjPru1DA55
         +cRs4am/FFj6xA4YYJpvyT4va/oGXtJNvyjhMNnwf+BnxRa8kBh8EAK/4aj/JjPb5nHp
         kZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2IsbWh1rf9RTCCWtGtGkylE20Ibu0bNbLzdUEufICpY=;
        b=OlJTPwSULemDQbtpGqqtEkkRG86uaolLtl6w5MF06T7Z0D8cMjcF35LL6bwKrjtgCu
         02BERadR0L1r8F/pgsznm5xPBaSHCpPR1tv1HMXaC+4LL28v75py6fqwt3gx7kgHm3tp
         nZE/MbEDX0WXa9xULEhXYGBam9VW97VSA+r4xBRzvceAlK+5/RMUrYG5H+mVNymmYyQz
         K2jd6GjdzhdZg/+JaAZ2dWH3YO6z4iONuKBHxOODxVRWg75TX2J6UPu/wYsdB1axag04
         7S0O3fb/qcUDYBALn0HL+caOHjZ5IOzAYFXVokDs5AaAMSB/EyZDnWZEMWSuDZKCUspV
         aTHQ==
X-Gm-Message-State: AOAM531KO0SD3FEU/Y5Y9GoPy1vSCANbOPlx4uOyJ6dZvIFcALY4PM8F
        nVq8O5PyCOosWcyoZUeLX3Q=
X-Google-Smtp-Source: ABdhPJxdWoOhk2KAdpI3CUtGlUPJcCiLF8BCKDcCPLawxiiQ0JjwyHMUuxsNgvZyMwSBCoDuBIBhow==
X-Received: by 2002:a05:651c:1068:: with SMTP id y8mr1702418ljm.76.1608293494906;
        Fri, 18 Dec 2020 04:11:34 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id i9sm1036472ljn.18.2020.12.18.04.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 04:11:34 -0800 (PST)
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
Subject: [PATCH v3 7/9] usb: chipidea: tegra: Specify TX FIFO threshold in UDC SoC info
Date:   Fri, 18 Dec 2020 15:02:44 +0300
Message-Id: <20201218120246.7759-8-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201218120246.7759-1-digetx@gmail.com>
References: <20201218120246.7759-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The UDC/OTG controller could be switched to a host mode and the
TXFILLTUNING register needs to be programmed properly for the host
mode. Hence specify the TX FIFO threshold in the UDC SoC info.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 655671159511..90f2a8b786be 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -52,11 +52,20 @@ static const struct tegra_usb_soc_info tegra30_ehci_soc_info = {
 	.txfifothresh = 16,
 };
 
-static const struct tegra_usb_soc_info tegra_udc_soc_info = {
+static const struct tegra_usb_soc_info tegra20_udc_soc_info = {
 	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA |
 		 CI_HDRC_OVERRIDE_PHY_CONTROL |
 		 CI_HDRC_SUPPORTS_RUNTIME_PM,
 	.dr_mode = USB_DR_MODE_UNKNOWN,
+	.txfifothresh = 10,
+};
+
+static const struct tegra_usb_soc_info tegra30_udc_soc_info = {
+	.flags = CI_HDRC_REQUIRES_ALIGNED_DMA |
+		 CI_HDRC_OVERRIDE_PHY_CONTROL |
+		 CI_HDRC_SUPPORTS_RUNTIME_PM,
+	.dr_mode = USB_DR_MODE_UNKNOWN,
+	.txfifothresh = 16,
 };
 
 static const struct of_device_id tegra_usb_of_match[] = {
@@ -68,16 +77,16 @@ static const struct of_device_id tegra_usb_of_match[] = {
 		.data = &tegra30_ehci_soc_info,
 	}, {
 		.compatible = "nvidia,tegra20-udc",
-		.data = &tegra_udc_soc_info,
+		.data = &tegra20_udc_soc_info,
 	}, {
 		.compatible = "nvidia,tegra30-udc",
-		.data = &tegra_udc_soc_info,
+		.data = &tegra30_udc_soc_info,
 	}, {
 		.compatible = "nvidia,tegra114-udc",
-		.data = &tegra_udc_soc_info,
+		.data = &tegra30_udc_soc_info,
 	}, {
 		.compatible = "nvidia,tegra124-udc",
-		.data = &tegra_udc_soc_info,
+		.data = &tegra30_udc_soc_info,
 	}, {
 		/* sentinel */
 	}
-- 
2.29.2

