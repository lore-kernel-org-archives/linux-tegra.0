Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D85C433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 19:03:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18CD323102
	for <linux-tegra@archiver.kernel.org>; Tue, 12 Jan 2021 19:03:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732012AbhALTDV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 12 Jan 2021 14:03:21 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:17662 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726664AbhALTDV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 12 Jan 2021 14:03:21 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5ffdf2510002>; Tue, 12 Jan 2021 11:02:41 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Jan
 2021 19:02:40 +0000
Received: from skomatineni-linux.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 12 Jan 2021 19:02:40 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <digetx@gmail.com>, <wsa@the-dreams.de>, <skomatineni@nvidia.com>
CC:     <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
Subject: [PATCH v3] Create i2c_writesl_vi() to use with VI I2C
Date:   Tue, 12 Jan 2021 11:02:40 -0800
Message-ID: <1610478161-4877-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1610478161; bh=xwwBp4yfrgJzIJ1O4SXmSt1ktHP8GdLhQ92ARq5y3wA=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:X-NVConfidentiality:
         MIME-Version:Content-Type;
        b=f3SpTnVZ+LbHkhz1bWB5OTJPZBGhmiIIBYquI12O72pj0oNGU3T0xYIraVkARzVQG
         kJNbJGCdfHjPDzeVZ0NAJbRyHDQpGeoZFVprmCmG2SLWK7jUtyiXWpaZO6WIZaq2a6
         rNZ07dggOioDw/AkvzRkPKhgZJHKT2a4rYnpmaJXZEAOOxf8hrPPmEhps9XK0Rt0oi
         wnc4OgLm/T58xtKuA4ylnL3UgUxD50ksRkCiY3hlsnFZ/NLNvGlrsu2scRTqL8W7cc
         jQnOOEAUEA5oZV96F4aW4/yIFmloleJnZB6YBP4YGj9rhYROkgRp3BJ1+xMLAU6HnZ
         E7Z8IHJpqXzYA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Patch in this series is to fix known hardware bug with VI I2C
controller where immediate multiple writes to TX_FIFO gets stuck
resulting in VI I2C controller to be in bad state.

Delta between patch versions:
[v3]:	Includes v2 feedback 
	- uses relaxed writel and readl
	- avoids type casting on data buffer during i2c_writesl_vi()
	- updated comment to clearly mention this as workaround to
	  known hardware bug with VI I2C.

[v2]:	Creates i2c_writesl_vi() for vi i2c based on v1 feedback.

[v1]:	Updates i2c_writesl() to use writel() followed by i2c_readl().

Sowjanya Komatineni (1):
  i2c: tegra: Create i2c_writesl_vi() to use with VI I2C for filling TX
    FIFO

 drivers/i2c/busses/i2c-tegra.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

-- 
2.7.4

