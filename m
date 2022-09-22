Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C48E4C6FA86
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Sep 2022 13:41:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230125AbiIVNlm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 22 Sep 2022 09:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230058AbiIVNlh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 22 Sep 2022 09:41:37 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 542B3B5A67
        for <linux-tegra@vger.kernel.org>; Thu, 22 Sep 2022 06:41:36 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id hy2so17467506ejc.8
        for <linux-tegra@vger.kernel.org>; Thu, 22 Sep 2022 06:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=mLus40LTkinj3Uho6lSUX8es64btXlCWmS9F5rWzrmk=;
        b=DwqSfVgCHS6ss2m0tMUWPwEFYWL86kzFPM2cjW8u2ry8yJJkBUDvoRBV0V6TyHNqMI
         jHQTWm+GDG0B3Htu4W1emW7vsUnSDfVfxvXS7zVmx2CEmP4ojOkjbq8LBeU6Oi1zzXlx
         5PPjh5UY3m3mudeMRQZCRzye6fZrc8j0dhMsh6h/eTdRAkxO0tYkWE5kofAf45IX0og1
         jO+PAGcFhFTQYDwDx//z7+u20HshH8atbhZ4c/umVvZvGDM/XpgiKYamaH9m8zsU+rdN
         MSRlDu4djffObskM4lcVik2rInT5zzK5doCZMrY8ADtKIc1LYJWpt2tGJl3rGtyc/xS+
         W6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=mLus40LTkinj3Uho6lSUX8es64btXlCWmS9F5rWzrmk=;
        b=1sB5D3QtdWQx9wpjfRXOsJr0WMAp0jxv7/rxma3Hu0Jfluw4FL1AbIkP/s12Sq56d6
         eI7NOFjSSDCR5vjlOEZR0WIVdmeTfhH3KMMO1d5c42xbVZ0/7AdKx0n1ouvhnlpisDbV
         R3keH9UOrzGLnstfJ+xn+qQNc0xu+IxjBlu5jOE1NBefseFZr1QFKZuMFKw37SlvO/Ti
         AJ9a3n5luDgUa4whVqa2vLDCxgZkj2ERVWrDifvJkAuJgzQNRfZaBOGaCpuTxL6wmxZG
         KhFsVu2JdfkMTwZ63qvGqQk5LCOFM0Jl9SKR1P8V8ip2Qe1XuEjpAQmi15gW98m6G/2V
         o4mQ==
X-Gm-Message-State: ACrzQf2sEThlr9qmBNURF/BAwXoXgOx1rGmDKiasL/y7GjdSsbZhON5u
        IWGrWmWFCCS0J5Qvm5OZOQWS/5HtJ6g=
X-Google-Smtp-Source: AMsMyM6cjXanvvLsR/qvuJCjfco9HprFnUFSiqOqoMt03iLhYcPYMO9vtblQYX+Nn1FxtqpNGXcgfA==
X-Received: by 2002:a17:907:1614:b0:780:633d:c7a1 with SMTP id hb20-20020a170907161400b00780633dc7a1mr3012148ejc.708.1663854094728;
        Thu, 22 Sep 2022 06:41:34 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id g5-20020a170906538500b0073bdf71995dsm2695118ejo.139.2022.09.22.06.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 06:41:33 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Timo Alho <talho@nvidia.com>,
        Manish Bhardwaj <mbhardwaj@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] firmware: tegra: bpmp: Do not support big-endian
Date:   Thu, 22 Sep 2022 15:41:25 +0200
Message-Id: <20220922134125.844730-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922134125.844730-1-thierry.reding@gmail.com>
References: <20220922134125.844730-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The CPU and BPMP inter-processor communication code is only partially
endian-aware, so it doesn't work properly when run on a big-endian CPU
anyway. Running Tegra SoCs in big-endian mode has also never been
supported, especially not on those with 64-bit ARM processors.

If big-endian support ever becomes necessary this can be added back but
will need additional fixes for completeness.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/firmware/tegra/bpmp-debugfs.c | 42 ++++++++++++---------------
 drivers/firmware/tegra/bpmp.c         |  2 +-
 2 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-debugfs.c b/drivers/firmware/tegra/bpmp-debugfs.c
index 1a3b88d63f0c..4a14376af222 100644
--- a/drivers/firmware/tegra/bpmp-debugfs.c
+++ b/drivers/firmware/tegra/bpmp-debugfs.c
@@ -50,11 +50,7 @@ static int seqbuf_read(struct seqbuf *seqbuf, void *buf, size_t nbyte)
 
 static int seqbuf_read_u32(struct seqbuf *seqbuf, u32 *v)
 {
-	int err;
-
-	err = seqbuf_read(seqbuf, v, 4);
-	*v = le32_to_cpu(*v);
-	return err;
+	return seqbuf_read(seqbuf, v, 4);
 }
 
 static int seqbuf_read_str(struct seqbuf *seqbuf, const char **str)
