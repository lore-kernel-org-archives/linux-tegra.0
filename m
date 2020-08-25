Return-Path: <SRS0=F6W0=CD=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5785C433DF
	for <linux-tegra@archiver.kernel.org>; Tue, 25 Aug 2020 05:24:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88C422067C
	for <linux-tegra@archiver.kernel.org>; Tue, 25 Aug 2020 05:24:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="EUmxOOXo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726449AbgHYFYa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 25 Aug 2020 01:24:30 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:2892 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbgHYFY3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Aug 2020 01:24:29 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f44a0150000>; Mon, 24 Aug 2020 22:22:29 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Mon, 24 Aug 2020 22:24:28 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Mon, 24 Aug 2020 22:24:28 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 25 Aug
 2020 05:24:28 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 25 Aug 2020 05:24:28 +0000
Received: from mkumard.nvidia.com (Not Verified[10.24.34.162]) by hqnvemgw03.nvidia.com with Trustwave SEG (v7,5,8,10121)
        id <B5f44a08a0002>; Mon, 24 Aug 2020 22:24:28 -0700
From:   Mohan Kumar <mkumard@nvidia.com>
To:     <tiwai@suse.com>, <aplattner@nvidia.com>, <spujar@nvidia.com>
CC:     <alsa-devel@alsa-project.org>, <linux-tegra@vger.kernel.org>,
        <treding@nvidia.com>, <jonathanh@nvidia.com>,
        Mohan Kumar <mkumard@nvidia.com>
Subject: [PATCH 0/2] Tegra HDA specific fixes
Date:   Tue, 25 Aug 2020 10:54:13 +0530
Message-ID: <20200825052415.20626-1-mkumard@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1598332949; bh=wgkok6TARXT/axLlRKHms5VavjJ9TwuiwRcGCN84XkQ=;
        h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
         MIME-Version:Content-Type;
        b=EUmxOOXoeCkAejyI6rm1Ui2xzYe5NDB5hJ5H1g0yc4HEEKUJeCVE1vaD5XS4nZuSW
         Vv8GPTzWuA4XyO3mSG3fjjZCJauhWi7EvX6gv2jTHlNsqGeO5/C9yEW/KOxQqpMyQp
         LQSC+rYTraQF/ojVR63UJRBNJBJznVW6z71/OUI35K6dumpmvyUrsTQtrae3OrFGpY
         R0v1Voxa/GrwhAx5KjdwvQtQhuarCnIy1CH+lpiRnd5SqcXSueU0kTSMi9QCK5p571
         6/F7wtPArXyoKgjgp6lm5RNOll/ObSGHeb52iPEqKSPGnZhzr4b2y8WEV7PDw82PSp
         Ld/HTXJKoH1Sw==
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series has the fix for
- 2 Channel swapping issue for Tegra
- WAKEEN programming to detect wake events.

Mohan Kumar (2):
  ALSA: hda: Fix 2 channel swapping for Tegra
  ALSA: hda/tegra: Program WAKEEN register for Tegra

 sound/pci/hda/hda_tegra.c  | 7 +++++++
 sound/pci/hda/patch_hdmi.c | 5 +++++
 2 files changed, 12 insertions(+)

-- 
2.17.1

