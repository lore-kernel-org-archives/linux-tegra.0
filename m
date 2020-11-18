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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71968C6369E
	for <linux-tegra@archiver.kernel.org>; Wed, 18 Nov 2020 03:46:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22B402465E
	for <linux-tegra@archiver.kernel.org>; Wed, 18 Nov 2020 03:46:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="puHw6YQp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726629AbgKRDqe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 Nov 2020 22:46:34 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:19297 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726487AbgKRDqe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 Nov 2020 22:46:34 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fb499240000>; Tue, 17 Nov 2020 19:46:44 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Nov
 2020 03:46:34 +0000
Received: from jckuo-lt.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 18 Nov 2020 03:46:32 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <robh+dt@kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <devicetree@vger.kernel.org>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v1] arm64: tegra: jetson-tx1: Fix USB_VBUS_EN0 regulator
Date:   Wed, 18 Nov 2020 11:46:31 +0800
Message-ID: <20201118034631.74127-1-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605671204; bh=CzEJnQTXpaO+zvL/bMVWDJgq8PsKnA/5HnYumHPgzos=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         X-NVConfidentiality:Content-Transfer-Encoding:Content-Type;
        b=puHw6YQpo6zExa7fqJPCEvC4oHAeYV6V9kQKoRBtW8PbWqDLK3HgFLlgvuDK1MZZN
         4YwwKAUVseZb4MKaSTdE/PHgZAxA0ehwfU4AC2q2v97jdmlfAf0E5oPR5KRxWL42by
         ZxHjTBGTGPcOdpmIHIBeNkRCRay49Xt7/LKMn344t9QNyqDxkI/f10d8F7oLmkuVjp
         xPzONMHi1HYclOHfMGhKY/QOaNqoLV2llDgsNYMppE2cv8GdCSOFvyFS42PVhkrgWH
         3y+bfYfGhjojlurO1IB0W5v/HhcBFyjSqKBzppVnaWa5TQPwKoc89RM0rCT6IhxaTc
         C5zYSHfoDWqBg==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

USB_VBUS_EN0 regulator (regulator@11) is being overwritten by vdd-cam-1v2
regulator. This commit rearrange USB_VBUS_EN0 to be regulator@14.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
 .../arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi b/arch/arm64/bo=
ot/dts/nvidia/tegra210-p2597.dtsi
index e18e1a9a3011..a9caaf7c0d67 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi
@@ -1663,16 +1663,6 @@ vdd_usb_vbus: regulator@9 {
 		vin-supply =3D <&vdd_5v0_sys>;
 	};
=20
-	vdd_usb_vbus_otg: regulator@11 {
-		compatible =3D "regulator-fixed";
-		regulator-name =3D "USB_VBUS_EN0";
-		regulator-min-microvolt =3D <5000000>;
-		regulator-max-microvolt =3D <5000000>;
-		gpio =3D <&gpio TEGRA_GPIO(CC, 4) GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-		vin-supply =3D <&vdd_5v0_sys>;
-	};
-
 	vdd_hdmi: regulator@10 {
 		compatible =3D "regulator-fixed";
 		regulator-name =3D "VDD_HDMI_5V0";
@@ -1712,4 +1702,14 @@ vdd_cam_1v8: regulator@13 {
 		enable-active-high;
 		vin-supply =3D <&vdd_3v3_sys>;
 	};
+
+	vdd_usb_vbus_otg: regulator@14 {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "USB_VBUS_EN0";
+		regulator-min-microvolt =3D <5000000>;
+		regulator-max-microvolt =3D <5000000>;
+		gpio =3D <&gpio TEGRA_GPIO(CC, 4) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		vin-supply =3D <&vdd_5v0_sys>;
+	};
 };
--=20
2.25.1

