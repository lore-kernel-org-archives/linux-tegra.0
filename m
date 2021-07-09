Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32E2AC07E9C
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 19:29:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0762E613B2
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 19:29:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbhGITc3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jul 2021 15:32:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbhGITc3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jul 2021 15:32:29 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4379DC0613DD
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jul 2021 12:29:44 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id a5-20020a7bc1c50000b02901e3bbe0939bso6979251wmj.0
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jul 2021 12:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Isvi3/x44UzMyQwAu2oXCJWsW3MfoQvAQpXOQZ41AUA=;
        b=uiV620pmGLtybo+gE7xDLFgFV34/JFByTec9u6HCLoPrAt0HWpTTsEISpQ9J0xaD2Q
         lYCSnURP8d0w9quFtH1RIH7Uwv9xjh+CGXvzUsPSB0RJqg3UpIw0qHRSSAfv9531oKrv
         2f3qUsjRIl60e7t0DUhdFyzKjQCYkgoGHhzUdnvTK+AUWQRu/kV9W4mZo34FH/c5kGEV
         ccVeQOJzDJXZxShkXkwVyPdK79oW9JIa+YqM/WnrMtIW/ntHWY51dk2aTdoj5zRXCA0D
         vXCxMB+MEh7BdngtVTN6ejR7t/PexZOei1nbwvQBttFhomOm10I+OweorRJu3lx1UAPE
         UmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Isvi3/x44UzMyQwAu2oXCJWsW3MfoQvAQpXOQZ41AUA=;
        b=Z5np/yM4pCnenn1MlEhPd4yS9dzGN87g/kC4nAwVXQ9Tel1B8qlpIbcR31H3mdmjgi
         dqbcgT/q4do/V8dnqce6lGtDl4zsMuEkOFrhYnY+LFsZ5igK5Ndo+DTbo5kH4GaJ2jVw
         RVMbJ37VdaqcXOy7n8ctgcVwBthu8nilhX9kwjq97IjsiZpX7dvEV0+5EeoRnXGDzAr3
         K/LC/VLq+0ma4uM/OxrvX7wdDazjTZjHv3a3lPjI2LqhFJ4rDxBDFu+ujaY35D//rmh4
         3CuemPMrzTrNORpsN/udmApXLyM9Po4UDuC7pfxd4vmm0zgmlRQjyrmad9NXnDqy13DQ
         cUnw==
X-Gm-Message-State: AOAM531I1iBckk61iqhk0rQiym5Vhh7B276AYRw5t1bYtJhunhPkKE4O
        pVpAO9BcPxsQ8dj/SUAgiyo=
X-Google-Smtp-Source: ABdhPJyXAYkiZEydo/FIWDVxRj8d46lfTsg0O8Mk5qP0lQx+6fPmMa/pK3ikpz8FbevTlJBev+a7AQ==
X-Received: by 2002:a05:600c:1c19:: with SMTP id j25mr544594wms.166.1625858982840;
        Fri, 09 Jul 2021 12:29:42 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id y23sm5739410wmi.28.2021.07.09.12.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 12:29:42 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v8 13/14] drm/tegra: Add job firewall
Date:   Fri,  9 Jul 2021 21:31:45 +0200
Message-Id: <20210709193146.2859516-14-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709193146.2859516-1-thierry.reding@gmail.com>
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

Add a firewall that validates jobs before submission to ensure
they don't do anything they aren't allowed to do, like accessing
memory they should not access.

The firewall is functionality-wise a copy of the firewall already
implemented in gpu/host1x. It is copied here as it makes more
sense for it to live on the DRM side, as it is only needed for
userspace job submissions, and generally the data it needs to
do its job is easier to access here.

In the future, the other implementation will be removed.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/Makefile   |   1 +
 drivers/gpu/drm/tegra/firewall.c | 254 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/tegra/submit.c   |  10 +-
 drivers/gpu/drm/tegra/submit.h   |   4 +
 4 files changed, 267 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/tegra/firewall.c

diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makefile
index ab4289d1c991..5d2039f0c734 100644
--- a/drivers/gpu/drm/tegra/Makefile
+++ b/drivers/gpu/drm/tegra/Makefile
@@ -6,6 +6,7 @@ tegra-drm-y := \
 	uapi.o \
 	submit.o \
 	gather_bo.o \
+	firewall.o \
 	gem.o \
 	fb.o \
 	dp.o \
