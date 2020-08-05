Return-Path: <SRS0=0g03=BP=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37578C433E0
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Aug 2020 09:12:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E0C622CA1
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Aug 2020 09:12:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="YTZrZVBj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727787AbgHEJMV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Aug 2020 05:12:21 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:8656 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728423AbgHEJLl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Aug 2020 05:11:41 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2a77950001>; Wed, 05 Aug 2020 02:10:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 05 Aug 2020 02:11:34 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 05 Aug 2020 02:11:34 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Aug
 2020 09:11:34 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 5 Aug 2020 09:11:34 +0000
Received: from mkumard.nvidia.com (Not Verified[10.24.34.162]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f2a77c40000>; Wed, 05 Aug 2020 02:11:33 -0700
From:   Mohan Kumar <mkumard@nvidia.com>
To:     <tiwai@suse.com>, <perex@perex.cz>
CC:     <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <treding@nvidia.com>, <jonathanh@nvidia.com>, <spujar@nvidia.com>,
        Mohan Kumar <mkumard@nvidia.com>
Subject: [PATCH 0/3] Tegra Specific fixes
Date:   Wed, 5 Aug 2020 14:41:13 +0530
Message-ID: <20200805091116.2314-1-mkumard@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596618645; bh=5slDGC1M33xL2s2ysl137a0ShsilwhhCiWFS/kOUJDM=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:Content-Type;
        b=YTZrZVBj98V1+qq0MPOMCwaujXLloyBI2kEdEwxtgAvtpNi4VIP1SkSJvOl/9vXXb
         oojceGD5YsvreLrBsHMTHirVcVd9LGJpJUQ3QbRS32m2mSS4feHfqviqKv7l9ARznR
         4evD7S2xDYwLUVU1uXI75AwSx4mayOswQpX2HLyyhDtF8r9d/T79oVKa+LZDlaYbgZ
         SjFBxaltD4zEwVIh44y+lTD85xP4aM6Bmuf+oTcsUbIsWw99J7y2ooyn8DK/RWmfaE
         Cgvul7TE2ovcMM6GrO9IVOk5mWhsb4tyDYT1o3pUSt5XEHlg8Cj8goCLxIrMAtxLON
         zQ8MuXwUJO7iQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series proposes following fixes to Tegra HDA driver.
* Align the buffer to 128 bytes for Tegra.
* Add new behavior flag dma_stop_delay in hdac_bus structure.
* Add 100us as dma stop delay for Tegra.

Mohan Kumar (3):
  ASoC: hda/tegra: Set buffer alignment to 128 bytes
  ALSA: hda: Add behaviour flag for dma stop delay
  ALSA: hda/tegra: Add 100us dma stop delay

 include/sound/hdaudio.h   | 2 ++
 sound/hda/hdac_stream.c   | 7 +++++++
 sound/pci/hda/hda_tegra.c | 3 +++
 3 files changed, 12 insertions(+)

-- 
2.17.1

