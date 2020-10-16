Return-Path: <SRS0=VMTZ=DX=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3973AC43467
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 13:08:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D3EA82158C
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 13:08:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="bpkMyRLy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408075AbgJPNIB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Oct 2020 09:08:01 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:12342 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408073AbgJPNIA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Oct 2020 09:08:00 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f899ad50000>; Fri, 16 Oct 2020 06:06:29 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct
 2020 13:07:59 +0000
Received: from jckuo-lt.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 16 Oct 2020 13:07:57 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH v4 02/16] clk: tegra: Don't enable PLLE HW sequencer at init
Date:   Fri, 16 Oct 2020 21:07:12 +0800
Message-ID: <20201016130726.1378666-3-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016130726.1378666-1-jckuo@nvidia.com>
References: <20201016130726.1378666-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602853589; bh=YjBVJf1mmOANacGEuliAldeZeM0yW8G0DiHqKtMx7dI=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=bpkMyRLyNu6CxsCi8DbKgIYM8xIDRKZTLOFtCXaQnvrs/yH3LJtDaZvbfL8iNqHMw
         y2sDLx05AeYE6I1kZ6idibyjvmGl6DqsMA/QmJacir1C/0Vs9+Foc1aSVWoJKXxvCG
         X9Jz24/BslI2r5lNdvuOi/f7qmXlAO727GAvvBEi3n+o8nZrpWlLja8f/HdkVXXueP
         vuWL+JFdMrGMT/4mTBfKtit8sYK0QBVdrxE1Z4LbLV5ygfqSpezhQSvlfQ1y4DC/lG
         ejCrRQv5BFoADNgvBqB98W4yf/QgfkGlKsSJd3nw4zVSfjUTNllxpYBcRENU67UHqk
         2ORFNTJw0owmg==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

PLLE hardware power sequencer references PEX/SATA UPHY PLL hardware
power sequencers' output to enable/disable PLLE. PLLE hardware power
sequencer has to be enabled only after PEX/SATA UPHY PLL's sequencers
are enabled.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
v4:
   no change=20
v3:
   no change

 drivers/clk/tegra/clk-pll.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
index c5cc0a2dac6f..0193cebe8c5a 100644
--- a/drivers/clk/tegra/clk-pll.c
+++ b/drivers/clk/tegra/clk-pll.c
@@ -2515,18 +2515,6 @@ static int clk_plle_tegra210_enable(struct clk_hw *h=
w)
 	pll_writel(val, PLLE_SS_CTRL, pll);
 	udelay(1);
=20
-	val =3D pll_readl_misc(pll);
-	val &=3D ~PLLE_MISC_IDDQ_SW_CTRL;
-	pll_writel_misc(val, pll);
-
-	val =3D pll_readl(pll->params->aux_reg, pll);
-	val |=3D (PLLE_AUX_USE_LOCKDET | PLLE_AUX_SS_SEQ_INCLUDE);
-	val &=3D ~(PLLE_AUX_ENABLE_SWCTL | PLLE_AUX_SS_SWCTL);
-	pll_writel(val, pll->params->aux_reg, pll);
-	udelay(1);
-	val |=3D PLLE_AUX_SEQ_ENABLE;
-	pll_writel(val, pll->params->aux_reg, pll);
-
 out:
 	if (pll->lock)
 		spin_unlock_irqrestore(pll->lock, flags);
--=20
2.25.1

