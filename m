Return-Path: <SRS0=VMTZ=DX=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D2CC2D0AE
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 13:08:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C666D2071A
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 13:08:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="BVZ6znZm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408165AbgJPNIj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Oct 2020 09:08:39 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:12357 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408104AbgJPNIL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Oct 2020 09:08:11 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f899ae00000>; Fri, 16 Oct 2020 06:06:40 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct
 2020 13:08:06 +0000
Received: from jckuo-lt.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 16 Oct 2020 13:08:04 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>,
        Thierry Reding <treding@nvidia.com>
Subject: [PATCH v4 05/16] phy: tegra: xusb: Rearrange UPHY init on Tegra210
Date:   Fri, 16 Oct 2020 21:07:15 +0800
Message-ID: <20201016130726.1378666-6-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016130726.1378666-1-jckuo@nvidia.com>
References: <20201016130726.1378666-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602853600; bh=MnfLScPtruzCbnDPXAATZNVz2msClzX5eCyrxy1WauM=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=BVZ6znZm2YfsOedOcgyBThhIW9bO30XZzFknFAOTqNf4V1WoxXMnMkPLAK9/9q7eF
         OjYDHigLebmJZbhSLnMDcvbHJSfCuQIabkYoq65a6UJXsnJoNZgClzumpBJuKRVj1D
         mulyShLxFjBIawBC6o95ETGvvtIY7BdnpVMAaxzwgYvUTN+DWAiIizsx6oNFYSWJa3
         IiTuEJHVBiKL7F9Y8+AUSDqTYtbc9xeSIG+5lomW8Uzht+PmXlQSI4vT9Xajp0oumB
         BUq6PlKBJmEFzmkm31VzX89NDTwjGAw1jUuU5aUC8jAgDdHbSy/rl94yx6ULkiHTkV
         3e1wLormt6f3w==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This commit is a preparation for enabling XUSB SC7 support.
It rearranges Tegra210 XUSB PADCTL UPHY initialization sequence,
for the following reasons:

1. PLLE hardware power sequencer has to be enabled only after both
   PEX UPHY PLL and SATA UPHY PLL are initialized.
   tegra210_uphy_init() -> tegra210_pex_uphy_enable()
                        -> tegra210_sata_uphy_enable()
                        -> tegra210_plle_hw_sequence_start()
                        -> tegra210_aux_mux_lp0_clamp_disable()

2. At cold boot and SC7 exit, the following bits must be cleared after
   PEX/SATA lanes are out of IDDQ (IDDQ_DISABLE=3D1).
   a. XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_CLAMP_EN,
   b. XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_CLAMP_EN_EARLY
   c. XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_VCORE_DOWN

   tegra210_pex_uphy_enable() and tegra210_sata_uphy_enable() are in
   charge of bringing lanes out of IDDQ, and then AUX_MUX_LP0_* bits
   will be cleared by tegra210_aux_mux_lp0_clamp_disable().

Signed-off-by: JC Kuo <jckuo@nvidia.com>
Acked-by: Thierry Reding <treding@nvidia.com>
---
v4:                                                                        =
                                                                           =
                                =20
   no change
v3:
   make separate changes
   use "unsigned int" instead "int" type for PHY index
   add blank line for better readability

 drivers/phy/tegra/xusb-tegra210.c | 195 ++++++++++++++++--------------
 drivers/phy/tegra/xusb.h          |   4 +-
 2 files changed, 103 insertions(+), 96 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-teg=
ra210.c
index 9bfecdfecf35..faacb866cd1f 100644
--- a/drivers/phy/tegra/xusb-tegra210.c
+++ b/drivers/phy/tegra/xusb-tegra210.c
@@ -288,17 +288,19 @@ static int tegra210_pex_uphy_enable(struct tegra_xusb=
_padctl *padctl)
 	struct tegra_xusb_pcie_pad *pcie =3D to_pcie_pad(padctl->pcie);
 	unsigned long timeout;
 	u32 value;
+	unsigned int i;
 	int err;
=20
-	if (pcie->enable > 0) {
-		pcie->enable++;
+	if (pcie->enable)
 		return 0;
-	}
=20
 	err =3D clk_prepare_enable(pcie->pll);
 	if (err < 0)
 		return err;
=20
+	if (tegra210_plle_hw_sequence_is_enabled())
+		goto skip_pll_init;
+
 	err =3D reset_control_deassert(pcie->rst);
 	if (err < 0)
 		goto disable;
@@ -481,7 +483,14 @@ static int tegra210_pex_uphy_enable(struct tegra_xusb_=
padctl *padctl)
=20
 	tegra210_xusb_pll_hw_sequence_start();
