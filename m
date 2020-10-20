Return-Path: <SRS0=rHad=D3=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70789C388F7
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Oct 2020 19:35:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09F682242E
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Oct 2020 19:35:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="ArgT2VVu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438164AbgJTTfd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Oct 2020 15:35:33 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:5593 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438191AbgJTTfc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Oct 2020 15:35:32 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f8f3bd40000>; Tue, 20 Oct 2020 12:34:45 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct
 2020 19:35:31 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 20 Oct 2020 19:35:31 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 6/9] media: tegra-video: Add support for EDID ioctl ops
Date:   Tue, 20 Oct 2020 12:36:12 -0700
Message-ID: <1603222575-14427-7-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603222575-14427-1-git-send-email-skomatineni@nvidia.com>
References: <1603222575-14427-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603222485; bh=bHzQRpU16Ph4H6jjekuasUSGwbJ9VXFyRGyVRWLhW1I=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=ArgT2VVui8CMC7it1MIhqExeU//Gg5UL4XwZo/zSoXw5h86DUOFzy+vgmR39XiWOT
         OIeicLYDRrK8f4sEFjUiVb8AEk7Cm6H345DWQwRXPywCic9bFI085wiqK515x4CznM
         eplCMlkY0ud94TVmYuhAVlQSHzrvQqmZ6ctqkRlMiVperCfk18ap9LOoifNLiJBAjH
         FANRKpRJAnqDPEr/Fj7kW3fs3pyqBjqS8cIOTB7Y9UKHrKxLAaYJKp+q+/8i5J0YiJ
         /+11ee28DunHsxRtYKgr7OPdrAOnAm9SHQ2zWNDi6W0Rqdjfx87knzI/ZoM7btxvHz
         Zdx3Psf3/WZVA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch adds support for EDID get and set v4l2 ioctl ops to use
with HDMI to CSI bridges.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/vi.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index d0d84da..92f36b1 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -721,6 +721,32 @@ static int tegra_channel_s_selection(struct file *file, void *fh,
 	return ret;
 }
 
+static int tegra_channel_g_edid(struct file *file, void *fh,
+				struct v4l2_edid *edid)
+{
+	struct tegra_vi_channel *chan = video_drvdata(file);
+	struct v4l2_subdev *subdev;
+
+	subdev = tegra_channel_get_remote_source_subdev(chan);
+	if (!v4l2_subdev_has_op(subdev, pad, get_edid))
+		return -ENOTTY;
+
+	return v4l2_subdev_call(subdev, pad, get_edid, edid);
+}
+
+static int tegra_channel_s_edid(struct file *file, void *fh,
+				struct v4l2_edid *edid)
+{
+	struct tegra_vi_channel *chan = video_drvdata(file);
+	struct v4l2_subdev *subdev;
+
+	subdev = tegra_channel_get_remote_source_subdev(chan);
+	if (!v4l2_subdev_has_op(subdev, pad, set_edid))
+		return -ENOTTY;
+
+	return v4l2_subdev_call(subdev, pad, set_edid, edid);
+}
+
 static int tegra_channel_g_dv_timings(struct file *file, void *fh,
 				      struct v4l2_dv_timings *timings)
 {
@@ -871,6 +897,8 @@ static const struct v4l2_ioctl_ops tegra_channel_ioctl_ops = {
 	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
 	.vidioc_g_selection		= tegra_channel_g_selection,
 	.vidioc_s_selection		= tegra_channel_s_selection,
+	.vidioc_g_edid			= tegra_channel_g_edid,
+	.vidioc_s_edid			= tegra_channel_s_edid,
 	.vidioc_g_dv_timings		= tegra_channel_g_dv_timings,
 	.vidioc_s_dv_timings		= tegra_channel_s_dv_timings,
 	.vidioc_query_dv_timings	= tegra_channel_query_dv_timings,
-- 
2.7.4

