Return-Path: <SRS0=0g03=BP=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF9AC433E0
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Aug 2020 09:12:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CC1922CA1
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Aug 2020 09:12:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Cal4YxOw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728410AbgHEJMf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Aug 2020 05:12:35 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:7657 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728431AbgHEJLl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Aug 2020 05:11:41 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2a77660000>; Wed, 05 Aug 2020 02:09:58 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 05 Aug 2020 02:11:37 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 05 Aug 2020 02:11:37 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 5 Aug
 2020 09:11:37 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 5 Aug 2020 09:11:37 +0000
Received: from mkumard.nvidia.com (Not Verified[10.24.34.162]) by rnnvemgw01.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f2a77c60001>; Wed, 05 Aug 2020 02:11:36 -0700
From:   Mohan Kumar <mkumard@nvidia.com>
To:     <tiwai@suse.com>, <perex@perex.cz>
CC:     <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <treding@nvidia.com>, <jonathanh@nvidia.com>, <spujar@nvidia.com>,
        Mohan Kumar <mkumard@nvidia.com>
Subject: [PATCH 1/3] ASoC: hda/tegra: Set buffer alignment to 128 bytes
Date:   Wed, 5 Aug 2020 14:41:14 +0530
Message-ID: <20200805091116.2314-2-mkumard@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200805091116.2314-1-mkumard@nvidia.com>
References: <20200805091116.2314-1-mkumard@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596618598; bh=xr6uX8YmavJUmyTOqAj79akwf/8Wmbfu9U6LVTS7h30=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         In-Reply-To:References:MIME-Version:Content-Type;
        b=Cal4YxOwEbhS7LEPXB4zqIvTQzwc+1bRn4iRQZ/QIDnZ4jg3GsC0Xwb2FUlY9wLgD
         wYeO1icn8IPzSYDgDaiSTXCncyy8ldYGx/La02fRG8enZhTyAqFypgzA3p759KH20o
         4X8khA/jEWQAhuwv62+S+VP356jpQvFfHD7C71U50ULer+M16/M8lFBhMiLFbbE59M
         5rTf3y+OoKIJxNZ25A30bvwde9wHi2jNBIxdMifxzh5Ve2/Rph9J3kuyakqodrPwv6
         HG/hn2gq5utF5DAOL6CPGrCc0JUAxClL4KTfC4/0v5CSX0eYgxRsNvl1lER5ehHzRD
         tLNYfHiDmeoXQ==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Set  chip->align_buffer_size to 1 for Tegra platforms to make the buffer
alignment to be multiple of 128 bytes. This fix is applied as gstreamer
alsasink gets stuck with the default buffer-time and latency-time
parameters with 4 byte buffer alignment.

Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
---
 sound/pci/hda/hda_tegra.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 5637f0129932..ecf98eb9df36 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -333,6 +333,8 @@ static int hda_tegra_first_init(struct azx *chip, struct platform_device *pdev)
 	gcap = azx_readw(chip, GCAP);
 	dev_dbg(card->dev, "chipset global capabilities = 0x%x\n", gcap);
 
+	chip->align_buffer_size = 1;
+
 	/* read number of streams from GCAP register instead of using
 	 * hardcoded value
 	 */
-- 
2.17.1

