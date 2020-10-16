Return-Path: <SRS0=VMTZ=DX=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C731C433E7
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 13:08:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3E68D2071A
	for <linux-tegra@archiver.kernel.org>; Fri, 16 Oct 2020 13:08:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Wzsc0ubb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408158AbgJPNIi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 16 Oct 2020 09:08:38 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:14304 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408108AbgJPNIN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 16 Oct 2020 09:08:13 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f899b300000>; Fri, 16 Oct 2020 06:08:01 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Oct
 2020 13:08:10 +0000
Received: from jckuo-lt.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 16 Oct 2020 13:08:08 +0000
From:   JC Kuo <jckuo@nvidia.com>
To:     <gregkh@linuxfoundation.org>, <thierry.reding@gmail.com>,
        <robh@kernel.org>, <jonathanh@nvidia.com>, <kishon@ti.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v4 07/16] phy: tegra: xusb: Add sleepwalk and suspend/resume
Date:   Fri, 16 Oct 2020 21:07:17 +0800
Message-ID: <20201016130726.1378666-8-jckuo@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201016130726.1378666-1-jckuo@nvidia.com>
References: <20201016130726.1378666-1-jckuo@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1602853681; bh=OWI4cyiiZOaTHeFHihqIVC0+O5bSQCAyhS2E3AfiBMQ=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:MIME-Version:X-NVConfidentiality:
         Content-Transfer-Encoding:Content-Type;
        b=Wzsc0ubbG/5M1IS5F5wKEL1oy6oTI14zgCbtOH/tGMO1BZuccALcWcRHTxW2BScEn
         lBTnmBCPZyfidg6etSoYXkK3zyt5WRLxAVKfh6GL10nHA+3iu96TdKvcgMpFrLjhos
         3pUjCnUBZ2pjZ9mTzK9VNocNjuaqEH4XBJy7JRhrko7ZIVnxlRjWAM8qTGBK7yhegd
         oHA/1BiwckUG9/BQrE3legmbQUWMTWhnTSivlIixXrvsSLGTT7r6J70tXg/+LXY1FX
         T/2hlvDlcXMbSsPcb1XmtNN4OlEfxWPOkHz/KunODQ9yPhtEF0uJUJ+Nj2uZkBSCf0
         fk7EtEcSwj4IQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This commit adds sleepwalk/wake and suspend/resume interfaces
to Tegra XUSB PHY driver.

Tegra XUSB host controller driver makes use of sleepwalk functions
to enable/disable sleepwalk circuit which is in always-on partition
and can respond to USB resume signals when controller is not powered.
Sleepwalk can be enabled/disabled for any USB UPHY individually.

  - tegra_xusb_padctl_enable_phy_sleepwalk()
  - tegra_xusb_padctl_disable_phy_sleepwalk()

Tegra XUSB host controller driver makes use of wake functions to
enable/disable/query wake circuit which is in always-on partition
can wake system up when USB resume happens.
Wake circuit can be enabled/disabled for any USB PHY individually.

  - tegra_xusb_padctl_enable_phy_wake()
  - tegra_xusb_padctl_disable_phy_wake()
  - tegra_xusb_padctl_remote_wake_detected()

This commit also adds two system suspend stubs that can be used to
save and restore XUSB PADCTL context during system suspend and
resume.
  - tegra_xusb_padctl_suspend_noirq()
  - tegra_xusb_padctl_resume_noirq()

Signed-off-by: JC Kuo <jckuo@nvidia.com>
---
v4:
   move sleepwalk/wake stubs from 'struct tegra_xusb_padctl_ops' to
   'struct tegra_xusb_lane_ops'
v3:
   commit message improvement, no change in code

 drivers/phy/tegra/xusb.c       | 82 ++++++++++++++++++++++++++++++++++
 drivers/phy/tegra/xusb.h       |  8 ++++
 include/linux/phy/tegra/xusb.h | 10 ++++-
 3 files changed, 99 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 90578fb98aab..f0dc9c43959f 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -1274,10 +1274,36 @@ static int tegra_xusb_padctl_remove(struct platform=
_device *pdev)
 	return err;
 }
