Return-Path: <SRS0=rHad=D3=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60C93C41604
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Oct 2020 19:35:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0451F2225C
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Oct 2020 19:35:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Yn9aFeh6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438217AbgJTTfe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Oct 2020 15:35:34 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:9850 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438209AbgJTTfe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Oct 2020 15:35:34 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f8f3bf90000>; Tue, 20 Oct 2020 12:35:21 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 20 Oct
 2020 19:35:33 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 20 Oct 2020 19:35:33 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 9/9] media: tegra-video: Implement V4L2 device notify callback
Date:   Tue, 20 Oct 2020 12:36:15 -0700
Message-ID: <1603222575-14427-10-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603222575-14427-1-git-send-email-skomatineni@nvidia.com>
References: <1603222575-14427-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603222521; bh=xWtjeqZACAKCgSw2RHdrYwyQIBNwajqC+8SWI/tdbs0=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=Yn9aFeh6ccUnDsgV7gbxyyzaK7F13d6oJhk6HFyA9JiReXTf7mcEoMYZrdIYr5qJu
         o5CdAnfmVY152nVsWV/mY64K1C3WimMu2g9d6EzdjJiQCoSh7+KNJqfBQYbwshwp5M
         0ztZ3GmxG3PAvDyFkiFZxChem7HR2jZOKRWcpGjacOVpv19jDPZPuPb3Jd0w4REOMF
         agi+uDEJSP2c/W4pFRmTRNIUXzzsNQNw2so9JALFTRgF3yzZSITSSrHcXbK4qYxRyb
         yxr8nHIYn2kIuHptvJYxAHX77tCWy1Ab4qgln5xuyQL6Clz+PB/5OcAtOCwHR4Cgjw
         W4MV7mMTdDVVA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Implement V4L2 device notify callback to handle
V4L2_EVENT_SOURCE_CHANGE event from subdevices.

HDMI-to-CSI bridge drivers trigger V4L2_EVENT_SOURCE_CHANGE when
source DV timing changes are detected or when HDMI hotplug happens.

Runtime source parameter changes during active streaming is not
allowed and Tegra video driver calls vb2_queue_error to signal a
fatal error if a notification of this event happens during an active
streaming.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/vi.c    |  3 +++
 drivers/staging/media/tegra-video/video.c | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 28c06a9..e866f7d 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1634,6 +1634,9 @@ static int tegra_vi_graph_notify_complete(struct v4l2_async_notifier *notifier)
 
 	v4l2_set_subdev_hostdata(subdev, chan);
 
+	subdev = tegra_channel_get_remote_source_subdev(chan);
+	v4l2_set_subdev_hostdata(subdev, chan);
+
 	return 0;
 
 unregister_video:
diff --git a/drivers/staging/media/tegra-video/video.c b/drivers/staging/media/tegra-video/video.c
index e50bd70..d966b31 100644
--- a/drivers/staging/media/tegra-video/video.c
+++ b/drivers/staging/media/tegra-video/video.c
@@ -7,6 +7,8 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 
+#include <media/v4l2-event.h>
+
 #include "video.h"
 
 static void tegra_v4l2_dev_release(struct v4l2_device *v4l2_dev)
@@ -24,6 +26,21 @@ static void tegra_v4l2_dev_release(struct v4l2_device *v4l2_dev)
 	kfree(vid);
 }
 
+static void tegra_v4l2_dev_notify(struct v4l2_subdev *sd,
+				  unsigned int notification, void *arg)
+{
+	struct tegra_vi_channel *chan;
+	const struct v4l2_event *ev = arg;
+
+	if (notification != V4L2_DEVICE_NOTIFY_EVENT)
+		return;
+
+	chan = v4l2_get_subdev_hostdata(sd);
+	v4l2_event_queue(&chan->video, arg);
+	if (ev->type == V4L2_EVENT_SOURCE_CHANGE && vb2_is_streaming(&chan->queue))
+		vb2_queue_error(&chan->queue);
+}
+
 static int host1x_video_probe(struct host1x_device *dev)
 {
 	struct tegra_video_device *vid;
@@ -49,6 +66,7 @@ static int host1x_video_probe(struct host1x_device *dev)
 
 	vid->v4l2_dev.mdev = &vid->media_dev;
 	vid->v4l2_dev.release = tegra_v4l2_dev_release;
+	vid->v4l2_dev.notify = tegra_v4l2_dev_notify;
 	ret = v4l2_device_register(&dev->dev, &vid->v4l2_dev);
 	if (ret < 0) {
 		dev_err(&dev->dev,
-- 
2.7.4

