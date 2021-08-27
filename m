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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EBC6C432BE
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 13:23:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 67D3160F91
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Aug 2021 13:23:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245413AbhH0NYW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Aug 2021 09:24:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245305AbhH0NYV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Aug 2021 09:24:21 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 589D8C0613CF
        for <linux-tegra@vger.kernel.org>; Fri, 27 Aug 2021 06:23:32 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id x2-20020a1c7c02000000b002e6f1f69a1eso9217382wmc.5
        for <linux-tegra@vger.kernel.org>; Fri, 27 Aug 2021 06:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o8mdIOwahhFdiNA5X6/gDD8mBdCYOOyNMhKUr7Zcw/4=;
        b=SKWYo4ZfKSasEa8hZF1E/hHTPpmHWlbuZQLZJ+iT79SiL6ITKyee8N4uBHwXtDqkCE
         pDBXhUmA1lUI+E2aBTPi+GupTO8c73tJ3NoByHgWNoncALNRqbaCgmdGqw++2tFZPVtT
         +EGY6gmlSK1AM8dIm6JR2LLH7ZNxt8r72QDWPgit+1iRsgG9ca+T1xW5yriXbB8l3uVT
         rLmxWukxSnCl1RDCNzpPJf9g3j7ZVN1Ns/PuV7m/0omhcQtyBt9xAG1NCyKyN6RKs2OE
         AvKiWFqSHEmP1yZwNamRet343P95pQfwZ3sHC2GwqCQnRCl4S8WDg6CJQZC1ioDxrHeJ
         +clw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o8mdIOwahhFdiNA5X6/gDD8mBdCYOOyNMhKUr7Zcw/4=;
        b=n9rua9squZEnxe+ET7SB20Dxb2dcq/j/omUeXZS/zV0n0cTlN2qQ/0yZDosqy6ulQC
         rCgQ3eyD0S16E/2BgLwh7AGtOOpWkKjcQlYmY9AuBMlq8TZ3qfzGF62/W6FKCZ2+5X8b
         DRAYykkUOJLVAo3qgHTXxMgLjv7MlKrHdgEhzW5fnvfQ1CUQIBf1klVcypYoxnM9Rrk6
         7P36I4ybNiJzYfMLD4KVR8cTS55WG8/BT20Viywzcx8zkw0ObjdKj+HFJKBJ9BEQnZzO
         FX9Gf6L7f9SYs5u1segJHiY+zUe/P5MCIeIZ9GRlw+bNle5vfZYorw1Bqou5p3iJBSlL
         d3Vg==
X-Gm-Message-State: AOAM533DtMgCDsoDOcTK3J8vP6bkl6c3YCoelkXqf0BX26hePI3m2SdT
        KeWhrL9zApqlbXZF6euEvqQGnpVlTro=
X-Google-Smtp-Source: ABdhPJxOEDZH38jbtvMLfMGw/+4SOUCK0iBXgQLvCJ8UJZqeLaAnIerE/iHeGiu0d/HGDD8ZmS99mg==
X-Received: by 2002:a05:600c:414f:: with SMTP id h15mr19650303wmm.66.1630070610950;
        Fri, 27 Aug 2021 06:23:30 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id n10sm6292895wrw.76.2021.08.27.06.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 06:23:29 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH libdrm 10/25] tegra: Include private.h in list of source files
Date:   Fri, 27 Aug 2021 15:22:50 +0200
Message-Id: <20210827132305.3572077-11-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210827132305.3572077-1-thierry.reding@gmail.com>
References: <20210827132305.3572077-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This makes sure that the proper dependencies are created and that the
file is distributed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 tegra/meson.build | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tegra/meson.build b/tegra/meson.build
index edddf72bc0e7..9813d9baddac 100644
--- a/tegra/meson.build
+++ b/tegra/meson.build
@@ -20,7 +20,12 @@
 
 libdrm_tegra = library(
   'drm_tegra',
-  [files('tegra.c'), config_file],
+  [
+    files(
+      'private.h', 'tegra.c'
+    ),
+    config_file
+  ],
   include_directories : [inc_root, inc_drm],
   link_with : libdrm,
   dependencies : [dep_pthread_stubs, dep_atomic_ops],
-- 
2.32.0

