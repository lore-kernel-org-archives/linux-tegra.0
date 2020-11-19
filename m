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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB28C8300C
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Nov 2020 08:54:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6E9124654
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Nov 2020 08:54:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="XEmt4HKJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbgKSIyf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Nov 2020 03:54:35 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:6216 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726666AbgKSIye (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Nov 2020 03:54:34 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fb632cd0000>; Thu, 19 Nov 2020 00:54:37 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Nov
 2020 08:54:31 +0000
Received: from jckuo-lt.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 19 Nov 2020 08:54:29 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v5 10/16] dt-bindings: phy: tegra-xusb: Add nvidia,pmc prop
Date:   Thu, 19 Nov 2020 16:53:59 +0800
Message-ID: <20201119085405.556138-11-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119085405.556138-1-jckuo@nvidia.com>
References: <20201119085405.556138-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605776078; bh=/25Z1zzMaL8p7xwbvJ82Qyyi/mNswl6YKDmpc3+Tezc=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=XEmt4HKJyGYwQHzbWke2MFGU/SlGsCpn1c2n4OV6AgwYvKNOghGX9Baj4HO78o3sN
         1pl2sZOAGoIvg15wefbbCCLBwuhhCF4mcoWQxa6gllvub7DVYuS5f/qU8z50M0JsMf
         3pJdZpeoYvzp9c7VIHgbL7uq+Z6YrZiA/rGu5WiAgGHERCz05FQog5dYejpHvW5cp6
         UzgBtTf32sGgYz1j0QLa7D2eX5pkl93EiGsuLTL2DpVt9cBXGhX0IJrU5ioICGD6CS
         RRh12n0u6xp45gQ7u9/W3Iua7T2C+v0l0kSqpTbjK4YpATzijbiJkpnF2kF6FLgSl4
         Y9VnyxMvlHhCA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This commit describes the "nvidia,pmc" property for Tegra210 tegra-xusb
PHY driver. It is a phandle and specifier referring to the Tegra210
pmc@7000e400 node.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
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

