Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2776C4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Apr 2022 08:22:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355357AbiD2I0P (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Apr 2022 04:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239744AbiD2I0P (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Apr 2022 04:26:15 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C15A0C12D7
        for <linux-tegra@vger.kernel.org>; Fri, 29 Apr 2022 01:22:54 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id j4so12707872lfh.8
        for <linux-tegra@vger.kernel.org>; Fri, 29 Apr 2022 01:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oMI7QqZGI0vddFgsm9lt9vX32EVJjnSzVDzCY5m9AWw=;
        b=A+MZEIPz8f8ZVktBwhejBMEn6pzxhtXTC4xQVz8q12o9QJLmNmtexynvWUrVfIa+Ae
         6maTnwa27kI+xhAXIBGtAXjVHK7OGM1kx3PkAyO1LHyQpy7V4Zbr4LBWK2DnNg5xfU31
         o/YCThPeqJSDMynOYaIVENS+YcOQV9KrhfGlA2t/h0nwecrVjINLXEHjSqLLDCi3YgGi
         dHNbsLaDuEnWQYS3Hjn99lwnOfDdmAXQQo88TH0DPRgx1FPIO/rhzW9EnivfjyxWeWTe
         uEfb1tML0BB76+flF+4+aDM9lTjTNlwoTuDlfW5skzC2KfUcYHWvHsrF7HsOUW99vdOq
         qkSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oMI7QqZGI0vddFgsm9lt9vX32EVJjnSzVDzCY5m9AWw=;
        b=BBMesCQuEiwAuCG8X+cOnAzogUygulrjkID2CvROE9nOfgjV4X7mLVd/4WZ2idwE+X
         JAMXiaOgRnwrNulVftQ54HA/heXfDfRW/DtWVLS/J9RIIdYLCnxonLF81E3d8ha8eJT0
         gDoJ5iJfg33354twVcULRs1PJIYbm7NizQ3Up8u8DKGa3MQyx47lqPFSRKydK9PnOv2u
         Yu4EVPAbLJVCojHORSxrbac61wcvWna+R34oxvI1nWSGH3CtkrN+I84M3tl19/0y0mSl
         UIbjowUDgKxF6QBVhz1EF9iuWp1U1tAvzWl7i1+nIghnzXzBzO4sBn18K3ADOSYfkqyJ
         1ZAQ==
X-Gm-Message-State: AOAM533pDXDXAHo7I63HnnXJcSZ4VT1k1OLlIwn9eodxsGtuabsRQYYF
        rTQvpwHwCFdFBEFAhkMp4TA=
X-Google-Smtp-Source: ABdhPJznRjWCO7GO08thPSho9osAYFp9jDBFLMKt6fOX5IuiDEYe27Bgr+pjGNRAHJ3ZKvw5r/QthA==
X-Received: by 2002:a05:6512:3d1c:b0:472:3444:df98 with SMTP id d28-20020a0565123d1c00b004723444df98mr6310755lfv.366.1651220573131;
        Fri, 29 Apr 2022 01:22:53 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id t19-20020a19dc13000000b0044b022fd9f1sm179229lfg.160.2022.04.29.01.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 01:22:52 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 2/3] dt-bindings: arm-smmu: Add compatible for Tegra234 SOC
Date:   Fri, 29 Apr 2022 10:22:42 +0200
Message-Id: <20220429082243.496000-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429082243.496000-1-thierry.reding@gmail.com>
References: <20220429082243.496000-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The NVIDIA Tegra234 SoC comes with one single-instance ARM SMMU used by
isochronous memory clients and two dual-instance ARM SMMUs used by non-
isochronous memory clients.

Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 44606ad5aa39..590cc8dc8323 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -62,8 +62,9 @@ properties:
           for improved performance.
         items:
           - enum:
-              - nvidia,tegra194-smmu
               - nvidia,tegra186-smmu
+              - nvidia,tegra194-smmu
+              - nvidia,tegra234-smmu
           - const: nvidia,smmu-500
       - items:
           - const: arm,mmu-500
@@ -183,8 +184,9 @@ allOf:
         compatible:
           contains:
             enum:
-              - nvidia,tegra194-smmu
               - nvidia,tegra186-smmu
+              - nvidia,tegra194-smmu
+              - nvidia,tegra234-smmu
     then:
       properties:
         reg:
-- 
2.35.1

