Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72BBFC47096
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 16:45:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B8D96024A
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 16:45:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229888AbhFCQq7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Jun 2021 12:46:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbhFCQq7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Jun 2021 12:46:59 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 801FAC06174A
        for <linux-tegra@vger.kernel.org>; Thu,  3 Jun 2021 09:45:06 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id dj8so7910615edb.6
        for <linux-tegra@vger.kernel.org>; Thu, 03 Jun 2021 09:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1qAlE0u1BDdmT3kxaqiAfVPWOKqwZQKr5SI3k0RTYWA=;
        b=CAhaaFczzsR+qo5Hqs0zvKaqIcB44uJx5EPBVT/eOlIiBQO8Kxrfy9kyLfEQx2VOs7
         3galmUc2FmgWxY4s+wTVSbEWuWpE7chcjjWgW7G3usHcX9445FW8a+FI4SxKccny40G9
         q/fTNdBmQFuwoYx+jvtIZ0PiOX9ccEFghofCJ1A553lvVsVk4E/pCiBpbCdtAfC7/WoJ
         PScqrLCNOHamT8W0H4MR6uoyvJZWtOb0emaiPPYkvaFflu3e5ny9JLMn5eTYgKLpGg/z
         oxtFgJ2a8IIGrnBOadoSNgfXvSCGi40elWZeTES0IHeWvNw4kZLIqFPAvo+O7Dm5wUqx
         02fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1qAlE0u1BDdmT3kxaqiAfVPWOKqwZQKr5SI3k0RTYWA=;
        b=q1dpnuUGO1lpdexADSvs0lsdDXl4PTXf7oj4nGVC32S39V1LHPjLm7ALQ25QfvyPA9
         KI/z5KUd9Ffj6TKxn1us6KAKqwUka9X6ERmhXzt8ANpQ7gdxVBsfbxs1VSxAR0pmfQAt
         nE9A7F5R/b3or8yB1u5LWN1Dfzy1h4KxN2mfxgGibFAnrho98SqNQKvnTUoUZAqhRLh6
         r/e874YvyLT8sL8r9R7+yHQMallwm6TbbGxnlIV2CHiH/nNRpvB8tm3KvQdDaEwyJV78
         m5ZhngSopIjJh4PjTxhk8p3hQsPd7jVD2j8Gm0IdkLAoQ7oMtL2p4j++5/wyCtYVeavr
         NlpA==
X-Gm-Message-State: AOAM531UgdO0vp9GkdhqZ7iIBbkT7K3361gTqx/F9gSlVXt0tZ8rhK2n
        0rJA6BWrkdcnj60p0ZVJBxc=
X-Google-Smtp-Source: ABdhPJxWxKKXdiAhQmYMpJQg1u2BfcQfDwX6ekk/hR6cNHnyigeCY0LGOj7xl3o81sGLEp2hfKPUoQ==
X-Received: by 2002:a05:6402:4390:: with SMTP id o16mr390957edc.79.1622738703488;
        Thu, 03 Jun 2021 09:45:03 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id zb19sm1720622ejb.120.2021.06.03.09.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 09:45:02 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/9] dt-bindings: arm-smmu: Add Tegra186 compatible string
Date:   Thu,  3 Jun 2021 18:46:25 +0200
Message-Id: <20210603164632.1000458-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603164632.1000458-1-thierry.reding@gmail.com>
References: <20210603164632.1000458-1-thierry.reding@gmail.com>
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
2.31.1