=20
-	pcie->enable++;
+skip_pll_init:
+	pcie->enable =3D true;
+
+	for (i =3D 0; i < padctl->pcie->soc->num_lanes; i++) {
+		value =3D padctl_readl(padctl, XUSB_PADCTL_USB3_PAD_MUX);
+		value |=3D XUSB_PADCTL_USB3_PAD_MUX_PCIE_IDDQ_DISABLE(i);
+		padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
+	}
=20
 	return 0;
=20
@@ -495,28 +504,44 @@ static int tegra210_pex_uphy_enable(struct tegra_xusb=
_padctl *padctl)
 static void tegra210_pex_uphy_disable(struct tegra_xusb_padctl *padctl)
 {
 	struct tegra_xusb_pcie_pad *pcie =3D to_pcie_pad(padctl->pcie);
+	u32 value;
+	unsigned int i;
=20
-	if (WARN_ON(pcie->enable =3D=3D 0))
+	if (WARN_ON(!pcie->enable))
 		return;
=20
-	if (--pcie->enable > 0)
-		return;
+	pcie->enable =3D false;
+
+	for (i =3D 0; i < padctl->pcie->soc->num_lanes; i++) {
+		value =3D padctl_readl(padctl, XUSB_PADCTL_USB3_PAD_MUX);
+		value &=3D ~XUSB_PADCTL_USB3_PAD_MUX_PCIE_IDDQ_DISABLE(i);
+		padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
+	}
=20
 	clk_disable_unprepare(pcie->pll);
 }
=20
 /* must be called under padctl->lock */
-static int tegra210_sata_uphy_enable(struct tegra_xusb_padctl *padctl, boo=
l usb)
+static int tegra210_sata_uphy_enable(struct tegra_xusb_padctl *padctl)
 {
 	struct tegra_xusb_sata_pad *sata =3D to_sata_pad(padctl->sata);
+	struct tegra_xusb_lane *lane =3D tegra_xusb_find_lane(padctl, "sata", 0);
 	unsigned long timeout;
 	u32 value;
+	unsigned int i;
 	int err;
+	bool usb;
=20
-	if (sata->enable > 0) {
-		sata->enable++;
+	if (sata->enable)
 		return 0;
-	}
+
+	if (IS_ERR(lane))
+		return 0;
+
+	if (tegra210_plle_hw_sequence_is_enabled())
+		goto skip_pll_init;
+
+	usb =3D tegra_xusb_lane_check(lane, "usb3-ss");
=20
 	err =3D clk_prepare_enable(sata->pll);
 	if (err < 0)
@@ -717,7 +742,14 @@ static int tegra210_sata_uphy_enable(struct tegra_xusb=
_padctl *padctl, bool usb)
=20
 	tegra210_sata_pll_hw_sequence_start();
=20
-	sata->enable++;
+skip_pll_init:
+	sata->enable =3D true;
+
+	for (i =3D 0; i < padctl->sata->soc->num_lanes; i++) {
+		value =3D padctl_readl(padctl, XUSB_PADCTL_USB3_PAD_MUX);
+		value |=3D XUSB_PADCTL_USB3_PAD_MUX_SATA_IDDQ_DISABLE(i);
+		padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
+	}
=20
 	return 0;
=20
@@ -731,25 +763,27 @@ static int tegra210_sata_uphy_enable(struct tegra_xus=
b_padctl *padctl, bool usb)
 static void tegra210_sata_uphy_disable(struct tegra_xusb_padctl *padctl)
 {
 	struct tegra_xusb_sata_pad *sata =3D to_sata_pad(padctl->sata);
+	u32 value;
+	unsigned int i;
=20
-	if (WARN_ON(sata->enable =3D=3D 0))
+	if (WARN_ON(!sata->enable))
 		return;
=20
-	if (--sata->enable > 0)
-		return;
+	sata->enable =3D false;
+
+	for (i =3D 0; i < padctl->sata->soc->num_lanes; i++) {
+		value =3D padctl_readl(padctl, XUSB_PADCTL_USB3_PAD_MUX);
+		value &=3D ~XUSB_PADCTL_USB3_PAD_MUX_SATA_IDDQ_DISABLE(i);
+		padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
+	}
=20
 	clk_disable_unprepare(sata->pll);
 }
=20
-static int tegra210_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
+static void tegra210_aux_mux_lp0_clamp_disable(struct tegra_xusb_padctl *p=
adctl)
 {
 	u32 value;
=20
-	mutex_lock(&padctl->lock);
-
-	if (padctl->enable++ > 0)
-		goto out;
-
 	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
 	value &=3D ~XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_CLAMP_EN;
 	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
@@ -765,24 +799,12 @@ static int tegra210_xusb_padctl_enable(struct tegra_x=
usb_padctl *padctl)
 	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
 	value &=3D ~XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_VCORE_DOWN;
 	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
-
-out:
-	mutex_unlock(&padctl->lock);
-	return 0;
 }
=20
-static int tegra210_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
+static void tegra210_aux_mux_lp0_clamp_enable(struct tegra_xusb_padctl *pa=
dctl)
 {
 	u32 value;
=20
-	mutex_lock(&padctl->lock);
-
-	if (WARN_ON(padctl->enable =3D=3D 0))
-		goto out;
-
-	if (--padctl->enable > 0)
-		goto out;
-
 	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
 	value |=3D XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_VCORE_DOWN;
 	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
@@ -798,12 +820,38 @@ static int tegra210_xusb_padctl_disable(struct tegra_=
xusb_padctl *padctl)
 	value =3D padctl_readl(padctl, XUSB_PADCTL_ELPG_PROGRAM1);
 	value |=3D XUSB_PADCTL_ELPG_PROGRAM1_AUX_MUX_LP0_CLAMP_EN;
 	padctl_writel(padctl, value, XUSB_PADCTL_ELPG_PROGRAM1);
+}
+
+static int tegra210_uphy_init(struct tegra_xusb_padctl *padctl)
+{
+	if (padctl->pcie)
+		tegra210_pex_uphy_enable(padctl);
+
+	if (padctl->sata)
+		tegra210_sata_uphy_enable(padctl);
+
+	if (!tegra210_plle_hw_sequence_is_enabled())
+		tegra210_plle_hw_sequence_start();
+	else
+		dev_dbg(padctl->dev, "PLLE is already in HW control\n");
+
+	tegra210_aux_mux_lp0_clamp_disable(padctl);
=20
-out:
-	mutex_unlock(&padctl->lock);
 	return 0;
 }
=20
+static void __maybe_unused
+tegra210_uphy_deinit(struct tegra_xusb_padctl *padctl)
+{
+	tegra210_aux_mux_lp0_clamp_enable(padctl);
+
+	if (padctl->sata)
+		tegra210_sata_uphy_disable(padctl);
+
+	if (padctl->pcie)
+		tegra210_pex_uphy_disable(padctl);
+}
+
 static int tegra210_hsic_set_idle(struct tegra_xusb_padctl *padctl,
 				  unsigned int index, bool idle)
 {
@@ -940,14 +988,12 @@ static int tegra210_usb2_phy_init(struct phy *phy)
 		 XUSB_PADCTL_USB2_PAD_MUX_USB2_BIAS_PAD_SHIFT;
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_PAD_MUX);
=20
-	return tegra210_xusb_padctl_enable(padctl);
+	return 0;
 }
