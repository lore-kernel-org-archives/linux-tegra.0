Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40EE8C001B3
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Jul 2023 06:50:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231908AbjGEGuO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Jul 2023 02:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231820AbjGEGtp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jul 2023 02:49:45 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10D4D19A4
        for <linux-tegra@vger.kernel.org>; Tue,  4 Jul 2023 23:49:13 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99364ae9596so352774966b.1
        for <linux-tegra@vger.kernel.org>; Tue, 04 Jul 2023 23:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688539746; x=1691131746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gnpj157c3whA4keAde4dkEQlANMe2n/WYXZtcdvXOtI=;
        b=qnxKcQ+ogqw9SGXbUz4Lb1635OSrmEZ6jrj1QiIUI9pHSW2xyBXeWXoJkYt7F4Wg1x
         Yv2XRaBwAzke9DDDYzRvzOQ38gwNtS/fjv36UtAM6/sSFy3SDTjazsWiMmeRFeFNBtPm
         Y1mBAKtb2L4lUBQLuh34mw4aZ6gtsQTY3TJCPV44qp+OSEbHH6DmboKo5ZxUAeL/Oy/7
         jiheg/CimLISbrJsCu1IJjMP8liOf2FOeV+8K+kItsDsuylSrEet/bCLCc2HzlKgPsrH
         u/FPNYa8kJCuNP86/m3IMSXkVT/tcDaOBQ7hdpX/Tdl+XMFE4OoRdybOiHXjOfKhxXKw
         2V7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688539746; x=1691131746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gnpj157c3whA4keAde4dkEQlANMe2n/WYXZtcdvXOtI=;
        b=P0QW+/bViTO+jVQzSBkhqXlMkwXkztXqq0ytJ2eCDWIB69uS+GjhqYbSKvk8w5jBJY
         idYkCsE8WdjsVXP2fvp1jWC8022cZNNjDw7Zs9pQ8oZ32GJ8eHZKepXkysCTJBujh+4u
         kquMXRNJu6y0AR9Ehruc+DyNpR4z2FUU2wpjcua/V2mDTuq2fg0SKWFdZ4z9H4hohIiO
         x+12TiHSoME306V/8xKke6cmijJQvsBnlWR/iP6t91X0QMO8IpAk4tqbZnx+G+brMBno
         XzHTlGsB28F07q4rI9IPGF2KTVZ9PFzAKTe99CmTcX2ve5u/iMya7u6V/7B8BQXR2yCL
         fMzw==
X-Gm-Message-State: ABy/qLbp5m3O95rl0hpnqswh0DxtfanSkhuQUKKBClMjcVm0BWJk2toG
        A+f04mmnOtUsiuiZ8ijDyM/Mig==
X-Google-Smtp-Source: APBJJlEv9Qie1QyGZE7X599Yi2UpWVPM1zDwcHS0k9EYYzxDgnLXI89gNsM3Zl16UKEQPrVgXCkkdg==
X-Received: by 2002:a17:906:d8d1:b0:974:1ef1:81ad with SMTP id re17-20020a170906d8d100b009741ef181admr10699538ejb.4.1688539745878;
        Tue, 04 Jul 2023 23:49:05 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id w10-20020a170906130a00b00992b50fbbe9sm7849728ejb.90.2023.07.04.23.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 23:49:05 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [RFT PATCH 1/2] arm64: tegra: correct audio-codec interrupt flag in P2972-0000
Date:   Wed,  5 Jul 2023 08:49:02 +0200
Message-Id: <20230705064903.12690-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
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
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
index 64a3398fe7a6..7c400e024332 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -2115,7 +2115,7 @@ rt5658: audio-codec@1a {
 				compatible = "realtek,rt5658";
 				reg = <0x1a>;
 				interrupt-parent = <&gpio>;
-				interrupts = <TEGRA194_MAIN_GPIO(S, 5) GPIO_ACTIVE_HIGH>;
+				interrupts = <TEGRA194_MAIN_GPIO(S, 5) IRQ_TYPE_EDGE_FALLING>;
 				clocks = <&bpmp TEGRA194_CLK_AUD_MCLK>;
 				clock-names = "mclk";
 				realtek,jd-src = <2>;
-- 
2.34.1

