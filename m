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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74764C49360
	for <linux-tegra@archiver.kernel.org>; Sun, 13 Jun 2021 15:02:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5655561357
	for <linux-tegra@archiver.kernel.org>; Sun, 13 Jun 2021 15:02:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231955AbhFMPE2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 13 Jun 2021 11:04:28 -0400
Received: from mail-lj1-f178.google.com ([209.85.208.178]:35502 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231782AbhFMPE0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 13 Jun 2021 11:04:26 -0400
Received: by mail-lj1-f178.google.com with SMTP id n17so16509076ljg.2;
        Sun, 13 Jun 2021 08:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vwLc+Cwj3JuQAE0/T4amXW2tbDrWfyGTYXqxA4e2OyA=;
        b=fO7EoFAKItDv6Z5MzvtL7UIFVHmALkSBXDxitKBqJcSK0fFZQCJSLujj2XcnyKI+VX
         UPSlVQcQ1VdALrAa9IDI+So8b/movDBeyejfwjs87iGRpR6jnGbhaZPaV1lts2ECkk9C
         ES6dOlnHjCVR1/yet35rL+phW8tVlj8jaqBHPkE/ciJJIgm4edVxY+r/b/IcGLiv3kqt
         yATCv6Oe6JXFTRhQxdYhSDoDcNrHp5rfRkN9jbJJoMwqGX0wi+o+RRh5bY444ir2osnI
         yHNhB2L4RYkkYj7IRxYIPjSQ5fMdjoNgdrfOsEYpPT3y0rl/xLf0Jk+PhIifeCnNkEXs
         QF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vwLc+Cwj3JuQAE0/T4amXW2tbDrWfyGTYXqxA4e2OyA=;
        b=iwoYqgOiZ63oapBQu8ODulM5jfdw7d2TpYHs1HMiMW129TwxnDf+HQdtf+w0DOBUHt
         nDjUVTt4jANXi66L/JyJw7lg5Y8QOrlk6bbnpvppqfuiD/+/KBYpKgqmTNNwUGu6mtsQ
         YhnCpbk5lvntjFO/Qrk+L2pr0eDq787+E6pPubgnU/cYz2I+ixvVYXN4vplQjRF4JNQ2
         IY5BRstJ1I7QtQIan9xCNnnGmYhfxvupwznlKz3fCcw0k3OpAB+WWK/W6NSXc4210EKV
         kUwefz5ke/sVPRqZzwCVMuFPbA56NHwmSL+LEAAanh8XMcF2fIyCEPISxSsATEZp0J7T
         CEnQ==
X-Gm-Message-State: AOAM530OmTv4j7zV7O8o8IZCoVab6Cv/12OIKYYXmvjeX2a5xjRu2qYd
        O7dmCKxFccvnwJ5GVKBxUOQ=
X-Google-Smtp-Source: ABdhPJz5iw9M2VyooUEsY/17QxKjJSsLfqND4f//c5Q67oFJL4LNqLskgq1PIW/4rG6V0gvzNJWn7g==
X-Received: by 2002:a2e:9c4a:: with SMTP id t10mr10577162ljj.307.1623596484035;
        Sun, 13 Jun 2021 08:01:24 -0700 (PDT)
Received: from localhost.localdomain (46-138-6-137.dynamic.spd-mgts.ru. [46.138.6.137])
        by smtp.gmail.com with ESMTPSA id b16sm1473192ljh.93.2021.06.13.08.01.23
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
Subject: [PATCH v1 2/2] usb: phy: tegra: Correct definition of B_SESS_VLD_WAKEUP_EN bit
Date:   Sun, 13 Jun 2021 17:59:36 +0300
Message-Id: <20210613145936.9902-2-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210613145936.9902-1-digetx@gmail.com>
References: <20210613145936.9902-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The B_SESS_VLD_WAKEUP_EN bit 6 was added by a mistake in a previous
commit. This bit corresponds to B_SESS_END_WAKEUP_EN, which we don't use.
The B_VBUS_VLD_WAKEUP_EN doesn't exist at all and B_SESS_VLD_WAKEUP_EN
needs to be in place of it. We don't utilize B-sensors in the driver,
so it never was a problem, nevertheless let's correct the definition of
the bits.

Fixes: 35192007d28d ("usb: phy: tegra: Support waking up from a low power mode")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/phy/phy-tegra-usb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
index ff482c694200..cd425b937750 100644
--- a/drivers/usb/phy/phy-tegra-usb.c
+++ b/drivers/usb/phy/phy-tegra-usb.c
@@ -58,8 +58,7 @@
 #define   USB_WAKEUP_DEBOUNCE_COUNT(x)		(((x) & 0x7) << 16)
 
 #define USB_PHY_VBUS_SENSORS			0x404
-#define   B_SESS_VLD_WAKEUP_EN			BIT(6)
-#define   B_VBUS_VLD_WAKEUP_EN			BIT(14)
+#define   B_SESS_VLD_WAKEUP_EN			BIT(14)
 #define   A_SESS_VLD_WAKEUP_EN			BIT(22)
 #define   A_VBUS_VLD_WAKEUP_EN			BIT(30)
 
@@ -548,7 +547,7 @@ static int utmi_phy_power_on(struct tegra_usb_phy *phy)
 
 		val = readl_relaxed(base + USB_PHY_VBUS_SENSORS);
 		val &= ~(A_VBUS_VLD_WAKEUP_EN | A_SESS_VLD_WAKEUP_EN);
-		val &= ~(B_VBUS_VLD_WAKEUP_EN | B_SESS_VLD_WAKEUP_EN);
+		val &= ~(B_SESS_VLD_WAKEUP_EN);
 		writel_relaxed(val, base + USB_PHY_VBUS_SENSORS);
 
 		val = readl_relaxed(base + UTMIP_BAT_CHRG_CFG0);
-- 
2.30.2

