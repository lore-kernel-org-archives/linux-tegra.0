Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F55FC636CA
	for <linux-tegra@archiver.kernel.org>; Wed, 21 Jul 2021 15:25:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1643B61019
	for <linux-tegra@archiver.kernel.org>; Wed, 21 Jul 2021 15:25:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239825AbhGUOpS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 21 Jul 2021 10:45:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:35308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237983AbhGUOpS (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 21 Jul 2021 10:45:18 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D33861244;
        Wed, 21 Jul 2021 15:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626881154;
        bh=wjqtZHJ1O1pIfsvtHuG3THZnQPY//zpBpnkaegjFRl8=;
        h=From:To:Cc:Subject:Date:From;
        b=Dvw6DkqeI3kmFnWhMCI8yihoXRo9PNLiyahTyM6EVJ3ohV6CGpnLy2kVkcRqNzzaF
         /znCchJtzAl6ShY/0rrE//3j5HVXWgvFrvGYTnjK1nTmbUqDU2asaoHi5GrLfBu8C/
         10UW3fRofo/lvTY8kLME6R5iMszcLxxP1MvxUC+sdQItdc/lRCoONd8UHdq4Jax8MN
         2cyeJHF7DxrW6e2eZEZIjlwxNXoVYqsN8WnLExVTzxjEK7axC1xAX8YItgmejVll9Q
         zCx5hOCcUXr+m3ALPp5X+RS3gLL/p30ECJOdmstJM5qcHZrFfwyaP3yJNjP20zKm/J
         hwrW41syI4U9g==
From:   Arnd Bergmann <arnd@kernel.org>
To:     JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] phy: tegra: xusb: mark PM functions as __maybe_unused
Date:   Wed, 21 Jul 2021 17:25:42 +0200
Message-Id: <20210721152550.2976003-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

When these are not referenced, gcc prints a harmless warning:

drivers/phy/tegra/xusb.c:1286:12: error: 'tegra_xusb_padctl_resume_noirq' defined but not used [-Werror=unused-function]
 1286 | static int tegra_xusb_padctl_resume_noirq(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/phy/tegra/xusb.c:1276:12: error: 'tegra_xusb_padctl_suspend_noirq' defined but not used [-Werror=unused-function]
 1276 | static int tegra_xusb_padctl_suspend_noirq(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes: c545a9056712 ("phy: tegra: xusb: Add sleepwalk and suspend/resume")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/phy/tegra/xusb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index 0aadac678191..963de5913e50 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -1273,7 +1273,7 @@ static int tegra_xusb_padctl_remove(struct platform_device *pdev)
 	return err;
 }
 
-static int tegra_xusb_padctl_suspend_noirq(struct device *dev)
+static __maybe_unused int tegra_xusb_padctl_suspend_noirq(struct device *dev)
 {
 	struct tegra_xusb_padctl *padctl = dev_get_drvdata(dev);
 
@@ -1283,7 +1283,7 @@ static int tegra_xusb_padctl_suspend_noirq(struct device *dev)
 	return 0;
 }
 
-static int tegra_xusb_padctl_resume_noirq(struct device *dev)
+static __maybe_unused int tegra_xusb_padctl_resume_noirq(struct device *dev)
 {
 	struct tegra_xusb_padctl *padctl = dev_get_drvdata(dev);
 
-- 
2.29.2

