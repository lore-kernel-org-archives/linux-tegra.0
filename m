Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EAE1C48BCF
	for <linux-tegra@archiver.kernel.org>; Sun, 13 Jun 2021 15:02:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1097E61285
	for <linux-tegra@archiver.kernel.org>; Sun, 13 Jun 2021 15:02:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231922AbhFMPE0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 13 Jun 2021 11:04:26 -0400
Received: from mail-lj1-f178.google.com ([209.85.208.178]:34633 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231755AbhFMPEZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 13 Jun 2021 11:04:25 -0400
Received: by mail-lj1-f178.google.com with SMTP id bn21so16487085ljb.1;
        Sun, 13 Jun 2021 08:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ASZtt9RicUC6Li5nnAiBicxpu/Z78FYFE+q293rWAv4=;
        b=WjENKTp316jAB/g3HUjC5zwc5CBlihmCSLBIhFpD/wzCb2VjZpLJ1F57d2ky/M8Kda
         5D8IjWM1UgO/ivr/ItE2579NYXdqi4689uTwS8tvsybXCDRxuns0zle+ZomNBrroJTPe
         UeZzk831ppOrd2bDRaJmEU3zDUUHiLvnN7fIGQOGYvoQDoT3l+iTzV0VGtYj6QfjLBAq
         67PeR5J2ZaTOEicGb02kOjgWy3mFmxvjYU+vFFCmyfcgTozXtMF0W5ZQhxathC6LJlsP
         RwYbfXFH/yrkUW3aeHkl2YbHuN7Iric782426fQWHVsuaQ65qyjPHHGycg/4nIAKxTZm
         haBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ASZtt9RicUC6Li5nnAiBicxpu/Z78FYFE+q293rWAv4=;
        b=cMGeAi9LQo+v8V7t6K2m2An1eT6hS1tmg1p6gKTLvoyntk3jDS8QIxuVwT39125h0D
         YQrbsDm7vgyfla5WpP5tKz8ODpisDKKRt5kcpqd4a90GFDflVGzU+rBGNYTAoFA7/lXa
         qB+nIEKPgLi78jty51GQI9YB3X4YN2fQByMbDUOzHv+MpFv+htPLPFjwKNbn1cjt61Nq
         j5bkgoaffcHstnvZp2k+otelEEcZzdVjpL9JF/fCh+uf7UbSSH8ji+2hqET/MOXNMbwi
         z1xJxYhd/29bw0rna+anwufv1AWEbPjfVFYkXjMNqaVILcWxV1GEqlWo+650HvTr94aK
         KzxA==
X-Gm-Message-State: AOAM531aUHqYTJi/JfIp0k/PrLl2WzsTjz6W89lXjrj3Lx4duDljT4V/
        sxC/5KLXAJP6d98eI7Mbvp4=
X-Google-Smtp-Source: ABdhPJzDUZYYGFXmlBUv9wVpn8FtmOm3sjTTS5l1UfkXwSPIEyrBJss8+Yy1uo0ZkV2fLg7B/cSSag==
X-Received: by 2002:a2e:1414:: with SMTP id u20mr10180144ljd.416.1623596483438;
        Sun, 13 Jun 2021 08:01:23 -0700 (PDT)
Received: from localhost.localdomain (46-138-6-137.dynamic.spd-mgts.ru. [46.138.6.137])
        by smtp.gmail.com with ESMTPSA id b16sm1473192ljh.93.2021.06.13.08.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 08:01:23 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Maxim Schwalm <maxim.schwalm@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] usb: phy: tegra: Wait for VBUS wakeup status deassertion on suspend
Date:   Sun, 13 Jun 2021 17:59:35 +0300
Message-Id: <20210613145936.9902-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Some devices need an extra delay after losing VBUS, otherwise VBUS may
be detected as active at suspend time, preventing the PHY's suspension
by the VBUS detection sensor. This problem was found on Asus Transformer
TF700T (Tegra30) tablet device, where the USB PHY wakes up immediately
from suspend because VBUS sensor continues to detect VBUS as active after
disconnection. We need to poll the PHY's VBUS wakeup status until it's
deasserted before suspending PHY in order to fix this minor trouble.

Fixes: 35192007d28d ("usb: phy: tegra: Support waking up from a low power mode")
Reported-by: Maxim Schwalm <maxim.schwalm@gmail.com> # Asus TF700T
Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> # Asus TF700T
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index fc5c6cab58ba..ff482c694200 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -64,6 +64,7 @@
 #define   A_VBUS_VLD_WAKEUP_EN			BIT(30)
 
 #define USB_PHY_VBUS_WAKEUP_ID			0x408
+#define   VBUS_WAKEUP_STS			BIT(10)
 #define   VBUS_WAKEUP_WAKEUP_EN			BIT(30)
 
 #define USB1_LEGACY_CTRL			0x410
@@ -645,6 +646,15 @@ static int utmi_phy_power_off(struct tegra_usb_phy *phy)
 	void __iomem *base = phy->regs;
 	u32 val;
 
+	/*
+	 * Give hardware time to settle down after VBUS disconnection,
+	 * otherwise PHY will immediately wake up from suspend.
+	 */
+	if (phy->wakeup_enabled && phy->mode != USB_DR_MODE_HOST)
+		readl_relaxed_poll_timeout(base + USB_PHY_VBUS_WAKEUP_ID,
+					   val, !(val & VBUS_WAKEUP_STS),
+					   5000, 100000);
+
 	utmi_phy_clk_disable(phy);
 
 	/* PHY won't resume if reset is asserted */
-- 
2.30.2

