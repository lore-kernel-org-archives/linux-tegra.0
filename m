Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2416C433F5
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Oct 2021 14:41:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB67661164
	for <linux-tegra@archiver.kernel.org>; Wed, 13 Oct 2021 14:41:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237317AbhJMOn5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 13 Oct 2021 10:43:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:50952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235592AbhJMOn4 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 13 Oct 2021 10:43:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E372561164;
        Wed, 13 Oct 2021 14:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634136112;
        bh=FnygDVALxuB6jzfdbNL9ETJk+t+tvoto1moRUkWnoa4=;
        h=From:To:Cc:Subject:Date:From;
        b=blmtjwVQ44gx2yksClstXIIuCIKlj42Zg4rAXRmJbWq1jWfUHvwsNV1usBK/b+KoS
         Xm36wyw7WogQiiIK6XZ3PSBLcsC6rl2DfzWsRzVWIRIiRieZCKVYoaKWoUnbYuZqx8
         OSiXJX+jGfaR7L1jX+NVL8tSkNGzDw1DblD4lQS1hBjUJbddYpxZnbdkcxBOW2IgaD
         OL3yWPnPjCDviqhkN9915JLQQz5mvcmrlY0VKF42opvMg9WPw6YDtydX+gZDAMQi5X
         thyDojZd++nO5AzUbPbN45fdvirIKUdNGrOwWyGemtIA2OmLTfV/u6h1S9VjBiCon2
         59jTZa2hxWBuw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tegra: mark nvdec PM functions as __maybe_unused
Date:   Wed, 13 Oct 2021 16:41:36 +0200
Message-Id: <20211013144148.2208472-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The resume helper is called conditionally and causes a harmless
warning when stubbed out:

drivers/gpu/drm/tegra/nvdec.c:240:12: error: 'nvdec_runtime_resume' defined but not used [-Werror=unused-function]
  240 | static int nvdec_runtime_resume(struct device *dev)

Mark both suspend and resume as __maybe_unused for consistency
to avoid this warning.

Fixes: e76599df354d ("drm/tegra: Add NVDEC driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/tegra/nvdec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
index 30105a93de9f..791bf1acf5f0 100644
--- a/drivers/gpu/drm/tegra/nvdec.c
+++ b/drivers/gpu/drm/tegra/nvdec.c
@@ -238,7 +238,7 @@ static int nvdec_load_firmware(struct nvdec *nvdec)
 }
 
 
-static int nvdec_runtime_resume(struct device *dev)
+static __maybe_unused int nvdec_runtime_resume(struct device *dev)
 {
 	struct nvdec *nvdec = dev_get_drvdata(dev);
 	int err;
@@ -264,7 +264,7 @@ static int nvdec_runtime_resume(struct device *dev)
 	return err;
 }
 
-static int nvdec_runtime_suspend(struct device *dev)
+static __maybe_unused int nvdec_runtime_suspend(struct device *dev)
 {
 	struct nvdec *nvdec = dev_get_drvdata(dev);
 
-- 
2.29.2

