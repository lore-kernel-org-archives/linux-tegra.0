Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29225C433E4
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 16:41:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D34F161A2C
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 16:41:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229524AbhCYQlX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 12:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229662AbhCYQlF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 12:41:05 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B23AC06174A;
        Thu, 25 Mar 2021 09:41:04 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id o16so3011323wrn.0;
        Thu, 25 Mar 2021 09:41:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=THw8zcgbqLcO16dUqauFb0z8OAhU7380cxSadcHRy9U=;
        b=IloW8Z33ZDvYuKx2XBziTeFxCxMoDYKa2NhSguqvWJsy76doeS3uEx7rrkXSy+VKzz
         BWbxBOAjRnb89Bd5P5tQlGnn+/JgzAFTlXVlJL9Z1SUC0lv4+8R3ueo/oPDFUyy8fGHn
         1wPjz4s88BAIv0gJFqEeTMCQOJXDx/WPNl2LM4q9EMJCn9306irOl1jnHcWDHgdXQxYd
         YKUNXJOloW5VBG4dIDj2cdClJzXgFkXshnWRJJjrXkN4pncRX+eseRdyd3xLFQrmDY+V
         kaM2Hkc3gFw/dYDyePPYYSL30Q99s/fQU00yUbo4RueJl9EiTrlR1i3++nqhkuwaaGft
         m1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=THw8zcgbqLcO16dUqauFb0z8OAhU7380cxSadcHRy9U=;
        b=gTgX/56ta4LH6fuaKx0j8kv24d6vraV/T38kC2y6nuQIoZbyD5X6oidP3CjrhgjloJ
         GskhbNAX+n+v+gMXN2U2N5BKks/FdxdKnSCvcOW7vztrtl2Mvp6deF68Pj8nMflhtuWi
         2zy4QrPIsyPfAVEJdD84/RW9Qt9PhCctOYXG0Z5fLhMDVzMTImb0FDtjbKyXm3bmeMfo
         ay81KLscAlQXOrrSVdi46rt5hQZ2VL3g/mug8H8umrfpLUaxwCx0OPh7NED8ltT6Lau0
         mfx+Tg8U82L5yTKMP/QWQ72nhLj/NsRx/SdtFy7YQmC7MT+DyZbagHNJqJsQSfU3PcHN
         x2sQ==
X-Gm-Message-State: AOAM531dzFtAgo8WZ4zIu5obI+kwiwtwj18CLmVMV4QjTnH2aVjypdt5
        vronRixc4SGBGN1TTkw4CXU=
X-Google-Smtp-Source: ABdhPJwS8D3jR/+zm9zeYJjDu4IIIl3Zh0tcS8mq+uGfbnHw8pab8S329eTtv5epyq7ZB+aN8xZozQ==
X-Received: by 2002:adf:d236:: with SMTP id k22mr9959080wrh.144.1616690463074;
        Thu, 25 Mar 2021 09:41:03 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id k11sm7115040wmj.1.2021.03.25.09.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 09:40:59 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        JC Kuo <jckuo@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org
Subject: [PATCH v8 06/13] phy: tegra: xusb: Add sleepwalk and suspend/resume
Date:   Thu, 25 Mar 2021 17:40:50 +0100
Message-Id: <20210325164057.793954-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325164057.793954-1-thierry.reding@gmail.com>
References: <20210325164057.793954-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: JC Kuo <jckuo@nvidia.com>

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
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/phy/tegra/xusb.c       | 82 ++++++++++++++++++++++++++++++++++
 drivers/phy/tegra/xusb.h       |  8 ++++
 include/linux/phy/tegra/xusb.h | 10 ++++-
 3 files changed, 99 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index a34d304677bb..0aadac678191 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -1273,10 +1273,36 @@ static int tegra_xusb_padctl_remove(struct platform_device *pdev)
 	return err;
 }
 
