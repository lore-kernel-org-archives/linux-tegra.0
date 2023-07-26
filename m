Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF3E3C41513
	for <linux-tegra@archiver.kernel.org>; Wed, 26 Jul 2023 16:28:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231882AbjGZQ2G (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 26 Jul 2023 12:28:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232448AbjGZQ15 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Jul 2023 12:27:57 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7CA9269E;
        Wed, 26 Jul 2023 09:27:56 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99bcf2de59cso67489966b.0;
        Wed, 26 Jul 2023 09:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690388875; x=1690993675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HxE0mMmcceNMvmRqlCAKAXjQ777wkTsSniDCsxrumrA=;
        b=DvzrkwfKLgpwTnXAzk0wE2IdeIH3/6pXdpzgj70qYCTRINfTd5s/MhLdHsGPQfFka4
         drNFNyszsh+rDAJ5G9JkF/uk80LE5kGNhOaTgsMSR6Sji9jnxV0W8JPXk5xCoXRLLoYE
         u2az7U/UE51jKAl8B9myoHPH5s4P/7gQDNOl1fH/MUH1VqTeQqljQxSEBnqkIjD2zVK3
         3xxDl21ydy//x8yytZeFRG2tQa61vIQ+ba+M28oMNcWRjhBltry3osRIgB5iS31yy0oc
         W+GMLJYecwlI6PTs/krs9ouecCohkc8jR14si8yi8mLAU/E9aI4/rWdUdE9tb3jNusH0
         HQIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690388875; x=1690993675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HxE0mMmcceNMvmRqlCAKAXjQ777wkTsSniDCsxrumrA=;
        b=bk6dajjrS2Eoel1GjxH+7sFiFQCzDyeubvwonDCkvyh2YwjC0DalNQi2KZqgKJs5w+
         lAuINTdiCvt/V4nXAoi8Rl+UQ8p4uCPScvUI2SAXcAcOGN9uZUoERLdcecFE+MQKSFW4
         4G14Yct2yvT7I9tEJrz9oCKJbK0Kn9pOWsxiLop6BVrXxp3MUah23xG7KaKJa6kWbw/B
         xqF1AhRsC63H+0g4UlRmwLFyN/rv2PnVjEv4HVDqCCaGYWcdq/ABGPF4jwV5ypm4ubjG
         mzYUidkR1eYra2eXnhE0PaoHvAHrg613Fk2aL/tDHz8LMhskip2qScCpSfzfrjEn/JUl
         ZjwA==
X-Gm-Message-State: ABy/qLZOWkGCl5reIXb6ph6zQJhAlNG3HjkJ4kgVUVx8UijAFfBkkOIj
        cGGBWbQaQQQzsUl/2NDNqGY=
X-Google-Smtp-Source: APBJJlHSiDre1LQc7wFLk8jINl3pQChFCzNgNdoPt8p8z8W2eE61PfMb9TvBFrmSnGvh8OCNJ8r8fQ==
X-Received: by 2002:a17:906:9bd4:b0:99b:cecf:dc4 with SMTP id de20-20020a1709069bd400b0099bcecf0dc4mr1038087ejc.48.1690388875302;
        Wed, 26 Jul 2023 09:27:55 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id z5-20020a1709063ac500b009882e53a42csm9794261ejd.81.2023.07.26.09.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 09:27:55 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 7/7] dt-bindings: arm: tegra: pmc: Relicense and move into soc/tegra directory
Date:   Wed, 26 Jul 2023 18:27:44 +0200
Message-ID: <20230726162744.2113008-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726162744.2113008-1-thierry.reding@gmail.com>
References: <20230726162744.2113008-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Dual-license this binding for consistency with other Tegra bindings and
move it into the soc/tegra directory.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- add Reviewed-by: from Rob

 .../bindings/{arm => soc}/tegra/nvidia,tegra20-pmc.yaml       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/devicetree/bindings/{arm => soc}/tegra/nvidia,tegra20-pmc.yaml (99%)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml
similarity index 99%
rename from Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
rename to Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml
index a54b562e2a1c..b86f6f53ca95 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
+++ b/Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-pmc.yaml
@@ -1,7 +1,7 @@
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/arm/tegra/nvidia,tegra20-pmc.yaml#
+$id: http://devicetree.org/schemas/soc/tegra/nvidia,tegra20-pmc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Tegra Power Management Controller (PMC)
-- 
2.41.0

