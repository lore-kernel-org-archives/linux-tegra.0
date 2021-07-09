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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49E84C07E9C
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 19:29:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34C5B613C5
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 19:29:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbhGITcP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jul 2021 15:32:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbhGITcO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jul 2021 15:32:14 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99E97C0613DD
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jul 2021 12:29:30 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id i94so13552904wri.4
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jul 2021 12:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t/PPBeundHHV5YTZRwwjwy8TkUTmGmzjIPGpViip3II=;
        b=pqelCgeXolsAnxuHmLV3Ct1tvYPFaB4LJOy08eu2LIO50Rlo1R7XtQ/RAfRB5qzEhA
         NyVr36XsiX4JEreMf6Ud8BUSWPnKUb4JMQnoZnuPNV1RocIEdMTlivkzRBoyoFILjsji
         t36FTGeghKAiKd5AfJsEnRiU/GuhdJjH0X3LbGzpWTCu/79nAPoq2zC0jIMXQDkqLWhV
         QFajYZ40adUkD0KyfKrOwADHd0+KZFbf9P2pFArgfK12oDjR9Ys1yFx5HiT6YGcVQN3G
         q+OrjhAQfK+MvLfDMflebtgocSQTrvsEtF8dzDToZ2CMAs8hKDbBB4wA3npLco/Eji9E
         Z3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t/PPBeundHHV5YTZRwwjwy8TkUTmGmzjIPGpViip3II=;
        b=aFTWnorKWW9U1TobGhmA0Q6o5HTawcjYSak15jSxaZp3j/1R5tH8tgAaESDVa9i4XI
         2LXz65G5AJpZFYrCe6JaXpfskM4uulS4U5uoKv2wzKeXXfM6OUt1govUfHEf1Kn0YW4v
         o3Be/JTt/JPwazolnfikQ+EN913XOOtl66m0yBn6iYQgAbgoQcsox316/lnCW1wVTeCL
         QSlFReyae6tqY6P0WYg5oPy+mk92+TmsvcJqD3U7RESDPgf0LHnrl/PIKry1AQROImGk
         JxFFO0gQdTRaK90lmISH1BrSgTcJKH6xKh9r/kpOtS0TN4FAqlHmu5o7a9Xh0n9GQsXq
         gK0Q==
X-Gm-Message-State: AOAM533imeeAKPwwV5YPiHn33qocVLQQXEH+7NXF09FY3CThrDsjyi7g
        Ly+v+qsPP1MkOC88Pz+2bGk=
X-Google-Smtp-Source: ABdhPJxGLU+b4+22T+GiDmeH6f5tdlfWvnNAU6bBt9+dvM17X93TRCmjTMT9zcq1yruAWPjocE86fA==
X-Received: by 2002:a5d:634e:: with SMTP id b14mr42593504wrw.96.1625858969210;
        Fri, 09 Jul 2021 12:29:29 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id n5sm5988765wri.31.2021.07.09.12.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 12:29:28 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v8 06/14] drm/tegra: Add new UAPI to header
Date:   Fri,  9 Jul 2021 21:31:38 +0200
Message-Id: <20210709193146.2859516-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709193146.2859516-1-thierry.reding@gmail.com>
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

Update the tegra_drm.h UAPI header, adding the new proposed UAPI.
The old staging UAPI is left in for now, with minor modification
to avoid name collisions.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v8:
- renamed hardware_flags to capabilities (flags sounds like they can be
  user-specified)
- renamed hardware_version to just version
- consistently use "context" to refer to channels contexts
- allow channel mappings to be read-only or write-only (or neither)
- consistently use "mapping" (instead of "mapping_id")
- rename BLOCKLINEAR relocation flag to SECTOR_LAYOUT for a more
  accurate description of what it does
- cleanup submission syncpoint structure:
  - drop _incr suffix for conciseness
  - rename fence_value to just value
  - rename num_incrs to increments
- rename syncpoint threshold to value for consistency
- add padding to make all structures 64-bit aligned

 include/uapi/drm/tegra_drm.h | 425 +++++++++++++++++++++++++++++++++--
 1 file changed, 402 insertions(+), 23 deletions(-)

diff --git a/include/uapi/drm/tegra_drm.h b/include/uapi/drm/tegra_drm.h
index c4df3c3668b3..94cfc306d50a 100644
--- a/include/uapi/drm/tegra_drm.h
+++ b/include/uapi/drm/tegra_drm.h
@@ -1,24 +1,5 @@
-/*
- * Copyright (c) 2012-2013, NVIDIA CORPORATION.  All rights reserved.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- */
+/* SPDX-License-Identifier: MIT */
+/* Copyright (c) 2012-2020 NVIDIA Corporation */
 
 #ifndef _UAPI_TEGRA_DRM_H_
 #define _UAPI_TEGRA_DRM_H_
