Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90AF7C001DE
	for <linux-tegra@archiver.kernel.org>; Tue, 25 Jul 2023 14:27:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232708AbjGYO1W (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 25 Jul 2023 10:27:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232889AbjGYO1B (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Jul 2023 10:27:01 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13FDD2684
        for <linux-tegra@vger.kernel.org>; Tue, 25 Jul 2023 07:26:46 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-992f6d7c7fbso954600166b.3
        for <linux-tegra@vger.kernel.org>; Tue, 25 Jul 2023 07:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690295202; x=1690900002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vu+SOH4cepAU3He/10eBbbigpHdBSsePlh/8VUX5+Ec=;
        b=nrDcALCBsURrCYIIx3musDDrXuazEXW7Oj1ljTKV94TayCIqzepAJjratlWbrHog2V
         /P3qC6DjqNzsD4oa92jZH0Mcjnhxnkye8jCzw4avSPIO22Xte9ExGPPFM6zhFx1AE1sE
         IawdoM5xVDgGp8TzlAm+51U3/2W2qV/gcFPPND/KcjL+E54EOQ4S33MIUz/EGq1Vsw/t
         GdXJPGjIFE7GaAp5DULAIwbr8+X7ZQ/u5TDqTkC6RWI16TeRTauEV7sC4MpLo5dgbNoH
         Jo3Lp5RN4J4PZjXZM4GKuzQW4W3/szJE5B6d9M6bijy/0tsDobZcNFsVd1UQ4WI0QfpH
         QrDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690295202; x=1690900002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vu+SOH4cepAU3He/10eBbbigpHdBSsePlh/8VUX5+Ec=;
        b=kp5QjYeyj4hk2F8jFRBRWbbjPR+tNb9sEVS3DZpNnFj3h6kracvHaLy4Dxthb9qR8L
         tYq1Ul7ea2A1Jjjelqeujhl9ykGMghH+2iK+QRJE4Hs/zJITQ7sUq6Gtqb5jiNr/GYC0
         5Djyy+P7U1OjhFU2WqqsYrCj5Qjynb9Jhr/sr6Dzqb5gkVT+vOuHriQqB0+BQfJ91nG6
         Bp19RYn3rsi2SwSfpaukL6uw01kea4TgHHk9rPnKRHt2XR53kqaqe9h62V0idL/wZ6TU
         EmJJq5jIX+e6UwKuyTY52olXFetaguGD6tRW8LOjyV4Z748eK98PDNhIRvrKIJC9Kr7T
         E5xw==
X-Gm-Message-State: ABy/qLapwjSmDfuSNjhvSEm2K8PHc1t31L+Gvi22ElrHR5zDU/XuWVRu
        4v0TUz5mI8/Puu5MEgQ2AT5aLw==
X-Google-Smtp-Source: APBJJlHe2WaCVFFIhqEkOPLYn/lx1GMUgdYHp82/ZIdmUHgA6YkokG2wKA3Ec/xAodRbKTF1DXwBTg==
X-Received: by 2002:a17:906:31d6:b0:997:d4ee:1b53 with SMTP id f22-20020a17090631d600b00997d4ee1b53mr12297667ejf.48.1690295202211;
        Tue, 25 Jul 2023 07:26:42 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id w8-20020a170906130800b00992b510089asm8313621ejb.84.2023.07.25.07.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 07:26:41 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: tegra: drop incorrect maxim,disable-etr in Smaug
Date:   Tue, 25 Jul 2023 16:26:38 +0200
Message-Id: <20230725142638.157449-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

There is no "maxim,disable-etr" property (but there is
maxim,enable-etr), neither in the bindings nor in the Linux driver:

  tegra210-smaug.dtb: regulator@1c: Unevaluated properties are not allowed ('maxim,disable-etr' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 80476893fa57..53805555dd2d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1395,7 +1395,6 @@ max77621_gpu: regulator@1c {
 			maxim,dvs-default-state = <1>;
 			maxim,enable-active-discharge;
 			maxim,enable-bias-control;
-			maxim,disable-etr;
 			maxim,enable-gpio = <&pmic 6 GPIO_ACTIVE_HIGH>;
 			maxim,externally-enable;
 		};
-- 
2.34.1