=20
+static int tegra_xusb_padctl_suspend_noirq(struct device *dev)
+{
+	struct tegra_xusb_padctl *padctl =3D dev_get_drvdata(dev);
+
+	if (padctl->soc && padctl->soc->ops && padctl->soc->ops->suspend_noirq)
+		return padctl->soc->ops->suspend_noirq(padctl);
+
+	return 0;
+}
+
+static int tegra_xusb_padctl_resume_noirq(struct device *dev)
+{
+	struct tegra_xusb_padctl *padctl =3D dev_get_drvdata(dev);
+
+	if (padctl->soc && padctl->soc->ops && padctl->soc->ops->resume_noirq)
+		return padctl->soc->ops->resume_noirq(padctl);
+
+	return 0;
+}
+
+static const struct dev_pm_ops tegra_xusb_padctl_pm_ops =3D {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_xusb_padctl_suspend_noirq,
+				      tegra_xusb_padctl_resume_noirq)
+};
+
 static struct platform_driver tegra_xusb_padctl_driver =3D {
 	.driver =3D {
 		.name =3D "tegra-xusb-padctl",
 		.of_match_table =3D tegra_xusb_padctl_of_match,
+		.pm =3D &tegra_xusb_padctl_pm_ops,
 	},
 	.probe =3D tegra_xusb_padctl_probe,
 	.remove =3D tegra_xusb_padctl_remove,
@@ -1344,6 +1370,62 @@ int tegra_xusb_padctl_hsic_set_idle(struct tegra_xus=
b_padctl *padctl,
 }
 EXPORT_SYMBOL_GPL(tegra_xusb_padctl_hsic_set_idle);
=20
+int tegra_xusb_padctl_enable_phy_sleepwalk(struct tegra_xusb_padctl *padct=
l, struct phy *phy,
+					   enum usb_device_speed speed)
+{
+	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
+
+	if (lane->pad->ops->enable_phy_sleepwalk)
+		return lane->pad->ops->enable_phy_sleepwalk(lane, speed);
+
+	return -EOPNOTSUPP;
+}
+EXPORT_SYMBOL_GPL(tegra_xusb_padctl_enable_phy_sleepwalk);
+
+int tegra_xusb_padctl_disable_phy_sleepwalk(struct tegra_xusb_padctl *padc=
tl, struct phy *phy)
+{
+	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
+
+	if (lane->pad->ops->disable_phy_sleepwalk)
+		return lane->pad->ops->disable_phy_sleepwalk(lane);
+
+	return -EOPNOTSUPP;
+}
+EXPORT_SYMBOL_GPL(tegra_xusb_padctl_disable_phy_sleepwalk);
+
+int tegra_xusb_padctl_enable_phy_wake(struct tegra_xusb_padctl *padctl, st=
ruct phy *phy)
+{
+	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
+
+	if (lane->pad->ops->enable_phy_wake)
+		return lane->pad->ops->enable_phy_wake(lane);
+
+	return -EOPNOTSUPP;
+}
+EXPORT_SYMBOL_GPL(tegra_xusb_padctl_enable_phy_wake);
+
+int tegra_xusb_padctl_disable_phy_wake(struct tegra_xusb_padctl *padctl, s=
truct phy *phy)
+{
+	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
+
+	if (lane->pad->ops->disable_phy_wake)
+		return lane->pad->ops->disable_phy_wake(lane);
+
+	return -EOPNOTSUPP;
+}
+EXPORT_SYMBOL_GPL(tegra_xusb_padctl_disable_phy_wake);
+
+bool tegra_xusb_padctl_remote_wake_detected(struct tegra_xusb_padctl *padc=
tl, struct phy *phy)
+{
+	struct tegra_xusb_lane *lane =3D phy_get_drvdata(phy);
+
+	if (lane->pad->ops->remote_wake_detected)
+		return lane->pad->ops->remote_wake_detected(lane);
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(tegra_xusb_padctl_remote_wake_detected);
+
 int tegra_xusb_padctl_usb3_set_lfps_detect(struct tegra_xusb_padctl *padct=
l,
 					   unsigned int port, bool enable)
 {
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index e789d5ff4eb8..034f7a2c28d6 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -11,6 +11,7 @@
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
=20
+#include <linux/usb/ch9.h>
 #include <linux/usb/otg.h>
 #include <linux/usb/role.h>
=20
@@ -132,6 +133,11 @@ struct tegra_xusb_lane_ops {
 	void (*remove)(struct tegra_xusb_lane *lane);
 	void (*iddq_enable)(struct tegra_xusb_lane *lane);
 	void (*iddq_disable)(struct tegra_xusb_lane *lane);
+	int (*enable_phy_sleepwalk)(struct tegra_xusb_lane *lane, enum usb_device=
_speed speed);
+	int (*disable_phy_sleepwalk)(struct tegra_xusb_lane *lane);
+	int (*enable_phy_wake)(struct tegra_xusb_lane *lane);
+	int (*disable_phy_wake)(struct tegra_xusb_lane *lane);
+	bool (*remote_wake_detected)(struct tegra_xusb_lane *lane);
 };
=20
 bool tegra_xusb_lane_check(struct tegra_xusb_lane *lane, const char *funct=
ion);
@@ -396,6 +402,8 @@ struct tegra_xusb_padctl_ops {
 			 const struct tegra_xusb_padctl_soc *soc);
 	void (*remove)(struct tegra_xusb_padctl *padctl);
=20
+	int (*suspend_noirq)(struct tegra_xusb_padctl *padctl);
+	int (*resume_noirq)(struct tegra_xusb_padctl *padctl);
 	int (*usb3_save_context)(struct tegra_xusb_padctl *padctl,
 				 unsigned int index);
 	int (*hsic_set_idle)(struct tegra_xusb_padctl *padctl,
diff --git a/include/linux/phy/tegra/xusb.h b/include/linux/phy/tegra/xusb.=
h
index 71d956935405..3a35e74cdc61 100644
--- a/include/linux/phy/tegra/xusb.h
+++ b/include/linux/phy/tegra/xusb.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2016, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2016-2020, NVIDIA CORPORATION.  All rights reserved.
  */
=20
 #ifndef PHY_TEGRA_XUSB_H
@@ -8,6 +8,7 @@
=20
 struct tegra_xusb_padctl;
 struct device;
+enum usb_device_speed;
=20
 struct tegra_xusb_padctl *tegra_xusb_padctl_get(struct device *dev);
 void tegra_xusb_padctl_put(struct tegra_xusb_padctl *padctl);
@@ -23,4 +24,11 @@ int tegra_xusb_padctl_set_vbus_override(struct tegra_xus=
b_padctl *padctl,
 int tegra_phy_xusb_utmi_port_reset(struct phy *phy);
 int tegra_xusb_padctl_get_usb3_companion(struct tegra_xusb_padctl *padctl,
 					 unsigned int port);
+int tegra_xusb_padctl_enable_phy_sleepwalk(struct tegra_xusb_padctl *padct=
l, struct phy *phy,
+					   enum usb_device_speed speed);
+int tegra_xusb_padctl_disable_phy_sleepwalk(struct tegra_xusb_padctl *padc=
tl, struct phy *phy);
+int tegra_xusb_padctl_enable_phy_wake(struct tegra_xusb_padctl *padctl, st=
ruct phy *phy);
+int tegra_xusb_padctl_disable_phy_wake(struct tegra_xusb_padctl *padctl, s=
truct phy *phy);
+bool tegra_xusb_padctl_remote_wake_detected(struct tegra_xusb_padctl *padc=
tl, struct phy *phy);
+
 #endif /* PHY_TEGRA_XUSB_H */
--=20
2.25.1