@@ -29,6 +10,8 @@
 extern "C" {
 #endif
 
+/* Tegra DRM legacy UAPI. Only enabled with STAGING */
+
 #define DRM_TEGRA_GEM_CREATE_TILED     (1 << 0)
 #define DRM_TEGRA_GEM_CREATE_BOTTOM_UP (1 << 1)
 
@@ -649,8 +632,8 @@ struct drm_tegra_gem_get_flags {
 #define DRM_TEGRA_SYNCPT_READ		0x02
 #define DRM_TEGRA_SYNCPT_INCR		0x03
 #define DRM_TEGRA_SYNCPT_WAIT		0x04
-#define DRM_TEGRA_OPEN_CHANNEL		0x05
-#define DRM_TEGRA_CLOSE_CHANNEL		0x06
+#define DRM_TEGRA_OPEN_CHANNEL	        0x05
+#define DRM_TEGRA_CLOSE_CHANNEL	        0x06
 #define DRM_TEGRA_GET_SYNCPT		0x07
 #define DRM_TEGRA_SUBMIT		0x08
 #define DRM_TEGRA_GET_SYNCPT_BASE	0x09
@@ -674,6 +657,402 @@ struct drm_tegra_gem_get_flags {
 #define DRM_IOCTL_TEGRA_GEM_SET_FLAGS DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_GEM_SET_FLAGS, struct drm_tegra_gem_set_flags)
 #define DRM_IOCTL_TEGRA_GEM_GET_FLAGS DRM_IOWR(DRM_COMMAND_BASE + DRM_TEGRA_GEM_GET_FLAGS, struct drm_tegra_gem_get_flags)
 
+/* New Tegra DRM UAPI */
+
+/*
+ * Reported by the driver in the `capabilities` field.
+ *
+ * DRM_TEGRA_CHANNEL_CAP_CACHE_COHERENT: If set, the engine is cache coherent
+ * with regard to the system memory.
+ */
+#define DRM_TEGRA_CHANNEL_CAP_CACHE_COHERENT (1 << 0)
+
+struct drm_tegra_channel_open {
+	/**
+	 * @host1x_class: [in]
+	 *
+	 * Host1x class of the engine that will be programmed using this
+	 * channel.
+	 */
+	__u32 host1x_class;
+
+	/**
+	 * @flags: [in]
+	 *
+	 * Flags.
+	 */
+	__u32 flags;
+
+	/**
+	 * @context: [out]
+	 *
+	 * Opaque identifier corresponding to the opened channel.
+	 */
+	__u32 context;
+
+	/**
+	 * @version: [out]
+	 *
+	 * Version of the engine hardware. This can be used by userspace
+	 * to determine how the engine needs to be programmed.
+	 */
+	__u32 version;
+
+	/**
+	 * @capabilities: [out]
+	 *
+	 * Flags describing the hardware capabilities.
+	 */
+	__u32 capabilities;
+	__u32 padding;
+};
+
+struct drm_tegra_channel_close {
+	/**
+	 * @context: [in]
+	 *
+	 * Identifier of the channel to close.
+	 */
+	__u32 context;
+	__u32 padding;
+};
+
+/*
+ * Mapping flags that can be used to influence how the mapping is created.
+ *
+ * DRM_TEGRA_CHANNEL_MAP_READ: create mapping that allows HW read access
+ * DRM_TEGRA_CHANNEL_MAP_WRITE: create mapping that allows HW write access
+ */
+#define DRM_TEGRA_CHANNEL_MAP_READ  (1 << 0)
+#define DRM_TEGRA_CHANNEL_MAP_WRITE (1 << 1)
+#define DRM_TEGRA_CHANNEL_MAP_READ_WRITE (DRM_TEGRA_CHANNEL_MAP_READ | \
+					  DRM_TEGRA_CHANNEL_MAP_WRITE)
+
+struct drm_tegra_channel_map {
+	/**
+	 * @context: [in]
+	 *
+	 * Identifier of the channel to which make memory available for.
+	 */
+	__u32 context;
+
+	/**
+	 * @handle: [in]
+	 *
+	 * GEM handle of the memory to map.
+	 */
+	__u32 handle;
+
+	/**
+	 * @flags: [in]
+	 *
+	 * Flags.
+	 */
+	__u32 flags;
+
+	/**
+	 * @mapping: [out]
+	 *
+	 * Identifier corresponding to the mapping, to be used for
+	 * relocations or unmapping later.
+	 */
+	__u32 mapping;
+};
+
+struct drm_tegra_channel_unmap {
+	/**
+	 * @context: [in]
+	 *
+	 * Channel identifier of the channel to unmap memory from.
+	 */
+	__u32 context;
+
+	/**
+	 * @mapping: [in]
+	 *
+	 * Mapping identifier of the memory mapping to unmap.
+	 */
+	__u32 mapping;
+};
+
+/* Submission */
+
+/**
+ * Specify that bit 39 of the patched-in address should be set to switch
+ * swizzling between Tegra and non-Tegra sector layout on systems that store
+ * surfaces in system memory in non-Tegra sector layout.
+ */
+#define DRM_TEGRA_SUBMIT_RELOC_SECTOR_LAYOUT (1 << 0)
+
+struct drm_tegra_submit_buf {
+	/**
+	 * @mapping: [in]
+	 *
+	 * Identifier of the mapping to use in the submission.
+	 */
+	__u32 mapping;
+
+	/**
+	 * @flags: [in]
+	 *
+	 * Flags.
+	 */
+	__u32 flags;
+
+	/**
+	 * Information for relocation patching.
+	 */
+	struct {
+		/**
+		 * @target_offset: [in]
+		 *
+		 * Offset from the start of the mapping of the data whose
+		 * address is to be patched into the gather.
+		 */
+		__u64 target_offset;
+
+		/**
+		 * @gather_offset_words: [in]
+		 *
+		 * Offset in words from the start of the gather data to
+		 * where the address should be patched into.
+		 */
+		__u32 gather_offset_words;
+
+		/**
+		 * @shift: [in]
+		 *
+		 * Number of bits the address should be shifted right before
+		 * patching in.
+		 */
+		__u32 shift;
+	} reloc;
+};
+
+/**
+ * Execute `words` words of Host1x opcodes specified in the `gather_data_ptr`
+ * buffer. Each GATHER_UPTR command uses successive words from the buffer.
+ */
+#define DRM_TEGRA_SUBMIT_CMD_GATHER_UPTR		0
+/**
+ * Wait for a syncpoint to reach a value before continuing with further
+ * commands.
+ */
+#define DRM_TEGRA_SUBMIT_CMD_WAIT_SYNCPT		1
+/**
+ * Wait for a syncpoint to reach a value before continuing with further
+ * commands. The threshold is calculated relative to the start of the job.
+ */
+#define DRM_TEGRA_SUBMIT_CMD_WAIT_SYNCPT_RELATIVE	2
+
+struct drm_tegra_submit_cmd_gather_uptr {
+	__u32 words;
+	__u32 reserved[3];
+};
+
+struct drm_tegra_submit_cmd_wait_syncpt {
+	__u32 id;
+	__u32 value;
+	__u32 reserved[2];
+};
+
+struct drm_tegra_submit_cmd {
+	/**
+	 * @type: [in]
+	 *
+	 * Command type to execute. One of the DRM_TEGRA_SUBMIT_CMD*
+	 * defines.
+	 */
+	__u32 type;
+
+	/**
+	 * @flags: [in]
+	 *
+	 * Flags.
+	 */
+	__u32 flags;
+
+	union {
+		struct drm_tegra_submit_cmd_gather_uptr gather_uptr;
+		struct drm_tegra_submit_cmd_wait_syncpt wait_syncpt;
+		__u32 reserved[4];
+	};
+};
+
+struct drm_tegra_submit_syncpt {
+	/**
+	 * @id: [in]
+	 *
+	 * ID of the syncpoint that the job will increment.
+	 */
+	__u32 id;
+
+	/**
+	 * @flags: [in]
+	 *
+	 * Flags.
+	 */
+	__u32 flags;
+
+	/**
+	 * @increments: [in]
+	 *
+	 * Number of times the job will increment this syncpoint.
+	 */
+	__u32 increments;
+
+	/**
+	 * @value: [out]
+	 *
+	 * Value the syncpoint will have once the job has completed all
+	 * its specified syncpoint increments.
+	 *
+	 * Note that the kernel may increment the syncpoint before or after
+	 * the job. These increments are not reflected in this field.
+	 *
+	 * If the job hangs or times out, not all of the increments may
+	 * get executed.
+	 */
+	__u32 value;
+};
+
+struct drm_tegra_channel_submit {
+	/**
+	 * @context: [in]
+	 *
+	 * Identifier of the channel to submit this job to.
+	 */
+	__u32 context;
+
+	/**
+	 * @num_bufs: [in]
+	 *
+	 * Number of elements in the `bufs_ptr` array.
+	 */
+	__u32 num_bufs;
+
+	/**
+	 * @num_cmds: [in]
+	 *
+	 * Number of elements in the `cmds_ptr` array.
+	 */
+	__u32 num_cmds;
+
+	/**
+	 * @gather_data_words: [in]
+	 *
+	 * Number of 32-bit words in the `gather_data_ptr` array.
+	 */
+	__u32 gather_data_words;
+
+	/**
+	 * @bufs_ptr: [in]
+	 *
+	 * Pointer to an array of drm_tegra_submit_buf structures.
+	 */
+	__u64 bufs_ptr;
+
+	/**
+	 * @cmds_ptr: [in]
+	 *
+	 * Pointer to an array of drm_tegra_submit_cmd structures.
+	 */
+	__u64 cmds_ptr;
+
+	/**
+	 * @gather_data_ptr: [in]
+	 *
+	 * Pointer to an array of Host1x opcodes to be used by GATHER_UPTR
+	 * commands.
+	 */
+	__u64 gather_data_ptr;
+
+	/**
+	 * @syncobj_in: [in]
+	 *
+	 * Handle for DRM syncobj that will be waited before submission.
+	 * Ignored if zero.
+	 */
+	__u32 syncobj_in;
+
+	/**
+	 * @syncobj_out: [in]
+	 *
+	 * Handle for DRM syncobj that will have its fence replaced with
+	 * the job's completion fence. Ignored if zero.
+	 */
+	__u32 syncobj_out;
+
+	/**
+	 * @syncpt_incr: [in,out]
+	 *
+	 * Information about the syncpoint the job will increment.
+	 */
+	struct drm_tegra_submit_syncpt syncpt;
+};
+
+struct drm_tegra_syncpoint_allocate {
+	/**
+	 * @id: [out]
+	 *
+	 * ID of allocated syncpoint.
+	 */
+	__u32 id;
+	__u32 padding;
+};
+
+struct drm_tegra_syncpoint_free {
+	/**
+	 * @id: [in]
+	 *
+	 * ID of syncpoint to free.
+	 */
+	__u32 id;
+	__u32 padding;
+};
+
+struct drm_tegra_syncpoint_wait {
+	/**
+	 * @timeout: [in]
+	 *
+	 * Absolute timestamp at which the wait will time out.
+	 */
+	__s64 timeout_ns;
+
+	/**
+	 * @id: [in]
+	 *
+	 * ID of syncpoint to wait on.
+	 */
+	__u32 id;
+
+	/**
+	 * @threshold: [in]
+	 *
+	 * Threshold to wait for.
+	 */
+	__u32 threshold;
+
+	/**
+	 * @value: [out]
+	 *
+	 * Value of the syncpoint upon wait completion.
+	 */
+	__u32 value;
+
+	__u32 padding;
+};
+
+#define DRM_IOCTL_TEGRA_CHANNEL_OPEN DRM_IOWR(DRM_COMMAND_BASE + 0x10, struct drm_tegra_channel_open)
+#define DRM_IOCTL_TEGRA_CHANNEL_CLOSE DRM_IOWR(DRM_COMMAND_BASE + 0x11, struct drm_tegra_channel_close)
+#define DRM_IOCTL_TEGRA_CHANNEL_MAP DRM_IOWR(DRM_COMMAND_BASE + 0x12, struct drm_tegra_channel_map)
+#define DRM_IOCTL_TEGRA_CHANNEL_UNMAP DRM_IOWR(DRM_COMMAND_BASE + 0x13, struct drm_tegra_channel_unmap)
+#define DRM_IOCTL_TEGRA_CHANNEL_SUBMIT DRM_IOWR(DRM_COMMAND_BASE + 0x14, struct drm_tegra_channel_submit)
+
+#define DRM_IOCTL_TEGRA_SYNCPOINT_ALLOCATE DRM_IOWR(DRM_COMMAND_BASE + 0x20, struct drm_tegra_syncpoint_allocate)
+#define DRM_IOCTL_TEGRA_SYNCPOINT_FREE DRM_IOWR(DRM_COMMAND_BASE + 0x21, struct drm_tegra_syncpoint_free)
+#define DRM_IOCTL_TEGRA_SYNCPOINT_WAIT DRM_IOWR(DRM_COMMAND_BASE + 0x22, struct drm_tegra_syncpoint_wait)
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.32.0

