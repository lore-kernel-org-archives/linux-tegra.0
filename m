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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E289C6379D
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Nov 2020 08:55:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2DD6246B8
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Nov 2020 08:55:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="qFv3+3um"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbgKSIyw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Nov 2020 03:54:52 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:16354 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726854AbgKSIyl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Nov 2020 03:54:41 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fb632c70001>; Thu, 19 Nov 2020 00:54:31 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 19 Nov
 2020 08:54:40 +0000
Received: from jckuo-lt.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 19 Nov 2020 08:54:38 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v5 14/16] arm64: tegra210/tegra186/tegra194: XUSB PADCTL irq
Date:   Thu, 19 Nov 2020 16:54:03 +0800
Message-ID: <20201119085405.556138-15-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201119085405.556138-1-jckuo@nvidia.com>
References: <20201119085405.556138-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605776071; bh=p3G5cNbZuLAIZnD4SsYSRHa4gkTHlp53w4tnFKRGbvQ=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=qFv3+3um4dSijIXZn+vQ558rKJX5sOLYOey1ox1rQQZVl3MSii0QVKgR2IqnlWSO8
         Dc9Kl9Y3MKeyQPQ1xo/F333Fgyisau4FC921a9kkbqfNd+KP88WbRrzjFwYdF+wC6Y
         koUzPIjVkNJ/D1gYvnOzz16WZ9BC1dxn5LTqpWptOQqLxaVFlT2nhFLR+6uwoRrYVk
         V5N04H3fRG0IqoESqbDxaD2kAEEXwg66K6bj6gYGCTNVjM+xotbsiGnUXStISTDizX
         WOlW79IN0xaccmOprhvUuzWzJ0SQXLLSC/JBiz/j3G7jCbrRsnAJ1asKbiaoosFlRO
         EnV630uvlq43g==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This commit adds "interrupts" property to Tegra210/Tegra186/Tegra194
XUSB PADCTL node. XUSB PADCTL interrupt will be raised when USB wake
event happens. This is required for supporting XUSB host controller
ELPG.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
v5:
   no change
v4:
   no change
v3:
   no change

 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 1 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 1 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts=
/nvidia/tegra186.dtsi
index 98544d16d01b..53ab8e5487e0 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -685,6 +685,7 @@ padctl: padctl@3520000 {
 		reg =3D <0x0 0x03520000 0x0 0x1000>,
 		      <0x0 0x03540000 0x0 0x1000>;
 		reg-names =3D "padctl", "ao";
+		interrupts =3D <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
=20
 		resets =3D <&bpmp TEGRA186_RESET_XUSB_PADCTL>;
 		reset-names =3D "padctl";
diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts=
/nvidia/tegra194.dtsi
index 6946fb210e48..c84d1f040111 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -801,6 +801,7 @@ xusb_padctl: padctl@3520000 {
 			reg =3D <0x03520000 0x1000>,
 			      <0x03540000 0x1000>;
 			reg-names =3D "padctl", "ao";
+			interrupts =3D <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
=20
 			resets =3D <&bpmp TEGRA194_RESET_XUSB_PADCTL>;
 			reset-names =3D "padctl";
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts=
/nvidia/tegra210.dtsi
index 88e778655e99..b4537671a6ca 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -1043,6 +1043,7 @@ padctl: padctl@7009f000 {
 		resets =3D <&tegra_car 142>;
 		reset-names =3D "padctl";
 		nvidia,pmc =3D  <&tegra_pmc>;
+		interrupts =3D <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
=20
 		status =3D "disabled";
=20
--=20
2.25.1

