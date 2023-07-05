Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3B6FC001DD
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Jul 2023 06:50:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231912AbjGEGuP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Jul 2023 02:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231835AbjGEGtq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jul 2023 02:49:46 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E006E1BD4
        for <linux-tegra@vger.kernel.org>; Tue,  4 Jul 2023 23:49:16 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-9926623e367so728566466b.0
        for <linux-tegra@vger.kernel.org>; Tue, 04 Jul 2023 23:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688539747; x=1691131747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Btk0Xk8ehSaK2P10pmIt1e+0B7YcT15m+TnmX26R3bI=;
        b=nmV7E24aBirkOoOViUWGRT1rHx4DzWZ45CFp6HO1qW1Ktr4BjyIw1NomU8GRC9Vden
         M2+UppiBaDMDLqT2GFsJDNZGyhRympzdtaPYfnQeShLbjI2FA5oMBoC0M7TfZ/rW1czu
         D1WwUmYOVUs9a4jAEYCbD4rL0oF8ZhxNX3i2BLJo9BmPWzkEb8NF35E+bEUm/nros6Mk
         6hNrEatGQJ0ehrvhzB0sgzYs7pOYC5iclK+AQmt0RuTS5t1eLaiQmMfdMnWpfulY4VL3
         QLGKTp7eo3RbRU+TFMfosuTHy9kjtmuCeeXBAdc7F3JEHhPDuq/jLTcVlExgQ4ig2IbO
         7M9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688539747; x=1691131747;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Btk0Xk8ehSaK2P10pmIt1e+0B7YcT15m+TnmX26R3bI=;
        b=BJ9jYhQLF/x5pWEz1DyjVgSEaVdxW27CVFLOpDtoY3KfyrwvHy9k6WcmxxvqBpA72t
         0NtuaUWXaoSgAWnxteo/uvRtY8gpVv6OxvlWsrAlvkPCh3UOSXPkWWeh3sbSPCUN+1fq
         bahJB6ebi3miHuOT7irmmAbFIbzzGh5s3V0DIkXxst7PxRjh/hACzDlcrezLTgjwKKfw
         0EH9N0+gM5UOsd2fa/oPsSg8wEP4ROHZS7ebt+iclrWjhPKcyLi6NLRsM02XD93nMKrF
         /3xVsZGAU5s3L33uVLZTthIPzXQPsj+tBqo3f7QoSPIMGO6JyVRKwjlkM1cR3QjZaMVK
         OK6A==
X-Gm-Message-State: ABy/qLbK56C//XUiARv4KQeOaAxcLWsf94RnpzdAlAyOS1jwx0XYSC8K
        cCpPVIcuMHh3G+Lo8/cdH7CtbQ==
X-Google-Smtp-Source: APBJJlH/lV0N5VSpd7XysIeV4btKyrXfkL9BcaOIuNEDolOKA5zH4R1OiHe86awZvK44Z9hWjVxUaA==
X-Received: by 2002:a17:906:828a:b0:991:fd87:c6fd with SMTP id h10-20020a170906828a00b00991fd87c6fdmr11302813ejx.23.1688539747054;
        Tue, 04 Jul 2023 23:49:07 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id w10-20020a170906130a00b00992b50fbbe9sm7849728ejb.90.2023.07.04.23.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 23:49:06 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 2/2] arm64: tegra: correct audio-codec interrupt flag in P3737-0000
Date:   Wed,  5 Jul 2023 08:49:03 +0200
Message-Id: <20230705064903.12690-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705064903.12690-1-krzysztof.kozlowski@linaro.org>
References: <20230705064903.12690-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

GPIO_ACTIVE_x flags are not correct in the context of interrupt flags.
These are simple defines so they could be used in DTS but they will not
have the same meaning: GPIO_ACTIVE_HIGH = 0 = IRQ_TYPE_NONE.

Correct the interrupt flags to a value used also in Tegra30 Beaver board
with this device.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index cd13cf2381dd..ad5d7b9028cd 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -2025,7 +2025,7 @@ audio-codec@1c {
 				compatible = "realtek,rt5640";
 				reg = <0x1c>;
 				interrupt-parent = <&gpio>;
-				interrupts = <TEGRA234_MAIN_GPIO(AC, 5) GPIO_ACTIVE_HIGH>;
+				interrupts = <TEGRA234_MAIN_GPIO(AC, 5) IRQ_TYPE_EDGE_FALLING>;
 				clocks = <&bpmp TEGRA234_CLK_AUD_MCLK>;
 				clock-names = "mclk";
 				realtek,dmic1-data-pin = <RT5640_DMIC1_DATA_PIN_NONE>;
-- 
2.34.1

