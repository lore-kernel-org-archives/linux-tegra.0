Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4798AC433EF
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Oct 2021 07:02:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FB026159A
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Oct 2021 07:02:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230526AbhJEHEd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Oct 2021 03:04:33 -0400
Received: from unicom146.biz-email.net ([210.51.26.146]:4600 "EHLO
        unicom146.biz-email.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231816AbhJEHEc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Oct 2021 03:04:32 -0400
Received: from ([60.208.111.195])
        by unicom146.biz-email.net ((LNX1044)) with ASMTP (SSL) id YHH00035;
        Tue, 05 Oct 2021 15:02:35 +0800
Received: from localhost.localdomain (10.200.104.119) by
 jtjnmail201606.home.langchao.com (10.100.2.6) with Microsoft SMTP Server id
 15.1.2308.14; Tue, 5 Oct 2021 15:02:36 +0800
From:   Kai Song <songkai01@inspur.com>
To:     <krzysztof.kozlowski@canonical.com>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Kai Song <songkai01@inspur.com>
Subject: [PATCH] memory: tegra210-emc: replace DEFINE_SIMPLE_ATTRIBUTE with
Date:   Tue, 5 Oct 2021 12:35:14 +0800
Message-ID: <20211005043514.9650-1-songkai01@inspur.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.200.104.119]
tUid:   20211005150235d31e8fdc29e23751e046cbafe63ded92
X-Abuse-Reports-To: service@corp-email.com
Abuse-Reports-To: service@corp-email.com
X-Complaints-To: service@corp-email.com
X-Report-Abuse-To: service@corp-email.com
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

fix debugfs_simple_attr.cocci warning:
drivers/memory/tegra/tegra210-emc-core.c:1665:0-23: WARNING:tegra210_emc_debug_min_rate_fops 
should be defined with DEFINE_DEBUGFS_ATTRIBUTE

Fixes: 6fc5f1adf5a1 ("memory: tegra210-emc: replace DEFINE_SIMPLE_ATTRIBUTE 
with DEFINE_DEBUGFS_ATTRIBUTE"):It reports the same warning, but didn't 
fix all matches in this file at once.

Signed-off-by: Kai Song <songkai01@inspur.com>
---
 drivers/memory/tegra/tegra210-emc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/tegra210-emc-core.c b/drivers/memory/tegra/tegra210-emc-core.c
index 3b8284c6678e..13584f9317a4 100644
--- a/drivers/memory/tegra/tegra210-emc-core.c
+++ b/drivers/memory/tegra/tegra210-emc-core.c
@@ -1662,7 +1662,7 @@ static int tegra210_emc_debug_min_rate_set(void *data, u64 rate)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(tegra210_emc_debug_min_rate_fops,
+DEFINE_DEBUGFS_ATTRIBUTE(tegra210_emc_debug_min_rate_fops,
 			tegra210_emc_debug_min_rate_get,
 			tegra210_emc_debug_min_rate_set, "%llu\n");
 
-- 
2.27.0

