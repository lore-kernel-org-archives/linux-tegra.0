Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4509DC433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:12:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1DA2F60EFE
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:12:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231553AbhKLNPa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 08:15:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231158AbhKLNP3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 08:15:29 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6D5AC061766;
        Fri, 12 Nov 2021 05:12:38 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id d24so15520166wra.0;
        Fri, 12 Nov 2021 05:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5BQCyeoftBnqluexlQFqNbj0sfJJp2rC7QMu3C6I4Zg=;
        b=O1/AgrCk+PAkiYDIhOZArF//i2H+vPoki07JngSt9fvDUEs8ThN9b9qg/7Tn9d21dp
         9T7CTcxvuVB8YVg9P7bQa1/+jHwvPVcOyYEL4KXMtDgc98P+ZAlfQRJAwI/kvPOumtvs
         OBRRHT1MO3elSIcyIsr+iW7Ze44hLyWydY1Z6lyshshP7yqm3GI1qUMMvNkzNDbFUP31
         cWTjO83fzF/AG82eUIVVziB/FF/cQQCjTHn2mcm8WspkPZV0agOM8E6UlP9x4WqqXygA
         QnE+6aMrDASh2FMthqYYZ1tbJu0nXW+OObKhqqvUQMpI99+W7DlKZ23EwIpmV4+WOeCZ
         8Xrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5BQCyeoftBnqluexlQFqNbj0sfJJp2rC7QMu3C6I4Zg=;
        b=lbEtQ6wii/DtGW0uMlHCNusjkd0tUq/WxY8zNTza1cNcvEbIxTq/VJL0vxthb/FCFU
         2uwMbulOpE6fditwR6WEzQ4HtIszPpFZSKD6N0KAmmidZLS+NO1fCVtIj4oU8A+URQ5l
         WPeAAuCr2CrDMrwla3DdLuGOMo1dEjXRpTaPMCL8TrcrOZRAmyinKrO5P8AsMOs5vpUb
         tBkxdPHuaAtPft3raeE0pnSosdZ/OCfcy8ZW54uaGKCmtXslVCEVwkuXwCkvxEvnzokF
         uoVkJg8NcRWvPg6aITBoFVvQmf3N+5gX1tLUD+KVTyRo02MwIMoTKNHjeFS89CG/gKiS
         swcA==
X-Gm-Message-State: AOAM5325IaVoX1xzhqOzGtKTIEJYM3b0WypZzUVvM7AaYFlfHOxfsfqf
        uFo5ZwdsDJ97HbUDKpLoINk=
X-Google-Smtp-Source: ABdhPJzXGvINEjdyWWMM4YRPaSpE8bNuSD+Uq5vsHP8/CjX9uKFv1EsCovA9Wf4X2IHkhGEaYgKzeg==
X-Received: by 2002:a5d:4b41:: with SMTP id w1mr17906538wrs.437.1636722757281;
        Fri, 12 Nov 2021 05:12:37 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id h18sm6276740wre.46.2021.11.12.05.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:12:36 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] dt-bindings: arm-smmu: Document nvidia,memory-controller property
Date:   Fri, 12 Nov 2021 14:12:28 +0100
Message-Id: <20211112131231.3683098-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112131231.3683098-1-thierry.reding@gmail.com>
References: <20211112131231.3683098-1-thierry.reding@gmail.com>
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

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index f66a3effba73..cf32a7955475 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -155,6 +155,12 @@ properties:
   power-domains:
     maxItems: 1
 
+  nvidia,memory-controller:
+    description: A phandle to the memory controller on NVIDIA Tegra186
+      and later SoCs. The memory controller needs to be programmed with
+      a mapping of memory client IDs to ARM SMMU stream IDs.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
 required:
   - compatible
   - reg
@@ -177,6 +183,9 @@ allOf:
         reg:
           minItems: 1
           maxItems: 2
+
+      required:
+        - nvidia,memory-controller
     else:
       properties:
         reg:
-- 
2.33.1

