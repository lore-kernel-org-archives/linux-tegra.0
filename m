Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3C0DC7619A
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Mar 2023 23:43:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230281AbjCVXn3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 22 Mar 2023 19:43:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230150AbjCVXnT (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Mar 2023 19:43:19 -0400
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [IPv6:2001:690:2100:1::15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B07EE23A65
        for <linux-tegra@vger.kernel.org>; Wed, 22 Mar 2023 16:42:51 -0700 (PDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id E7BAC600140E;
        Wed, 22 Mar 2023 23:42:43 +0000 (WET)
X-Virus-Scanned: by amavisd-new-2.11.0 (20160426) (Debian) at
        tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
        by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavisd-new, port 10025)
        with LMTP id SMY1-8rMhLmB; Wed, 22 Mar 2023 23:42:37 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
        by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 8252E600087B;
        Wed, 22 Mar 2023 23:42:37 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tecnico.ulisboa.pt;
        s=mail; t=1679528557;
        bh=flR+x3rdAt7Zs8l/WvGBysdRa9xtIItbhny7kU7heUI=;
        h=From:To:Subject:Date;
        b=pn53BXjzxRIxZjtBxR0k/iP7xacRrPhf2tC1iVfrPGNE+xLrsRnUrs50HgAmmkkIC
         vC4ZOsRshROVFEov7OqZ5nPzp4vg+TLTFQSLWE6Ahh2UQ7PxKgJ/jVQAaozSIeYas2
         49BadcnyXrzf+NWOOxlyBKVVzFP6ycRfNOalzfvE=
Received: from wslaptop.Home (unknown [IPv6:2001:8a0:6a1a:e700:b1f6:8e31:237e:e5dd])
        (Authenticated sender: ist187313)
        by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 3D415360077;
        Wed, 22 Mar 2023 23:42:37 +0000 (WET)
From:   Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To:     krzysztof.kozlowski@linaro.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, diogo.ivo@tecnico.ulisboa.pt,
        linux-tegra@vger.kernel.org
Subject: [PATCH] memory: tegra: read values from correct device
Date:   Wed, 22 Mar 2023 23:40:50 +0000
Message-Id: <20230322234050.47332-1-diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

When reading MR18 for Dev1 the code was incorrectly reading the
value corresponding to Dev0, so fix this by adjusting the index
according to the Tegra X1 TRM.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/memory/tegra/tegra210-emc-cc-r21021.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/tegra210-emc-cc-r21021.c b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
index cc76adb8d7e8..4cb608c71ead 100644
--- a/drivers/memory/tegra/tegra210-emc-cc-r21021.c
+++ b/drivers/memory/tegra/tegra210-emc-cc-r21021.c
@@ -277,7 +277,7 @@ static u32 update_clock_tree_delay(struct tegra210_emc *emc, int type)
 		/*
 		 * Dev1 LSB.
 		 */
-		value = tegra210_emc_mrr_read(emc, 2, 18);
+		value = tegra210_emc_mrr_read(emc, 1, 18);
 
 		for (i = 0; i < emc->num_channels; i++) {
 			temp[i][0] |= (value & 0x00ff) >> 0;
-- 
2.40.0