@@ -112,7 +108,7 @@ static int mrq_debug_open(struct tegra_bpmp *bpmp, const char *name,
 			  u32 *fd, u32 *len, bool write)
 {
 	struct mrq_debug_request req = {
-		.cmd = cpu_to_le32(write ? CMD_DEBUG_OPEN_WO : CMD_DEBUG_OPEN_RO),
+		.cmd = write ? CMD_DEBUG_OPEN_WO : CMD_DEBUG_OPEN_RO,
 	};
 	struct mrq_debug_response resp;
 	struct tegra_bpmp_message msg = {
@@ -150,7 +146,7 @@ static int mrq_debug_open(struct tegra_bpmp *bpmp, const char *name,
 static int mrq_debug_close(struct tegra_bpmp *bpmp, u32 fd)
 {
 	struct mrq_debug_request req = {
-		.cmd = cpu_to_le32(CMD_DEBUG_CLOSE),
+		.cmd = CMD_DEBUG_CLOSE,
 		.frd = {
 			.fd = fd,
 		},
@@ -182,7 +178,7 @@ static int mrq_debug_read(struct tegra_bpmp *bpmp, const char *name,
 			  char *data, size_t sz_data, u32 *nbytes)
 {
 	struct mrq_debug_request req = {
-		.cmd = cpu_to_le32(CMD_DEBUG_READ),
+		.cmd = CMD_DEBUG_READ,
 	};
 	struct mrq_debug_response resp;
 	struct tegra_bpmp_message msg = {
@@ -245,7 +241,7 @@ static int mrq_debug_write(struct tegra_bpmp *bpmp, const char *name,
 			   uint8_t *data, size_t sz_data)
 {
 	struct mrq_debug_request req = {
-		.cmd = cpu_to_le32(CMD_DEBUG_WRITE)
+		.cmd = CMD_DEBUG_WRITE
 	};
 	struct mrq_debug_response resp;
 	struct tegra_bpmp_message msg = {
@@ -308,7 +304,7 @@ static int bpmp_debug_show(struct seq_file *m, void *p)
 	char fnamebuf[256];
 	const char *filename;
 	struct mrq_debug_request req = {
-		.cmd = cpu_to_le32(CMD_DEBUG_READ),
+		.cmd = CMD_DEBUG_READ,
 	};
 	struct mrq_debug_response resp;
 	struct tegra_bpmp_message msg = {
@@ -494,12 +490,12 @@ static int mrq_debugfs_read(struct tegra_bpmp *bpmp,
 			    size_t *nbytes)
 {
 	struct mrq_debugfs_request req = {
-		.cmd = cpu_to_le32(CMD_DEBUGFS_READ),
+		.cmd = CMD_DEBUGFS_READ,
 		.fop = {
-			.fnameaddr = cpu_to_le32((u32)name),
-			.fnamelen = cpu_to_le32((u32)sz_name),
-			.dataaddr = cpu_to_le32((u32)data),
-			.datalen = cpu_to_le32((u32)sz_data),
+			.fnameaddr = (u32)name,
+			.fnamelen = (u32)sz_name,
+			.dataaddr = (u32)data,
+			.datalen = (u32)sz_data,
 		},
 	};
 	struct mrq_debugfs_response resp;
@@ -532,12 +528,12 @@ static int mrq_debugfs_write(struct tegra_bpmp *bpmp,
 			     dma_addr_t data, size_t sz_data)
 {
 	const struct mrq_debugfs_request req = {
-		.cmd = cpu_to_le32(CMD_DEBUGFS_WRITE),
+		.cmd = CMD_DEBUGFS_WRITE,
 		.fop = {
-			.fnameaddr = cpu_to_le32((u32)name),
-			.fnamelen = cpu_to_le32((u32)sz_name),
-			.dataaddr = cpu_to_le32((u32)data),
-			.datalen = cpu_to_le32((u32)sz_data),
+			.fnameaddr = (u32)name,
+			.fnamelen = (u32)sz_name,
+			.dataaddr = (u32)data,
+			.datalen = (u32)sz_data,
 		},
 	};
 	struct tegra_bpmp_message msg = {
@@ -555,10 +551,10 @@ static int mrq_debugfs_dumpdir(struct tegra_bpmp *bpmp, dma_addr_t addr,
 			       size_t size, size_t *nbytes)
 {
 	const struct mrq_debugfs_request req = {
-		.cmd = cpu_to_le32(CMD_DEBUGFS_DUMPDIR),
+		.cmd = CMD_DEBUGFS_DUMPDIR,
 		.dumpdir = {
-			.dataaddr = cpu_to_le32((u32)addr),
-			.datalen = cpu_to_le32((u32)size),
+			.dataaddr = (u32)addr,
+			.datalen = (u32)size,
 		},
 	};
 	struct mrq_debugfs_response resp;
diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 3f652ce6e9fa..042c2043929d 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -502,7 +502,7 @@ EXPORT_SYMBOL_GPL(tegra_bpmp_free_mrq);
 
 bool tegra_bpmp_mrq_is_supported(struct tegra_bpmp *bpmp, unsigned int mrq)
 {
-	struct mrq_query_abi_request req = { .mrq = cpu_to_le32(mrq) };
+	struct mrq_query_abi_request req = { .mrq = mrq };
 	struct mrq_query_abi_response resp;
 	struct tegra_bpmp_message msg = {
 		.mrq = MRQ_QUERY_ABI,
-- 
2.37.3

