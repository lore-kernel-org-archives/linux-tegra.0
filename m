Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7C21C07E9E
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 19:29:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BED08613C9
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jul 2021 19:29:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230242AbhGITcb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jul 2021 15:32:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230191AbhGITca (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jul 2021 15:32:30 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12136C0613DD
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jul 2021 12:29:46 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id f17so13568734wrt.6
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jul 2021 12:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=woytsdeMsSLEt6Q2LUUCjM1OTzgLZo6zg5hihbFLDiA=;
        b=D6l4qCobI+52GX7y18gix33GA/A4mXjgZoy/KsRqGv6+4RZcGjjkUwDtQ/vyf2NPXr
         rO/BHD5bKf87107ikpOQLXQcG2igOsQ4/Tu5y8fqAgxodx/cIELEmmTQymOSw9WGOPR5
         AHk8KmoDNXSvA7P41NwGR2Sr8i8BsB5rRnBXyTmO30Uo6/8tYnZ3iT+YHc6d54MJ3jTe
         7j7Ds7bfBf0SGk06amNKYmh7hBCLbLyiLd7+H5EXL/lAfOyJIKwzwR4Vl0dEuZ/bejAv
         0RaKRMzvpAnBLBsnxmff3z6dUoMRpDOo5fK/8mFp5RqfsI7zhI1exDtgz3c/bD2BMHH7
         btIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=woytsdeMsSLEt6Q2LUUCjM1OTzgLZo6zg5hihbFLDiA=;
        b=Lu7Nzt4nD0g8tVOxoA8/xedmDfmK53PVF2NP+Rr+dWFwqRRfFJYUWSO9WmDn81qvDs
         tbNZJKqFvlQGwLCHUfVLSUOpwJ8Enibl+ZMaprySnu0fu/KqUZh1yxb6J6bugaB5Zpzs
         dYG7Q/FEGu5rqlzbCSMO5oR8dAEOLEs0+vMXXOcwFZLLfVJnnmKGnNIoIkGDgD+DqN7Q
         e8dEMkvq/GAFhtM+B5mJnFN+pm65ppeXrQaz2kvwnWf+ESzNI/vGlt46jR02dJ9zYnAU
         kwzA2IMXqKM7GjdKWuOnE3OKn8S2MyT6npsSqOr2mjQr/r2WZtcMUGk1wwoZdlXKbqfB
         y+Tw==
X-Gm-Message-State: AOAM533++MTaGAFFkwhF3cdrHbgilFX09PcxUZOqquDaM3o7NHFCo1bJ
        dGORvhr8RcE0csJYF5c5Gzw=
X-Google-Smtp-Source: ABdhPJwqz5ruPMQXGdLS4uAiwY75l0FJB+5rb4XzspO0b/yWlo3SGmCRxY9ed1mUsqelmHYbCsSeFA==
X-Received: by 2002:a5d:4d01:: with SMTP id z1mr838536wrt.34.1625858984638;
        Fri, 09 Jul 2021 12:29:44 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id x17sm6256027wru.6.2021.07.09.12.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 12:29:43 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v8 14/14] drm/tegra: Bump driver version
Date:   Fri,  9 Jul 2021 21:31:46 +0200
Message-Id: <20210709193146.2859516-15-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709193146.2859516-1-thierry.reding@gmail.com>
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

Bump driver version to 1.0.0 to allow userspace to detect
availability of new interfaces.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index ae9dafc32c2b..b20fd0833661 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -28,7 +28,7 @@
 #define DRIVER_NAME "tegra"
 #define DRIVER_DESC "NVIDIA Tegra graphics"
 #define DRIVER_DATE "20120330"
-#define DRIVER_MAJOR 0
+#define DRIVER_MAJOR 1
 #define DRIVER_MINOR 0
 #define DRIVER_PATCHLEVEL 0
 
-- 
2.32.0

