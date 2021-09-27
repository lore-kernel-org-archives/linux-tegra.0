Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F12C433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 27 Sep 2021 14:23:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96FB961058
	for <linux-tegra@archiver.kernel.org>; Mon, 27 Sep 2021 14:23:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234785AbhI0OYl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 27 Sep 2021 10:24:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:35286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234730AbhI0OYl (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 27 Sep 2021 10:24:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 24C0E60FD7;
        Mon, 27 Sep 2021 14:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632752583;
        bh=ZQ/mzkuYyFwT1Vg8d4ghbZ2fcO4h2gXnjki81+LWF5Y=;
        h=From:To:Cc:Subject:Date:From;
        b=Yv0VMjutnYt7YpQlCSbAgV0KeX2YXrxL/4sUyQ5s199wKNJMtWhhnpyE1whB3y7PE
         lt3x/Tyo1i1MMEq944grqooDLXMYLtZs5zXKdA/YnngXi1h3ZOr7lOIYEEqUqPBhf+
         IOTKuqb7pZfVQ6GPDe9KdepjYE4EYLCue0ajI/D8LlErWm+9KKxf32Kc3Q1vm6DHW1
         PjEm4wwPsbn5/O7YMyx7oqZfv6U4I0H4VCYZFxmwOJ5aboPUr4QuUAVxNGNGN7dPcW
         0IVdx10f/+mIqcLkvpKfYm+ZCnpkr66Ycvy7noYzKUPUnVf3HqiHHbBw0Q3gFP6Qui
         Rc1P8QYKjdqrQ==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Yang Yingliang <yangyingliang@huawei.com>,
        Petr Mladek <pmladek@suse.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] [RESEND] usb: xhci: tegra: mark PM functions as __maybe_unused
Date:   Mon, 27 Sep 2021 16:22:52 +0200
Message-Id: <20210927142258.1863321-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The added #ifdefs in the PM rework were almost correct, but still
cause warnings in some randconfig builds:

drivers/usb/host/xhci-tegra.c:2147:12: error: 'tegra_xusb_resume' defined but not used [-Werror=unused-function]
 2147 | static int tegra_xusb_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~
drivers/usb/host/xhci-tegra.c:2105:12: error: 'tegra_xusb_suspend' defined but not used [-Werror=unused-function]
 2105 | static int tegra_xusb_suspend(struct device *dev)

Replace the #ifdef checks with simpler __maybe_unused annotations to
reliably shut up these warnings.

Fixes: d64d362f1d8b ("usb: xhci: tegra: Enable ELPG for runtime/system PM")
Reviewed-by: JC Kuo <jckuo@nvidia.com>
Link: https://lore.kernel.org/all/20210421135613.3560777-2-arnd@kernel.org/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/usb/host/xhci-tegra.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 575fa89a783f..1bf494b649bd 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -1787,7 +1787,6 @@ static int tegra_xusb_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#if IS_ENABLED(CONFIG_PM) || IS_ENABLED(CONFIG_PM_SLEEP)
 static bool xhci_hub_ports_suspended(struct xhci_hub *hub)
 {
 	struct device *dev = hub->hcd->self.controller;
@@ -2102,7 +2101,7 @@ static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool runtime)
 	return err;
 }
 
-static int tegra_xusb_suspend(struct device *dev)
+static __maybe_unused int tegra_xusb_suspend(struct device *dev)
 {
 	struct tegra_xusb *tegra = dev_get_drvdata(dev);
 	int err;
@@ -2144,7 +2143,7 @@ static int tegra_xusb_suspend(struct device *dev)
 	return err;
 }
 
-static int tegra_xusb_resume(struct device *dev)
+static __maybe_unused int tegra_xusb_resume(struct device *dev)
 {
 	struct tegra_xusb *tegra = dev_get_drvdata(dev);
 	int err;
@@ -2174,10 +2173,8 @@ static int tegra_xusb_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-#ifdef CONFIG_PM
-static int tegra_xusb_runtime_suspend(struct device *dev)
+static __maybe_unused int tegra_xusb_runtime_suspend(struct device *dev)
 {
 	struct tegra_xusb *tegra = dev_get_drvdata(dev);
 	int ret;
@@ -2190,7 +2187,7 @@ static int tegra_xusb_runtime_suspend(struct device *dev)
 	return ret;
 }
 
-static int tegra_xusb_runtime_resume(struct device *dev)
+static __maybe_unused int tegra_xusb_runtime_resume(struct device *dev)
 {
 	struct tegra_xusb *tegra = dev_get_drvdata(dev);
 	int err;
@@ -2201,7 +2198,6 @@ static int tegra_xusb_runtime_resume(struct device *dev)
 
 	return err;
 }
-#endif
 
 static const struct dev_pm_ops tegra_xusb_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra_xusb_runtime_suspend,
-- 
2.29.2

