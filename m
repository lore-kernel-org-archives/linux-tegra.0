Return-Path: <SRS0=4JQ8=EL=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 125DDC55179
	for <linux-tegra@archiver.kernel.org>; Thu,  5 Nov 2020 17:59:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AF6AF2151B
	for <linux-tegra@archiver.kernel.org>; Thu,  5 Nov 2020 17:59:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVD0FscP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731453AbgKER7f (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 5 Nov 2020 12:59:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbgKER7f (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 5 Nov 2020 12:59:35 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D27C0613CF;
        Thu,  5 Nov 2020 09:59:35 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id 1so1158444ple.2;
        Thu, 05 Nov 2020 09:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=9R0Npxph68AU7PWFQ4QRZSNA/O3rcswyVG3VJILrsQM=;
        b=BVD0FscPMU4YoqUkiSJgwQkIWgQ1LPWJgaG6bhkws4ZZuwvd5jQyHYnGZw1MpT58LM
         mwviSZzHufvzgRta+8sADHXxn/dh4PlzZ4lvyM8DrkYbUYzZzhrTkIzC5gpokcbkk5SL
         rXnVTqfNUk+AdJZsKyPPXMRcD4spEBg1nqhT0TSFmDN05qpphrlamFNpEeF+5gdqNFQI
         h+XcHRq1FDe0B80uL4qeNr5oAgaSfWsjl3RIzh1Lok9kEJHzKkpEq/C533uRdV1NKEPM
         XTg6tqp8QjmmxOOaRVaMJZ8nKN9kb2Fl3kAcQu6VnbumA1wot/A9ZiztNyrk3WMlgYJE
         eWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=9R0Npxph68AU7PWFQ4QRZSNA/O3rcswyVG3VJILrsQM=;
        b=fJ2cOsr3szdYpKhr2J4Q4GMVEF3XYL/5SLH4O9kw+UxXTQnCv3GatFoquGH3Pq/IRB
         XFVJTes8YlZo47UTc7aq6YcXG466AXVSD+a8uOtEfh8+rVS43LkVM1Nm6FaLiwGfU95b
         Xj2VjJFrHjg1sYGWLo/sLQ82VEiOVNM3UmljKufY8zLKg3DRJ60tnNSAsLI4stmXzD84
         QdH5Rls4FlRtucK0tEsl9sK+RnmiKuZXSavhxYdTKh3q8F3EaAYN6IAMccsop4lxc3Zb
         XMzqu47yyQJA5kQq4CxiatmqevOTas0fiZTgcQYW1mACL3An60Ap7y6NlwG05WJD1f24
         VXQA==
X-Gm-Message-State: AOAM533//OVFWqkWoC95HA1TOWfkNFwl90viHQImU/YOuaE8EnheOmr6
        W1ZVwDEAf6o6Sg6QiMSrc0E=
X-Google-Smtp-Source: ABdhPJzpBzHOyBdbcoJwGu4x2cFAUIHPNF0tW4PfjHkSM901tlp4Uts8ESm2AmMKqTs0Iw8AIWneaA==
X-Received: by 2002:a17:90a:17ad:: with SMTP id q42mr3643832pja.36.1604599174601;
        Thu, 05 Nov 2020 09:59:34 -0800 (PST)
Received: from localhost ([160.202.157.3])
        by smtp.gmail.com with ESMTPSA id t129sm3350731pfc.140.2020.11.05.09.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2020 09:59:34 -0800 (PST)
Date:   Thu, 5 Nov 2020 23:29:28 +0530
From:   Deepak R Varma <mh12gx2825@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     mh12gx2825@gmail.com
Subject: [PATCH] drm/tegra: replace idr_init() by idr_init_base()
Message-ID: <20201105175928.GA42488@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

idr_init() uses base 0 which is an invalid identifier for this driver.
The new function idr_init_base allows IDR to set the ID lookup from
base 1. This avoids all lookups that otherwise starts from 0 since
0 is always unused.

References: commit 6ce711f27500 ("idr: Make 1-based IDRs more efficient")

Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>
---
 drivers/gpu/drm/tegra/drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index ba9d1c3e7cac..e4baf07992a4 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -90,7 +90,7 @@ static int tegra_drm_open(struct drm_device *drm, struct drm_file *filp)
 	if (!fpriv)
 		return -ENOMEM;
 
-	idr_init(&fpriv->contexts);
+	idr_init_base(&fpriv->contexts, 1);
 	mutex_init(&fpriv->lock);
 	filp->driver_priv = fpriv;
 
-- 
2.25.1

