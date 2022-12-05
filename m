Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F681C63703
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Dec 2022 15:19:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231830AbiLEPTR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Dec 2022 10:19:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232398AbiLEPSx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Dec 2022 10:18:53 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82E231A068
        for <linux-tegra@vger.kernel.org>; Mon,  5 Dec 2022 07:18:51 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id p8so19049328lfu.11
        for <linux-tegra@vger.kernel.org>; Mon, 05 Dec 2022 07:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMM2e9aAz3ScK1WCwVxOEAtkh7hD8Yf9LFwwk/nFS4Q=;
        b=XXvn8qAq8Z9ZjUknoYhyHU4GY12GZE2RsUUv7JBfngn7zSavhb1dt3AAQzPE2bHk9i
         lt2zMOESrs1C1XU9rfTK/T8ErK1W8dKv0V9Ke0uiICfH75C59lIguDlcJVgysdUBSaWS
         2QKgs6JhfzTFPAR6h6wXe4j6Lvve3IrBPS7Ni4Il56qblyoSvv1T9QtDZQQGG/l9Id9H
         OLT10cXgoPSrsQISgc8S/ZvSms9ffVKnQc2jI7oIrQIHrsHx8BPoTErd9ZozuFEpZ2nU
         kSySjyJji1I9/26O54zxl8ON8/38sDEOUwM5YCoPuehgS5IXr/KpEUhPtL0pniC0UivV
         wImQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMM2e9aAz3ScK1WCwVxOEAtkh7hD8Yf9LFwwk/nFS4Q=;
        b=3181KRTStbHMvBRJW0dkl8b96ZgmcGlPo6jvueZTzNFffyU/GYvtwyYv3SdcNSI2xp
         njUejLOEmJ2yvG0m4r68L6AtLLq1v+7lJXWwh4vC/nCeenb4MegCpnpUPrQebN0D0IkH
         VGaKZHE5bxLhg7TZvBK7QLn2AYk7by9nvxuNBUQfaOHu6z3vIngik+p0c2wNIn005NdS
         5/EKrSiW/3VpI9hrR6Wxe7ygujBDUGvZwIWDWsl6lKYDQ6M4DmuQmYckmIVGWFkM/f8m
         rpop5rIjvoU7E/m4LLn7jMGw6GuRudMSRsO26o9lnDJ7gYZrZXU3dmyNYUkrLPIh2BI9
         3m0w==
X-Gm-Message-State: ANoB5pmZH6v425gSbX1waoHjXcRPJWXSKwqazFEQ65ohlOYem4CKc+0B
        pfqcL4idGzUc4HD0KVMrQ4BgGg==
X-Google-Smtp-Source: AA0mqf6+PyA5wIRMbY5xrOCf3yc5l33tR90s95AXvlxQBcLjopdbD0CRdckVx/Eh2NMejeIoM2cdqQ==
X-Received: by 2002:a05:6512:324d:b0:4a2:4d28:73b9 with SMTP id c13-20020a056512324d00b004a24d2873b9mr29734643lfr.690.1670253529775;
        Mon, 05 Dec 2022 07:18:49 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id w26-20020a05651204da00b004b55f60c65asm1012470lfq.284.2022.12.05.07.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 07:18:49 -0800 (PST)
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
Subject: [PATCH v2 1/9] media: dt-bindings: amlogic,meson-gx-ao-cec: move to cec subfolder
Date:   Mon,  5 Dec 2022 16:18:37 +0100
Message-Id: <20221205151845.21618-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
References: <20221205151845.21618-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Move amlogic,meson-gx-ao-cec.yaml bindings to cec subfolder and drop
unneeded quotes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml     | 4 ++--
 MAINTAINERS                                                   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename Documentation/devicetree/bindings/media/{ => cec}/amlogic,meson-gx-ao-cec.yaml (93%)

diff --git a/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml b/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
similarity index 93%
rename from Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
rename to Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
index 8d844f4312d1..f65c9681a9f7 100644
--- a/Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
+++ b/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
@@ -2,8 +2,8 @@
 # Copyright 2019 BayLibre, SAS
 %YAML 1.2
 ---
-$id: "http://devicetree.org/schemas/media/amlogic,meson-gx-ao-cec.yaml#"
-$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+$id: http://devicetree.org/schemas/media/cec/amlogic,meson-gx-ao-cec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Amlogic Meson AO-CEC Controller
 
diff --git a/MAINTAINERS b/MAINTAINERS
index e3f3c3e53f77..07cb85cac4c3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13553,7 +13553,7 @@ L:	linux-amlogic@lists.infradead.org
 S:	Supported
 W:	http://linux-meson.com/
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/amlogic,meson-gx-ao-cec.yaml
+F:	Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
 F:	drivers/media/cec/platform/meson/ao-cec-g12a.c
 F:	drivers/media/cec/platform/meson/ao-cec.c
 
-- 
2.34.1

