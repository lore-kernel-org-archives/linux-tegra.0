Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D191FC433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Mar 2022 10:37:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235245AbiC2Kjj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Mar 2022 06:39:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235244AbiC2Kji (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Mar 2022 06:39:38 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E67CC12E2;
        Tue, 29 Mar 2022 03:37:55 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id bp39so14815612qtb.6;
        Tue, 29 Mar 2022 03:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xKC778etah9QDKKcTZhhCigcf4xPfMmEKK8YhWBFI3U=;
        b=PDvLAK727ct6dPW56kW/LelNoVohBTmDa2Azjn40F4G+K9/a9FvkOuyluaA7aYxwTl
         LcAVtUIsDGndq1N/B6ZQp/S4nrRurzW0tiofMGqNg0yefQfbhNzyLc88hURsF1kE0b6R
         4l24zv5jf4Cg/u/AqQlyU6dLq44h7RFSeudNVrhlp6fRfWCZn/AUAzEioZrCTtO+QrKJ
         +Z9ju0P6kWUBX1Yjpsy8WGnUlb9ipnEjKh2pOYGaBE88I34X29q3f42xEip1JAKNMV0G
         Rx+1mmT4qnxxawWkem/Oqg6Qq7dsx+hgI+8tZ/dQ1cPx9COImVqWy61DA+3Vo3VANB8U
         /5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xKC778etah9QDKKcTZhhCigcf4xPfMmEKK8YhWBFI3U=;
        b=fvcHXjM97gSoQTktpfQjWFpql4M8bxPxdzTJmy0hdt8pbnAz3B/E9jE0bkh4totQt/
         Zue0bRdq8/xLWOYscqgqVBzfR89ZRs0hO7Z9pz7luZwAGXkMfcsAnpR3ZConWkTpjdwB
         FO8i6acJbLFXyvJYBXOPN5flxZUBink61OKRYbDPqJZaERUOyo1Yuw0FwciDMBtcXrnh
         aYWBg58ip48yW2lCH7CJ87mmkdIQWFkfki8RBG1Rs537lBJDWJCLTBRhfC0twWyfptcC
         bL+p271JsFlK2XjCOD0pcC6ibhSbFl1zM/Cma2gZcRS8JuXeP/nbelgqVhybkg1gfkVF
         s5vA==
X-Gm-Message-State: AOAM5338JsMhlHqGCvZhf1kjmSMKaCJiN4Z0dPUjzS1lzt8RcCV7W5tr
        imhXqMblGkDb4S9M1vQrCK2dHZOczLY=
X-Google-Smtp-Source: ABdhPJyjvB2r/3wtYP5p9c9+BZYtdAonfE8T69SzZfubL2yGRZlQQpA0YYQnGTkJOcqV2rR+BdnRUQ==
X-Received: by 2002:a05:622a:89:b0:2e1:b8c7:9975 with SMTP id o9-20020a05622a008900b002e1b8c79975mr26674072qtw.342.1648550274239;
        Tue, 29 Mar 2022 03:37:54 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id j188-20020a3755c5000000b0067d1c76a09fsm9545713qkb.74.2022.03.29.03.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 03:37:53 -0700 (PDT)
From:   cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To:     thierry.reding@gmail.com
Cc:     airlied@linux.ie, daniel@ffwll.ch, jonathanh@nvidia.com,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lv Ruyi <lv.ruyi@zte.com.cn>,
        Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] drm: tegra: fix memory leak in error handling path
Date:   Tue, 29 Mar 2022 10:37:47 +0000
Message-Id: <20220329103747.2376753-1-lv.ruyi@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Lv Ruyi <lv.ruyi@zte.com.cn>

Before leave the nvdec_load_firmware, we shuold free virt which is alloced
by dma_alloc_coherent, so change "return err" to "goto cleanup".

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 drivers/gpu/drm/tegra/nvdec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
index 79e1e88203cf..a14863346bfa 100644
--- a/drivers/gpu/drm/tegra/nvdec.c
+++ b/drivers/gpu/drm/tegra/nvdec.c
@@ -209,7 +209,7 @@ static int nvdec_load_firmware(struct nvdec *nvdec)
 
 		err = dma_mapping_error(nvdec->dev, iova);
 		if (err < 0)
-			return err;
+			goto cleanup;
 	} else {
 		virt = tegra_drm_alloc(tegra, size, &iova);
 	}
-- 
2.25.1

