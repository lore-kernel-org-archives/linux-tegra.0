Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8645BC47089
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Dec 2022 15:19:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232096AbiLEPTW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Dec 2022 10:19:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232410AbiLEPSy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Dec 2022 10:18:54 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D69C758
        for <linux-tegra@vger.kernel.org>; Mon,  5 Dec 2022 07:18:52 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id p36so14726589lfa.12
        for <linux-tegra@vger.kernel.org>; Mon, 05 Dec 2022 07:18:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+PteMG/Ads8tC893Hy13VLmIBDMK2suUNCe/1HZdDs=;
        b=TyQKk5Jb/oTm+Kxu2GX9IYiCfH6m5H2YSYAaAsoQ4Xqhn0YSesbd+oJMZwhLzFIhsT
         uwPxEQiUzlRp2ZKGDHIMUWEM9hqwXUfS7wDSGb40/dB3jgxmd+WCeSGBZpWRAhpQblxZ
         woNdwJs7zRHNHg88D85YeUu8115asVSudFEajY5oe5yU6SNTBFmS1ZUh9YvzGT+PB0fF
         JFoGP/gUE8u5ZeUctNk1FTBoQkLcxpuv5B6UdCR4RAiZUa+O+EltMAzNWjagUULlVcwg
         R18gDUIVgp9X8sU3JDEez55GjaLFGz6gKm8Q/KiDjfumjmwKDzYRb2bAzyeG3MITLtCd
         34Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t+PteMG/Ads8tC893Hy13VLmIBDMK2suUNCe/1HZdDs=;
        b=hIHOj/2ca3c4lb368+iwBx/8kfmfmoGz4lm/DSPkf0l+WFDM/iYKVeiek5NQF7oEqF
         3UGs0Eqq3R4gZkWAD/NNxn/HXbzUGXCNhCphtDz2uh3EV1fo/oJGza8OzpCA+QHefCEU
         q3F2s5WOu2qnPaxQYwBjFGC6o6wTFTljXkFeN0ZhrVvByxGxdxqtbxqrHQfhP3olAVK8
         onv4DI6RK1YULlMy7lSVKF+kNym+xrP+ree1Pc2YlIFQpu6Azm+kz8iAzPK6pCJkk3Jn
         mrBV/ttn3MjU0x6nPpDEU/DCa+jA69klxJ/MApIsFgSsrDEzijWrLTE8CrGXuIKIIIkw
         EuJg==
X-Gm-Message-State: ANoB5pn/HSVHQ/PW1bhTN10D+SLnyzaxiTbdwFq4Q9Rsv0Byq+c9ztoo
        2LB8QG3iYZls7Y5rjozfPfj1HA==
X-Google-Smtp-Source: AA0mqf78FJH5p0ax6RFYVZeoFxmMuA7VAWipG1lyz5YZW0n7TWCLHLZ7zCLyYkWtLb4MXZoQZsJMGg==
X-Received: by 2002:a19:654c:0:b0:4ab:e1c9:f9b1 with SMTP id c12-20020a19654c000000b004abe1c9f9b1mr22905192lfj.378.1670253531188;
        Mon, 05 Dec 2022 07:18:51 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w26-20020a05651204da00b004b55f60c65asm1012470lfq.284.2022.12.05.07.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 07:18:50 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Joe Tessler <jrt@google.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/9] media: dt-bindings: st,stm32-cec: move to cec subfolder
Date:   Mon,  5 Dec 2022 16:18:38 +0100
Message-Id: <20221205151845.21618-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Move st,stm32-cec.yaml bindings to cec subfolder and drop unneeded
"bindings" in the title.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/media/{ => cec}/st,stm32-cec.yaml     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/media/{ => cec}/st,stm32-cec.yaml (89%)

diff --git a/Documentation/devicetree/bindings/media/st,stm32-cec.yaml b/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
similarity index 89%
rename from Documentation/devicetree/bindings/media/st,stm32-cec.yaml
rename to Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
index 77144cc6f7db..2314a9a14650 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-cec.yaml
+++ b/Documentation/devicetree/bindings/media/cec/st,stm32-cec.yaml
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/media/st,stm32-cec.yaml#
+$id: http://devicetree.org/schemas/media/cec/st,stm32-cec.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: STMicroelectronics STM32 CEC bindings
+title: STMicroelectronics STM32 CEC
 
 maintainers:
   - Yannick Fertre <yannick.fertre@foss.st.com>
-- 
2.34.1

