Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E462CDB46E
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Oct 2023 12:43:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343894AbjJLMnQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 12 Oct 2023 08:43:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343872AbjJLMnQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Oct 2023 08:43:16 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714AC91
        for <linux-tegra@vger.kernel.org>; Thu, 12 Oct 2023 05:43:14 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c4fdf94666so2839601fa.2
        for <linux-tegra@vger.kernel.org>; Thu, 12 Oct 2023 05:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697114593; x=1697719393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ta09WPRuO9o6C84VTSDlxVug49qH4I0X6C9I7Cy7wEo=;
        b=k0fK5oxyYcbxAsxtunTh9nmgQvF08uhadjoi7jAI9sUYCQeH/0KJ68TvaTe1XUj7WE
         6tojFxXITotBs0kVOF7OTZRz3piWaJrr6vzItUE5Fa9RtvxeRrNjJSQ4F0x8I7CTaTQ1
         Zo66iyzdDfemzRpZIwqx9UL2MFn58PDN9P/XkMUYFKP1pdGTvXCekuL0N1fWjPLpuV04
         Rd8xrVxl2u/wISMZb3+4sdpg4LnRmVHtXPXVN64ZO2FGoCWGchAbgI7tvJ/Dx0kY90+j
         4vLd2Z8VhJMqgnZ3takArhGplvo0wpPgvBrPxgIpJh2pMjmQ6q0taNM2KLYtDXjV7wry
         rCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697114593; x=1697719393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ta09WPRuO9o6C84VTSDlxVug49qH4I0X6C9I7Cy7wEo=;
        b=SqA8EpSbQdMB+u8U/FX+tiHI3dFGGRDk0IK1faZyBufr3nkuIY2mmt8aJj9VxdgU6P
         MzWAbW46G7B88QuYHyU3TcfsePNJIAfpNGvBjEG/J+dFaxv0hQG1gAZM+h9sgxcMbSoY
         U816WMzlYcoIl1BtMJZ1X/XVd/YlHjaljlJHI9Pm1AG0R/gWObgG7vv+W+Fge/6Nfbfy
         /Lv2xatdII2KX3+k6YYxlLuE9xAO7+A1PaCOiXPwioWSvWqTmUUzTQz4LIXd4qim0WWV
         bhojK8VfOR5JrzFTeY8e+vKalXinlvceG0+yy2ft18mZea9NVhUecMCPEekf/jIJSM2F
         R3NA==
X-Gm-Message-State: AOJu0YwUnycdIi4ggt+gg3/Uv/aVEiHMwNisqCgpvootkqkyzfDbVNUi
        /Kn1KY/kDyIVPxJYPD2VI/c=
X-Google-Smtp-Source: AGHT+IFCGbeStAuF+4VDo7mXTlL3dbPR3XDiF10JyYmT6HOw6XK3VB3UxvrWcFhSBaP/IE5NArwsjw==
X-Received: by 2002:a05:6512:3f0e:b0:502:f7a4:c31f with SMTP id y14-20020a0565123f0e00b00502f7a4c31fmr25312499lfa.45.1697114592344;
        Thu, 12 Oct 2023 05:43:12 -0700 (PDT)
Received: from localhost (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id f26-20020a50ee9a000000b0052e1783ab25sm10168092edr.70.2023.10.12.05.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 05:43:11 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Shubhi Garg <shgarg@nvidia.com>
Subject: [PATCH] arm64: tegra: Use correct interrupts for Tegra234 TKE
Date:   Thu, 12 Oct 2023 14:43:11 +0200
Message-ID: <20231012124311.3009393-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The shared interrupts 0-9 of the TKE are mapped to interrupts 0-9, but
shared interrupts 10-15 are mapped to 256-261. Correct the mapping for
the final 6 interrupts. This prevents the TKE from requesting the RTC
interrupt (along with several GTE and watchdog interrupts).

Reported-by: Shubhi Garg <shgarg@nvidia.com>
Fixes: 28d860ed02c2 ("arm64: tegra: Enable native timers on Tegra234")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 7cf31862d68b..cc11cfe34edb 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -43,12 +43,12 @@ timer@2080000 {
 				     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>;
 			status = "okay";
 		};
 
-- 
2.42.0

