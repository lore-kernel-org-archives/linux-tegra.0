Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D67E8EB64DA
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Jul 2023 13:17:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230098AbjGGNRT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Jul 2023 09:17:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbjGGNRS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Jul 2023 09:17:18 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD6791FEA;
        Fri,  7 Jul 2023 06:17:17 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fbc656873eso23732455e9.1;
        Fri, 07 Jul 2023 06:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688735836; x=1691327836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vy/0fHAoINnqH1mI2R69W8uNhvSD3tnpTeux+R7nK90=;
        b=hpdiWPTaG0eIIp9XDVUxByIuLC6bY1vSlUpnymjSiK4BgXGRlhCBgHVw+0YuUn27VT
         4YmjioAdURXLYMdrk+1iLKN5UXe5yh/4CLT3fXMrOX4ebQ7zPENUFrgfC8R0pDQ9CuOb
         fVnCm2fS8ZkZfwAYWwj4W+e8Q5Pt23qs8W9cn3Rvthx+wmEc46J2ZVUgnutKVAPNI5ib
         MCeA5q8EXsGL/DhF0AYcPKZO5vGlA05Y/Gel4ZObjprxAoB8rzR46TW3cRUveSbdCFSh
         naTT/H8EewpdM90AfcnZod9BHPTH8uqZr4+wBQc/s+RtFv5+cWRTBnsLApZJMBhc8qla
         xgsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688735836; x=1691327836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vy/0fHAoINnqH1mI2R69W8uNhvSD3tnpTeux+R7nK90=;
        b=CekPHTvV6jBa5uGQ3v57sh31zT3gcwApGXX8vqApOHql0M3KCaSIBzUX7wOPVHtfTd
         oMntbF+uSDJGqoRsq6VOqINpLnvOLWFGR3VqjHvVIHpEzEXbMsq4Uv4/tA53oHgbmOsf
         Wk6EJGdlylmJJcrBcKvwLE+x/fsONIghOWXFqqzoKg7ZU/B//3yWSyq3cl0fPeTimtWe
         OIro4uyVpSFs5vdWte1bpoV8x9E/V3OzjCut+BzuW2QUWtOj2eCH++hgEkUTesnkKH8C
         ogqXZv7gsDLkI2BHtimpVFG3r9DGNlK2wGksPvxnZ/8iPshNToGHWN8SNI7/e0rpWk9v
         +5tg==
X-Gm-Message-State: ABy/qLaAB3vi7QH+Z4+v070G1Qjz8wikznddoaEmxPPhFVOM5JVJGjF0
        tRdpn/Xt2bywTgM5I7If+1E=
X-Google-Smtp-Source: APBJJlEJcoCyC3XUC4xgP7+EOxBLZ8yqs5jfirQ5sup/G+ON795Okus1vNk0IDXHB8bzaPX3ndTp0w==
X-Received: by 2002:a1c:4c08:0:b0:3fa:935e:e185 with SMTP id z8-20020a1c4c08000000b003fa935ee185mr5671832wmf.22.1688735836093;
        Fri, 07 Jul 2023 06:17:16 -0700 (PDT)
Received: from localhost (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id i7-20020a05600c290700b003fbad1b4904sm2514473wmd.0.2023.07.07.06.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 06:17:15 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 2/7] dt-bindings: arm: tegra: pmc: Remove useless boilerplate descriptions
Date:   Fri,  7 Jul 2023 15:17:06 +0200
Message-ID: <20230707131711.2997956-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230707131711.2997956-1-thierry.reding@gmail.com>
References: <20230707131711.2997956-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The descriptions for the clocks and resets properties are no longer
useful in the context of json-schema, so drop them.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml        | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
index a90f01678775..c5a1ae44c5e3 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
@@ -32,9 +32,6 @@ properties:
 
   clocks:
     maxItems: 2
-    description:
-      Must contain an entry for each entry in clock-names.
-      See ../clocks/clocks-bindings.txt for details.
 
   '#clock-cells':
     const: 1
@@ -233,18 +230,10 @@ properties:
           clocks:
             minItems: 1
             maxItems: 8
-            description:
-              Must contain an entry for each clock required by the PMC
-              for controlling a power-gate.
-              See ../clocks/clock-bindings.txt document for more details.
 
           resets:
             minItems: 1
             maxItems: 8
-            description:
-              Must contain an entry for each reset required by the PMC
-              for controlling a power-gate.
-              See ../reset/reset.txt for more details.
 
           power-domains:
             maxItems: 1
-- 
2.41.0

