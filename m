Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68AAC432BE
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Aug 2021 15:55:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 872D860F35
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Aug 2021 15:55:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242633AbhHJPzh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 10 Aug 2021 11:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242563AbhHJPzg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Aug 2021 11:55:36 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A00EDC0613C1;
        Tue, 10 Aug 2021 08:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=2mp+fhmrxTKK78q3PfQ3USMLfLfKsq+0eOarN5I74/8=; b=nXyWLbWSA3Cov+BOZYkeIY4/2n
        ZcDr3xqLJM5nJTNc/X2phuJV5tRwcZ03KnbLKm/LcjZHEdbXdVRx4dSM0G6s10JmwartXRjZoW5td
        hRSMwUBUYuDLEKA/WTXBojIZflH6T98IuNmtX7iMJ8kfg66Qdibj+Rqy1hxH9Zq2V0jY5DCtw5qHK
        EctdN8mETAa7hlWmcyMNpqrY7GFsFwr01MPrWAtdflmCTVNkdSVluyAWiaHtpd99v+vADTMoe32do
        U/xcZBmGgE9ejLFi54TfSY/SK6wP+h5QuzdVpFlmr3v+sHWCoQxcu0nPVg3hdcDxrhqSN7dqdPLQv
        xkKT9l5g==;
Received: from 089144200071.atnat0009.highway.a1.net ([89.144.200.71] helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mDU5Q-00CJ3Q-I5; Tue, 10 Aug 2021 15:54:49 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: tegra: stop using seq_get_buf
Date:   Tue, 10 Aug 2021 17:54:39 +0200
Message-Id: <20210810155439.1813109-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Opencode a copy of mrq_debug_read in bpmp_debug_show so that it
can use seq_write directly instead of poking holes into the seq_file
abstractions using seq_get_buf.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/firmware/tegra/bpmp-debugfs.c | 58 ++++++++++++++++++++++-----
 1 file changed, 47 insertions(+), 11 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-debugfs.c b/drivers/firmware/tegra/bpmp-debugfs.c
index 440d99c63638..3e9fa4b54358 100644
--- a/drivers/firmware/tegra/bpmp-debugfs.c
+++ b/drivers/firmware/tegra/bpmp-debugfs.c
@@ -296,25 +296,61 @@ static int bpmp_debug_show(struct seq_file *m, void *p)
 	struct file *file = m->private;
 	struct inode *inode = file_inode(file);
 	struct tegra_bpmp *bpmp = inode->i_private;
-	char *databuf = NULL;
 	char fnamebuf[256];
 	const char *filename;
-	uint32_t nbytes = 0;
-	size_t len;
-	int err;
-
-	len = seq_get_buf(m, &databuf);
-	if (!databuf)
-		return -ENOMEM;
+	struct mrq_debug_request req = {
+		.cmd = cpu_to_le32(CMD_DEBUG_READ),
+	};
+	struct mrq_debug_response resp;
+	struct tegra_bpmp_message msg = {
+		.mrq = MRQ_DEBUG,
+		.tx = {
+			.data = &req,
+			.size = sizeof(req),
+		},
+		.rx = {
+			.data = &resp,
+			.size = sizeof(resp),
+		},
+	};
+	uint32_t fd = 0, len = 0;
+	int remaining, err;
 
 	filename = get_filename(bpmp, file, fnamebuf, sizeof(fnamebuf));
 	if (!filename)
 		return -ENOENT;
 
-	err = mrq_debug_read(bpmp, filename, databuf, len, &nbytes);
-	if (!err)
-		seq_commit(m, nbytes);
+	mutex_lock(&bpmp_debug_lock);
+	err = mrq_debug_open(bpmp, filename, &fd, &len, 0);
+	if (err)
+		goto out;
+
+	req.frd.fd = fd;
+	remaining = len;
+
+	while (remaining > 0) {
+		err = tegra_bpmp_transfer(bpmp, &msg);
+		if (err < 0) {
+			goto close;
+		} else if (msg.rx.ret < 0) {
+			err = -EINVAL;
+			goto close;
+		}
 
+		if (resp.frd.readlen > remaining) {
+			pr_err("%s: read data length invalid\n", __func__);
+			err = -EINVAL;
+			goto close;
+		}
+
+		seq_write(m, resp.frd.data, resp.frd.readlen);
+		remaining -= resp.frd.readlen;
+	}
+
+close:
+	err = mrq_debug_close(bpmp, fd);
+out:
+	mutex_unlock(&bpmp_debug_lock);
 	return err;
 }
 
-- 
2.30.2