+static int tegra_xusb_padctl_suspend_noirq(struct device *dev)
+{
+	struct tegra_xusb_padctl *padctl = dev_get_drvdata(dev);
+
+	if (padctl->soc && padctl->soc->ops && padctl->soc->ops->suspend_noirq)
+		return padctl->soc->ops->suspend_noirq(padctl);
+
+	return 0;
+}
+
+static int tegra_xusb_padctl_resume_noirq(struct device *dev)
+{
+	struct tegra_xusb_padctl *padctl = dev_get_drvdata(dev);
+
+	if (padctl->soc && padctl->soc->ops && padctl->soc->ops->resume_noirq)
+		return padctl->soc->ops->resume_noirq(padctl);
+
+	return 0;
+}
+
+static const struct dev_pm_ops tegra_xusb_padctl_pm_ops = {
+	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_xusb_padctl_suspend_noirq,
+				      tegra_xusb_padctl_resume_noirq)
+};
+
 static struct platform_driver tegra_xusb_padctl_driver = {
 	.driver = {
 		.name = "tegra-xusb-padctl",
 		.of_match_table = tegra_xusb_padctl_of_match,
+		.pm = &tegra_xusb_padctl_pm_ops,
 	},
 	.probe = tegra_xusb_padctl_probe,
 	.remove = tegra_xusb_padctl_remove,
@@ -1343,6 +1369,62 @@ int tegra_xusb_padctl_hsic_set_idle(struct tegra_xusb_padctl *padctl,
 }
 EXPORT_SYMBOL_GPL(tegra_xusb_padctl_hsic_set_idle);
 
+int tegra_xusb_padctl_enable_phy_sleepwalk(struct tegra_xusb_padctl *padctl, struct phy *phy,
+					   enum usb_device_speed speed)
+{
+	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
+
+	if (lane->pad->ops->enable_phy_sleepwalk)
+		return lane->pad->ops->enable_phy_sleepwalk(lane, speed);
+
+	return -EOPNOTSUPP;
+}
+EXPORT_SYMBOL_GPL(tegra_xusb_padctl_enable_phy_sleepwalk);
+
+int tegra_xusb_padctl_disable_phy_sleepwalk(struct tegra_xusb_padctl *padctl, struct phy *phy)
+{
+	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
+
+	if (lane->pad->ops->disable_phy_sleepwalk)
+		return lane->pad->ops->disable_phy_sleepwalk(lane);
+
+	return -EOPNOTSUPP;
+}
+EXPORT_SYMBOL_GPL(tegra_xusb_padctl_disable_phy_sleepwalk);
+
+int tegra_xusb_padctl_enable_phy_wake(struct tegra_xusb_padctl *padctl, struct phy *phy)
+{
+	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
+
+	if (lane->pad->ops->enable_phy_wake)
+		return lane->pad->ops->enable_phy_wake(lane);
+
+	return -EOPNOTSUPP;
+}
+EXPORT_SYMBOL_GPL(tegra_xusb_padctl_enable_phy_wake);
+
+int tegra_xusb_padctl_disable_phy_wake(struct tegra_xusb_padctl *padctl, struct phy *phy)
+{
+	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
+
+	if (lane->pad->ops->disable_phy_wake)
+		return lane->pad->ops->disable_phy_wake(lane);
+
+	return -EOPNOTSUPP;
+}
+EXPORT_SYMBOL_GPL(tegra_xusb_padctl_disable_phy_wake);
+
+bool tegra_xusb_padctl_remote_wake_detected(struct tegra_xusb_padctl *padctl, struct phy *phy)
+{
+	struct tegra_xusb_lane *lane = phy_get_drvdata(phy);
+
+	if (lane->pad->ops->remote_wake_detected)
+		return lane->pad->ops->remote_wake_detected(lane);
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(tegra_xusb_padctl_remote_wake_detected);
+
 int tegra_xusb_padctl_usb3_set_lfps_detect(struct tegra_xusb_padctl *padctl,
 					   unsigned int port, bool enable)
 {
diff --git a/drivers/phy/tegra/xusb.h b/drivers/phy/tegra/xusb.h
index e789d5ff4eb8..034f7a2c28d6 100644
--- a/drivers/phy/tegra/xusb.h
+++ b/drivers/phy/tegra/xusb.h
@@ -11,6 +11,7 @@
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
 
+#include <linux/usb/ch9.h>
 #include <linux/usb/otg.h>
 #include <linux/usb/role.h>
 
@@ -132,6 +133,11 @@ struct tegra_xusb_lane_ops {
 	void (*remove)(struct tegra_xusb_lane *lane);
 	void (*iddq_enable)(struct tegra_xusb_lane *lane);
 	void (*iddq_disable)(struct tegra_xusb_lane *lane);
+	int (*enable_phy_sleepwalk)(struct tegra_xusb_lane *lane, enum usb_device_speed speed);
+	int (*disable_phy_sleepwalk)(struct tegra_xusb_lane *lane);
+	int (*enable_phy_wake)(struct tegra_xusb_lane *lane);
+	int (*disable_phy_wake)(struct tegra_xusb_lane *lane);
+	bool (*remote_wake_detected)(struct tegra_xusb_lane *lane);
 };
 
 bool tegra_xusb_lane_check(struct tegra_xusb_lane *lane, const char *function);
@@ -396,6 +402,8 @@ struct tegra_xusb_padctl_ops {
 			 const struct tegra_xusb_padctl_soc *soc);
 	void (*remove)(struct tegra_xusb_padctl *padctl);
 
+	int (*suspend_noirq)(struct tegra_xusb_padctl *padctl);
+	int (*resume_noirq)(struct tegra_xusb_padctl *padctl);
 	int (*usb3_save_context)(struct tegra_xusb_padctl *padctl,
 				 unsigned int index);
 	int (*hsic_set_idle)(struct tegra_xusb_padctl *padctl,
diff --git a/include/linux/phy/tegra/xusb.h b/include/linux/phy/tegra/xusb.h
index 71d956935405..3a35e74cdc61 100644
--- a/include/linux/phy/tegra/xusb.h
+++ b/include/linux/phy/tegra/xusb.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2016, NVIDIA CORPORATION.  All rights reserved.
+ * Copyright (c) 2016-2020, NVIDIA CORPORATION.  All rights reserved.
  */
 
 #ifndef PHY_TEGRA_XUSB_H
@@ -8,6 +8,7 @@
 
 struct tegra_xusb_padctl;
 struct device;
+enum usb_device_speed;
 
 struct tegra_xusb_padctl *tegra_xusb_padctl_get(struct device *dev);
 void tegra_xusb_padctl_put(struct tegra_xusb_padctl *padctl);
@@ -23,4 +24,11 @@ int tegra_xusb_padctl_set_vbus_override(struct tegra_xusb_padctl *padctl,
 int tegra_phy_xusb_utmi_port_reset(struct phy *phy);
 int tegra_xusb_padctl_get_usb3_companion(struct tegra_xusb_padctl *padctl,
 					 unsigned int port);
+int tegra_xusb_padctl_enable_phy_sleepwalk(struct tegra_xusb_padctl *padctl, struct phy *phy,
+					   enum usb_device_speed speed);
+int tegra_xusb_padctl_disable_phy_sleepwalk(struct tegra_xusb_padctl *padctl, struct phy *phy);
+int tegra_xusb_padctl_enable_phy_wake(struct tegra_xusb_padctl *padctl, struct phy *phy);
+int tegra_xusb_padctl_disable_phy_wake(struct tegra_xusb_padctl *padctl, struct phy *phy);
+bool tegra_xusb_padctl_remote_wake_detected(struct tegra_xusb_padctl *padctl, struct phy *phy);
+
 #endif /* PHY_TEGRA_XUSB_H */
-- 
2.30.2

