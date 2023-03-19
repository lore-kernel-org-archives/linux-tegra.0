Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EDFDC6FD1F
	for <linux-tegra@archiver.kernel.org>; Sun, 19 Mar 2023 17:21:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229481AbjCSRV3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 19 Mar 2023 13:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229448AbjCSRV2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 19 Mar 2023 13:21:28 -0400
X-Greylist: delayed 405 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 19 Mar 2023 10:21:23 PDT
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [IPv6:2001:690:2100:1::15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A318772AB
        for <linux-tegra@vger.kernel.org>; Sun, 19 Mar 2023 10:21:23 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 080C8600041F;
        Sun, 19 Mar 2023 17:14:35 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id AX7c4haIDEeo; Sun, 19 Mar 2023 17:14:32 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 6218A600041A;
        Sun, 19 Mar 2023 17:14:32 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1679246072;
        bh=k0bsszD62Ga3kLJgsmeTJd7cSk1TgYhPNrEJZS4FtHQ=;
        h=From:To:Subject:Date;
        b=sw/hlGuZs5VkUQ566Bnfb6BvyyatEq3lLqpi0Gqwaek2ZSMsTYQxaQpgVq6HVWYLv
         2QYTx3hSWLR6X+Omu7o/88JdXpTSklUMcugNHJSg9rsfwABiETPWIOdW8py/p+Ntdb
         xX2C3dggSZtzNx8VTDe1CzwvFmnL+8qqqRSRsf5I=
Received: from wslaptop.Home (unknown [IPv6:2001:8a0:6a1a:e700:b1f6:8e31:237e:e5dd])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id E4783360071;
        Sun, 19 Mar 2023 17:14:31 +0000 (WET)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To:     diogo.ivo@tecnico.ulisboa.pt, krzysztof.kozlowski@linaro.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org
Subject: [PATCH] memory: tegra: remove redundant variable initialization
Date:   Sun, 19 Mar 2023 17:13:03 +0000
Message-Id: <20230319171303.120777-1-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

tegra210_emc_table_device_init() sets count = 0 twice, so
remove the second instance.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/memory/tegra/tegra210-emc-table.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/memory/tegra/tegra210-emc-table.c b/drivers/memory/tegra/tegra210-emc-table.c
index 3e0598363b87..34a8785d2861 100644
--- a/drivers/memory/tegra/tegra210-emc-table.c
+++ b/drivers/memory/tegra/tegra210-emc-table.c
@@ -22,8 +22,6 @@ static int tegra210_emc_table_device_init(struct reserved_mem *rmem,
 		return -ENOMEM;
 	}
 
-	count = 0;
-
 	for (i = 0; i < TEGRA_EMC_MAX_FREQS; i++) {
 		if (timings[i].revision == 0)
 			break;
-- 
2.40.0

