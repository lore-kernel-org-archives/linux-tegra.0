Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE8F2C4361B
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Dec 2020 18:29:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8984D23EF3
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Dec 2020 18:29:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393786AbgLKREO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Dec 2020 12:04:14 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:2300 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389604AbgLKRDc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Dec 2020 12:03:32 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fd3a63b0001>; Fri, 11 Dec 2020 09:02:51 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 11 Dec
 2020 17:02:51 +0000
Received: from skomatineni-linux.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 11 Dec 2020 17:02:51 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>,
        <sakari.ailus@iki.fi>, <robh+dt@kernel.org>
CC:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 06/13] media: tegra-video: Add support for EDID ioctl ops
Date:   Fri, 11 Dec 2020 09:02:35 -0800
Message-ID: <1607706162-1548-7-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607706162-1548-1-git-send-email-skomatineni@nvidia.com>
References: <1607706162-1548-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607706171; bh=pNpN3f/SRR0mn9c/AvbESRBJwpfQPmb/g2WTapIp4ew=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=C/25hCP0iakGGv2ak5U5xIIOSip/HEH0GGEIVrifMVEzZ0amik9wRdrXTpzVquzyZ
         ywtzrvOJBhhCyxvv8qRiTWLMq6dayThMYWga4E7AozN1VBEIVDYGqb865MTWDQ4Mwp
         vt1Czl/ZbDaPcuOhdudG908lEPtPYoB8zLuuCD6NpKIoIeNNv+VF3V1UKVfBKvrDol
         1412fb2zNAm7G0qwLUQ8LOaEMNwmOXUCKLvwcDGYGu3J7ytdKXl39f9cGYTI1iBAKu
         hR7UTUEJsOsPfrUDTyR/hL3jrhblMbh5kxnm3V0H9t1nmcJv291RNt1xAkUVie0J4s
         yPj8kK0qxsHoQ==
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
index d01e88d..bc38136 100644
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
@@ -873,6 +899,8 @@ static const struct v4l2_ioctl_ops tegra_channel_ioctl_ops = {
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

