Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA997C433FE
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 02:39:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BBC1960F42
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 02:39:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233638AbhKLCmn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 11 Nov 2021 21:42:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231965AbhKLCmm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 11 Nov 2021 21:42:42 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A99C4C061766;
        Thu, 11 Nov 2021 18:39:52 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id b13so7340834plg.2;
        Thu, 11 Nov 2021 18:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IBQs7fu+H8AhiV4259K+BvetOv7yqdM5oNTRoi6ACrs=;
        b=Ww7izhamLDzitGvxzmrbd8T9UJu0DrgvgwVdVPnzlFy1KwkvBANXJyNdPxT1iS0ATZ
         oqREhDd8QuyjT2sTMwAsPzsZXYVpezaBa+jxl9MtM9ermq7Wv021wHk3ROso60QJT7Na
         ZuzwI18yC78qYW034X7l4DOgj9rCVfE07bitdST6r4FaBQMJKl6Uc/XrHLNK2TbgLOQH
         2gWjh2o4h2weHoYj60+o6hCnSIeGCu/z0G9AaYggLfTYDK+9WlW6YDh3HoGXxT+e9KjV
         sRtlTm+ajfgDvScafHZJV1I/i6OTpStCNatEZPavuDNNZsK4UZc9sac7TCRCS5LMbRIS
         G7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IBQs7fu+H8AhiV4259K+BvetOv7yqdM5oNTRoi6ACrs=;
        b=zeDXTZY9d8kzRSNaOPB+jTx9wv6qWzhWr4vVHYsjflvDgSFMPMGGf/o4QyxSagzGxn
         WFALidxw7f5fJHWGS9lr48uP5lYG53idU4YMK4lovI3naJfgm7N3a4A4tVjIPlRxh4w3
         xvr9hrh1G0owD9evfCKXzaOiiQF4d6jXwzMIMX0tFsd8uF/OFCF7Amy22oYVBrwOnBDa
         ILAlvmqXROJ7VCT2xA2fKWPFcxtvlC5i+Afcb40uoBjFR3hvnKk86noLk6chyuQu0+Cj
         hDdCeV93EiRM3Q5ZEO2ybtZqfzToDgBH1Z+lAa70N8KsIFqLhu4ZOs4Tf7Q4EGpFZyPp
         xrQQ==
X-Gm-Message-State: AOAM5328DH3iyIb2rzZq03bofsnQqncFcXwxOeH9++vpy+qjwBcHjE7O
        E+JDgXg86wDDDgWSlySbeXA=
X-Google-Smtp-Source: ABdhPJxOgVjtPLmL63yp3nVk7hGgiVBT66VPfdt2aXgEFQ7/vsDQrDhZnNdkEggqxLpxr6b9zO7edQ==
X-Received: by 2002:a17:902:9897:b0:143:84c3:4341 with SMTP id s23-20020a170902989700b0014384c34341mr4293767plp.64.1636684792166;
        Thu, 11 Nov 2021 18:39:52 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id 32sm3353102pgn.31.2021.11.11.18.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 18:39:51 -0800 (PST)
From:   cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To:     thierry.reding@gmail.com
Cc:     airlied@linux.ie, daniel@ffwll.ch, jonathanh@nvidia.com,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, chiminghao <chi.minghao@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cm>
Subject: [PATCH] fs:btrfs: remove unneeded variable
Date:   Fri, 12 Nov 2021 02:39:47 +0000
Message-Id: <20211112023947.4999-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: chiminghao <chi.minghao@zte.com.cn>

Fix the following coccicheck REVIEW:
./fs/btrfs/extent_map.c:299:5-8 REVIEW Unneeded variable

Reported-by: Zeal Robot <zealci@zte.com.cm>
Signed-off-by: chiminghao <chi.minghao@zte.com.cn>
---
 fs/btrfs/extent_map.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/btrfs/extent_map.c b/fs/btrfs/extent_map.c
index 5a36add21305..1dcb5486ccb6 100644
--- a/fs/btrfs/extent_map.c
+++ b/fs/btrfs/extent_map.c
@@ -296,7 +296,6 @@ static void try_merge_map(struct extent_map_tree *tree, struct extent_map *em)
 int unpin_extent_cache(struct extent_map_tree *tree, u64 start, u64 len,
 		       u64 gen)
 {
-	int ret = 0;
 	struct extent_map *em;
 	bool prealloc = false;
 
@@ -328,7 +327,7 @@ int unpin_extent_cache(struct extent_map_tree *tree, u64 start, u64 len,
 	free_extent_map(em);
 out:
 	write_unlock(&tree->lock);
-	return ret;
+	return 0;
 
 }
 
-- 
2.25.1

