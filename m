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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ED2AC433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 15:55:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F476619CD
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Mar 2021 15:55:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232803AbhCWPyk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 11:54:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232806AbhCWPy0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 11:54:26 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F3FDC061574
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 08:54:25 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id ce10so27917558ejb.6
        for <linux-tegra@vger.kernel.org>; Tue, 23 Mar 2021 08:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ttCD6uCX5tFeOHJNIPofy4nwJsMNY2bP8hvgcMSOHFU=;
        b=Teog51hXf+U5LdhrN1Q17doEvCKL84mSY7vWRBetExH5CXL+TG0Z2l/cKWD8lBZh5m
         y/Z9WYcKeW+pMDBc0UR5uduNY7e7RdcDRV9/40hq7DHVZXHeGMMQuaVVxuUK+HfEjt/p
         qOipRFboiB4Yq69jLCaTeN4uGLt98hxz2gtPETXydBz7jePyWzBNJs4y3FP/EMQXPUXZ
         zf/OkAVlVK/2QTxnAwswtMpfYf4eNGiKBjl0LREXafjOVOPrGWJVQxl4eovl2U9OWNeS
         CxRBAYafhW53CnsOP2NJLl2UYeNs8WRxNFU6UYncPdE8srfBCvsfljmpUqSQ1ZhAiG23
         GiHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ttCD6uCX5tFeOHJNIPofy4nwJsMNY2bP8hvgcMSOHFU=;
        b=ocxShWVXbZxR3DxTgp09LN6zL5RW+LrGwAz0A9a38xKo8v8T/tcKF4xBpAV+xEX5jy
         AQZARewD/HcIVEyF04VtGVozRyOA3ASMdkxdIGI+BJwkgM95pNxHTidY4d3NpDqoMbYB
         U6xrqETHXqW6/6hjx/snVJ5FYbEcbtoWTu2udpRvN4GK+XRx/NGbXiNTCHn9M3a4HmJc
         zD//y7ovcCc5sV3aYdih9X442o8cjWK6Fpc0pChg0Z0IwlY14I6Cwu23pDC1QZH6CtKy
         acDMJl8L6Jm9qYDzX8Yl3kVoIA+uzkE5ltWo9tJPwbjwwnq3Cba1S6BIofni0LBIalwO
         obWg==
X-Gm-Message-State: AOAM533z+rs9CGHnKeVmCIGSd9hcErECDuJ/5i4L+O9LYukKlfG0AcXm
        30dXfSndrJzlkqy42Nhynp4=
X-Google-Smtp-Source: ABdhPJxEkR+OjzJB2FpCESzwpXM5NSRSJPKHgeSFb5twIZw/J5vwiPJQQLzHJZTeEJNL6mWGDWLsOw==
X-Received: by 2002:a17:906:a1c8:: with SMTP id bx8mr5406071ejb.381.1616514863951;
        Tue, 23 Mar 2021 08:54:23 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id g7sm6973977ejw.51.2021.03.23.08.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 08:54:22 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        James Jones <jajones@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH 1/9] drm/fourcc: Add macro to check for the modifier vendor
Date:   Tue, 23 Mar 2021 16:54:29 +0100
Message-Id: <20210323155437.513497-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210323155437.513497-1-thierry.reding@gmail.com>
References: <20210323155437.513497-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This is useful for checking at runtime whether a given modifier is from
a specific vendor so that any vendor-specific parsing can be done.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/uapi/drm/drm_fourcc.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index f76de49c768f..567fd4566e08 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -366,6 +366,9 @@ extern "C" {
 
 #define DRM_FORMAT_RESERVED	      ((1ULL << 56) - 1)
 
+#define fourcc_mod_is_vendor(modifier, vendor) \
+	((((modifier) >> 56) & 0xff) == DRM_FORMAT_MOD_VENDOR_## vendor)
+
 #define fourcc_mod_code(vendor, val) \
 	((((__u64)DRM_FORMAT_MOD_VENDOR_## vendor) << 56) | ((val) & 0x00ffffffffffffffULL))
 
-- 
2.30.2

