Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918E1C43460
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 17:25:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 551E1613B8
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Apr 2021 17:25:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233409AbhDTR0P (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Apr 2021 13:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232473AbhDTR0O (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Apr 2021 13:26:14 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12951C06138A
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 10:25:42 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id j7so9142062eds.8
        for <linux-tegra@vger.kernel.org>; Tue, 20 Apr 2021 10:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rplQXUmZ3dZaacFdD2/srDfpf5ly21wkPzV828fQxU0=;
        b=WGtiLxPL+ZMD/2cJcTdb6TNrVJ7kpsc/TKm+6Yn5hLZagZgNELwTGSFe2OB7JgOH2f
         lNFTEJF96qxnqFGwExDRuH2mi/nSk6rgnz34yO89rQixQ3DB95+l3FnxHk3Y2aqBiP1I
         yKo06USh0xCCuc6A4bqB/4uiJkqjVFzfUxmFW0+BqYgCqCpJrGsZR3vAhn0qGWuT6Kuu
         GrEFILmMbP8utFC6ypWzvQGNR+HYUYlNtEU99G839CR1KPROi7S/H47eyKoSdKIB1t/a
         ZEkUHGVMSYj21ReVIMjvZS9nCUqfb58gXoaVqwDudmAgBnUvAu7VjVhAjSzwSDVTj9QP
         wHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rplQXUmZ3dZaacFdD2/srDfpf5ly21wkPzV828fQxU0=;
        b=gUN8fQYc+T1O2U1OU2lmu5Xi0N2gK+n9nArTg/mkWWHodz0wNHNXsYevs1/B0RHuJu
         RVxA50dYsGXysrH4K9KIjWuL89dRhPpEpOgqifkuulIft3jhE3GCWxsdk2mlJnqnUngd
         qtl8lz4NWJxxEFkjWwe0jGzSj8d0+EQh7EtDuPJ5WJCguJvoBFW3mQqsaNcNTOj/cpxx
         A0JVnfqHuK9LZVvILT+WRBTdn1G3McdiO/z8TN50erO7zbo0tLwyRytAlDYAZKb1gzeo
         KdVfAQ4xKW4KgiumQ/xmSxA8URGVzkd/7uuz1TNYsL95ErXUP0XElloT8S6vqoOTApLM
         Br8A==
X-Gm-Message-State: AOAM531sy7jG2W4vkZhWbMviiwvIOS4dItwUthxV9wM4ot9sLz9iZotu
        +og0IEVu0vrLpVv0HBaLa00=
X-Google-Smtp-Source: ABdhPJy2hEVDGdB7GOaFHXjCKKKVhYmH5kmX29KofoItNeRF5QX6huP1VBvPg6OO52HQJ3zXXgYoeA==
X-Received: by 2002:a05:6402:27ce:: with SMTP id c14mr33381218ede.263.1618939540856;
        Tue, 20 Apr 2021 10:25:40 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id m14sm7179088edr.45.2021.04.20.10.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 10:25:39 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 02/10] dt-bindings: arm-smmu: Add Tegra186 compatible string
Date:   Tue, 20 Apr 2021 19:26:11 +0200
Message-Id: <20210420172619.3782831-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210420172619.3782831-1-thierry.reding@gmail.com>
References: <20210420172619.3782831-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The ARM SMMU instantiations found on Tegra186 and later need inter-
operation with the memory controller in order to correctly program
stream ID overrides.

Furthermore, on Tegra194 multiple instances of the SMMU can gang up
to achieve higher throughput. In order to do this, they have to be
programmed identically so that the memory controller can interleave
memory accesses between them.

Add the Tegra186 compatible string to make sure the interoperation
with the memory controller can be enabled on that SoC generation.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 9d27aa5111d4..1181b590db71 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -54,8 +54,14 @@ properties:
           - const: arm,mmu-500
       - description: NVIDIA SoCs that program two ARM MMU-500s identically
         items:
+      - description: NVIDIA SoCs that require memory controller interaction
+          and may program multiple ARM MMU-500s identically with the memory
+          controller interleaving translations between multiple instances
+          for improved performance.
+        items:
           - enum:
-              - nvidia,tegra194-smmu
+              - const: nvidia,tegra194-smmu
+              - const: nvidia,tegra186-smmu
           - const: nvidia,smmu-500
       - items:
           - const: arm,mmu-500
@@ -165,10 +171,11 @@ allOf:
           contains:
             enum:
               - nvidia,tegra194-smmu
+              - nvidia,tegra186-smmu
     then:
       properties:
         reg:
-          minItems: 2
+          minItems: 1
           maxItems: 2
     else:
       properties:
-- 
2.30.2

