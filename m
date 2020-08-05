Return-Path: <SRS0=0g03=BP=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFBBCC433DF
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Aug 2020 09:54:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A299B2173E
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Aug 2020 09:54:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Ue6pmgES"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725868AbgHEJyI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Aug 2020 05:54:08 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:2465 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728062AbgHEJwz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Aug 2020 05:52:55 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2a81670000>; Wed, 05 Aug 2020 02:52:39 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 05 Aug 2020 02:52:52 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 05 Aug 2020 02:52:52 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Aug
 2020 09:52:52 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 5 Aug 2020 09:52:52 +0000
Received: from mkumard.nvidia.com (Not Verified[10.24.34.162]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f2a81720000>; Wed, 05 Aug 2020 02:52:51 -0700
From:   Mohan Kumar <mkumard@nvidia.com>
To:     <tiwai@suse.com>, <perex@perex.cz>
CC:     <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <treding@nvidia.com>, <jonathanh@nvidia.com>, <spujar@nvidia.com>,
        Mohan Kumar <mkumard@nvidia.com>
Subject: [PATCH v2 3/3] ALSA: hda/tegra: Add 100us dma stop delay
Date:   Wed, 5 Aug 2020 15:22:21 +0530
Message-ID: <20200805095221.5476-4-mkumard@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200805095221.5476-1-mkumard@nvidia.com>
References: <20200805095221.5476-1-mkumard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596621159; bh=uZF+fL32kiXr/FFhU7XFb0VNeNdMUglasynYmIpWkSs=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:Content-Type;
        b=Ue6pmgESI0KEd18bPXWXznCxRraZq044VlQbBMpliDuMu2N0F1h1v/pFid4D6688d
         Nb0JkeAN+Ekydp+UEcHyDK5J1a3QRptFSNm0CtRD43qNDdjL7RyycPdnx8/ZUQoYXq
         Iqz9RMTwdt6zxxPVl9nT8BdMEvZ+pFIJZGk51nrXkfo7g5jE7GzM3BFxik5pM7HM1x
         nJIO1r2w8Sg4SVspz9dAS/4CCPcZ4K9XrvUVyo396ErdgLbgjlnm1VtkTx170sBgp4
         EwcAs/QtNAtVOq0ZytBV+HlDnqEzAdqcEhXpldtXniMFfC/2jNNv2V+kkHr2fdqV6T
         Pe0sz3F0iK+Cg==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra HDA has audio data buffer for upto tens of frames, this buffer
can help to avoid underflow. HW will keep issuing new data fetch
request when buffers are not full and current BDL is not done. When SW
disable DMA RUN bit for a stream, HW can't cancel the already issued data
fetch request and hence it can't stop DMA. HW has to wait for all issued
data fetch request get data returned before it stops DMA.

This HW behavior is not in sync with HDA spec which says DMA RUN bit
should be cleared within 1 audio frame. For Tegra, DMA RUN bit was
active for more than one audio frame, due to this the timeout in
snd_hdac_stream_sync function is not helping. When Stream reset set
and clear happens during DMA RUN bit active state it results in Memory
Decode error.

Unfortunately, there is no way to detect when these data accesses have
completed, but testing has shown that a 100us delay between Stream reset
set and clear operation for Tegra avoids the memory decode error.
Therefore, adding a 100us dma stop delay.

Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
---
 sound/pci/hda/hda_tegra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index ecf98eb9df36..c94553bcca88 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -308,6 +308,7 @@ static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
 		return err;
 	}
 	bus->irq = irq_id;
+	bus->dma_stop_delay = 100;
 	card->sync_irq = bus->irq;
 
 	/*
-- 
2.17.1

