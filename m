Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BA64C4727C
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 03:00:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93A672074B
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 03:00:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="OA+S7Bz9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729623AbgI3DAE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Sep 2020 23:00:04 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:4218 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729446AbgI3DAD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Sep 2020 23:00:03 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f73f44e0002>; Tue, 29 Sep 2020 19:58:22 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Sep
 2020 03:00:02 +0000
Received: from skomatineni-linux.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 30 Sep 2020 03:00:02 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
Subject: [PATCH v1 0/2] Allow building Tegra video driver with COMPILE_TEST
Date:   Tue, 29 Sep 2020 20:02:36 -0700
Message-ID: <1601434958-29305-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1601434702; bh=1nqr4ua6fcvL3/8a5eNm1SxuTO2CagaFTIPMzrgRzIU=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:X-NVConfidentiality:
         MIME-Version:Content-Type;
        b=OA+S7Bz99oAUP1W4RSA4rm04dSnO1ZYsNukV/Sdf7T0N5Cfq8fFT81x4AP0I6khUv
         kdATBkrRQf0TDr0CtvlytiUZQfKj+17MKifgG9lOkkYNKOrqqv/wekMa6Xb//Ai0Zu
         tQlvVpqmcE4++srxiSK2dWBvfRKpTP1jbSL/aDRSsThDaVAeGJTsxb8EasmB+cw9H2
         dcdtVyh3dOeST4eZkT/yrYf+tdBHzMCJeJfCmFDDNFok1DjspausWcHC2mF0lMNmzr
         1wvQxv0KNKtjXVJeO7xXuGToU3uQ6dwYziwAwL3hhp4F2GZbfEXkH1L4RJ2qjAQan3
         8VUmdpXgAMrzw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series enables COMPILE_TEST for Tegra video driver.

Tegra video driver has dependency on host1x driver. So this series also
includes a patch to allow building host1x driver with COMPILE_TEST for
all platforms.

Sowjanya Komatineni (2):
  gpu: host1x: Allow COMPILE_TEST to build host1x driver on all
    platforms
  media: tegra-video: Allow building driver with COMPILE_TEST

 drivers/gpu/host1x/Kconfig                | 2 +-
 drivers/staging/media/tegra-video/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.7.4

