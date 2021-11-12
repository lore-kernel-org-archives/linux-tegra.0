Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E44AEC4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:12:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA9026103A
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:12:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231760AbhKLNPc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 08:15:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231158AbhKLNPc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 08:15:32 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 788E9C061766;
        Fri, 12 Nov 2021 05:12:41 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id s13so15477592wrb.3;
        Fri, 12 Nov 2021 05:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=30OwVGxUy40t+1ZulyfICuuL3SNGXPyxdBoyAE95czg=;
        b=YSl3Vw5r2ILfv9Lot0EbCgdgIT+huk0RU+o8Oa9IK+u6PKR2Lyp73TbIR2pE6QJyDB
         hSKBfsO0nfDyMNwQZbl5AcI3qpJ6Jn086dxGqZL1ccKMXZUlI+hditFp11VfRq5Y/Cps
         mB7STmUiTskjXiCaMkvRZjQs5a9PzChrsK568cq/um+YEy1DAO4pb6iKajtxg1wMdzBn
         eaHHHPBPy4e3XncPYw8ivtkb5Xk+TcEkiGJ3hTq0dgoMmDtwhmRzgWT5OhJnqlbnGRaU
         ID/j3QjumPGu7YvlBq1geGcQ4WzVeqhZyCLMMW24lbhlDWhLNxuC9pPPAhsHizic6xI0
         04vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=30OwVGxUy40t+1ZulyfICuuL3SNGXPyxdBoyAE95czg=;
        b=phgMjWpR/JqTT7BrFpkZHEJj5OsBwxfQXWsBaQMgiLjqBiigtLUGJ52R9cj1qqpB3u
         H8r0up3tuxnK+V6GgiND/Ps/0xkF9WFKBhyjDH64wLbLo6ecDY8Hz1QfoPscXZhnCWEv
         ZC9Dp5syp3k05Ei++0Ni1lCgLZl7VRPbCW2xA2Wo/OUNM+7QZw+T04pG7zPN6/sjlVdS
         gG0/cHOh2wT1d4XXlUNPLKnA/Dt6nzHljmsD91Gvvygso/PfxQqW90zqShgXeVh+P9Tn
         FdoZVYaGxWPyimRJ3XJNlL442OMSpAiALGVfiZYzSqX36YhQT6+/CtphTepO8uprWcBk
         FCSQ==
X-Gm-Message-State: AOAM5324yJeTWa0uMehC2ugMdVR4hHnQdL70NGX/T/WEWnYxrJ9h043A
        ARGsTvBaHL79VxHuwZTLKmR7IT974gdfqQ==
X-Google-Smtp-Source: ABdhPJywqmqY0nIe7O7aYkY30dDm1/rkkFXIkJBhzsUDjoLWFwd8Ga9BDfrqfLD2rCzfrK8nQkVVrw==
X-Received: by 2002:a5d:6d0b:: with SMTP id e11mr18874906wrq.16.1636722760058;
        Fri, 12 Nov 2021 05:12:40 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id o2sm5931682wrg.1.2021.11.12.05.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:12:39 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] dt-bindings: arm-smmu: Add compatible for Tegra234 SOC
Date:   Fri, 12 Nov 2021 14:12:29 +0100
Message-Id: <20211112131231.3683098-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112131231.3683098-1-thierry.reding@gmail.com>
References: <20211112131231.3683098-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The NVIDIA Tegra234 SoC comes with one single-instance ARM SMMU used by
isochronous memory clients and two dual-instance ARM SMMUs used by non-
isochronous memory clients.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index cf32a7955475..21d293a2dadd 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -60,6 +60,7 @@ properties:
           for improved performance.
         items:
           - enum:
+              - nvidia,tegra234-smmu
               - nvidia,tegra194-smmu
               - nvidia,tegra186-smmu
           - const: nvidia,smmu-500
@@ -176,8 +177,9 @@ allOf:
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
2.33.1

