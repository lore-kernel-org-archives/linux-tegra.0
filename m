Return-Path: <SRS0=stlo=EC=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 004E7C2D0A3
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Oct 2020 03:19:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1FAE21707
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Oct 2020 03:19:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="sOXh/7fE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504548AbgJ0DT1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 26 Oct 2020 23:19:27 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:14408 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504542AbgJ0DT1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 26 Oct 2020 23:19:27 -0400
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5f9791a90000>; Mon, 26 Oct 2020 20:19:05 -0700
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 27 Oct
 2020 03:19:26 +0000
Received: from skomatineni-linux.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 27 Oct 2020 03:19:26 +0000
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
To:     <skomatineni@nvidia.com>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <hverkuil@xs4all.nl>
CC:     <mchehab@kernel.org>, <linux-media@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 01/10] media: tegra-video: Use zero crop settings if subdev has no get_selection
Date:   Mon, 26 Oct 2020 20:19:14 -0700
Message-ID: <1603768763-25590-2-git-send-email-skomatineni@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1603768763-25590-1-git-send-email-skomatineni@nvidia.com>
References: <1603768763-25590-1-git-send-email-skomatineni@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1603768745; bh=ERCkCneZmXlmcSkkK9fGRHPBppn9DardS4Sr/wZUI/E=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
         References:X-NVConfidentiality:MIME-Version:Content-Type;
        b=sOXh/7fEqrJnV/vidg8kp7R0h85iGmbLqXyKzGp2Qw3MyJJsutu/NslN6rxYOFxu5
         RGASNVlX7rm+sV93TjFDhZ/E23EuRKO9rHqzWpnfkpjhsF0eH+yCk+scKDFByaZY1c
         dc2lCNdUrmM6GaPrDncVJitRhlpE4uSNtllhqixKZEoJvad33OEebsIt6lwVjy1m3e
         ZUxd6vxpjtUX1KouLrDOzk2wBAO+R8IA/aTsG8zeknRvF1H4ysBaEtMO3kn3vNr89Y
         X8Tr8UQRsZzk8RVbsjPhkYBPQvC37cwSz30QZndDwzRjix84V0jU3g5gSgxFwYJo6w
         XgordTUwoUyyQ==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Currently try format implementation doesn't check if subdevice has
get_selection ops implemented and returns -EINVAL on error from
direct v4l2_subdev_call of get_selection.

Selection API's are not mandatory for all V4L2 subdevices.

This patch fixes it by adding v4l2_subdev_has_ops check prior to
calling get_selection ops and continues with try or set format with
zero crop settings for subdevices that don't have get_selection and
returns -EINVAL only for subdevices that has get_selection ops.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/staging/media/tegra-video/vi.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 560d8b3..7edd35c 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -533,11 +533,18 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	fse.code = fmtinfo->code;
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, pad_cfg, &fse);
 	if (ret) {
-		ret = v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel);
-		if (ret)
-			return -EINVAL;
-		pad_cfg->try_crop.width = sdsel.r.width;
-		pad_cfg->try_crop.height = sdsel.r.height;
+		if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
+			pad_cfg->try_crop.width = 0;
+			pad_cfg->try_crop.height = 0;
+		} else {
+			ret = v4l2_subdev_call(subdev, pad, get_selection,
+					       NULL, &sdsel);
+			if (ret)
+				return -EINVAL;
+
+			pad_cfg->try_crop.width = sdsel.r.width;
+			pad_cfg->try_crop.height = sdsel.r.height;
+		}
 	} else {
 		pad_cfg->try_crop.width = fse.max_width;
 		pad_cfg->try_crop.height = fse.max_height;
-- 
2.7.4

