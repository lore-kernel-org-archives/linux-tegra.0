Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC58C433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 16 Sep 2021 09:44:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 022AF61185
	for <linux-tegra@archiver.kernel.org>; Thu, 16 Sep 2021 09:44:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235649AbhIPJpb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 16 Sep 2021 05:45:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235287AbhIPJpa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Sep 2021 05:45:30 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93F93C061574
        for <linux-tegra@vger.kernel.org>; Thu, 16 Sep 2021 02:44:10 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id u18so6705209wrg.5
        for <linux-tegra@vger.kernel.org>; Thu, 16 Sep 2021 02:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LLv8c3GPvSmHSixxrZzhkLRp5WLbVu1bfIiV+NIuCjg=;
        b=KP1ezvOI0ZFODE+OslQZj5tg8JLbwwSixXwoM0qJh/HiqUtOiVyo/yzNCj3d2RntxX
         dSUj4mjuuDS+BCCxBnqdq0bbFm39VPhLoVGED55p9IxGm917YembcQftJgOsbF+A8LSW
         fQcQdbXG5ww3eFrwZIm+lb3GNMCpvWqUZDhF4ow//YJ6bjD1F+3YFNc6Mq97it4KMG4+
         3hE5OyiiagDO5laHDtp6BJnq/IYMMd+CEcgNR0TpOY9XQ+1WEAjVefg8Z8bxAxuWPpMx
         aoFmo7WmYPT5fcH4ajvlVGxkjSGTUZuniR8DpoWJ3kjZW+UJjea2kErNk1ojMhpOjX0I
         Fh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LLv8c3GPvSmHSixxrZzhkLRp5WLbVu1bfIiV+NIuCjg=;
        b=DEcf/5DQ3dfdxifr0vq1XLABv/vDim3qwkr2nIukNkbJmmc14+dV2UQGIsgyfn7oSB
         EMCVXLFSPMZV5CLVFJihZ/hlW4IRcsyhwSNHb/Q0ZuqHJBhmElBMUN8/TzpBHlzoVN5H
         NB3pVdSWvUa+5M3KC3DYdf7fR9q1l/ONe5oFCrxsC4seg7cIWzletmejTJkrw24XbuDN
         qNDtLWWSe8dPzJTb7C/Q6NkwbO7sgbBoRBc6M0z260qkXoDzzwZvppTgNRI2CrwwEGOP
         vOL1M59bPblgV815AFdFHC4zRpi7Vbf+MJ9x5R/zo0OS4slzLCPxjyerk6dTWfSGpAL5
         v9jw==
X-Gm-Message-State: AOAM532JFgE8zntIuiSKib5niOl37nUCsRT+QbkIRopUrNDteqOUaqkv
        CsKxJpeK/s/YygJE1GJDbiQ=
X-Google-Smtp-Source: ABdhPJxfZrGaNINRkIM4LAyUQlrkuRJpHatfKtMbjz3rEOifaoQKzADw+fMIU6/qGNVlMJoclvGG0w==
X-Received: by 2002:a05:6000:1623:: with SMTP id v3mr5033115wrb.288.1631785449213;
        Thu, 16 Sep 2021 02:44:09 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id o26sm6830771wmc.17.2021.09.16.02.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 02:44:08 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 1/6] lib/scatterlist: Add contiguous DMA chunks helpers
Date:   Thu, 16 Sep 2021 11:43:59 +0200
Message-Id: <20210916094404.888267-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add a few helpers to count the number of contiguous DMA chunks found in
an SG table. This is useful to determine whether or not a mapping can be
used by drivers whose devices need contiguous memory.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/linux/scatterlist.h | 11 +++++++++++
 lib/scatterlist.c           | 26 ++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index 266754a55327..cca235ff2d0a 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -281,6 +281,7 @@ int sg_split(struct scatterlist *in, const int in_mapped_nents,
 	     const size_t *split_sizes,
 	     struct scatterlist **out, int *out_mapped_nents,
 	     gfp_t gfp_mask);
+unsigned int sg_dma_count_chunks(struct scatterlist *sgl, unsigned int nents);
 
 typedef struct scatterlist *(sg_alloc_fn)(unsigned int, gfp_t);
 typedef void (sg_free_fn)(struct scatterlist *, unsigned int);
@@ -358,6 +359,16 @@ size_t sg_pcopy_to_buffer(struct scatterlist *sgl, unsigned int nents,
 size_t sg_zero_buffer(struct scatterlist *sgl, unsigned int nents,
 		       size_t buflen, off_t skip);
 
+static inline unsigned int sgt_dma_count_chunks(struct sg_table *sgt)
+{
+	return sg_dma_count_chunks(sgt->sgl, sgt->nents);
+}
+
+static inline bool sgt_dma_contiguous(struct sg_table *sgt)
+{
+	return sgt_dma_count_chunks(sgt) == 1;
+}
+
 /*
  * Maximum number of entries that will be allocated in one piece, if
  * a list larger than this is required then chaining will be utilized.
diff --git a/lib/scatterlist.c b/lib/scatterlist.c
index abb3432ed744..fae2179a218a 100644
--- a/lib/scatterlist.c
+++ b/lib/scatterlist.c
@@ -142,6 +142,32 @@ void sg_init_one(struct scatterlist *sg, const void *buf, unsigned int buflen)
 }
 EXPORT_SYMBOL(sg_init_one);
 
+/**
+ * sg_dma_count_chunks - return number of contiguous DMA chunks in scatterlist
+ * @sgl: SG table
+ * @nents: number of entries in SG table
+ */
+unsigned int sg_dma_count_chunks(struct scatterlist *sgl, unsigned int nents)
+{
+	dma_addr_t next = ~(dma_addr_t)0;
+	unsigned int count = 0, i;
+	struct scatterlist *s;
+
+	for_each_sg(sgl, s, nents, i) {
+		/* sg_dma_address(s) is only valid for entries that have sg_dma_len(s) != 0. */
+		if (!sg_dma_len(s))
+			continue;
+
+		if (sg_dma_address(s) != next) {
+			next = sg_dma_address(s) + sg_dma_len(s);
+			count++;
+		}
+	}
+
+	return count;
+}
+EXPORT_SYMBOL(sg_dma_count_chunks);
+
 /*
  * The default behaviour of sg_alloc_table() is to use these kmalloc/kfree
  * helpers.
-- 
2.33.0

