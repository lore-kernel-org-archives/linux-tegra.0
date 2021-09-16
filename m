Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FDA9C433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 16 Sep 2021 09:44:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 35DCD6112E
	for <linux-tegra@archiver.kernel.org>; Thu, 16 Sep 2021 09:44:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235287AbhIPJpj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 16 Sep 2021 05:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235886AbhIPJph (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 16 Sep 2021 05:45:37 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD3EC061574
        for <linux-tegra@vger.kernel.org>; Thu, 16 Sep 2021 02:44:16 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id w29so8443965wra.8
        for <linux-tegra@vger.kernel.org>; Thu, 16 Sep 2021 02:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YNTwPa/ukwHAcbgK2EYvlx/6J9Qtj3bcwUG5UpA/d2I=;
        b=anJu+GdJ8r7IReQ665UT8EERus72GUMwf1yvdHTS2IlI2pHriRXoB/34UAxRiphlwl
         JzLBYNs0fyNzx5OBh5bBAuvAIVnnfx2IS4ovbidZWZ86fRZyft08l46rnyqfQQauQbbo
         +9azNaB4+GWT5mVwiMO6bm7nMb4aChNp+pQWCmRLvWl65loZJu22/mfo4kt86tYXAOp/
         h6+cpIrciahI2L0ilVmhbsmsWYhshOuDznhRIlXrRW7R5FF8Vv4atHyvs/DFVHgT7rMh
         LdPfDdHo/tf2sXbqAXgbUL8GrX0dYOxt0nVoN+AKSX7Tc7NDbKd6J9IR3v8dWaCeMqMX
         jtpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YNTwPa/ukwHAcbgK2EYvlx/6J9Qtj3bcwUG5UpA/d2I=;
        b=DfJuM+Ij/j4oA3j7+xCcGU0rigIqXkJG8nCHAIFkCnRnIF2gZlmVGp9JNzZOPzYDTf
         ge643W6byxvqAkJGwTB3cCGWyZJUB9NEkN9725bCHSlsQmbJBdT21gR2w+Q3oZVn01F8
         lISXrsCjcSOLBJhK/i/xOvSVythb/CkM6EhCikW3kZxEWhDzYor1Dd/R7/g4cVb2qGVu
         N35svNpzKqXcdqCcJPrXi0/8GYM3o5XIOWD+eT2ay5zY0witYpq/rD0PqYlOc8ILmK6M
         b5tTdRalauW0w41NO4XMtnzpg5Iqs7zrQfL8/SgXrY7pR3xJF1uuLV6Ewv7+NFSMah86
         Z8jg==
X-Gm-Message-State: AOAM5312o/+OHeFZGusZfBX7UMH8RgEtZHthQ0EC4dytWEfwnsbJ5jJC
        vpPWqn2X5Ji0b1lY+Yhrd5U=
X-Google-Smtp-Source: ABdhPJwPuz8gEAC0746r3Y3IKxW8MlamGVTG350FENP6Ra/koXN8UO2RtdrH4mkGco4tvISej/VR/Q==
X-Received: by 2002:adf:e643:: with SMTP id b3mr5050574wrn.67.1631785455292;
        Thu, 16 Sep 2021 02:44:15 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id l2sm7435374wmi.1.2021.09.16.02.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Sep 2021 02:44:14 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 4/6] drm/tegra: Do not reference tegra_plane_funcs directly
Date:   Thu, 16 Sep 2021 11:44:02 +0200
Message-Id: <20210916094404.888267-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210916094404.888267-1-thierry.reding@gmail.com>
References: <20210916094404.888267-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Instead of referencing the tegra_plane_funcs struct directly, use each
plane's vtable instead. This makes it more future-proof in case any of
the planes ever use a different set of functions.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/dc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 16c7aabb94d3..2025b18d2f63 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -1267,9 +1267,9 @@ static struct drm_plane *tegra_dc_add_planes(struct drm_device *drm,
 			err = PTR_ERR(planes[i]);
 
 			while (i--)
-				tegra_plane_funcs.destroy(planes[i]);
+				planes[i]->funcs->destroy(planes[i]);
 
-			tegra_plane_funcs.destroy(primary);
+			primary->funcs->destroy(primary);
 			return ERR_PTR(err);
 		}
 	}
-- 
2.33.0

