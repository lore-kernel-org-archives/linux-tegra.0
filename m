Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6B57C6379D
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Nov 2020 08:55:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8003624654
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Nov 2020 08:55:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="R1KCd2WE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgKSIyV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Nov 2020 03:54:21 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:6184 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726375AbgKSIyV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Nov 2020 03:54:21 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fb632c00001>; Thu, 19 Nov 2020 00:54:24 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Nov
 2020 08:54:17 +0000
Received: from jckuo-lt.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 19 Nov 2020 08:54:16 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v5 04/16] phy: tegra: xusb: tegra210: Do not reset UPHY PLL
Date:   Thu, 19 Nov 2020 16:53:53 +0800
Message-ID: <20201119085405.556138-5-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119085405.556138-1-jckuo@nvidia.com>
References: <20201119085405.556138-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605776064; bh=Lb6CUM5xzjsJ/3rF72AFs1BvgdwDxUt+jwEIxP8Cz+4=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=R1KCd2WEF7B70YxsQOFCyD5yrMsXhr7bkZOfKDW9C1muhMEMeQKBofGpb3kZFjHBg
         sYqbQ2iFFz8P61ndpbRpuR9nl184HnlHUlS90Dxtafl16FGe3yOJNsn+BpOLYpviE8
         JjmL4v+RjQPCKXVIXYO4ll7DNluhwTXPUHE5TryQZOb0Ea84eQwx7WNoQsluKMHJXC
         kNC5/7OaV8CAu0n5m+/WK2vdVpvIStEqUj6hzcgxlT+RamHKGkrJMPQ7MRuISgj6BN
         +NEgafhfAEztv98ptpJ+bwSOPQKoawZwIsd0HFEND4Oe5k9C/aYDEd+0P9BySKcFfZ
         Q8i8soDBH8zwg==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Once UPHY PLL hardware power sequencer is enabled, do not assert
reset to PEX/SATA PLLs, otherwise UPHY PLL operation will be broken.
This commit removes reset_control_assert(pcie->rst) and
reset_control_assert(sata->rst) from PEX/SATA UPHY disable procedure.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
v5:
   no change
v4:
   no change
v3:
   new, was a part of "phy: tegra: xusb: Rearrange UPHY init on Tegra210"

 drivers/phy/tegra/xusb-tegra210.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-teg=
ra210.c
index 4dc9286ec1b8..9bfecdfecf35 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -502,7 +502,6 @@ static void tegra210_pex_uphy_disable(struct tegra_xusb=
_padctl *padctl)
 	if (--pcie->enable > 0)
 		return;
=20
-	reset_control_assert(pcie->rst);
 	clk_disable_unprepare(pcie->pll);
 }
=20
@@ -739,7 +738,6 @@ static void tegra210_sata_uphy_disable(struct tegra_xus=
b_padctl *padctl)
 	if (--sata->enable > 0)
 		return;
=20
-	reset_control_assert(sata->rst);
 	clk_disable_unprepare(sata->pll);
 }
=20
--=20
2.25.1

