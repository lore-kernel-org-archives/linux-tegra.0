Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74606C433F5
	for <linux-tegra@archiver.kernel.org>; Fri,  6 May 2022 13:56:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1390583AbiEFN7p (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 6 May 2022 09:59:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236583AbiEFN7m (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 6 May 2022 09:59:42 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF458403FB
        for <linux-tegra@vger.kernel.org>; Fri,  6 May 2022 06:55:58 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id t6so10160530wra.4
        for <linux-tegra@vger.kernel.org>; Fri, 06 May 2022 06:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gg/JXMjpfOwiEZg6JQBAtzWxMQokLCT2waLLfWBbD+0=;
        b=gqFlZWoAEphOQA4KiBpzJ/0Q8MIO+jvtWxLDmDWS8JeqkDSnXm1pxZwuSJzR2wrvTe
         DALuSt7xR2VWB4jz3x2GjB1iyAuqqaGkJOd1AY3lfTbNUwYKo7ZzF2LNzgt3lJVbEUrr
         XcT6+n0kVdqe4Z9SNg+FCJLxJyCl9ZJhLoQdRX47RZi9F85urOafN9UPvEL4dPIGEb95
         aIEFf4fS79s2pj0PimLKhDTjRZ1i/Y7AfPs5zwJWgwr9sGYgX1TBjUf7w1evf2eA9Tw4
         Oa3eW3bVrgCJU3dkguKXIKaWcRjnz8UvIZk24kjW5jwcGAmkpWGunqRs9YCpallyGpTG
         Gnog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gg/JXMjpfOwiEZg6JQBAtzWxMQokLCT2waLLfWBbD+0=;
        b=WOD4EMIPdc2x36RO0qsV5gl9Ziw4gSnGW5Kcsc00XVzVyWiiQJJABTN+NYIoCtMXY2
         MbS6/3Z3UbmDjtVBMbQ9FuCavCb4tUEWJyPOIeZMCJqIk20IxoxaLeNOs/4vrHNWa70A
         PNHuJfjHQIW4Tte8AfSJucjcwvB2ls1kEuy5Z+oUaXc13u4IWQcVEsm17AYu4dhCbuK9
         vgSyPgMD0bMaIbj2+SvQNdlC2SOlCfgobBrWi5BvV+ivQP+x1uooRhZ3h7mSO3mm7dSQ
         oillMdwQMntExrLZocvYvDyo2dKDxhxPrTHew0zf9nBY+mgHABs7E7r/kIh8oVNIPKJj
         g36w==
X-Gm-Message-State: AOAM531P4UOD9NOdx7WCnd0LGE7vPrRvvzIqSYki5nQdQoOdbtAbTB6J
        K41032oRU/ScPj76Eaqo0W8=
X-Google-Smtp-Source: ABdhPJz/G3rJIS2qAFjbcSCV0/1cHjKw2VsLuFIl/Hf+bylt36IxaQ+FDHWSptNmOUuo0r33ce1rZg==
X-Received: by 2002:a05:6000:1acd:b0:20c:811c:9f39 with SMTP id i13-20020a0560001acd00b0020c811c9f39mr2768730wry.482.1651845357175;
        Fri, 06 May 2022 06:55:57 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id r190-20020a1c2bc7000000b003942a244f51sm8765545wmr.42.2022.05.06.06.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 06:55:56 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] drm/tegra: gem: Do not try to dereference ERR_PTR()
Date:   Fri,  6 May 2022 15:55:52 +0200
Message-Id: <20220506135552.3913468-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

When mapping the DMA-BUF attachment fails, map->sgt will be an ERR_PTR-
encoded error code and the cleanup code would try to free that memory,
which obviously would fail.

Zero out that pointer after extracting the error code when this happens
so that kfree() can do the right thing.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/gem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 0063403ab5e1..7c7dd84e6db8 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -88,6 +88,7 @@ static struct host1x_bo_mapping *tegra_bo_pin(struct device *dev, struct host1x_
 		if (IS_ERR(map->sgt)) {
 			dma_buf_detach(buf, map->attach);
 			err = PTR_ERR(map->sgt);
+			map->sgt = NULL;
 			goto free;
 		}
 
-- 
2.35.1

