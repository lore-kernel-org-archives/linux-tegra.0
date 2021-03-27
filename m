Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B151C433DB
	for <linux-tegra@archiver.kernel.org>; Sat, 27 Mar 2021 12:36:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F198619DC
	for <linux-tegra@archiver.kernel.org>; Sat, 27 Mar 2021 12:36:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbhC0Mgi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 27 Mar 2021 08:36:38 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14502 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230220AbhC0Mgf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 27 Mar 2021 08:36:35 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F6yvp261Gzrbjn;
        Sat, 27 Mar 2021 20:34:30 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Sat, 27 Mar 2021 20:36:20 +0800
From:   Xie XiuQi <xiexiuqi@huawei.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <yangyingliang@huawei.com>
Subject: [PATCH 2/2] firmware: tegra: Fix build with Tegra234 configuration
Date:   Sat, 27 Mar 2021 20:37:57 +0800
Message-ID: <20210327123757.4568-3-xiexiuqi@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210327123757.4568-1-xiexiuqi@huawei.com>
References: <20210327123757.4568-1-xiexiuqi@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

If only Tegra234 support is enabled, the tegra186_bpmp_ops and
tegra186_soc are not defined and cause a build failure.

Add Tegra234 to the preprocessor guard to make sure these functions are
available for Tegra234-only builds as well.

Fixes: 0ebdf11699d0 ("firmware: tegra: Enable BPMP support on Tegra234")
Signed-off-by: Xie XiuQi <xiexiuqi@huawei.com>
---
 drivers/firmware/tegra/Makefile       | 1 +
 drivers/firmware/tegra/bpmp-private.h | 3 ++-
 drivers/firmware/tegra/bpmp.c         | 3 ++-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/tegra/Makefile b/drivers/firmware/tegra/Makefile
index 49c87e00fafb..620cf3fdd607 100644
--- a/drivers/firmware/tegra/Makefile
+++ b/drivers/firmware/tegra/Makefile
@@ -3,6 +3,7 @@ tegra-bpmp-y			= bpmp.o
 tegra-bpmp-$(CONFIG_ARCH_TEGRA_210_SOC)	+= bpmp-tegra210.o
 tegra-bpmp-$(CONFIG_ARCH_TEGRA_186_SOC)	+= bpmp-tegra186.o
 tegra-bpmp-$(CONFIG_ARCH_TEGRA_194_SOC)	+= bpmp-tegra186.o
+tegra-bpmp-$(CONFIG_ARCH_TEGRA_234_SOC)	+= bpmp-tegra186.o
 tegra-bpmp-$(CONFIG_DEBUG_FS)	+= bpmp-debugfs.o
 obj-$(CONFIG_TEGRA_BPMP)	+= tegra-bpmp.o
 obj-$(CONFIG_TEGRA_IVC)		+= ivc.o
diff --git a/drivers/firmware/tegra/bpmp-private.h b/drivers/firmware/tegra/bpmp-private.h
index 54d560c48398..182bfe396516 100644
--- a/drivers/firmware/tegra/bpmp-private.h
+++ b/drivers/firmware/tegra/bpmp-private.h
@@ -24,7 +24,8 @@ struct tegra_bpmp_ops {
 };
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
-    IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC)
+    IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
 extern const struct tegra_bpmp_ops tegra186_bpmp_ops;
 #endif
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 0742a90cb844..5654c5e9862b 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -809,7 +809,8 @@ static const struct dev_pm_ops tegra_bpmp_pm_ops = {
 };
 
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_186_SOC) || \
-    IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC)
+    IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC) || \
+    IS_ENABLED(CONFIG_ARCH_TEGRA_234_SOC)
 static const struct tegra_bpmp_soc tegra186_soc = {
 	.channels = {
 		.cpu_tx = {
-- 
2.25.1

