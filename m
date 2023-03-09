Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52987C74A4B
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Mar 2023 14:44:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbjCIOof (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Mar 2023 09:44:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231940AbjCIOoU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Mar 2023 09:44:20 -0500
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4763CF05D6;
        Thu,  9 Mar 2023 06:43:59 -0800 (PST)
Received: from booty.fritz.box (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPA id 1CB95FF80F;
        Thu,  9 Mar 2023 14:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1678373038;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DdRp15j/k4XeYmQe3luSEncUUhUk/h4Frh9ooM2yWbA=;
        b=GvPyYvV+RzXgDfT9Ok4kHclraNH3fivV4H/83JhM5IkFib2D8XpQP7tq0BUEE2U6RbLGLY
        b13oOulz/W9mK3YUTUOCaAJ5hGm/YaN0zEdLyJP5+Pd1i4911ITHbxeR8gqV2QGxsnacLq
        4+jNRFQQO0PhMo+wYmvliL0EVUMKkK8DBxQYI6FMREK3I6pOVjYaqxXGh3PYOSUHnOB4Rs
        bw3SZZkqCGbA1zAwZ9R2Cha4NXWNOTi17SPuzrqQacBsT3samqkek84U91cl4Zht69nYxN
        JkPWGnowFwT64h7oQuRXdRDvNiHDPscnpETIZQ78h2eprpU1qVO2iFREUEfRSw==
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Richard Leitner <richard.leitner@skidata.com>
Subject: [RESEND PATCH v4 11/21] staging: media: tegra-video: remove unneeded include
Date:   Thu,  9 Mar 2023 15:43:10 +0100
Message-Id: <20230309144320.2937553-12-luca.ceresoli@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309144320.2937553-1-luca.ceresoli@bootlin.com>
References: <20230309144320.2937553-1-luca.ceresoli@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

There is only a pointer reference to struct tegra_vi in video.h, thus vi.h
is not needed.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Dmitry Osipenko <digetx@gmail.com>

---

Changed in v4:
 - Added review tags

No changes in v3
No changes in v2
---
 drivers/staging/media/tegra-video/video.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/video.h b/drivers/staging/media/tegra-video/video.h
index fadaf2189dc9..1e9be1474a9c 100644
--- a/drivers/staging/media/tegra-video/video.h
+++ b/drivers/staging/media/tegra-video/video.h
@@ -12,7 +12,6 @@
 #include <media/v4l2-device.h>
 
 #include "vi.h"
-#include "csi.h"
 
 struct tegra_video_device {
 	struct v4l2_device v4l2_dev;
-- 
2.34.1

