Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF2B8C433E9
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 02:24:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D76322252
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 02:24:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405517AbhASCYi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 18 Jan 2021 21:24:38 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:18788 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393946AbhASCYi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Jan 2021 21:24:38 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B600642bd0001>; Mon, 18 Jan 2021 18:23:57 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Jan
 2021 02:23:57 +0000
Received: from jckuo-lt.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 19 Jan 2021 02:23:54 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <robh+dt@kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <stable@vger.kernel.org>,
        JC Kuo <jckuo@nvidia.com>
Subject: [PATCH] arm64: tegra: Enable Jetson-Xavier J512 USB host
Date:   Tue, 19 Jan 2021 10:23:49 +0800
Message-ID: <20210119022349.136453-1-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611023037; bh=I8KRuadsSP9ujBg3UCBPF0M40+TaUrMhBkFLROVrMRg=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         X-NVConfidentiality:Content-Transfer-Encoding:Content-Type;
        b=FhRzl9GjjnVHtGUWO+0ZqgYMw4uhh836WGq3OigXe4h1hyBraea41i2HPWp2jZsoV
         Ma1gUgv3+tEvM8nOT0zwxosRuN32z28uggyckYwOagmubzXBINvkZmlPMtIRi48Ico
         s+FQwfiHvB+7O5hH8TD2n/Ytd0sMd5K6uxbNIgJA67AKroADKAbplU+XafaeUN5xtO
         vt907F9tDPypdAgkfOiKnXnrewmKnGvEJyUAjqTw33VnlNmvj9QMZf28ORWjoE/tHn
         aRTr2Y6lGF/TxFf6XC9/qltt03wwmvnPMQpWgq7dvInc+Lyt8OQ1lFySXgWqHD/KEP
         SnMGk9PfNITXA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This commit enables USB host mode at J512 type-C port of Jetson-Xavier.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
 .../arm64/boot/dts/nvidia/tegra194-p2888.dtsi |  8 +++++++
 .../boot/dts/nvidia/tegra194-p2972-0000.dts   | 24 +++++++++++++++++--
 2 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/bo=
ot/dts/nvidia/tegra194-p2888.dtsi
index d71b7a1140fe..7e7b0eb90c80 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -93,6 +93,10 @@ padctl@3520000 {
 			vclamp-usb-supply =3D <&vdd_1v8ao>;
=20
 			ports {
+				usb2-0 {
+					vbus-supply =3D <&vdd_5v0_sys>;
+				};
+
 				usb2-1 {
 					vbus-supply =3D <&vdd_5v0_sys>;
 				};
@@ -105,6 +109,10 @@ usb3-0 {
 					vbus-supply =3D <&vdd_5v0_sys>;
 				};
=20
+				usb3-2 {
+					vbus-supply =3D <&vdd_5v0_sys>;
+				};
+
 				usb3-3 {
 					vbus-supply =3D <&vdd_5v0_sys>;
 				};
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts b/arch/arm6=
4/boot/dts/nvidia/tegra194-p2972-0000.dts
index 54d057beec59..8697927b1fe7 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
@@ -57,6 +57,10 @@ padctl@3520000 {
 			pads {
 				usb2 {
 					lanes {
+						usb2-0 {
+							status =3D "okay";
+						};
+
 						usb2-1 {
 							status =3D "okay";
 						};
@@ -73,6 +77,10 @@ usb3-0 {
 							status =3D "okay";
 						};
=20
+						usb3-2 {
+							status =3D "okay";
+						};
+
 						usb3-3 {
 							status =3D "okay";
 						};
@@ -81,6 +89,11 @@ usb3-3 {
 			};
=20
 			ports {
+				usb2-0 {
+					mode =3D "host";
+					status =3D "okay";
+				};
+
 				usb2-1 {
 					mode =3D "host";
 					status =3D "okay";
@@ -96,6 +109,11 @@ usb3-0 {
 					status =3D "okay";
 				};
=20
+				usb3-2 {
+					nvidia,usb2-companion =3D <0>;
+					status =3D "okay";
+				};
+
 				usb3-3 {
 					nvidia,usb2-companion =3D <3>;
 					maximum-speed =3D "super-speed";
@@ -107,11 +125,13 @@ usb3-3 {
 		usb@3610000 {
 			status =3D "okay";
=20
-			phys =3D	<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-1}>,
+			phys =3D	<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
+				<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-1}>,
 				<&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-3}>,
 				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-0}>,
+				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-2}>,
 				<&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-3}>;
-			phy-names =3D "usb2-1", "usb2-3", "usb3-0", "usb3-3";
+			phy-names =3D "usb2-0", "usb2-1", "usb2-3", "usb3-0", "usb3-2", "usb3-3=
";
 		};
=20
 		pwm@c340000 {
--=20
2.25.1

