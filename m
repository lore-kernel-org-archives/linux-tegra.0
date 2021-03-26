Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F7E2C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 14:52:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 777C5619C9
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Mar 2021 14:52:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbhCZOvc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Mar 2021 10:51:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbhCZOv0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Mar 2021 10:51:26 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31120C0613AA
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 07:51:26 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 12so3122569wmf.5
        for <linux-tegra@vger.kernel.org>; Fri, 26 Mar 2021 07:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1jY8mwnQnAeWLndXGjoVPFOh3LwZ9LMn1afxTK8ioYU=;
        b=cYq7anr9I5TabG+pA/dIDgs1ukMI/RJ5lyFqfgAVps2FCdtEjfXm1GStbQpi2qXjZS
         ySsNNfwQApaE20yjFGrODOhPG5agByHc+eadWqk55iEZNZ5wh6XJ7JXXLuI6xEMzortj
         pcL/O+JETN9SYJgQEbFVXB4K/C2RD0THr8R6PrhRdvLC8X9nZochrfTc3mCZxoXbc4hh
         mr9ABiBh66SO58+xocwUbq00OB1hPqf5fS6FOYwRjFWdC+TkZRNIDdb5sC9+Buv7byF7
         al3ZanAVPb/V6B6jdB+U7FyyNrQqFuJwnc2xTQSwtoIJviE8Y1JeB2u7wIqVunNRVfzk
         QyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1jY8mwnQnAeWLndXGjoVPFOh3LwZ9LMn1afxTK8ioYU=;
        b=i4h7usGy7Dedg0eexDh8LTR+zcC4kl/uj5/HcYfZn06Ga5E4i7E8MMJoH/kNlkTa7A
         NZGd1IuTIwKJtsOKBZq1uI6Vw5BdcY2u3xLSCMb8TEdJd77sqAy0Ye037dHp5uS2zmGP
         TpmTLVMc8pFYXLDbxwiCdpHIpcrhe9dRG4YqwkXH0hQPh4ZIODV0yHJqK5h4xRHJNBXr
         8iipYUdTimna1tUM3w2Ur8Ez8t2kOEOuHMORf/D6IBd1qQEXKTIynB9w25Ct60fyUcaF
         0RlgHe0sS8QFbClTBGXeAvxgG8Mk7S0oMGhBUqQ++WRYMK8gXnlMI1C3+Qt4h6r31UJX
         j0IQ==
X-Gm-Message-State: AOAM5333c/00E5Q5erof9Wn8RUfC9en5P4RU2S58MKg5jfRWY1fJr76z
        3xMBAXNDACoXjdT4ZMKlHiU=
X-Google-Smtp-Source: ABdhPJwLGnx999mXR/dfcnAYVGLYaE5B2HwvvEGVFtaZgHK51cReNLWGwGqZh/E9awvbrmVp/RyPdQ==
X-Received: by 2002:a05:600c:290b:: with SMTP id i11mr13888176wmd.129.1616770284982;
        Fri, 26 Mar 2021 07:51:24 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id m11sm13001228wrz.40.2021.03.26.07.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 07:51:24 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <mripard@kernel.org>,
        James Jones <jajones@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Simon Ser <contact@emersion.fr>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 01/10] drm/fourcc: Add macros to determine the modifier vendor
Date:   Fri, 26 Mar 2021 15:51:30 +0100
Message-Id: <20210326145139.467072-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210326145139.467072-1-thierry.reding@gmail.com>
References: <20210326145139.467072-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

When working with framebuffer modifiers, it can be useful to extract the
vendor identifier or check a modifier against a given vendor identifier.
Add one macro that extracts the vendor identifier and a helper to check
a modifier against a given vendor identifier.

v2: add macro to extract vendor ID from modifier (Simon)

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/uapi/drm/drm_fourcc.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index f76de49c768f..64f01bc2624c 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -366,6 +366,12 @@ extern "C" {
 
 #define DRM_FORMAT_RESERVED	      ((1ULL << 56) - 1)
 
+#define fourcc_mod_get_vendor(modifier) \
+	(((modifier) >> 56) & 0xff)
+
+#define fourcc_mod_is_vendor(modifier, vendor) \
+	(fourcc_mod_get_vendor(modifier) == DRM_FORMAT_MOD_VENDOR_## vendor)
+
 #define fourcc_mod_code(vendor, val) \
 	((((__u64)DRM_FORMAT_MOD_VENDOR_## vendor) << 56) | ((val) & 0x00ffffffffffffffULL))
 
-- 
2.30.2

