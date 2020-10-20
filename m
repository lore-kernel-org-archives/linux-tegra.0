Return-Path: <SRS0=rHad=D3=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C87C4363A
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Oct 2020 19:35:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 590982225D
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Oct 2020 19:35:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="LrEnEU6y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438155AbgJTTf2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Oct 2020 15:35:28 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:14695 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438154AbgJTTf2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Oct 2020 15:35:28 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f8f3ba30000>; Tue, 20 Oct 2020 12:33:55 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct
 2020 19:35:27 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 20 Oct 2020 19:35:27 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/9] media: tegra-video: Add support for capturing from HDMI-to-CSI bridge
Date:   Tue, 20 Oct 2020 12:36:06 -0700
Message-ID: <1603222575-14427-1-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603222435; bh=vk0Z162ydt5goTkfbh7cvYRBInjh/n9d55j7/sDPyE0=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:X-NVConfidentiality:
         MIME-Version:Content-Type;
        b=LrEnEU6y0IcixcnHy+BlIa6VuVeT+J5yNKe507Q7CwiD6VDHjkIb+zadqIfJI/tXs
         ghWDLx26mRLH0QjkEdHGujUGk6N5UOb9JOuC7HqGRDehPIX4SIrRqUsdk9yz0WqFAi
         HRUAiB9Ykiz96kusImH/c4YLiH3Fr0lkQK6J1USNwfjAncjgCD5M4oZbqReJwJS3LX
         5zqvxMGPNGJHJUCAGiAlmsGgEjMYpHHbgP+XIQjmhM87B3RxtV7jFLxW0hiN6KyLUa
         6xpIFypV0X6PC2JyXmt78cSkJM7vWyPCPS10Hdhqs5wKMRIYksIBXFhksG7m2isfeT
         9N7IBHfTmwhNQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series includes below changes to allow capturing from HDMI-to-CSI bridges.
- Add DV timing, EDID and log status V4L2 IOCTLs
- Subscribe V4L2_EVENT_SOURCE_CHANGE
- Implement V4L2 device notify callback to report queue error on source change
  during active streaming.
- Add support for NV16 V4L2 Pixel format.

This series also include below fixes
- Allow format change for subdevs that don't have crop support.
- Correct V4L2 Pixel format for RGB888_1X24
- Enable VI pixel transform for YUV and RGB formats.


Sowjanya Komatineni (9):
  media: tegra-video: Use zero crop settings if subdev has no
    get_selection
  media: tegra-video: Enable VI pixel transform for YUV and RGB formats
  media: tegra-video: Fix V4L2 pixel format for RGB888_1X24
  media: tegra-video: Add support for V4L2_PIX_FMT_NV16
  media: tegra-video: Add DV timing support
  media: tegra-video: Add support for EDID ioctl ops
  media: tegra-video: Add support for VIDIOC_LOG_STATUS ioctl
  media: tegra-video: Add support for V4L2_EVENT_SOURCE_CHANGE
  media: tegra-video: Implement V4L2 device notify callback

 drivers/staging/media/tegra-video/tegra210.c |  30 ++++-
 drivers/staging/media/tegra-video/vi.c       | 171 ++++++++++++++++++++++++++-
 drivers/staging/media/tegra-video/video.c    |  18 +++
 3 files changed, 211 insertions(+), 8 deletions(-)

-- 
2.7.4

