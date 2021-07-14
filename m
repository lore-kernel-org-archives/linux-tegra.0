Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F38C47E4D
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 19:53:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 638816100A
	for <linux-tegra@archiver.kernel.org>; Wed, 14 Jul 2021 19:53:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240489AbhGNTzt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 14 Jul 2021 15:55:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:46536 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240062AbhGNTt3 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 14 Jul 2021 15:49:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13447613E9;
        Wed, 14 Jul 2021 19:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626291884;
        bh=9vX5Pw3btHf51G/PwJ69a7b1fuw17DF2HH/8DIhR/qo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CDM4mnxVc/EQAeoCQyrHM+GdlDIEaOTWAwfFNdDWTLqyUgA48as2MVCn42CTFZhgS
         95MMGRf+PW9skQPfTl/RdIpjCFvqhOaXctTdSBUWSVksWJ4ZzzoPes2WkH+GeYLIEI
         551buBAGwmcwRYKIfRabUBBE3ZLsr3JnjzsffEY1JhQEGLkv0Py8QS+DTlJhhOuD6J
         VIahdNM+gkP9fNQJn9uJ8YywDu4xbPRzk3AVXTxtsohEnxnqNnwqCMD6V6xxJ3UgHR
         hatx832HQbuusnPkxPkaa5h3998V95K2v8xGQUMEw/A8ujBldin8m/tIGi5IpPUoDG
         zFgLQXEdO0R4A==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Thierry Reding <treding@nvidia.com>,
        Sasha Levin <sashal@kernel.org>, linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 67/88] soc/tegra: fuse: Fix Tegra234-only builds
Date:   Wed, 14 Jul 2021 15:42:42 -0400
Message-Id: <20210714194303.54028-67-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210714194303.54028-1-sashal@kernel.org>
References: <20210714194303.54028-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

[ Upstream commit e2d0ee225e49a5553986f3138dd2803852a31fd5 ]

The tegra30_fuse_read() symbol is used on Tegra234, so make sure it's
available.

Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/tegra/fuse/fuse-tegra30.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/tegra/fuse/fuse-tegra30.c b/drivers/soc/tegra/fuse/fuse-tegra30.c
index 9ea7f0168457..c1aa7815bd6e 100644
--- a/drivers/soc/tegra/fuse/fuse-tegra30.c
+++ b/drivers/soc/tegra/fuse/fuse-tegra30.c
@@ -37,7 +37,8 @@
     defined(CONFIG_ARCH_TEGRA_132_SOC) || \
     defined(CONFIG_ARCH_TEGRA_210_SOC) || \
     defined(CONFIG_ARCH_TEGRA_186_SOC) || \
-    defined(CONFIG_ARCH_TEGRA_194_SOC)
+    defined(CONFIG_ARCH_TEGRA_194_SOC) || \
+    defined(CONFIG_ARCH_TEGRA_234_SOC)
 static u32 tegra30_fuse_read_early(struct tegra_fuse *fuse, unsigned int offset)
 {
 	if (WARN_ON(!fuse->base))
-- 
2.30.2

