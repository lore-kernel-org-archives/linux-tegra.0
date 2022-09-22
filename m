Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1468FC6FA94
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Sep 2022 13:41:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbiIVNle (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 22 Sep 2022 09:41:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbiIVNlc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 22 Sep 2022 09:41:32 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD91AB5A67
        for <linux-tegra@vger.kernel.org>; Thu, 22 Sep 2022 06:41:31 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id dv25so21047972ejb.12
        for <linux-tegra@vger.kernel.org>; Thu, 22 Sep 2022 06:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=kkiFbabhnWDjXlR3Ra/6lg/maAZN2Inc6pz2K1Um9MU=;
        b=FVWRd0B7/vaeL2XkYzeUmFIUdr29k78og9jUYk6PkQUXlagEzDMvVayQGup2uzuTwB
         AjFsoMeg6Q6nUzs7dA0tgXqedH/FBGmy6LtM3wgqJkTVqQuwYjUwC/d35N4TO9q2/eUF
         Hbfs9In8CnL9FCLVxGvf0O2Oo7+/IayfYO5X7Ip1sHUdJ2GVtBBYmXr9ljmAP1Xfigtu
         VA62s5boCBJMN0SRYFmlV1t0plIiEayQhV+Olx09G4KXM7HjntnlpRPaXw0JP14aaWEF
         TOcHbxMM9rUR9CWFSvsaRuxNACrYdYREhsI3KxWt70zO4pZnk83k5P7IFUs7r+WxltHt
         SI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=kkiFbabhnWDjXlR3Ra/6lg/maAZN2Inc6pz2K1Um9MU=;
        b=q6N8snOTbvYBSo/3p0/Ya7iypKinFexjlw7Mmkz0BVY19Hlhk7BKj7H7sz2vyDPkiT
         lYQoUu/bKv6U4lZQ+JN9/C7aW+NxJPhB+UtXaoZ59Ouy+qvjD5qNcnp0RGmY1W68nxgo
         RzRldvtXiG5aq+xFz5GXBoW93HxhEDBcU68jjfIb/Ap5eI9X8Fw4Jf/OaAXEAhJ1kosF
         0DZyhebdsZHqwV7YhvnVmLryZ4WppGGc9qLH/HTcHwKj36XtbFEv7PTKt2nH0GQWVfvC
         R0zz7LH5PTkd1nkwMouzddhXuAeR0lmIe1ijDNMghHERkhKcPfQ8wPnGMNFOgE2B/DGJ
         cKTg==
X-Gm-Message-State: ACrzQf3oq3qgVLuB6xU5fyZRbAQUfPB+FcWRxdTM7NRWhH6dBK/fvAJ2
        Lh+mxXCrCFUC51r3G6YmZnM=
X-Google-Smtp-Source: AMsMyM6/zZCqca17h6YzGU50AXWPKI76tb+YgCcReXZFqD84FKdTdslyl5zvwC4us8O815g8/uE92w==
X-Received: by 2002:a17:907:9807:b0:781:feee:f87c with SMTP id ji7-20020a170907980700b00781feeef87cmr2903689ejc.101.1663854089983;
        Thu, 22 Sep 2022 06:41:29 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id l10-20020a1709063d2a00b0073c10031dc9sm2596020ejf.80.2022.09.22.06.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 06:41:28 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Timo Alho <talho@nvidia.com>,
        Manish Bhardwaj <mbhardwaj@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] firmware: tegra: bpmp: Prefer u32 over uint32_t
Date:   Thu, 22 Sep 2022 15:41:23 +0200
Message-Id: <20220922134125.844730-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The canonical type for 32-bit unsigned integers in the kernel is u32, so
use that instead of uint32_t.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/firmware/tegra/bpmp-debugfs.c | 40 +++++++++++++--------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-debugfs.c b/drivers/firmware/tegra/bpmp-debugfs.c
index 0c440afd5224..1a3b88d63f0c 100644
--- a/drivers/firmware/tegra/bpmp-debugfs.c
+++ b/drivers/firmware/tegra/bpmp-debugfs.c
@@ -48,7 +48,7 @@ static int seqbuf_read(struct seqbuf *seqbuf, void *buf, size_t nbyte)
 	return seqbuf_status(seqbuf);
 }
 
