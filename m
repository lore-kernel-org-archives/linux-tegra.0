Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC81C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 27 Sep 2021 12:41:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2573F60F4F
	for <linux-tegra@archiver.kernel.org>; Mon, 27 Sep 2021 12:41:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234341AbhI0Mna (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 27 Sep 2021 08:43:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:60972 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234333AbhI0Mna (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 27 Sep 2021 08:43:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2D81460F44;
        Mon, 27 Sep 2021 12:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632746512;
        bh=R0uZCCbR8eugKDSRXJsiwJRDLaT74qqKVjyfueNrrJg=;
        h=From:To:Cc:Subject:Date:From;
        b=mKtVt6/uUi3tx0MQrAfiw7yFJDzh/OPVJB1FZGwYq4S1zhLTInSQwumcJl+1vf+9X
         Ask2Eyg4JE6nCxut/78+j4PWrJPadAwB44wcwVuiNGzdSDJz0i2mldi5iRwiF8LwLZ
         X8J3f6/zYPCipIfC2uXK1X5DeqldZ1xWXY4xILt43dYzgQos4R7WT6lsoLMmdtQYnB
         ZKkSYx5SWZL6ao2K9RDs6kxCqiuvmaKQq3LJGbSt20LcIq405tNwwfVYsdHXegpg80
         PzTPMK6s7uLINtXhF9yRBuweKFCrD0ubHp8of5rKkr2+wgQWrYqZ+x39fywvVT1caH
         3eRFqdJZvUFUA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] [RESEND] firmware: tegra: reduce stack usage
Date:   Mon, 27 Sep 2021 14:41:40 +0200
Message-Id: <20210927124148.1415359-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Building the bpmp-debugfs driver for Arm results in a warning for stack usage:

drivers/firmware/tegra/bpmp-debugfs.c:321:16: error: stack frame size of 1224 bytes in function 'bpmp_debug_store' [-Werror,-Wframe-larger-than=]
static ssize_t bpmp_debug_store(struct file *file, const char __user *buf,

It should be possible to rearrange the code to not require two separate
buffers for the file name, but the easiest workaround is to use dynamic
allocation.

Fixes: 5e37b9c137ee ("firmware: tegra: Add support for in-band debug")
Link: https://lore.kernel.org/all/20201204193714.3134651-1-arnd@kernel.org/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I sent this one in 2020 but got no reply. It still appears to be
required, please have a look.
---
 drivers/firmware/tegra/bpmp-debugfs.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-debugfs.c b/drivers/firmware/tegra/bpmp-debugfs.c
index 3e9fa4b54358..f6888cee83ee 100644
--- a/drivers/firmware/tegra/bpmp-debugfs.c
+++ b/drivers/firmware/tegra/bpmp-debugfs.c
@@ -74,28 +74,34 @@ static void seqbuf_seek(struct seqbuf *seqbuf, ssize_t offset)
 static const char *get_filename(struct tegra_bpmp *bpmp,
 				const struct file *file, char *buf, int size)
 {
-	char root_path_buf[512];
+	char *root_path_buf;
 	const char *root_path;
-	const char *filename;
+	const char *filename = NULL;
 	size_t root_len;
 
+	root_path_buf = kzalloc(512, GFP_KERNEL);
+	if (!root_path_buf)
+		goto out;
+
 	root_path = dentry_path(bpmp->debugfs_mirror, root_path_buf,
 				sizeof(root_path_buf));
 	if (IS_ERR(root_path))
-		return NULL;
+		goto out;
 
 	root_len = strlen(root_path);
 
 	filename = dentry_path(file->f_path.dentry, buf, size);
 	if (IS_ERR(filename))
-		return NULL;
+		goto out;
 
 	if (strlen(filename) < root_len ||
 			strncmp(filename, root_path, root_len))
-		return NULL;
+		goto out;
 
 	filename += root_len;
 
+out:
+	kfree(root_path_buf);
 	return filename;
 }
 
-- 
2.29.2