=20
 static int tegra210_usb2_phy_exit(struct phy *phy)
 {
-	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
-
-	return tegra210_xusb_padctl_disable(lane->pad->padctl);
+	return 0;
 }
=20
 static int tegra210_xusb_padctl_vbus_override(struct tegra_xusb_padctl *pa=
dctl,
@@ -1405,14 +1451,12 @@ static int tegra210_hsic_phy_init(struct phy *phy)
 		 XUSB_PADCTL_USB2_PAD_MUX_HSIC_PAD_TRK_SHIFT;
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_PAD_MUX);
=20
-	return tegra210_xusb_padctl_enable(padctl);
+	return 0;
 }
=20
 static int tegra210_hsic_phy_exit(struct phy *phy)
 {
-	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
-
-	return tegra210_xusb_padctl_disable(lane->pad->padctl);
+	return 0;
 }
=20
 static int tegra210_hsic_phy_power_on(struct phy *phy)
@@ -1776,38 +1820,28 @@ static const struct tegra_xusb_lane_ops tegra210_pc=
ie_lane_ops =3D {
 static int tegra210_pcie_phy_init(struct phy *phy)
 {
 	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
+	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
=20
-	return tegra210_xusb_padctl_enable(lane->pad->padctl);
-}
+	mutex_lock(&padctl->lock);
=20
-static int tegra210_pcie_phy_exit(struct phy *phy)
-{
-	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
+	tegra210_uphy_init(padctl);
=20
-	return tegra210_xusb_padctl_disable(lane->pad->padctl);
+	mutex_unlock(&padctl->lock);
+
+	return 0;
 }
=20
 static int tegra210_pcie_phy_power_on(struct phy *phy)
 {
 	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
 	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
-	u32 value;
-	int err;
+	int err =3D 0;
=20
 	mutex_lock(&padctl->lock);
=20
-	err =3D tegra210_pex_uphy_enable(padctl);
-	if (err < 0)
-		goto unlock;
-
-	value =3D padctl_readl(padctl, XUSB_PADCTL_USB3_PAD_MUX);
-	value |=3D XUSB_PADCTL_USB3_PAD_MUX_PCIE_IDDQ_DISABLE(lane->index);
-	padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
-
 	if (tegra_xusb_lane_check(lane, "usb3-ss"))
 		err =3D tegra210_usb3_phy_power_on(phy);
=20
-unlock:
 	mutex_unlock(&padctl->lock);
 	return err;
 }
@@ -1817,16 +1851,9 @@ static int tegra210_pcie_phy_power_off(struct phy *p=
hy)
 	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
 	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
 	int err =3D 0;
-	u32 value;
=20
 	mutex_lock(&padctl->lock);
=20
-	value =3D padctl_readl(padctl, XUSB_PADCTL_USB3_PAD_MUX);
-	value &=3D ~XUSB_PADCTL_USB3_PAD_MUX_PCIE_IDDQ_DISABLE(lane->index);
-	padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
-
-	tegra210_pex_uphy_disable(padctl);
-
 	if (tegra_xusb_lane_check(lane, "usb3-ss"))
 		err =3D tegra210_usb3_phy_power_off(phy);
=20
@@ -1836,7 +1863,6 @@ static int tegra210_pcie_phy_power_off(struct phy *ph=
y)
=20
 static const struct phy_ops tegra210_pcie_phy_ops =3D {
 	.init =3D tegra210_pcie_phy_init,
-	.exit =3D tegra210_pcie_phy_exit,
 	.power_on =3D tegra210_pcie_phy_power_on,
 	.power_off =3D tegra210_pcie_phy_power_off,
 	.owner =3D THIS_MODULE,
@@ -1957,38 +1983,27 @@ static const struct tegra_xusb_lane_ops tegra210_sa=
ta_lane_ops =3D {
 static int tegra210_sata_phy_init(struct phy *phy)
 {
 	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
+	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
=20
-	return tegra210_xusb_padctl_enable(lane->pad->padctl);
-}
+	mutex_lock(&padctl->lock);
=20
-static int tegra210_sata_phy_exit(struct phy *phy)
-{
-	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
+	tegra210_uphy_init(padctl);
=20
-	return tegra210_xusb_padctl_disable(lane->pad->padctl);
+	mutex_unlock(&padctl->lock);
+	return 0;
 }
=20
 static int tegra210_sata_phy_power_on(struct phy *phy)
 {
 	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
 	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
-	u32 value;
-	int err;
+	int err =3D 0;
=20
 	mutex_lock(&padctl->lock);
=20
-	err =3D tegra210_sata_uphy_enable(padctl, false);
-	if (err < 0)
-		goto unlock;
-
-	value =3D padctl_readl(padctl, XUSB_PADCTL_USB3_PAD_MUX);
-	value |=3D XUSB_PADCTL_USB3_PAD_MUX_SATA_IDDQ_DISABLE(lane->index);
-	padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
-
 	if (tegra_xusb_lane_check(lane, "usb3-ss"))
 		err =3D tegra210_usb3_phy_power_on(phy);
=20
-unlock:
 	mutex_unlock(&padctl->lock);
 	return err;
 }
@@ -1998,16 +2013,9 @@ static int tegra210_sata_phy_power_off(struct phy *p=
hy)
 	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
 	struct tegra_xusb_padctl *padctl =3D lane->pad->padctl;
 	int err =3D 0;
-	u32 value;
=20
 	mutex_lock(&padctl->lock);
=20
-	value =3D padctl_readl(padctl, XUSB_PADCTL_USB3_PAD_MUX);
-	value &=3D ~XUSB_PADCTL_USB3_PAD_MUX_SATA_IDDQ_DISABLE(lane->index);
-	padctl_writel(padctl, value, XUSB_PADCTL_USB3_PAD_MUX);
-
-	tegra210_sata_uphy_disable(lane->pad->padctl);
-
 	if (tegra_xusb_lane_check(lane, "usb3-ss"))
 		err =3D tegra210_usb3_phy_power_off(phy);
=20
@@ -2017,7 +2025,6 @@ static int tegra210_sata_phy_power_off(struct phy *ph=
y)
=20
 static const struct phy_ops tegra210_sata_phy_ops =3D {
 	.init =3D tegra210_sata_phy_init,
-	.exit =3D tegra210_sata_phy_exit,
 	.power_on =3D tegra210_sata_phy_power_on,
 	.power_off =3D tegra210_sata_phy_power_off,
 	.owner =3D THIS_MODULE,
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index 37a5550a84ac..ccb5dc9b1220 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -232,7 +232,7 @@ struct tegra_xusb_pcie_pad {
 	struct reset_control *rst;
 	struct clk *pll;
=20
-	unsigned int enable;
+	bool enable;
 };
=20
 static inline struct tegra_xusb_pcie_pad *
@@ -247,7 +247,7 @@ struct tegra_xusb_sata_pad {
 	struct reset_control *rst;
 	struct clk *pll;
=20
-	unsigned int enable;
+	bool enable;
 };
=20
 static inline struct tegra_xusb_sata_pad *
--=20
2.25.1

