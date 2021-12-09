Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EAF6C4332F
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 16:36:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233322AbhLIQjq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 11:39:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233948AbhLIQjl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 11:39:41 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E4ECC0617A2;
        Thu,  9 Dec 2021 08:36:08 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id g191-20020a1c9dc8000000b0032fbf912885so4537232wme.4;
        Thu, 09 Dec 2021 08:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iI3azBWTRCFEeeRKyJXboLUDLxUqU0ShZoPCiSe0QHI=;
        b=IvslFsKP2cSAAyw81pK4hpkGOzTdSo/ctRvboBfXswKfysT5fU5LhL/9bRxSPuRWgL
         iBZHmyOuf9rQ3ILzAxwW6IBHw5NxZDxhUcTtbubGfDs+NS9kEWGeBug16SAcrC+ihzbP
         Y3NV2KEG6CbS3lZBJtG6eSob23mqkyF0FaClUFW8/vr9tbAJgmVFGqD9wjFdu9Wl+yIA
         3hDivw4Ft7xhzx9V2B2OYa9GYDE6KxbUjOC4Y6qvBD6wE6wigFf+MoZHwU0x06SElhur
         aGAHOZGlfXkirYozfV96mJpJ8ROZP5bUeGazugVqBgrCOBWWtYSbV9Q8+3+bnxK/uSY0
         mVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iI3azBWTRCFEeeRKyJXboLUDLxUqU0ShZoPCiSe0QHI=;
        b=vw5+cfzTThSfLG5kkCNDO/7LYnfXA9o0YqumdUq7dznb8QgLHt/0NPT8AMb1+pKsIg
         urcWsFiGRFFoMGgXIj82+2GzhkGzxmxRpYtOXbflxQh63zYRcNRtboBoj/RgBEBROojw
         Ph31DPriMJeuS7yJXEcy4Jy8z5Rr+Bnf/kcACULivkpCT2G0kwhhy0pdlO55cXgqMjyK
         BLubMOmFSP4JI1jNWL2aXo4Zz5ON2+Vp+Hah9mUnU1sHGRffXGnB93tCJyaDzuRrrqOs
         4Qy7auenm0y/MauG9zMblyvTDQkBzSNY0eff6A7zAD3ehYp4fGREVcZzHl+dekWyeN3m
         ftwA==
X-Gm-Message-State: AOAM532Tn1wHVaI7HeIrpShHF6Nb+7kViNAD7XJ4zl7qykvpBn39+prS
        FMNFPozushQcwY6sFy4jlbE=
X-Google-Smtp-Source: ABdhPJy/sovjJ1DaI6y5oVUNi8kEueGlCXRc+ly7iHh3Okas8Ii3nmU4WWUlC+CLCxJuYru8/SPnpw==
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr8636459wmb.1.1639067766782;
        Thu, 09 Dec 2021 08:36:06 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id r62sm284530wmr.35.2021.12.09.08.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 08:36:06 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] dt-bindings: arm-smmu: Document nvidia,memory-controller property
Date:   Thu,  9 Dec 2021 17:35:57 +0100
Message-Id: <20211209163600.609613-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On NVIDIA SoC's the ARM SMMU needs to interact with the memory
controller in order to map memory clients to the corresponding stream
IDs. Document how the nvidia,memory-controller property can be used to
achieve this.

Note that this is a backwards-incompatible change that is, however,
necessary to ensure correctness. Without the new property, most of the
devices would still work but it is not guaranteed that all will.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- clarify why the new nvidia,memory-controller property is required

 .../devicetree/bindings/iommu/arm,smmu.yaml     | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index f66a3effba73..e239157eb30c 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -155,6 +155,17 @@ properties:
   power-domains:
     maxItems: 1
 
+  nvidia,memory-controller:
+    description: |
+      A phandle to the memory controller on NVIDIA Tegra186 and later SoCs.
+      The memory controller needs to be programmed with a mapping of memory
+      client IDs to ARM SMMU stream IDs.
+
+      If this property is absent, the mapping programmed by early firmware
+      will be used and it is not guaranteed that IOMMU translations will be
+      enabled for any given device.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
 required:
   - compatible
   - reg
@@ -177,6 +188,12 @@ allOf:
         reg:
           minItems: 1
           maxItems: 2
+
+      # The reference to the memory controller is required to ensure that the
+      # memory client to stream ID mapping can be done synchronously with the
+      # IOMMU attachment.
+      required:
+        - nvidia,memory-controller
     else:
       properties:
         reg:
-- 
2.34.1

