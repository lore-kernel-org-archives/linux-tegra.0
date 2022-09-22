Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EE9C6FA82
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Sep 2022 13:53:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231945AbiIVNxs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 22 Sep 2022 09:53:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231854AbiIVNxe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 22 Sep 2022 09:53:34 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 034281C114
        for <linux-tegra@vger.kernel.org>; Thu, 22 Sep 2022 06:53:34 -0700 (PDT)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.53])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MYGqL6HGjzWgt3;
        Thu, 22 Sep 2022 21:49:34 +0800 (CST)
Received: from dggpemm100009.china.huawei.com (7.185.36.113) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 22 Sep 2022 21:53:32 +0800
Received: from huawei.com (10.175.113.32) by dggpemm100009.china.huawei.com
 (7.185.36.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 22 Sep
 2022 21:53:31 +0800
From:   Liu Shixin <liushixin2@huawei.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH] soc/tegra: cbb: use DEFINE_SHOW_ATTRIBUTE to simplify tegra_cbb_err
Date:   Thu, 22 Sep 2022 22:27:15 +0800
Message-ID: <20220922142715.3249566-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.32]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm100009.china.huawei.com (7.185.36.113)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use DEFINE_SHOW_ATTRIBUTE helper macro to simplify the code.
No functional change.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/soc/tegra/cbb/tegra-cbb.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/soc/tegra/cbb/tegra-cbb.c b/drivers/soc/tegra/cbb/tegra-cbb.c
index d200937353c7..a8566b9dd8de 100644
--- a/drivers/soc/tegra/cbb/tegra-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra-cbb.c
@@ -72,18 +72,7 @@ static int tegra_cbb_err_show(struct seq_file *file, void *data)
 
 	return cbb->ops->debugfs_show(cbb, file, data);
 }
-
-static int tegra_cbb_err_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, tegra_cbb_err_show, inode->i_private);
-}
-
-static const struct file_operations tegra_cbb_err_fops = {
-	.open = tegra_cbb_err_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release
-};
+DEFINE_SHOW_ATTRIBUTE(tegra_cbb_err);
 
 static int tegra_cbb_err_debugfs_init(struct tegra_cbb *cbb)
 {
-- 
2.25.1

