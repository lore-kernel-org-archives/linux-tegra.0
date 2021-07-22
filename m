Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA9E9C63793
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Jul 2021 09:07:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC6C26124B
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Jul 2021 09:07:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230504AbhGVI1Q (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 22 Jul 2021 04:27:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:60528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230419AbhGVI1Q (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 22 Jul 2021 04:27:16 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 96F3A610F7;
        Thu, 22 Jul 2021 09:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626944871;
        bh=F2bOQ2wJZqaEp0uMz1Rd5Ay2IRD7Pb+qXdR/w1JV9jY=;
        h=From:To:Cc:Subject:Date:From;
        b=Grns4zxjak8oi1LJ5h1bpkdXau/6RFwPeK3vANPxmNMApKnHhQJydq/3XML6Ecm1T
         xbpW6HcPJNJFiVnN7Cuyt/IK90l+/pFQPhT9Ca8DhIj5acT55uMB3LYvPShl47fwcf
         Pf+EVwKsEZNO5jayuvXPMuL3mZSF78K3ppq3Y8+Y2iN9wiujPSIDWYRrBndA8yQw8X
         VVNtJRmDrW7LX1M7KxSnkzscTvQEb5GbmmfRVRFOL6EsPZWYSJTRkmpHDjSJfP/zKS
         mJP5dnLPUgTOyaWOrUHvPrVi1GbbrQ+PtQKQmdbyn6bjSl7qbix4GO511Dwg9usqNd
         t5+mnByDrELxg==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH] memory: tegra: fix unused-function warning
Date:   Thu, 22 Jul 2021 11:07:43 +0200
Message-Id: <20210722090748.1157470-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The tegra186_mc_client_sid_override() is only called from
an #ifdef block:

drivers/memory/tegra/tegra186.c:74:13: error: 'tegra186_mc_client_sid_override' defined but not used [-Werror=unused-function]
   74 | static void tegra186_mc_client_sid_override(struct tegra_mc *mc,
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Add another #ifdef around the called function.

Fixes: 393d66fd2cac ("memory: tegra: Implement SID override programming")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/memory/tegra/tegra186.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index e65eac5764d4..3d153881abc1 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -71,6 +71,7 @@ static int tegra186_mc_resume(struct tegra_mc *mc)
 	return 0;
 }
 
+#if IS_ENABLED(CONFIG_IOMMU_API)
 static void tegra186_mc_client_sid_override(struct tegra_mc *mc,
 					    const struct tegra_mc_client *client,
 					    unsigned int sid)
@@ -108,6 +109,7 @@ static void tegra186_mc_client_sid_override(struct tegra_mc *mc,
 		writel(sid, mc->regs + client->regs.sid.override);
 	}
 }
+#endif
 
 static int tegra186_mc_probe_device(struct tegra_mc *mc, struct device *dev)
 {
-- 
2.29.2

