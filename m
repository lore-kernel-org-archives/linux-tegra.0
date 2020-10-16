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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E45E8C433E7
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 13:09:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 83928207DE
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 13:09:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="iUq2P8A1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406791AbgJPNJY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Oct 2020 09:09:24 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:2795 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405622AbgJPNIb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Oct 2020 09:08:31 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f899b220000>; Fri, 16 Oct 2020 06:07:46 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct
 2020 13:08:26 +0000
Received: from jckuo-lt.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 16 Oct 2020 13:08:24 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v4 14/16] arm64: tegra210/tegra186/tegra194: XUSB PADCTL irq
Date:   Fri, 16 Oct 2020 21:07:24 +0800
Message-ID: <20201016130726.1378666-15-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016130726.1378666-1-jckuo@nvidia.com>
References: <20201016130726.1378666-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602853666; bh=N5avLC4QdLCwttzfR3lfx3pENBmBaCjqLuixsG01+7U=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=iUq2P8A1bOnjQSJm2aN/UnCRTunTRG49tEFsXnTemzEFvRIxIAIBQ+1n2jjaowtB+
         D8UKEpzAIymvMEOG+9s/N9AmkTnOsEo6M3gO/cwgHW06w88rXM0BcgsLx/tAXmrrUZ
         3wdmxt/fhZI0ulnr7ljn9gxBgcE9qZX/W0vhLCXtEgHkCFa2zQxSVt73fqAeJNY2Aj
         OOhmnUDjcFtYn6Npc1y++HxnzZxtgvkBeNp62fosQ1lyrGJ8xj1FjzB6Gdx/m4gvnU
         xykGrsbAvtazaXLC5SiJAra87gkhRYdBq6ti705pCjazmKUuFtZlJIn+iUl/bkCUk6
         SHDIoHvagiyCQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This commit adds "interrupts" property to Tegra210/Tegra186/Tegra194
XUSB PADCTL node. XUSB PADCTL interrupt will be raised when USB wake
event happens. This is required for supporting XUSB host controller
ELPG.

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
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
index 0c46ab7bbbf3..c5a82bccc6ff 100644
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
index e9c90f0f44ff..73bad615020a 100644
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
index 120b92d9b80b..26660aec730e 100644
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