-static int seqbuf_read_u32(struct seqbuf *seqbuf, uint32_t *v)
+static int seqbuf_read_u32(struct seqbuf *seqbuf, u32 *v)
 {
 	int err;
 
@@ -109,7 +109,7 @@ static const char *get_filename(struct tegra_bpmp *bpmp,
 }
 
 static int mrq_debug_open(struct tegra_bpmp *bpmp, const char *name,
-			  uint32_t *fd, uint32_t *len, bool write)
+			  u32 *fd, u32 *len, bool write)
 {
 	struct mrq_debug_request req = {
 		.cmd = cpu_to_le32(write ? CMD_DEBUG_OPEN_WO : CMD_DEBUG_OPEN_RO),
@@ -147,7 +147,7 @@ static int mrq_debug_open(struct tegra_bpmp *bpmp, const char *name,
 	return 0;
 }
 
-static int mrq_debug_close(struct tegra_bpmp *bpmp, uint32_t fd)
+static int mrq_debug_close(struct tegra_bpmp *bpmp, u32 fd)
 {
 	struct mrq_debug_request req = {
 		.cmd = cpu_to_le32(CMD_DEBUG_CLOSE),
@@ -179,7 +179,7 @@ static int mrq_debug_close(struct tegra_bpmp *bpmp, uint32_t fd)
 }
 
 static int mrq_debug_read(struct tegra_bpmp *bpmp, const char *name,
-			  char *data, size_t sz_data, uint32_t *nbytes)
+			  char *data, size_t sz_data, u32 *nbytes)
 {
 	struct mrq_debug_request req = {
 		.cmd = cpu_to_le32(CMD_DEBUG_READ),
@@ -196,7 +196,7 @@ static int mrq_debug_read(struct tegra_bpmp *bpmp, const char *name,
 			.size = sizeof(resp),
 		},
 	};
-	uint32_t fd = 0, len = 0;
+	u32 fd = 0, len = 0;
 	int remaining, err;
 
 	mutex_lock(&bpmp_debug_lock);
@@ -259,7 +259,7 @@ static int mrq_debug_write(struct tegra_bpmp *bpmp, const char *name,
 			.size = sizeof(resp),
 		},
 	};
-	uint32_t fd = 0, len = 0;
+	u32 fd = 0, len = 0;
 	size_t remaining;
 	int err;
 
@@ -322,7 +322,7 @@ static int bpmp_debug_show(struct seq_file *m, void *p)
 			.size = sizeof(resp),
 		},
 	};
-	uint32_t fd = 0, len = 0;
+	u32 fd = 0, len = 0;
 	int remaining, err;
 
 	filename = get_filename(bpmp, file, fnamebuf, sizeof(fnamebuf));
@@ -413,8 +413,8 @@ static int bpmp_populate_debugfs_inband(struct tegra_bpmp *bpmp,
 {
 	const size_t pathlen = SZ_256;
 	const size_t bufsize = SZ_16K;
-	uint32_t dsize, attrs = 0;
 	struct dentry *dentry;
+	u32 dsize, attrs = 0;
 	struct seqbuf seqbuf;
 	char *buf, *pathbuf;
 	const char *name;
@@ -496,10 +496,10 @@ static int mrq_debugfs_read(struct tegra_bpmp *bpmp,
 	struct mrq_debugfs_request req = {
 		.cmd = cpu_to_le32(CMD_DEBUGFS_READ),
 		.fop = {
-			.fnameaddr = cpu_to_le32((uint32_t)name),
-			.fnamelen = cpu_to_le32((uint32_t)sz_name),
-			.dataaddr = cpu_to_le32((uint32_t)data),
-			.datalen = cpu_to_le32((uint32_t)sz_data),
+			.fnameaddr = cpu_to_le32((u32)name),
+			.fnamelen = cpu_to_le32((u32)sz_name),
+			.dataaddr = cpu_to_le32((u32)data),
+			.datalen = cpu_to_le32((u32)sz_data),
 		},
 	};
 	struct mrq_debugfs_response resp;
@@ -534,10 +534,10 @@ static int mrq_debugfs_write(struct tegra_bpmp *bpmp,
 	const struct mrq_debugfs_request req = {
 		.cmd = cpu_to_le32(CMD_DEBUGFS_WRITE),
 		.fop = {
-			.fnameaddr = cpu_to_le32((uint32_t)name),
-			.fnamelen = cpu_to_le32((uint32_t)sz_name),
-			.dataaddr = cpu_to_le32((uint32_t)data),
-			.datalen = cpu_to_le32((uint32_t)sz_data),
+			.fnameaddr = cpu_to_le32((u32)name),
+			.fnamelen = cpu_to_le32((u32)sz_name),
+			.dataaddr = cpu_to_le32((u32)data),
+			.datalen = cpu_to_le32((u32)sz_data),
 		},
 	};
 	struct tegra_bpmp_message msg = {
@@ -557,8 +557,8 @@ static int mrq_debugfs_dumpdir(struct tegra_bpmp *bpmp, dma_addr_t addr,
 	const struct mrq_debugfs_request req = {
 		.cmd = cpu_to_le32(CMD_DEBUGFS_DUMPDIR),
 		.dumpdir = {
-			.dataaddr = cpu_to_le32((uint32_t)addr),
-			.datalen = cpu_to_le32((uint32_t)size),
+			.dataaddr = cpu_to_le32((u32)addr),
+			.datalen = cpu_to_le32((u32)size),
 		},
 	};
 	struct mrq_debugfs_response resp;
@@ -695,10 +695,10 @@ static const struct file_operations debugfs_fops = {
 };
 
 static int bpmp_populate_dir(struct tegra_bpmp *bpmp, struct seqbuf *seqbuf,
-			     struct dentry *parent, uint32_t depth)
+			     struct dentry *parent, u32 depth)
 {
 	int err;
-	uint32_t d, t;
+	u32 d, t;
 	const char *name;
 	struct dentry *dentry;
 
-- 
2.37.3

