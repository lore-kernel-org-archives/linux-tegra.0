Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6C3CC63706
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Dec 2022 10:23:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbiLGKXF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 7 Dec 2022 05:23:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbiLGKXC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Dec 2022 05:23:02 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B0D115FF6
        for <linux-tegra@vger.kernel.org>; Wed,  7 Dec 2022 02:23:00 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id x11so20358486ljh.7
        for <linux-tegra@vger.kernel.org>; Wed, 07 Dec 2022 02:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AxgtdSHYHP1YbbzJqlPfT18aEYuRk09InbeSd0JHNg=;
        b=tOruhaPzNOR3bQD/ouWBj+2tp/tUN/H/5pGNgjSe2ABiV3vA61PRSLsVlqeAvI3Oro
         vHe3xvQC6FSO988F88LJTaSEr7beyBCC0Xr5mjSQNDZchgwGX/zzIK/HzVUFQm9VSFme
         1SwIrYDkMGRN9sZr262zvK3Rqvw0K0UZRe3qgHO2FEKAoLEeQbmgdeRgDgkeB2V1Z9KU
         ymxi4wc9pFKvlNmuXwlViGvq4nf0puoGFSzB+NSl2FGkbWnZ1skK7Dng2cwxys79bQBL
         B2o3FQDAN5bNXMdZu277dHREbYgTFCPcottzQGS2KMyJNymjfRP+abAi8h8GpG1+lETO
         jymg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AxgtdSHYHP1YbbzJqlPfT18aEYuRk09InbeSd0JHNg=;
        b=vC0aPiTv914Dd0jA74k12LtFvhEVhNIDTsZWZwOR7y+ZsmbpLJP8aIlxMCq9maoVnD
         ClEU3xZiILMkzTYN6fvC1hZqgM9+bj9+PHVy6PD9xeLsVKJyvkJvUnODsDlS2O7BK2Bm
         6+p0QBOYH5zSyBJlx4fM9aAoRIG9NlIdZhDmUqLN1AoEzYJLcPqSYGNBIOADHL/9FdGw
         /cRh3j9WqQ0+Qw43JXlW2vLlLnr158g85uBKxgPMQqq/Ovj3MGmoXTEycqS9wIq44NQC
         eyApHqC0/4bzZ0m4NLficLpO5qzfy1yp14XGiRkdWIzLXvRcjQkYy+cS+293nnBWcrex
         eF8A==
X-Gm-Message-State: ANoB5pkh9mcF/E6TQCV4HyQiCAPhzQ8xorLhnv7d25SZg3Npf3hL8e1H
        PPRDSkkTNxuPCNPZa5+3WGA3Zg==
X-Google-Smtp-Source: AA0mqf77/+pUWb1Bn4v6zLGZhuX5q4wF2Fzv0XKIu9nI2Iw4J7TFxfO02J2gesAVCe0NSJikkfILHA==
X-Received: by 2002:a2e:87d5:0:b0:27a:1ce7:bbcb with SMTP id v21-20020a2e87d5000000b0027a1ce7bbcbmr369003ljj.420.1670408578398;
        Wed, 07 Dec 2022 02:22:58 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bu31-20020a056512169f00b00499b27a329esm1953183lfb.300.2022.12.07.02.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Dec 2022 02:22:58 -0800 (PST)
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
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/9] media: dt-bindings: amlogic,meson-gx-ao-cec: move to cec subfolder
Date:   Wed,  7 Dec 2022 11:22:45 +0100
Message-Id: <20221207102253.26663-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
References: <20221207102253.26663-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Move amlogic,meson-gx-ao-cec.yaml bindings to cec subfolder and drop
unneeded quotes.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
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

