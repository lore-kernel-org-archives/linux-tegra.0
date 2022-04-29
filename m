Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C69C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Apr 2022 08:22:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354422AbiD2I0N (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Apr 2022 04:26:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239744AbiD2I0N (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Apr 2022 04:26:13 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2640C12E2
        for <linux-tegra@vger.kernel.org>; Fri, 29 Apr 2022 01:22:52 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id l19so9645545ljb.7
        for <linux-tegra@vger.kernel.org>; Fri, 29 Apr 2022 01:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BqXPunmGph8XZto24fUj0G8vrN134xfSDWAMlJF8WBA=;
        b=fucmz1GgWONzX38ItL0J0SdsV2RbDADjwMXY00Ep8ru2rz9kJYrICku40mpA+OhHkN
         Tt11jjM6p6pRkj68T/yBFKeQMEwpcIIE+k/Rl8DQcP8PLkG+lU6MgkdtomQaZP9TFndG
         ea1mFyzDGYy8Z0ZxcIn5nGhY6MqSz6ZT8rHHChdlsR4c4fGvZa9k2F4UMsxSF3pCbi/u
         2Ng4dB6T0PTVwsRb/SSi+2MPjpt8XNAG8gX1DFZwQl0ZNuFhJ+GalaFGQw5L0dHAXUZy
         Pf5aEyoanA40m2laUFNC6upPjs8h+wJdnkMSk7IJoOH+zr2nvhSiyw57MDN5C6mKULKE
         GP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BqXPunmGph8XZto24fUj0G8vrN134xfSDWAMlJF8WBA=;
        b=cIrQ3upgUvz1LNOmXv4qQia2XKY/z3akq4e1qjUwqm01oVgLydZ4dyKS0eMOHDOzs1
         7FI7LB+13AvoYf026F3Fo2d6126h4tswsyE7oMX0vDqikl/SJ2g0vIA/GAq4AR3O1JDz
         jAwFTSd//ttCSb2Pit2AwPULya0JrVKsA9bbFiCB+0hf9JDk9HZ9tQNgR13ufQ18eRVN
         B6LiYyiUzMEWL+YLGc1dkhCehpe5jmB2jrkzukyKN8r4To5Nb8WLOKOyJLNHE2rSMrua
         aDwKvF9I7D/M8++FqNHBhnAyx2Mo1lYEQWvGew03zAXzt9wtsejsRhseAPyee6KOWYkq
         Pxnw==
X-Gm-Message-State: AOAM533hyi85tDhVeGkqzu70BADPY5sQI0sLH0eQvNaRIySoSpfPGLGe
        F8738nvUrvp7YfbmgJiEhItjghfq6q4=
X-Google-Smtp-Source: ABdhPJxjBeKz+bjnoFzef0XBxYP3wxVL83OPI0s4GLwL1Z/ru492IPCB0tHy6nvnA/phj8VTYPSAZg==
X-Received: by 2002:a2e:82c5:0:b0:247:e81f:8b02 with SMTP id n5-20020a2e82c5000000b00247e81f8b02mr24196768ljh.90.1651220570942;
        Fri, 29 Apr 2022 01:22:50 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id q3-20020a2e8743000000b0024f3d1daee6sm209010ljj.110.2022.04.29.01.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 01:22:50 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/3] dt-bindings: arm-smmu: Document nvidia,memory-controller property
Date:   Fri, 29 Apr 2022 10:22:41 +0200
Message-Id: <20220429082243.496000-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220429082243.496000-1-thierry.reding@gmail.com>
References: <20220429082243.496000-1-thierry.reding@gmail.com>
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

Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Will Deacon <will@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- clarify why the new nvidia,memory-controller property is required

 .../devicetree/bindings/iommu/arm,smmu.yaml     | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index da5381c8ee11..44606ad5aa39 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -157,6 +157,17 @@ properties:
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
@@ -179,6 +190,12 @@ allOf:
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
2.35.1

