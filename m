Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C13C2FC35
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Aug 2023 14:14:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351732AbjHQOOW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Aug 2023 10:14:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351863AbjHQOOU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Aug 2023 10:14:20 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A56CC2D72
        for <linux-tegra@vger.kernel.org>; Thu, 17 Aug 2023 07:14:19 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fe9c20f449so42867125e9.3
        for <linux-tegra@vger.kernel.org>; Thu, 17 Aug 2023 07:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692281658; x=1692886458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YgLTYKqUbbPIFoT97Ps8s0NoPBV51v0xNI4lTrf+SuA=;
        b=JKZWkeFAWuq/m12Q4epAb4vieDYkdPxUdVpqv6YCS8yrO6mPMPWr7GP/kHCUVl/4Sm
         zm3YufF4u/eEiEjHmdb5AsffGrU1NLrnViLV/Q6300hfM0eqsT/7+x+NGROcvfgPOuon
         R61lVFvzEoT8sC0eOUR2gRyW/HpDA+v7TOWXplwo1sg63CR9vpj4H+DJVYEkzXJZNGqF
         XItoPNFmbbrd3ITbQsbHsUsYMr37nYT3Q/N7u9MWzAoYUaIgw3XczZnzSyMn/rdj20sH
         E0DLEBsG4tXfGHM6i00QvQSNynm9hPaHdUZzEPA9W6WqJXjRFfV5RgCpWYIVgDfzKD7K
         XJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692281658; x=1692886458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YgLTYKqUbbPIFoT97Ps8s0NoPBV51v0xNI4lTrf+SuA=;
        b=BRzw7bMQ+N6oLSlLenPwczCO3s+M5Vetk0KWvQOPlIqIdzehWHEtfrHCsp6s/jdhu3
         XWfZ1NgxZaIXGW/RIqbXOBwa/a3aMwj/P7tjHlUqZ3YJ8/dOU74RxkEO89DXhHqHfCP+
         pMzxct8GPEvCX6ArY6MHmf+pUWkDmljUH0nh0Xdg2XP7AUnzXzS4NZ/xV3zcWnHEcFmy
         Zx8Y75lZWLjBTk3O+aDiI2HG9BTc39q/k7rZNHrNm4cOxvZRQu0j5peDIC6bh2cHlYn1
         YXuaY34Y/cQst/MJKNZwk83pOAV7zwEVKvJ4lH5Dw0cP915Fi+TVRI6xqAzwB6K+0C2E
         ob6g==
X-Gm-Message-State: AOJu0YxXEBNVJPbFVJmWeEBcCyBC07Mi8DvjB04a1DIOSQ7UsG+BqQ7M
        wYmbY3HtTDOzDkC4T17G1OQ=
X-Google-Smtp-Source: AGHT+IF6oY68mVFiF98VxZqPO6h1qJBaG4adwf3uqofCzghKFN7WJ13Rrq3iMoQbyvJ3dIThySfMxw==
X-Received: by 2002:a05:600c:21cd:b0:3fc:1bd:95a6 with SMTP id x13-20020a05600c21cd00b003fc01bd95a6mr3954934wmj.31.1692281657848;
        Thu, 17 Aug 2023 07:14:17 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a23-20020a05600c225700b003fba6709c68sm3177042wmm.47.2023.08.17.07.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 07:14:17 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/5] arm64: tegra: Mark Tegra234 SPI as compatible with Tegra114
Date:   Thu, 17 Aug 2023 16:14:07 +0200
Message-ID: <20230817141407.3678613-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817141407.3678613-1-thierry.reding@gmail.com>
References: <20230817141407.3678613-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

According to the bindings, both Tegra210 and Tegra114 compatible strings
need to be specified since the version of this hardware block found in
Tegra210 is backwards-compatible.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 50db1b1e982b..7cf31862d68b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -859,7 +859,7 @@ dp_aux_ch3_i2c: i2c@31e0000 {
 		};
 
 		spi@3210000 {
-			compatible = "nvidia,tegra210-spi";
+			compatible = "nvidia,tegra210-spi", "nvidia,tegra114-spi";
 			reg = <0x0 0x03210000 0x0 0x1000>;
 			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -878,7 +878,7 @@ spi@3210000 {
 		};
 
 		spi@3230000 {
-			compatible = "nvidia,tegra210-spi";
+			compatible = "nvidia,tegra210-spi", "nvidia,tegra114-spi";
 			reg = <0x0 0x03230000 0x0 0x1000>;
 			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -1843,7 +1843,7 @@ gen8_i2c: i2c@c250000 {
 		};
 
 		spi@c260000 {
-			compatible = "nvidia,tegra210-spi";
+			compatible = "nvidia,tegra210-spi", "nvidia,tegra114-spi";
 			reg = <0x0 0x0c260000 0x0 0x1000>;
 			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
-- 
2.41.0

