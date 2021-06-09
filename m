Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A0E1C48BCF
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 12:05:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CEDA61364
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Jun 2021 12:05:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232709AbhFIMH1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Jun 2021 08:07:27 -0400
Received: from mail-lf1-f41.google.com ([209.85.167.41]:42745 "EHLO
        mail-lf1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239047AbhFIMH1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Jun 2021 08:07:27 -0400
Received: by mail-lf1-f41.google.com with SMTP id j2so10018299lfg.9;
        Wed, 09 Jun 2021 05:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tZCtQMsPj6MqTMMB9OICoZBXpm2RZpvCwMPjZq6lUwg=;
        b=Z8P89ckWEfrdYLEzk8hMiruknY00sSelI3mQZ1roumXi7lpgnpvHeHLSwgCnViNmB6
         l2ZeYN5BcVUCzqlIpZGWVoC5ttMLmGdv3sT5KORIf1hufdrS3tdz26RWcvXUvES80VvO
         tPQUj2UWIwuwHF7bxPDYucydIUluBHNJ77lXT5TrTSIqT34zP6DAUPorPRyuuG5fKGqr
         EAW9Dg8G7Pm1Vu6fDWGEsiWvuvgAQ5x+1Kvs6k8z3MRDFiniPWq34EUkAG0bhPUPCpaP
         mEbuaF4Fwm6e2Eb/cnakYKhzAKLwDk1F2DgwLrh0r0SpzQqobfguZhfgSuJA8kCqx1XB
         M0PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tZCtQMsPj6MqTMMB9OICoZBXpm2RZpvCwMPjZq6lUwg=;
        b=dYieoxjWBYh2StE+MQOMJ9R/EDMU+TOIvPXdgnxonUvzQ2ZZOW8CcZObslES0wQjFk
         l1vzk8rm1LcpTgN+mRdZHa/VfKeAMoRFAS9pTTB3BdKhh/jTEBUczEYTA7hStwZ3s4MZ
         +WnOkHo9tImDOqroLHB6rO8d4Z82j3zJ7wpr8cNLQgl95Kae6dunCx+rxyaGAHweQskP
         zbY5vh0Y98CkKE/BYH8GXCZf/X+uOfK05pOL7Hlh8DzAqUBeLn8Ed80KbOkNpwbUM6Sx
         +uSXO/MsIwCO8LdlT1ILthwuPhxnjw3biTutTniKSkco355ulVq5kzuTbO4pIuBeyy2c
         o1DQ==
X-Gm-Message-State: AOAM530FiKlXslGX3E0skcBiZnZU2qwzpXHLSZsMxkx5hqb7eUWrY8dS
        RM4zMr5TIU3/V68rWl6vroU=
X-Google-Smtp-Source: ABdhPJwY/S91q5i0lz2bcOndUtszbqCfLijy1yXbwEHJEnQpC2RlW9H6eg7X5dfwVnxNZ7zaU7XPng==
X-Received: by 2002:a19:7d83:: with SMTP id y125mr10538351lfc.135.1623240271419;
        Wed, 09 Jun 2021 05:04:31 -0700 (PDT)
Received: from localhost.localdomain (94-29-21-60.dynamic.spd-mgts.ru. [94.29.21.60])
        by smtp.gmail.com with ESMTPSA id h19sm338580lfc.225.2021.06.09.05.04.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jun 2021 05:04:31 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Maxim Schwalm <maxim.schwalm@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1] usb: chipidea: tegra: Delay PHY suspending
Date:   Wed,  9 Jun 2021 15:04:04 +0300
Message-Id: <20210609120404.3991-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The ChipIdea driver enters into suspend immediately after seeing a
VBUS disconnection. Some devices need an extra delay after losing
VBUS, otherwise VBUS may be floating, preventing the PHY's suspending
by the VBUS detection sensors. This problem was found on Tegra30 Asus
Transformer TF700T tablet device, where the USB PHY wakes up immediately
from suspend because VBUS sensor continues to detect VBUS as active after
disconnection. A minimum delay of 20ms is needed in order to fix this
issue, hence add 25ms delay before suspending the PHY.

Reported-by: Maxim Schwalm <maxim.schwalm@gmail.com> # Asus TF700T
Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> # Asus TF700T
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 60361141ac04..d1359b76a0e8 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
@@ -255,6 +256,13 @@ static int tegra_ehci_hub_control(struct ci_hdrc *ci, u16 typeReq, u16 wValue,
 
 static void tegra_usb_enter_lpm(struct ci_hdrc *ci, bool enable)
 {
+	/*
+	 * Give hardware time to settle down after VBUS disconnection,
+	 * otherwise PHY may wake up from suspend immediately.
+	 */
+	if (enable)
+		msleep(25);
+
 	/*
 	 * Touching any register which belongs to AHB clock domain will
 	 * hang CPU if USB controller is put into low power mode because
-- 
2.30.2

