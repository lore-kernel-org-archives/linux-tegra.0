Return-Path: <SRS0=VMTZ=DX=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E25D6C43467
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 13:08:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87A15207F7
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 13:08:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="UXjd6osF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408138AbgJPNI0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Oct 2020 09:08:26 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:12393 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406803AbgJPNIV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Oct 2020 09:08:21 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f899ae70001>; Fri, 16 Oct 2020 06:06:47 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct
 2020 13:08:17 +0000
Received: from jckuo-lt.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 16 Oct 2020 13:08:15 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v4 10/16] dt-bindings: phy: tegra-xusb: Add nvidia,pmc prop
Date:   Fri, 16 Oct 2020 21:07:20 +0800
Message-ID: <20201016130726.1378666-11-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016130726.1378666-1-jckuo@nvidia.com>
References: <20201016130726.1378666-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602853607; bh=8Qq9iY/OsqP+WbV9PU84sL2lITmYNt2yVHECweL7gmk=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=UXjd6osFA87UUu45yNbvoEgnD/1gpWK/Tl77Cig8rg9PMOET9APs7z8FOWj12QNE/
         TGgwga0wRWnB6zOiF86vsyaVvZBn6T8RFTqsi2uvOoMTDi7doJsWGWEc4X69q5MnKd
         GMwNwrMN5HkOw6iWLAHMuqyqY5FuJTqT6wQjd4yoOM7u8gzDvg0bA6zneCsSCz186h
         mYEXJxyKgPSo+OvLRX889RO86n9gwSgFOtxQESMGUHHeKLlV2/2eqR7OQoKQkm7K4v
         FP9k16iOzTnDNXtcxMtCdJCn+XwzEXh/lj1TunxqTuqNBup1/Ls+8PW4ROX6yTs1at
         PchKMza7D0qlw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This commit describes the "nvidia,pmc" property for Tegra210 tegra-xusb
PHY driver. It is a phandle and specifier referring to the Tegra210
pmc@7000e400 node.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
v4:
   new change to document "nvidia,pmc" prop

 .../devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-pad=
ctl.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl=
.txt
index 38c5fa21f435..ea559baeb546 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt
@@ -54,6 +54,7 @@ For Tegra210:
 - avdd-pll-uerefe-supply: PLLE reference PLL power supply. Must supply 1.0=
5 V.
 - dvdd-pex-pll-supply: PCIe/USB3 PLL power supply. Must supply 1.05 V.
 - hvdd-pex-pll-e-supply: High-voltage PLLE power supply. Must supply 1.8 V=
.
+- nvidia,pmc: phandle and specifier referring to the Tegra210 pmc@7000e400=
 node.
=20
 For Tegra186:
 - avdd-pll-erefeut-supply: UPHY brick and reference clock as well as UTMI =
PHY
--=20
2.25.1

