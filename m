Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6122AC43217
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 16:36:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237517AbhLIQjq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 11:39:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236531AbhLIQjp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 11:39:45 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90C3BC061746;
        Thu,  9 Dec 2021 08:36:10 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id a18so10695627wrn.6;
        Thu, 09 Dec 2021 08:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=86gCcT11WeDFdl1AL6yEl0ohyQgOtx0+QoNrmaw2baI=;
        b=Ga+bX+MxQ2LlUWtzQpm7YKN+3EoZkJIPF4urBsxybQ3zUoQRKwiYd3HPGW2qx8L49P
         q/wwMfLlhTN/bDG/qODlTV3TjkwsPu9qZDLFv4Ov1BwPD/+eND9vumYd0P4o+EfPii6t
         EP1P2UFvGfJVvqTbDl125jewEungHH4bTxUx7ZmGM0/Huct4rHA/auNHvDJWz9hkbLQy
         arWvahGAMpWjEQ4GrSrtaitit0FgX2rsXuFEF7A6GxDXyy+MUCI17Q3HrPRIGthnWHdA
         7OK3WKyYh1tDp+1bTWv9YFPZf8gDgsZOJ6eJVxcDKNo0pQ9pCrso9BoCKbJGm5aFchh0
         RBPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=86gCcT11WeDFdl1AL6yEl0ohyQgOtx0+QoNrmaw2baI=;
        b=4gWwdcDuHsxiwT2ZxnI+cmOowVoPqXfntZzpnLucB6Da+HkcMgo9PHSTCL3DXSSnUp
         E6rne6VweH9PLIuziv4vfF6JPmxifRH6y2xvJayQ2vrnkB0sstN8r8pUPEbqPjfnX2wd
         enbns/gidwsHLs4xnXnCOIgFUenoQ5r0Qp2YgZ8fewGNXB7uC73Uwr+0ne8KwK0HRehM
         KBC6JgTUXE040dVH43h61J+K7MffzJr/ME2tM2OiIZ+zvb/ORyCejP1Gr+Fq+37X0iz1
         aVQ8UYjQwcNQh6+rB7XJsp87kTX/QRJ9j6jbnShupoBkHt8zHg4vsonr9lnJcrn22985
         r6TQ==
X-Gm-Message-State: AOAM530oe95TXZ6WUQimvdBmaojHeCS+2enFwVW+KEhfZf2Jg6lxzfFO
        9tsPAJpAxXIo4gLuAVWmWOiv0GPfPD/z/g==
X-Google-Smtp-Source: ABdhPJzu/LQIurnEEcsBXxaEe6K46RBSx74oQ7BLemLuFcbFy7zSJ66BBZRQOEPAj2P6+XWrrayDTQ==
X-Received: by 2002:a5d:514a:: with SMTP id u10mr7663352wrt.321.1639067769151;
        Thu, 09 Dec 2021 08:36:09 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id r15sm8899810wmh.13.2021.12.09.08.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 08:36:08 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/4] dt-bindings: arm-smmu: Add compatible for Tegra234 SOC
Date:   Thu,  9 Dec 2021 17:35:58 +0100
Message-Id: <20211209163600.609613-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209163600.609613-1-thierry.reding@gmail.com>
References: <20211209163600.609613-1-thierry.reding@gmail.com>
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
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index e239157eb30c..7fd0522bcd84 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -60,8 +60,9 @@ properties:
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
@@ -181,8 +182,9 @@ allOf:
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
2.34.1

