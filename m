Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C6C3C433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 07:38:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B2D723142
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 07:38:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729520AbhATHhP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 20 Jan 2021 02:37:15 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:11430 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729216AbhATHge (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 20 Jan 2021 02:36:34 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B6007dd200001>; Tue, 19 Jan 2021 23:34:56 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 Jan
 2021 07:34:55 +0000
Received: from jckuo-lt.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 20 Jan 2021 07:34:52 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, <linux-clk@vger.kernel.org>,
        JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v7 09/14] dt-bindings: phy: tegra-xusb: Add nvidia,pmc prop
Date:   Wed, 20 Jan 2021 15:34:09 +0800
Message-ID: <20210120073414.69208-10-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210120073414.69208-1-jckuo@nvidia.com>
References: <20210120073414.69208-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611128096; bh=UdNntPIYiEhXZBzPeYhgB8nB7AAtuUd8EiG7KhLc+6Q=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=Xmd+yAb3p3dBP/AT7v+26bl+MIETLt/lWzg+uFXC+MoJ/jma+cBXm/8mH2AO5kXBr
         9AjQzJEtuNESmpVzqdJzYBmih8PAf+IHqeUwNDe9Gmm/ptdoww6DB0K06G06REjUjV
         a8x6ISgTp75akmdqke3664EJgkGji6LQBWKC5oheS2zPrm7K+It2g9RQQtktJfPTOx
         bKVvUIRF8c0bOBPDVEuVC9cFaPKgOHRE8SvRhUfB0OqaaBMRrqz7rJscvHmBqj2fiK
         n/elOpWEEb92jKmbASGZgWPxMPQel3RQb8kE9bbZCXgS9virHVucAnAA/WNCfluB87
         xh2E1Ynry/jlg==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This commit describes the "nvidia,pmc" property for Tegra210 tegra-xusb
PHY driver. It is a phandle and specifier referring to the Tegra210
pmc@7000e400 node.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
Acked-by: Rob Herring <robh@kernel.org>
---
v7:
   no change
v6:
   no change
v5:
   replace "pmc@7000e400 node" -> with "PMC node"
v4:
   new change to document "nvidia,pmc" prop

 .../devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-pad=
ctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl=
.txt
index 38c5fa21f435..b62397d2bb0c 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
@@ -54,6 +54,7 @@ For Tegra210:
 - avdd-pll-uerefe-supply: PLLE reference PLL power supply. Must supply 1.0=
5 V.
 - dvdd-pex-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
 - hvdd-pex-pll-e-supply: High-voltage PLLE power supply. Must supply 1.8 V=
.
+- nvidia,pmc: phandle and specifier referring to the Tegra210 PMC node.
=20
 For Tegra186:
 - avdd-pll-erefeut-supply: UPHY brick and reference clock as well as UTMI =
PHY
--=20
2.25.1

