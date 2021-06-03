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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43A8C47096
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 16:45:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0B62613F1
	for <linux-tegra@archiver.kernel.org>; Thu,  3 Jun 2021 16:45:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230172AbhFCQrO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 3 Jun 2021 12:47:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbhFCQrN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 3 Jun 2021 12:47:13 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C226DC06174A
        for <linux-tegra@vger.kernel.org>; Thu,  3 Jun 2021 09:45:15 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id g8so10263161ejx.1
        for <linux-tegra@vger.kernel.org>; Thu, 03 Jun 2021 09:45:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=emaUd/s+I/7zAGqRMV6GpYb0EGNWgcoNn6kxenQlqUg=;
        b=X+mC/YDJZh7NmSy5AKXhH6ARRZ6oNxVKb/QJsn+SBF7ahQKMfHahbwSNEiL2Erg7LG
         KAIJWZAP3OPXIYMkchZXHXRGEXi9IEzRqKXi2i+b4zeWsDj7qtbbwOtF4hOD+NhzdFZU
         xXCHpSlQbkimCyf6KTkGbzxuY9PZtv+P7korKxfdeUrSB3L4cQlFDpsgbUQdTv19ri0R
         cu4InkLernM4E03VSIMzCxmgrsSh/iAW0vzB6rVrPtn2UirqvAStXtERcvwidauasmbX
         1D85368AXktRu4RFzKkpVLBrMxgmDVextvBSHk3Z/VhTNCKA7qZJVOH3LeNUfHST6gIY
         lU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=emaUd/s+I/7zAGqRMV6GpYb0EGNWgcoNn6kxenQlqUg=;
        b=HPf9SwQg/Ph5iUGtLHNmpVHMRBiMXWPh+aNsTWzqc4iZfFuwkA37LsJyuJUnWJmE76
         5xRnA92xVtOVAmRflZYZCsyqrFIQQctd4UpqEUziPYvvgGFt4pfMmUagDNyZRFjmX0vZ
         FAIzg6VhdogsCu7S0YF5J8T+1o0FeZjKvIqlL5gk/jCpTeAl6PkwIF5odzqhW5cZDARL
         Gu7FTptUET76wOEJes/dENsPve0e3/x/q7zIFAn4IhhhnzdfahDmVs74aq2r6mbl+3sS
         zgAF0vN7r8ovYBwP5TWP0SWnaz/NsIAVtnYOlvkdNG2vCGBLVarQ2sQ3XCcleRyELskv
         JbQg==
X-Gm-Message-State: AOAM531p/YS4CrW8YkqukGcIwc9L5myigpCZ4G58D2FdHCSSKoSCyYCD
        54hMYL0kI6Xoups7mHU1lf8=
X-Google-Smtp-Source: ABdhPJxGHiqaz78ebiDKvbPuVlWxMu7idWE6kmjhgmMCpZ9tWDxf/zizOL8QBl192mfnuRUYJPqtmw==
X-Received: by 2002:a17:906:b317:: with SMTP id n23mr293860ejz.324.1622738714387;
        Thu, 03 Jun 2021 09:45:14 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id ck3sm168205edb.56.2021.06.03.09.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 09:45:13 -0700 (PDT)
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
Subject: [PATCH v3 7/9] arm64: tegra: Use correct compatible string for Tegra186 SMMU
Date:   Thu,  3 Jun 2021 18:46:30 +0200
Message-Id: <20210603164632.1000458-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603164632.1000458-1-thierry.reding@gmail.com>
References: <20210603164632.1000458-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The SMMU found on Tegra186 requires interoperation with the memory
controller in order to program stream ID overrides. The generic ARM SMMU
500 compatible is therefore inaccurate. Replace it with a more correct,
SoC-specific compatible string.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index 9f75bbf00cf7..a173f40256ae 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1082,7 +1082,7 @@ pci@3,0 {
 	};
 
 	smmu: iommu@12000000 {
-		compatible = "arm,mmu-500";
+		compatible = "nvidia,tegra186-smmu", "nvidia,smmu-500";
 		reg = <0 0x12000000 0 0x800000>;
 		interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.31.1

