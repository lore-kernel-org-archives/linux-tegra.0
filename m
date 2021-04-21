Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B20C433ED
	for <linux-tegra@archiver.kernel.org>; Wed, 21 Apr 2021 13:56:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B027C61439
	for <linux-tegra@archiver.kernel.org>; Wed, 21 Apr 2021 13:56:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241609AbhDUN5O (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 21 Apr 2021 09:57:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:33658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243038AbhDUN5C (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 21 Apr 2021 09:57:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF0856144D;
        Wed, 21 Apr 2021 13:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619013388;
        bh=JR07JyZ8UJK9Zsnb9BH+u/PKpxm352xvttxjWOx5aBs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=l+r1yXyeUlRi9sVm1chURKaj1i2uwzcMbWJMnZhh71vhfeVccP7cdQsoHOf4r0Wsp
         1njXtVY6aX03USXocTSFlbMaV2Z1HdF5Wd0OkdG5GtWL271SC4G+0Z+OJKN9BIAWRk
         E3lSMn61pWwq1SL9zD3OH9nAAmuoUeN5LuwQMjxir8lEFLP+ZHhcWvh+8m8n0vdDtc
         VlCnjbIQ5L/5nRuW0BMf9tv/c4wQgKKmYPoq6fGqwMnQidwpf9xoiRtV/dKnrK3ojL
         zi/h0UsEIOD4iSEegQQapZn/N7J/2XEpbKiMDtVT/syUoOk/4dJIKRQEqVD8GiDK5O
         nhbijk43v9Oyw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] usb: xhci: tegra: mark PM functions as __maybe_unused
Date:   Wed, 21 Apr 2021 15:56:08 +0200
Message-Id: <20210421135613.3560777-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210421135613.3560777-1-arnd@kernel.org>
References: <20210421135613.3560777-1-arnd@kernel.org>
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
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/usb/host/xhci-tegra.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index ce97ff054c68..adead2377149 100644
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

