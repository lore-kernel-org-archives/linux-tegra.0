Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F8FC2FC37
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Aug 2023 14:14:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351762AbjHQOOV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Aug 2023 10:14:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351861AbjHQOOT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Aug 2023 10:14:19 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E4862D62
        for <linux-tegra@vger.kernel.org>; Thu, 17 Aug 2023 07:14:18 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99df431d4bfso215968866b.1
        for <linux-tegra@vger.kernel.org>; Thu, 17 Aug 2023 07:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692281657; x=1692886457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENNpTWDc6lYkkbnsKJjWTnWpHMyiAwPlCSe44qUKvZk=;
        b=Duk19O9u9umN0L9RpFTfPuhH+d/K5vUDZ6dle/b6nz49naVWxKKWCaW41TaFb/PnM8
         /u0EJSum0DlGABwzSeIMcz0hOvijbF8WqTHGoQX74UArLLDx2qw6Mw9Cc2zkdV+FGw2w
         cYZpP9j+ScE3O7Cimmjl1kL9NA9H0P2/zGsqdENADBlwKNStKtOQTaPsUDZjJ+OPEQPq
         K8N5PCVE8JNF+auD1CHDyydB6T4o4M/hrfFHYuE/AZyU1gY6rvFyV4xUXRYG+lbzwLqf
         CK6SqdorFTZN1Ho5KoYdR3HkodHI8pCga1VX6w2+m5b5vhh823EhL3HzUpERcljT97Xz
         CFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692281657; x=1692886457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENNpTWDc6lYkkbnsKJjWTnWpHMyiAwPlCSe44qUKvZk=;
        b=fokhlo2B9gUosOyNmeFMnH+nPhp/KmKa3KfVGz6cdz4/fonGXSng1N+1LBkxHIWiyY
         yyt65aD1xf2uMML4LAIMJu3pvp2lHERNkK4DEXHp6V6SAFwhtFbBrhNP24fhJ12u66s7
         IPqlHUSxJ8g78Kxq6ct8HqR4rEicjfavfAq9sKjFjFTVU2hfgnR4R8byHesbW3fINY1Q
         UEwhO6T6o3rZrNfkizHJrgjOQkSGJvPBqgiDcSREpM2NUQWtJdlRMQ0c7/aLNFsSuRsL
         5mmfDBBvg2kdz9z74uEOrzCNMtFctkMgC55V3Uqm7SS+AL4nrB5JToHcaoaxRYSxLk25
         L3Nw==
X-Gm-Message-State: AOJu0Yw1YzgxbtXF77kjFhdYce+TXgaU5SSqqN0l5S+ukkelOdvH9xGw
        JFHpr59MdbH3/aB8Ptp65mc=
X-Google-Smtp-Source: AGHT+IHXVJdGMSppKQ/IvalpNpND5vxqkTCXGYyP4470DdscmV9AlhFYylJNxOizhz3n4/APT8X/8g==
X-Received: by 2002:a17:906:27c8:b0:99d:ed5e:cc7f with SMTP id k8-20020a17090627c800b0099ded5ecc7fmr4082966ejc.13.1692281656799;
        Thu, 17 Aug 2023 07:14:16 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ox11-20020a170907100b00b00989828a42e8sm10131727ejb.154.2023.08.17.07.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 07:14:16 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/5] arm64: tegra: Add dmas and dma-names for Tegra234 UARTE
Date:   Thu, 17 Aug 2023 16:14:06 +0200
Message-ID: <20230817141407.3678613-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817141407.3678613-1-thierry.reding@gmail.com>
References: <20230817141407.3678613-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Commit 940acdac99b2 ("arm64: tegra: Add UARTE device tree node on
Tegra234") added the device tree node for the UARTE on Tegra234 but
didn't include the "dmas" and "dma-names" properties required for this
device when it's used in high-speed mode.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 066b87ef7e41..50db1b1e982b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -732,6 +732,8 @@ uarte: serial@3140000 {
 			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&bpmp TEGRA234_CLK_UARTE>;
 			resets = <&bpmp TEGRA234_RESET_UARTE>;
+			dmas = <&gpcdma 20>, <&gpcdma 20>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
-- 
2.41.0

