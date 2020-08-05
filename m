Return-Path: <SRS0=0g03=BP=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23816C433E0
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Aug 2020 09:54:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F052E20792
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Aug 2020 09:54:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="BWBMWt6Q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727941AbgHEJxv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Aug 2020 05:53:51 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:2454 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727982AbgHEJwx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Aug 2020 05:52:53 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2a815f0000>; Wed, 05 Aug 2020 02:52:31 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 05 Aug 2020 02:52:45 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 05 Aug 2020 02:52:45 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Aug
 2020 09:52:45 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 5 Aug 2020 09:52:44 +0000
Received: from mkumard.nvidia.com (Not Verified[10.24.34.162]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f2a816a0000>; Wed, 05 Aug 2020 02:52:44 -0700
From:   Mohan Kumar <mkumard@nvidia.com>
To:     <tiwai@suse.com>, <perex@perex.cz>
CC:     <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <treding@nvidia.com>, <jonathanh@nvidia.com>, <spujar@nvidia.com>,
        Mohan Kumar <mkumard@nvidia.com>
Subject: [PATCH v2 0/3]  Tegra Specific fixes
Date:   Wed, 5 Aug 2020 15:22:18 +0530
Message-ID: <20200805095221.5476-1-mkumard@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596621151; bh=n1dlz8iyQVQn9u37McbzKI0W09GdeF2ZXWm7kj2D8ro=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:Content-Type;
        b=BWBMWt6QVMLMuh32CQv7EbgOGFYLt4B1kJkv4Q2FjTIqnRzzSczyZt51aN0DmDSUG
         W00eF6NWgZc4saNzaisPb8Lx/k7wsfXRUw6zDcunG2jTPLThr/hBmWiHj8Q8ZOLOiX
         SEpA0QeeFRYq6GWyI0aNR3+3O+iJF90IgwuU9IPxSxNRsT7QihuaXdKuXSoKSpz0co
         QrS92fAO+DLM3SQSwaI/jTG5Umc/uY77DjaEYnR7eWjsUHWqAlLZzYZExDXEQcjCFg
         PKEln59tCG4H/vRBp2C0Bj/FSYPX9c+CSbTVAXUXw79wwtmMofbUPXq/udTPZr2aor
         fvgTSksTu8scA==
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
  ALSA: hda: Add dma stop delay variable
  ALSA: hda/tegra: Add 100us dma stop delay

 include/sound/hdaudio.h   | 3 +++
 sound/hda/hdac_stream.c   | 7 +++++++
 sound/pci/hda/hda_tegra.c | 3 +++
 3 files changed, 13 insertions(+)

-- 
2.17.1

