Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 798C6C7EE29
	for <linux-tegra@archiver.kernel.org>; Tue, 30 May 2023 10:51:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbjE3KvR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 May 2023 06:51:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjE3KvQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 May 2023 06:51:16 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D7CF8F;
        Tue, 30 May 2023 03:51:15 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-973e7c35eddso419750366b.0;
        Tue, 30 May 2023 03:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685443873; x=1688035873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UXwcP3EM/dtcbayeTAVS9qnTQoR9QiJVpAbFocyePDk=;
        b=aZOJrgaFrYpL2gx0X9yCw0TYi07yjgBckK31UIxiT9TS6pgmRN5HCVWL3cyHGeVcle
         aXYq6jmRPKslcerHgd8ar7ZZDGFINVv50J+R19UeSheYRSRUY87hNhHVw3K7eq0tT7D8
         5Wmelf2W+htUtSfsAkwo/Zpka1Kc4JW3brAMH0f6pFxVVTibIeJYzWMcJ4TgJMj31GRD
         kpAyqe6fUGvf93mjmCiecqviSWm4TRWb5aFH9ntWL7U+/o4aNg7mjTotvRQ2uZJERgn1
         lcJCgLpemnPm9VeS667sRu+JWcCCuL+npmBQjt0mwFF5hzLVTIorfebNN2+ji8Lmxo1r
         O8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685443873; x=1688035873;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UXwcP3EM/dtcbayeTAVS9qnTQoR9QiJVpAbFocyePDk=;
        b=F/tTB5Znr8JhSxS350S54p6WhktfZP918jGAfwfnYBRKI/d/UoXvIWA/5yi1aedmjm
         sScegHMDRjOfkBBo18qMfE+w4VJ29Pa6oSDiKDl90ERwitFJE7iAGpxSTnTzv/5RANdf
         ZocUuc3El0DjZLYBYpV0B1lJ2YGK1CWe7dDGfVy+2ahpPj3rIXkdLEmlDwpBcHePq7nU
         5GCtyDV3Cav5g9Igxkpk+jAxeIvUfh4M3dx8AlowJJvaIacypFM4X8+B/Ex7a17PRRhu
         nJLPn9lyxHeXzlw/oRPuI8N3L4ViN0Lm2xAlLl1ic7f9ixRqwnqvy3lv7c7Z8X+dnju8
         i5gg==
X-Gm-Message-State: AC+VfDzuOmkJ+PCLA1NN96QMJFa89Y47Lx+QlNky6nSYXSxwH+zY9Mw4
        T24WBqSusxP/w/IQdEvml3s=
X-Google-Smtp-Source: ACHHUZ5ZZLcK1sBXWfk2XDr7Ow9I8rXw6/COYuK7cnl/xZWLq6Rr7fjWZ1GHiAnP/j7eWstguPmv0w==
X-Received: by 2002:a17:907:7291:b0:96a:eb2:9c5e with SMTP id dt17-20020a170907729100b0096a0eb29c5emr2319974ejc.63.1685443873061;
        Tue, 30 May 2023 03:51:13 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id bh25-20020a170906a0d900b0096165b2703asm7108900ejb.110.2023.05.30.03.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 03:51:12 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3] dt-bindings: gpio: Remove FSI domain ports on Tegra234
Date:   Tue, 30 May 2023 12:51:08 +0200
Message-Id: <20230530105108.1292681-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Prathamesh Shete <pshete@nvidia.com>

Ports S, T, U and V are in a separate controller that is part of the FSI
domain. Remove their definitions from the MAIN controller definitions to
get rid of the confusion.

This technically breaks ABI compatibility with old device trees. However
it doesn't cause issues in practice. The GPIO pins impacted by this are
used for non-critical functionality.

Fixes: a8b10f3d12cfc ("dt-bindings: gpio: Add Tegra234 support")
Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
[treding@nvidia.com: rewrite commit message]
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- rewrite commit message to provide a bit more background

 include/dt-bindings/gpio/tegra234-gpio.h | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/include/dt-bindings/gpio/tegra234-gpio.h b/include/dt-bindings/gpio/tegra234-gpio.h
index d7a1f2e298e8..784673c2c752 100644
--- a/include/dt-bindings/gpio/tegra234-gpio.h
+++ b/include/dt-bindings/gpio/tegra234-gpio.h
@@ -33,18 +33,14 @@
 #define TEGRA234_MAIN_GPIO_PORT_P  14
 #define TEGRA234_MAIN_GPIO_PORT_Q  15
 #define TEGRA234_MAIN_GPIO_PORT_R  16
-#define TEGRA234_MAIN_GPIO_PORT_S  17
-#define TEGRA234_MAIN_GPIO_PORT_T  18
-#define TEGRA234_MAIN_GPIO_PORT_U  19
-#define TEGRA234_MAIN_GPIO_PORT_V  20
-#define TEGRA234_MAIN_GPIO_PORT_X  21
-#define TEGRA234_MAIN_GPIO_PORT_Y  22
-#define TEGRA234_MAIN_GPIO_PORT_Z  23
-#define TEGRA234_MAIN_GPIO_PORT_AC 24
-#define TEGRA234_MAIN_GPIO_PORT_AD 25
-#define TEGRA234_MAIN_GPIO_PORT_AE 26
-#define TEGRA234_MAIN_GPIO_PORT_AF 27
-#define TEGRA234_MAIN_GPIO_PORT_AG 28
+#define TEGRA234_MAIN_GPIO_PORT_X  17
+#define TEGRA234_MAIN_GPIO_PORT_Y  18
+#define TEGRA234_MAIN_GPIO_PORT_Z  19
+#define TEGRA234_MAIN_GPIO_PORT_AC 20
+#define TEGRA234_MAIN_GPIO_PORT_AD 21
+#define TEGRA234_MAIN_GPIO_PORT_AE 22
+#define TEGRA234_MAIN_GPIO_PORT_AF 23
+#define TEGRA234_MAIN_GPIO_PORT_AG 24
 
 #define TEGRA234_MAIN_GPIO(port, offset) \
 	((TEGRA234_MAIN_GPIO_PORT_##port * 8) + offset)
-- 
2.40.1