diff --git a/drivers/gpu/drm/tegra/firewall.c b/drivers/gpu/drm/tegra/firewall.c
new file mode 100644
index 000000000000..1824d2db0e2c
--- /dev/null
+++ b/drivers/gpu/drm/tegra/firewall.c
@@ -0,0 +1,254 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2010-2020 NVIDIA Corporation */
+
+#include "drm.h"
+#include "submit.h"
+#include "uapi.h"
+
+struct tegra_drm_firewall {
+	struct tegra_drm_submit_data *submit;
+	struct tegra_drm_client *client;
+	u32 *data;
+	u32 pos;
+	u32 end;
+	u32 class;
+};
+
+static int fw_next(struct tegra_drm_firewall *fw, u32 *word)
+{
+	if (fw->pos == fw->end)
+		return -EINVAL;
+
+	*word = fw->data[fw->pos++];
+
+	return 0;
+}
+
+static bool fw_check_addr_valid(struct tegra_drm_firewall *fw, u32 offset)
+{
+	u32 i;
+
+	for (i = 0; i < fw->submit->num_used_mappings; i++) {
+		struct tegra_drm_mapping *m = fw->submit->used_mappings[i].mapping;
+
+		if (offset >= m->iova && offset <= m->iova_end)
+			return true;
+	}
+
+	return false;
+}
+
+static int fw_check_reg(struct tegra_drm_firewall *fw, u32 offset)
+{
+	bool is_addr;
+	u32 word;
+	int err;
+
+	err = fw_next(fw, &word);
+	if (err)
+		return err;
+
+	if (!fw->client->ops->is_addr_reg)
+		return 0;
+
+	is_addr = fw->client->ops->is_addr_reg(fw->client->base.dev, fw->class,
+					       offset);
+
+	if (!is_addr)
+		return 0;
+
+	if (!fw_check_addr_valid(fw, word))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int fw_check_regs_seq(struct tegra_drm_firewall *fw, u32 offset,
+			     u32 count, bool incr)
+{
+	u32 i;
+
+	for (i = 0; i < count; i++) {
+		if (fw_check_reg(fw, offset))
+			return -EINVAL;
+
+		if (incr)
+			offset++;
+	}
+
+	return 0;
+}
+
+static int fw_check_regs_mask(struct tegra_drm_firewall *fw, u32 offset,
+			      u16 mask)
+{
+	unsigned long bmask = mask;
+	unsigned int bit;
+
+	for_each_set_bit(bit, &bmask, 16) {
+		if (fw_check_reg(fw, offset+bit))
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int fw_check_regs_imm(struct tegra_drm_firewall *fw, u32 offset)
+{
+	bool is_addr;
+
+	is_addr = fw->client->ops->is_addr_reg(fw->client->base.dev, fw->class,
+					       offset);
+	if (is_addr)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int fw_check_class(struct tegra_drm_firewall *fw, u32 class)
+{
+	if (!fw->client->ops->is_valid_class) {
+		if (class == fw->client->base.class)
+			return 0;
+		else
+			return -EINVAL;
+	}
+
+	if (!fw->client->ops->is_valid_class(class))
+		return -EINVAL;
+
+	return 0;
+}
+
+enum {
+	HOST1X_OPCODE_SETCLASS  = 0x00,
+	HOST1X_OPCODE_INCR      = 0x01,
+	HOST1X_OPCODE_NONINCR   = 0x02,
+	HOST1X_OPCODE_MASK      = 0x03,
+	HOST1X_OPCODE_IMM       = 0x04,
+	HOST1X_OPCODE_RESTART   = 0x05,
+	HOST1X_OPCODE_GATHER    = 0x06,
+	HOST1X_OPCODE_SETSTRMID = 0x07,
+	HOST1X_OPCODE_SETAPPID  = 0x08,
+	HOST1X_OPCODE_SETPYLD   = 0x09,
+	HOST1X_OPCODE_INCR_W    = 0x0a,
+	HOST1X_OPCODE_NONINCR_W = 0x0b,
+	HOST1X_OPCODE_GATHER_W  = 0x0c,
+	HOST1X_OPCODE_RESTART_W = 0x0d,
+	HOST1X_OPCODE_EXTEND    = 0x0e,
+};
+
+int tegra_drm_fw_validate(struct tegra_drm_client *client, u32 *data, u32 start,
+			  u32 words, struct tegra_drm_submit_data *submit,
+			  u32 *job_class)
+{
+	struct tegra_drm_firewall fw = {
+		.submit = submit,
+		.client = client,
+		.data = data,
+		.pos = start,
+		.end = start+words,
+		.class = *job_class,
+	};
+	bool payload_valid = false;
+	u32 payload;
+	int err;
+
+	while (fw.pos != fw.end) {
+		u32 word, opcode, offset, count, mask, class;
+
+		err = fw_next(&fw, &word);
+		if (err)
+			return err;
+
+		opcode = (word & 0xf0000000) >> 28;
+
+		switch (opcode) {
+		case HOST1X_OPCODE_SETCLASS:
+			offset = word >> 16 & 0xfff;
+			mask = word & 0x3f;
+			class = (word >> 6) & 0x3ff;
+			err = fw_check_class(&fw, class);
+			fw.class = class;
+			*job_class = class;
+			if (!err)
+				err = fw_check_regs_mask(&fw, offset, mask);
+			if (err)
+				dev_warn(client->base.dev,
+					 "illegal SETCLASS(offset=0x%x, mask=0x%x, class=0x%x) at word %u",
+					 offset, mask, class, fw.pos-1);
+			break;
+		case HOST1X_OPCODE_INCR:
+			offset = (word >> 16) & 0xfff;
+			count = word & 0xffff;
+			err = fw_check_regs_seq(&fw, offset, count, true);
+			if (err)
+				dev_warn(client->base.dev,
+					 "illegal INCR(offset=0x%x, count=%u) in class 0x%x at word %u",
+					 offset, count, fw.class, fw.pos-1);
+			break;
+		case HOST1X_OPCODE_NONINCR:
+			offset = (word >> 16) & 0xfff;
+			count = word & 0xffff;
+			err = fw_check_regs_seq(&fw, offset, count, false);
+			if (err)
+				dev_warn(client->base.dev,
+					 "illegal NONINCR(offset=0x%x, count=%u) in class 0x%x at word %u",
+					 offset, count, fw.class, fw.pos-1);
+			break;
+		case HOST1X_OPCODE_MASK:
+			offset = (word >> 16) & 0xfff;
+			mask = word & 0xffff;
+			err = fw_check_regs_mask(&fw, offset, mask);
+			if (err)
+				dev_warn(client->base.dev,
+					 "illegal MASK(offset=0x%x, mask=0x%x) in class 0x%x at word %u",
+					 offset, mask, fw.class, fw.pos-1);
+			break;
+		case HOST1X_OPCODE_IMM:
+			/* IMM cannot reasonably be used to write a pointer */
+			offset = (word >> 16) & 0xfff;
+			err = fw_check_regs_imm(&fw, offset);
+			if (err)
+				dev_warn(client->base.dev,
+					 "illegal IMM(offset=0x%x) in class 0x%x at word %u",
+					 offset, fw.class, fw.pos-1);
+			break;
+		case HOST1X_OPCODE_SETPYLD:
+			payload = word & 0xffff;
+			payload_valid = true;
+			break;
+		case HOST1X_OPCODE_INCR_W:
+			if (!payload_valid)
+				return -EINVAL;
+
+			offset = word & 0x3fffff;
+			err = fw_check_regs_seq(&fw, offset, payload, true);
+			if (err)
+				dev_warn(client->base.dev,
+					 "illegal INCR_W(offset=0x%x) in class 0x%x at word %u",
+					 offset, fw.class, fw.pos-1);
+			break;
+		case HOST1X_OPCODE_NONINCR_W:
+			if (!payload_valid)
+				return -EINVAL;
+
+			offset = word & 0x3fffff;
+			err = fw_check_regs_seq(&fw, offset, payload, false);
+			if (err)
+				dev_warn(client->base.dev,
+					 "illegal NONINCR(offset=0x%x) in class 0x%x at word %u",
+					 offset, fw.class, fw.pos-1);
+			break;
+		default:
+			dev_warn(client->base.dev, "illegal opcode at word %u",
+				 fw.pos-1);
+			return -EINVAL;
+		}
+
+		if (err)
+			return err;
+	}
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
index 0225706e3163..c53b7207c478 100644
--- a/drivers/gpu/drm/tegra/submit.c
+++ b/drivers/gpu/drm/tegra/submit.c
@@ -233,7 +233,7 @@ static int submit_get_syncpt(struct tegra_drm_context *context, struct host1x_jo
 static int submit_job_add_gather(struct host1x_job *job, struct tegra_drm_context *context,
 				 struct drm_tegra_submit_cmd_gather_uptr *cmd,
 				 struct gather_bo *bo, u32 *offset,
-				 struct tegra_drm_submit_data *job_data)
+				 struct tegra_drm_submit_data *job_data, u32 *class)
 {
 	u32 next_offset;
 
@@ -258,6 +258,12 @@ static int submit_job_add_gather(struct host1x_job *job, struct tegra_drm_contex
 		return -EINVAL;
 	}
 
+	if (tegra_drm_fw_validate(context->client, bo->gather_data, *offset,
+				  cmd->words, job_data, class)) {
+		SUBMIT_ERR(context, "job was rejected by firewall");
+		return -EINVAL;
+	}
+
 	host1x_job_add_gather(job, &bo->base, cmd->words, *offset * 4);
 
 	*offset = next_offset;
@@ -311,7 +317,7 @@ submit_create_job(struct tegra_drm_context *context, struct gather_bo *bo,
 
 		if (cmd->type == DRM_TEGRA_SUBMIT_CMD_GATHER_UPTR) {
 			err = submit_job_add_gather(job, context, &cmd->gather_uptr, bo,
-						    &gather_offset, job_data);
+						    &gather_offset, job_data, &class);
 			if (err)
 				goto free_job;
 		} else if (cmd->type == DRM_TEGRA_SUBMIT_CMD_WAIT_SYNCPT) {
diff --git a/drivers/gpu/drm/tegra/submit.h b/drivers/gpu/drm/tegra/submit.h
index 0a165e9e4bda..cf6a2f0a29fc 100644
--- a/drivers/gpu/drm/tegra/submit.h
+++ b/drivers/gpu/drm/tegra/submit.h
@@ -14,4 +14,8 @@ struct tegra_drm_submit_data {
 	u32 num_used_mappings;
 };
 
+int tegra_drm_fw_validate(struct tegra_drm_client *client, u32 *data, u32 start,
+			  u32 words, struct tegra_drm_submit_data *submit,
+			  u32 *job_class);
+
 #endif
-- 
2.32.0

