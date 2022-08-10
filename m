Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 031D0C25B08
	for <linux-tegra@archiver.kernel.org>; Wed, 10 Aug 2022 13:12:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229797AbiHJNMu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 10 Aug 2022 09:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbiHJNMq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 10 Aug 2022 09:12:46 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9B3E13FA8
        for <linux-tegra@vger.kernel.org>; Wed, 10 Aug 2022 06:12:41 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id t1so21187325lft.8
        for <linux-tegra@vger.kernel.org>; Wed, 10 Aug 2022 06:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=Xt4sTSjZbsVw99EpwkCEf7vaG5aOAi9K9YMX6CS8DbU=;
        b=tDEXm9cJOo9x+jqx0eZjSaW0fOGtKkO/wjuGSXbbyLjhtHUEry6+Bb/qXO5hwNbAAr
         BctplbuasMFj9Osj0FNf1VY0R3cgmEMx0zg7AfozS5nZwReWFfsvnjUdq6y+MSiRcUVM
         mHOBaNNXyy5fS9037dkM6laEaVcv6IqsJ/po2HO4wIdbPDIPS+gH13zNcL5+/JhXqnIR
         YvYFMcqqOng1NzxOzf0w+xfO4IPX11ndEXW0VatliCPM33Q+0pz9ZyBr4Io2Ate93epE
         /4hGd4W+H8xcdAu5bn32XM8CCGMOTUGazEVX/k5gl0Ig4bmqJOXyZbr+eOeQWo3+5Bs2
         /wdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=Xt4sTSjZbsVw99EpwkCEf7vaG5aOAi9K9YMX6CS8DbU=;
        b=VG4IUPVfbHSkQpitGhCTZTFVfPeNERsE7NXMSwsjOgVZKCjYP4JK4AIWiaHPCxQW4w
         5EHFFa550TiGryaAXO6xrPkFWKwjIH/1gi45qN5d+GKHRVHjnz2YjjQltCYdEIWl48zm
         022u5t0Pt6k+8UyizeJdPnykh9qSsm1VDPHOZmZ0paKRdfWHspt47udDIJt78fZE94M0
         SHMZxROsltPkgIV4Y12UskkWg6h6EJb7mQ1ufxq7zuXHk+/NGbdv/j4fhaTwzRUrgl1e
         ASuJBOUsNNE6YVmaBI6IeJFS0l76DaFqQ2E3zG6kllJKsumLg1SpqGHek07JSZsR08xc
         YAIw==
X-Gm-Message-State: ACgBeo14LDer/0ntbuv+1woJjavIA01GZmpJIeH2Z+FnTlS4x70Rw/5q
        yyPemphQwKRwa0WdGcLzIUkowQ==
X-Google-Smtp-Source: AA6agR6BSaEUe26xeOlQs51vuNIgdOU/4k/pdSwN9BiMa+HppfBY/RMrzljKL1NTppwuvFsQnxDjSg==
X-Received: by 2002:a05:6512:138e:b0:47f:77cc:327a with SMTP id p14-20020a056512138e00b0047f77cc327amr9836703lfa.277.1660137160254;
        Wed, 10 Aug 2022 06:12:40 -0700 (PDT)
Received: from localhost.localdomain ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id g2-20020a19ee02000000b0048b08f0c4ddsm334168lfb.253.2022.08.10.06.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 06:12:39 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krishna Yarlagadda <kyarlagadda@nvidia.com>,
        linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] spi: dt-bindings: nvidia,tegra210-quad-peripheral-props: correct additional properties
Date:   Wed, 10 Aug 2022 16:12:36 +0300
Message-Id: <20220810131236.428529-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Re-usable schemas should use additionalProperties:true, so the schema
using it will check for evaluated properties.

Fixes: e23917822d3c ("spi: dt-bindings: split peripheral prods")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/spi/nvidia,tegra210-quad-peripheral-props.yaml    | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad-peripheral-props.yaml b/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad-peripheral-props.yaml
index 24e0c2181d25..2c3cada75339 100644
--- a/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad-peripheral-props.yaml
+++ b/Documentation/devicetree/bindings/spi/nvidia,tegra210-quad-peripheral-props.yaml
@@ -29,5 +29,4 @@ properties:
     minimum: 0
     maximum: 255
 
-unevaluatedProperties: true
-
+additionalProperties: true
-- 
2.34.1

