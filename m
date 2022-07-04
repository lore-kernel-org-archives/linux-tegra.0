Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2900AC43334
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Jul 2022 20:31:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231276AbiGDUb5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 4 Jul 2022 16:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229649AbiGDUb4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 4 Jul 2022 16:31:56 -0400
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr [80.12.242.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1115D6306
        for <linux-tegra@vger.kernel.org>; Mon,  4 Jul 2022 13:31:56 -0700 (PDT)
Received: from pop-os.home ([90.11.190.129])
        by smtp.orange.fr with ESMTPA
        id 8SjZo3fqFNUm18SjZokYxx; Mon, 04 Jul 2022 22:31:54 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Mon, 04 Jul 2022 22:31:54 +0200
X-ME-IP: 90.11.190.129
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH] gpu: host1x: Use the bitmap API to allocate bitmaps
Date:   Mon,  4 Jul 2022 22:31:51 +0200
Message-Id: <e46ef2e2190fd0183b3b64728fbec209f5b4e57b.1656966695.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Use bitmap_zalloc()/bitmap_free() instead of hand-writing them.

It is less verbose and it improves the semantic.

While at it, remove a useless bitmap_zero() call. The bitmap is already
zero'ed when allocated.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/gpu/host1x/channel.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/host1x/channel.c b/drivers/gpu/host1x/channel.c
index 2a9a3a8d5931..2d0051d6314c 100644
--- a/drivers/gpu/host1x/channel.c
+++ b/drivers/gpu/host1x/channel.c
@@ -21,22 +21,18 @@ int host1x_channel_list_init(struct host1x_channel_list *chlist,
 	if (!chlist->channels)
 		return -ENOMEM;
 
-	chlist->allocated_channels =
-		kcalloc(BITS_TO_LONGS(num_channels), sizeof(unsigned long),
-			GFP_KERNEL);
+	chlist->allocated_channels = bitmap_zalloc(num_channels, GFP_KERNEL);
 	if (!chlist->allocated_channels) {
 		kfree(chlist->channels);
 		return -ENOMEM;
 	}
 
-	bitmap_zero(chlist->allocated_channels, num_channels);
-
 	return 0;
 }
 
 void host1x_channel_list_free(struct host1x_channel_list *chlist)
 {
-	kfree(chlist->allocated_channels);
+	bitmap_free(chlist->allocated_channels);
 	kfree(chlist->channels);
 }
 
-- 
2.34.1

