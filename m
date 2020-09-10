Return-Path: <SRS0=wB+u=CT=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D41C433E2
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Sep 2020 07:11:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79B582078E
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Sep 2020 07:11:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="I9dpbZxH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730077AbgIJHLJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Sep 2020 03:11:09 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:9347 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730430AbgIJHJD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Sep 2020 03:09:03 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f59d0840003>; Thu, 10 Sep 2020 00:06:44 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Thu, 10 Sep 2020 00:09:00 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Thu, 10 Sep 2020 00:09:00 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 10 Sep
 2020 07:08:59 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 10 Sep 2020 07:08:59 +0000
Received: from dipenp.nvidia.com (Not Verified[172.17.173.69]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f59d10b0002>; Thu, 10 Sep 2020 00:08:59 -0700
From:   Dipen Patel <dipenp@nvidia.com>
To:     <robh+dt@kernel.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <mperttunen@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>
Subject: [PATCH] arm64: tegra: Wrong hsp_aon reg property size
Date:   Thu, 10 Sep 2020 00:09:50 -0700
Message-ID: <20200910070950.12941-1-dipenp@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599721604; bh=2x+FTZ3HYXf5sNisHlYuvYsgZ7LS1xif+fcVE0e8F40=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         X-NVConfidentiality:MIME-Version:Content-Type;
        b=I9dpbZxHwY8BjxHTS9Cepg+ojmUtFuOOLjEO8nkmt7gdbZkBhqP7AqfqXoLLdNfCl
         Vu8WitEb+RT2gd/igZzLCN/A/HVoSeEcWdtP05q9/DeYCT4kxCiL8m5e/xNYXzM5yh
         D5cXyM0dNe0glpn3YwHwd0WQDNqBdKA4y4Nn0rs4u6QN2nmeDTb3R6snPolACvAK+o
         zUGTdDne7ufWvp6CSmKxgWuLeZ4M46gTkaPtO/kiCwEpcByDy48XchrKqrsE0Zu5jI
         6l+zestSeph4BuQy/kxtHiIJVJ/K0d1tCnb1lFrgrJ1JVYgQP1rjzT948LP4ABFic4
         TYb1ybW5bGfHw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The hsp_aon node reg property size 0xa0000 will overlap with other
resources. This patch fixes that wrong value with correct size 0x90000.

Signed-off-by: Dipen Patel <dipenp@nvidia.com>

Fixes: a38570c22e9d ("arm64: tegra: Add nodes for TCU on Tegra194")
---
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

