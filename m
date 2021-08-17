Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43A6FC4320A
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Aug 2021 02:02:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29A8660FD7
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Aug 2021 02:02:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233394AbhHQCCt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Aug 2021 22:02:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233470AbhHQCCr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Aug 2021 22:02:47 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F6D2C061764
        for <linux-tegra@vger.kernel.org>; Mon, 16 Aug 2021 19:02:15 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id d4so38224081lfk.9
        for <linux-tegra@vger.kernel.org>; Mon, 16 Aug 2021 19:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=epNIxrUppPqeTZ7mqYHZ01PA0yMU2Orit2VrfzLmV54=;
        b=do/TU6chvs8vMTkbDooRR2le11a6dh31qQVCxAc7wOduy19pmJbPiDhCLSTW07+CiQ
         lX1UHH+momYHwEekQWF3+aDYU1DQ0RDhN/1yb57l3/MoXLQ4etTEOP8O8ae2lW4AL+Za
         /Ig741ScZy8GeVujaRJFJl1byQr4c0qhzuTIcVYJXj3ZIUlMMV33AdJGfFaVp/35T9Z3
         tLafaUFFsxgE8Ulj2u3UGa1E0VsRWGioUkpZb2KmZTpyjp593sml9+CxDqgkcDkHz7PF
         kqXCCJ2qSOebx4BN7sn/BIN967CvGzUVYuiVUzk063GET/0akxTM9iiSpfRNlLzKhfcU
         OYqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=epNIxrUppPqeTZ7mqYHZ01PA0yMU2Orit2VrfzLmV54=;
        b=tvquA1aHZiaN9mdSFzgMhZGpiafQeKv8oJiRX5sIUCc0cqgewNSsW46KljZh83Yxy9
         oLlR8m+sG75Dya6t7ESHXi+nObbPGA2SWYBleB7F2sfDG0b7DpsOxC3AEXYLcfTvRaxA
         wW6m1/uC33A70qyYTbc/7Wtte3OhqPdyJeN3ZzPfW7SeI2+FIjCqBT6GOMASNkev6eym
         G3X1yXBrLBzLByDJTMJUVFD8YBQNjx59IryJfUsXCvPmCEFOOIzd0gUrDBExHl6ODrKS
         jAAsIh4lDAJ25YknhGA5NWbl/RhhjCt6qbT68K4T46g7EIflx3aapCgi51I3QQgMarng
         CDdw==
X-Gm-Message-State: AOAM533LWTTFzUMISZQeUe++oX/+9KHnkEUBgu5BkX0ErcyUkeg7FPLX
        Q8VrMDHY9Q5B0Mpyagyz7tY=
X-Google-Smtp-Source: ABdhPJwkJ2gDPVNWO4IqYvAkxmWMhu2XsrbQEMpDkRgki8Oh4US6ZUSIQkq7gq/j1HoSU2SPC5P74Q==
X-Received: by 2002:a19:760b:: with SMTP id c11mr577972lff.224.1629165733949;
        Mon, 16 Aug 2021 19:02:13 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru. [46.138.85.91])
        by smtp.gmail.com with ESMTPSA id i24sm51729lfc.293.2021.08.16.19.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 19:02:13 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 2/3] drm/tegra: uapi: Fix wrong mapping end address in case of disabled IOMMU
Date:   Tue, 17 Aug 2021 05:01:52 +0300
Message-Id: <20210817020153.25378-3-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817020153.25378-1-digetx@gmail.com>
References: <20210817020153.25378-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

All jobs are failing on Tegra20 because it doesn't use IOMMU and mapping
function uses size of mapping that is zero instead of BO size, fix it.

Fixes: d7c591bc1a3f ("drm/tegra: Implement new UAPI")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/uapi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/uapi.c b/drivers/gpu/drm/tegra/uapi.c
index dc16a24f4dbe..690a339c52ec 100644
--- a/drivers/gpu/drm/tegra/uapi.c
+++ b/drivers/gpu/drm/tegra/uapi.c
@@ -222,7 +222,7 @@ int tegra_drm_ioctl_channel_map(struct drm_device *drm, void *data, struct drm_f
 		mapping->iova = sg_dma_address(mapping->sgt->sgl);
 	}
 
-	mapping->iova_end = mapping->iova + host1x_to_tegra_bo(mapping->bo)->size;
+	mapping->iova_end = mapping->iova + host1x_to_tegra_bo(mapping->bo)->gem.size;
 
 	err = xa_alloc(&context->mappings, &args->mapping, mapping, XA_LIMIT(1, U32_MAX),
 		       GFP_KERNEL);
-- 
2.32.0

