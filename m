Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3C5BC433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 16 Dec 2021 08:57:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbhLPI5s (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 16 Dec 2021 03:57:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235070AbhLPI5s (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Dec 2021 03:57:48 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 972D9C061574
        for <linux-tegra@vger.kernel.org>; Thu, 16 Dec 2021 00:57:47 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id j9so10707340wrc.0
        for <linux-tegra@vger.kernel.org>; Thu, 16 Dec 2021 00:57:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K+H8K64HIIAzzi6Wq71ui1bloRAuSnkt5CtXVfSPR6o=;
        b=oixvcvbBrELBSxNdg4nlSO8BbPddPkJoZAGiKORc+PVZncD67/djXkY5OVdjlE6DJH
         1yzSWp8Lhv4O8x8kRWCnFF+/VDh/vvPalcgq6Scqg6dWQkfnOu0mnLQwMbQc7eRdyWq4
         faftXj6LgKt+XlsP1gufEOrWiJ8ls6/H61EymK2s1DM+WKyy+X4NwPcsaGjzwXCMipNW
         VdOfE/Qx68EptDZup7sfFskLKKbfMIZ7enLnwV/HVyREGPZYLt9c5FdV9h1TOJWBDKLK
         aRn4I27fu78ZQEfEYzl5La34b86PKhhxnCf1AFjT3ce3myJfeKW8z5sNeUeUcYfiAUOz
         MUxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K+H8K64HIIAzzi6Wq71ui1bloRAuSnkt5CtXVfSPR6o=;
        b=X0jDc2UNA6ovQUW4qur5CtQLuBomTYLR5cY8uFdoPUsqsvpBqjMZCoOLpNg9eUp08T
         LfpFlfTcPDB3lR/KfwVuP0e2+Aab4dwdWRAUb4GSjnYGZcWxytSYw8Bc39cpC0PqEpww
         b9WyJS/bNryeREF03nWqbRRRBEn5O5/Fl1gc7O7QQDK6CcTJEGt6hGLb9nNJ8OqTlLbx
         ZMN6sVDbw8A/tOxT2F5qm98wWgmDhou0Va4WQBTIQ70S5T1kOViPmMyWBGCbINEKe5Bd
         PeviXDcJCRRNEX7KB4CO/WGNp0ic3++QSw1c7F/SzqrVZVyfEmoRXsP772HcYCXy1n1z
         kinA==
X-Gm-Message-State: AOAM5336jRuBsWBolYbAjw6eXLgMLax3tb/skEd+HxtTs9CfWnSbOBnf
        4qg1NBGCijQaN82bja/0sIY=
X-Google-Smtp-Source: ABdhPJypuZKrSvTfZncadzB2OvkfkY79+xUiWWwCPSRhU6hRPnhmYPMYJpL+Gse2zhnN7dza7FUyzw==
X-Received: by 2002:a05:6000:1c8:: with SMTP id t8mr8322112wrx.542.1639645066216;
        Thu, 16 Dec 2021 00:57:46 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id p12sm5063559wrr.10.2021.12.16.00.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 00:57:44 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH] drm/tegra: vic: Handle tegra_drm_alloc() failure
Date:   Thu, 16 Dec 2021 09:57:43 +0100
Message-Id: <20211216085743.1300416-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This function can return one of several errors in an ERR_PTR()-encoded
pointer, so make sure to propogate those on failure.

Suggested-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/vic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index c5f4d2b13c43..7d2b719ed8d1 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -237,6 +237,8 @@ static int vic_load_firmware(struct vic *vic)
 			return -ENOMEM;
 	} else {
 		virt = tegra_drm_alloc(tegra, size, &iova);
+		if (IS_ERR(virt))
+			return PTR_ERR(virt);
 	}
 
 	vic->falcon.firmware.virt = virt;
-- 
2.34.1

