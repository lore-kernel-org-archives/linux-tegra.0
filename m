Return-Path: <SRS0=YHIj=CV=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41868C433E2
	for <linux-tegra@archiver.kernel.org>; Sat, 12 Sep 2020 02:25:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD182207BB
	for <linux-tegra@archiver.kernel.org>; Sat, 12 Sep 2020 02:25:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="qm6U7MAW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725681AbgILCZx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Sep 2020 22:25:53 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:9149 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725562AbgILCZw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Sep 2020 22:25:52 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f5c31260000>; Fri, 11 Sep 2020 19:23:34 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 11 Sep 2020 19:25:52 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 11 Sep 2020 19:25:52 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 12 Sep
 2020 02:25:51 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sat, 12 Sep 2020 02:25:51 +0000
Received: from dipenp.nvidia.com (Not Verified[172.17.173.69]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f5c31af0000>; Fri, 11 Sep 2020 19:25:51 -0700
From:   Dipen Patel <dipenp@nvidia.com>
To:     <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <mperttunen@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>
Subject: [PATCH v2] arm64: tegra: Wrong hsp_aon reg property size
Date:   Fri, 11 Sep 2020 19:26:45 -0700
Message-ID: <20200912022645.7338-1-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599877414; bh=GA7oDohcEOV8AS7cTcnVkrK/v7M538GZva1ik4ji2Os=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=qm6U7MAWebo9Ot2ZZZI6C1tot4LQlTWQRxZ/TTP2pV8BGaqOvaHbk2uRJsCw0KRb3
         0GHKuSrSPUWe5CeYaHT+FkDnS2ZZ4QgIxTmtJcCVKF1AwmijrlbzC4GQEPH97Rb6a/
         yy7Cyplqt/4yoIsSijbHAjVmPSdK9pHvuiu6NhUrslAKdI0M+4sGAeEH0WMXiXjIbN
         P1nTcPfzxbENbuko+Lr+95WUBrTaOnUdOCGNwrJgNbRS9cVHOeROljLIqmJb1/bBwW
         X6pm0xbT3jI8bdWVkrXrA7Ye4Ayj3kKrTV57AOD4ZgPl+5c2TVGv8ridiFG4Th/YSc
         CtoirUisWuzSQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The hsp_aon node reg property size 0xa0000 will overlap with other
resources. This patch fixes that wrong value with correct size 0x90000.

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Dipen Patel <dipenp@nvidia.com>
Fixes: a38570c22e9d ("arm64: tegra: Add nodes for TCU on Tegra194")
---
Changes in v2:
  - Remove the space between Fixes and Signed-off-by tags

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index e9c90f0f44ff..93438d2b9469 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1161,7 +1161,7 @@
 
 		hsp_aon: hsp@c150000 {
 			compatible = "nvidia,tegra194-hsp", "nvidia,tegra186-hsp";
-			reg = <0x0c150000 0xa0000>;
+			reg = <0x0c150000 0x90000>;
 			interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
 			             <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
 			             <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.17.1

