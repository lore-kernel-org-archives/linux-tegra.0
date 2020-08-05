Return-Path: <SRS0=0g03=BP=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC9C2C433E1
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Aug 2020 09:54:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB7DD20792
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Aug 2020 09:54:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Ozfzo0Ez"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726041AbgHEJyJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Aug 2020 05:54:09 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:10494 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728030AbgHEJwz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Aug 2020 05:52:55 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2a810f0000>; Wed, 05 Aug 2020 02:51:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 05 Aug 2020 02:52:50 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 05 Aug 2020 02:52:50 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Aug
 2020 09:52:49 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 5 Aug 2020 09:52:49 +0000
Received: from mkumard.nvidia.com (Not Verified[10.24.34.162]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f2a816f0003>; Wed, 05 Aug 2020 02:52:49 -0700
From:   Mohan Kumar <mkumard@nvidia.com>
To:     <tiwai@suse.com>, <perex@perex.cz>
CC:     <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <treding@nvidia.com>, <jonathanh@nvidia.com>, <spujar@nvidia.com>,
        Mohan Kumar <mkumard@nvidia.com>
Subject: [PATCH v2 2/3] ALSA: hda: Add dma stop delay variable
Date:   Wed, 5 Aug 2020 15:22:20 +0530
Message-ID: <20200805095221.5476-3-mkumard@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200805095221.5476-1-mkumard@nvidia.com>
References: <20200805095221.5476-1-mkumard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596621071; bh=cAI69jqs7EoiWGpTZf5j8qW2hGEhCdiawWF5rWnA2DY=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:Content-Type;
        b=Ozfzo0EzAYvJ55O+ZCLIdD/eoIbmaVchC/ISaRm8GMmXxsHQpYg04exA6Wq2SB4LC
         t+nAvOd0ZXmdLy2Crtn2CSlKGfW5VMeHlT95I8O+aoNIF9bMFZhkwoLpyKY6LAkTaI
         j6rIx2WF+Jksd8rpFS/QnBXPLbwSxiM+2IjupQZnGZ39JAQ9YXm16B7PUcXlggAPG6
         mgFtybQDRw/PeNwh3axyN0E/kUBnOjkx1KTzHO0Lt7QPJO/X7f3e35NzoX0fZaY0/0
         CiNP1Vkt+o/sBOJUQ2pNCsbpRAucTQROdUu1VcjmfwOvZ8BUBGbzTyroKUBNu520Vy
         ZyxAhkQNvPV3w==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

A variable dma_stop_delay is added as a new member in hdac_bus
structure to avoid memory decode error incase DMA RUN bit is not
disabled in the given timeout from snd_hdac_stream_sync function and
followed by stream reset which results in memory decode error between
reset set and clear operation.

Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
---
 include/sound/hdaudio.h | 3 +++
 sound/hda/hdac_stream.c | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/include/sound/hdaudio.h b/include/sound/hdaudio.h
index c1f78d9a6e47..6eed61e6cf8a 100644
--- a/include/sound/hdaudio.h
+++ b/include/sound/hdaudio.h
@@ -347,6 +347,9 @@ struct hdac_bus {
 
 	int bdl_pos_adj;		/* BDL position adjustment */
 
+	/* delay time in us for dma stop */
+	unsigned int dma_stop_delay;
+
 	/* locks */
 	spinlock_t reg_lock;
 	struct mutex cmd_mutex;
diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index a38a2af1654f..abe7a1b16fe1 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -150,9 +150,12 @@ void snd_hdac_stream_reset(struct hdac_stream *azx_dev)
 {
 	unsigned char val;
 	int timeout;
+	int dma_run_state;
 
 	snd_hdac_stream_clear(azx_dev);
 
+	dma_run_state = snd_hdac_stream_readb(azx_dev, SD_CTL) & SD_CTL_DMA_START;
+
 	snd_hdac_stream_updateb(azx_dev, SD_CTL, 0, SD_CTL_STREAM_RESET);
 	udelay(3);
 	timeout = 300;
@@ -162,6 +165,10 @@ void snd_hdac_stream_reset(struct hdac_stream *azx_dev)
 		if (val)
 			break;
 	} while (--timeout);
+
+	if (azx_dev->bus->dma_stop_delay && dma_run_state)
+		udelay(azx_dev->bus->dma_stop_delay);
+
 	val &= ~SD_CTL_STREAM_RESET;
 	snd_hdac_stream_writeb(azx_dev, SD_CTL, val);
 	udelay(3);
-- 
2.17.1

