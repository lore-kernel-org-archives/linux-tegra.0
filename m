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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90438C432BE
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Aug 2021 02:02:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7132760FD8
	for <linux-tegra@archiver.kernel.org>; Tue, 17 Aug 2021 02:02:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233470AbhHQCCu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Aug 2021 22:02:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233523AbhHQCCs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Aug 2021 22:02:48 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16A14C0613C1
        for <linux-tegra@vger.kernel.org>; Mon, 16 Aug 2021 19:02:16 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id c24so38236200lfi.11
        for <linux-tegra@vger.kernel.org>; Mon, 16 Aug 2021 19:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EHlZUQ8HgfGWcfinu2oIDpWpJRbCk6Twh3QjNslqYr8=;
        b=fs4uFuIARdGUUvUr5JtczJnktriIqQUMwKz1TctsMb3X59FdX2FyyqpMPnbxuG9mU8
         CCic+poj7/DHmq8geyAiaUFaJRNrJNX5wmCdWAlsNbmWKQt7noAgNMhzbkfU6aDXHret
         EL13+/Q00KfmL9OpSOmMIjDOrxKLBx6PuuRA5Hl+K4d1UxSlcI2grgK71XdRkw8vToo4
         nl11MBwRuReJh8LoGJ2MPD+GEfGoqRFyYEVDTCdNH4W7V85uGjWRaqYEoiYJ3IlNH0q3
         Mo9YaSS+PkOsUzpKG6UAlpVr7j6Vzj/VGJmLheXFj99c4bPyTAqizk//I0eYcHX+MpC2
         CVGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EHlZUQ8HgfGWcfinu2oIDpWpJRbCk6Twh3QjNslqYr8=;
        b=s++w73Ux7KoQN0LXyGtaXMwojYiEpnhGILB3rWE+dLjVJZzRSJ0GaIBfXEdyi2WVAp
         qnEROPu1kzlmrgGkREOmxGW/KfgyBRWm0rBCdhyuWbuvwXOVtS7oCvrlN+6CW08Nh0c3
         dDcxJi05sR+h1eMlGCbmUWoyxYR95ugPc1V67nJuTlF2ppU2RK+GH1VScvWROxQEtSZR
         i28yLvsNEzS/ApZU7hH9RzlS2jCmP+wshruMC18AHJIj9NjtiiFoViqdnJZlJY8jXzfw
         6c/jK5UvTt13akybEqgotRBpUd3mJiiWnPshzAfREcE4/13hdbJgs8dPPPP4J7lE4Jrm
         CE3g==
X-Gm-Message-State: AOAM533/3EUrQqbjt0wxLLMKOu+IMfjDkBfS4lgWN362kyl6VoQClatK
        i9+Fy1Z1qTi65wfgoD+HMdE=
X-Google-Smtp-Source: ABdhPJzVZANJW5iSs1X4gKiIvuAT2ZlwwoV9fug2MkAnjpXJYzhlQGYByLpQ6vPcTb80NGpOsNFyzg==
X-Received: by 2002:a19:e00a:: with SMTP id x10mr615907lfg.536.1629165734488;
        Mon, 16 Aug 2021 19:02:14 -0700 (PDT)
Received: from localhost.localdomain (46-138-85-91.dynamic.spd-mgts.ru. [46.138.85.91])
        by smtp.gmail.com with ESMTPSA id i24sm51729lfc.293.2021.08.16.19.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 19:02:14 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <cyndis@kapsi.fi>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 3/3] gpu/host1x: fence: Make spinlock static
Date:   Tue, 17 Aug 2021 05:01:53 +0300
Message-Id: <20210817020153.25378-4-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817020153.25378-1-digetx@gmail.com>
References: <20210817020153.25378-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The DEFINE_SPINLOCK macro creates a global spinlock symbol that is visible
to the whole kernel. This is unintended in the code, fix it.

Fixes: 687db2207b1b ("gpu: host1x: Add DMA fence implementation")
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/host1x/fence.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/host1x/fence.c b/drivers/gpu/host1x/fence.c
index 6941add95d0f..e49083b0b09e 100644
--- a/drivers/gpu/host1x/fence.c
+++ b/drivers/gpu/host1x/fence.c
@@ -15,7 +15,7 @@
 #include "intr.h"
 #include "syncpt.h"
 
-DEFINE_SPINLOCK(lock);
+static DEFINE_SPINLOCK(lock);
 
 struct host1x_syncpt_fence {
 	struct dma_fence base;
-- 
2.32.0

