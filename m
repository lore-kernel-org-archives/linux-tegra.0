Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C9EC43381
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Jan 2021 12:10:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FCF764DDB
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Jan 2021 12:10:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231284AbhA1MJp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 28 Jan 2021 07:09:45 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:6660 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231305AbhA1MJp (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Jan 2021 07:09:45 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B6012a9600002>; Thu, 28 Jan 2021 04:09:04 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 28 Jan
 2021 12:09:04 +0000
Received: from moonraker.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Thu, 28 Jan 2021 12:09:02 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2 2/2] arm64: tegra: Add support for Jetson Xavier NX with eMMC
Date:   Thu, 28 Jan 2021 12:08:51 +0000
Message-ID: <20210128120851.361401-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128120851.361401-1-jonathanh@nvidia.com>
References: <20210128120851.361401-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1611835744; bh=1NLlgoKnl9GUXbvWPjS9ubLgg0Tgis9Bc3yY10svkg8=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=hajMfumVlOAXs6/ouSqt0o/560+lg2fEw+O5z4c5iUqESlTf8ijYMGh0uboSFxTSz
         swrDbXlvm/4cGQZW3+qXj07aRMB5qDAfGM3VSRmq/iNuOvHD+KdTsrZykVicrSqE52
         H6iObYWamcxCnP4IThYZdDoygy91Cr722fV4ljEjs14v9kEHbMLEwUSBNHTpYX1EGJ
         D67Lsmc8JhHbSzNCOMg5WAzH8y7IYHq3SvuY9+h0nWcX/DF526a/9CYdpbafT94xSd
         TwxkqtzSCfQKvChTB37+yu9Rdbxb/0pCMd3Sfyh98OV0+2L8emD5mKBxIov7MZWtPV
         BTgg3dpqTJPoQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add support for the variant of the Jetson Xavier NX Developer Kit that
has a system-on-module which includes an eMMC.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---

Changes since V1:
- No actual changes, simply split patch into two patches

 arch/arm64/boot/dts/nvidia/Makefile           |  1 +
 .../nvidia/tegra194-p3509-0000+p3668-0001.dts | 10 ++++++++++
 .../boot/dts/nvidia/tegra194-p3668-0001.dtsi  | 19 +++++++++++++++++++
 .../arm64/boot/dts/nvidia/tegra194-p3668.dtsi |  2 +-
 4 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-00=
01.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3668-0001.dtsi

diff --git a/arch/arm64/boot/dts/nvidia/Makefile b/arch/arm64/boot/dts/nvid=
ia/Makefile
index 9296d12d11e9..e13fb1070472 100644
--- a/arch/arm64/boot/dts/nvidia/Makefile
+++ b/arch/arm64/boot/dts/nvidia/Makefile
@@ -9,4 +9,5 @@ dtb-$(CONFIG_ARCH_TEGRA_210_SOC) +=3D tegra210-p2894-0050-a=
08.dtb
 dtb-$(CONFIG_ARCH_TEGRA_186_SOC) +=3D tegra186-p2771-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_194_SOC) +=3D tegra194-p2972-0000.dtb
 dtb-$(CONFIG_ARCH_TEGRA_194_SOC) +=3D tegra194-p3509-0000+p3668-0000.dtb
+dtb-$(CONFIG_ARCH_TEGRA_194_SOC) +=3D tegra194-p3509-0000+p3668-0001.dtb
 dtb-$(CONFIG_ARCH_TEGRA_234_SOC) +=3D tegra234-sim-vdk.dtb
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dts =
b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dts
new file mode 100644
index 000000000000..238fd98e8e45
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-0001.dts
@@ -0,0 +1,10 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+
+#include "tegra194-p3668-0001.dtsi"
+#include "tegra194-p3509-0000.dtsi"
+
+/ {
+	model =3D "NVIDIA Jetson Xavier NX Developer Kit (eMMC)";
+	compatible =3D "nvidia,p3509-0000+p3668-0001", "nvidia,tegra194";
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3668-0001.dtsi b/arch/arm=
64/boot/dts/nvidia/tegra194-p3668-0001.dtsi
new file mode 100644
index 000000000000..b7808648cfe4
--- /dev/null
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3668-0001.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "tegra194-p3668.dtsi"
+
+/ {
+	model =3D "NVIDIA Jetson Xavier NX (eMMC)";
+	compatible =3D "nvidia,p3668-0001", "nvidia,tegra194";
+
+	bus@0 {
+		/* SDMMC4 (eMMC) */
+		mmc@3460000 {
+			status =3D "okay";
+			bus-width =3D <8>;
+			non-removable;
+
+			vqmmc-supply =3D <&vdd_1v8ls>;
+			vmmc-supply =3D <&vdd_emmc_3v3>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi b/arch/arm64/bo=
ot/dts/nvidia/tegra194-p3668.dtsi
index a26b8a37f884..4f12721c332b 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi
@@ -252,7 +252,7 @@ ldo2 {
 						regulator-boot-on;
 					};
=20
-					ldo3 {
+					vdd_emmc_3v3: ldo3 {
 						regulator-name =3D "VDD_EMMC_3V3";
 						regulator-min-microvolt =3D <3300000>;
 						regulator-max-microvolt =3D <3300000>;
--=20
2.25.1

