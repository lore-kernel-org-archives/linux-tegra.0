Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A15C43219
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Nov 2022 18:41:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234569AbiKQSk7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Nov 2022 13:40:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240548AbiKQSk5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Nov 2022 13:40:57 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ED577FF1B;
        Thu, 17 Nov 2022 10:40:56 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id a5so3831098edb.11;
        Thu, 17 Nov 2022 10:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KBWaH/vKohLUzSe6QLXlh4Mx7QgSFZjyZMz+JYtKxxI=;
        b=PN2H4XymqqWem8S5cTcjWj54sE7zShRhQiFrsQNFZmaqE4nDDPF+zx1c/CGLFv2OSy
         3Gswa2GOYRqjT76c748Qwv9+8xkpJ8/cRmmME4jfzEt9cT5e9FDF436nO11EQ6QzGdih
         KLWGcIHS8regNMFEAkWFvgEmOdmqBduf/vLBjRP+LlMPBmM4im0dIXJv8dhxbFF82WID
         rvhXXAMbBcbNEfnREGGf636/VVz8o0mi4XCKYk6sioZWhM8v3XxqNe2zU7H/m+j/bqqR
         pmP9S9PfENRTyn99XM6bP4pJf+D54gYGqXBRWRd08QTQRk6cCJzD/adaeTiP2gsR5K9b
         Wb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KBWaH/vKohLUzSe6QLXlh4Mx7QgSFZjyZMz+JYtKxxI=;
        b=0jjSR91gJf03BZemvHefrvWooAoipXR82H8mzKV55BstQV7HgV6meb3pffKpfDgv0K
         9OiQd4Z4wYdDtLxY/kAETIoz9fWCEOGO/NBPICdw9pwjFLFhzb8tC/Y9AJ1XShXOzy9e
         KADX5Wux2zCVQRlYQm1RxD2Zw/TdVtxsgWqjAc6TF9G15OAz+HEd2jAaex2D6p5aXBU6
         H6YsayCTn8+AWqvAufv79BguaUC1/U9ilNs16LgdUeVTrz619gax06upo5HmT9EKzOz5
         wIil1s19+w+4apLadu14KPY6uW/KmANkuaANbMbSo/x7jpcdS2QeHB9XhLB3DR1EJhLv
         qhaA==
X-Gm-Message-State: ANoB5pmiSjq4F7QqLZDlZWEs/DWIHMVjBELL6U9GmdxwiCpMULRc/bpc
        pgvpy1Ozgmqf+Ksyc0HfD20=
X-Google-Smtp-Source: AA0mqf77/+b+VHZt2iTNuQJF8SBFQKPCJUFtQbHHRL8xCl1iwGBfNl9qWYmvSkfDDyQ+w91qlTVhiQ==
X-Received: by 2002:a05:6402:5412:b0:460:e19c:15a3 with SMTP id ev18-20020a056402541200b00460e19c15a3mr3432932edb.252.1668710456001;
        Thu, 17 Nov 2022 10:40:56 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 8-20020a170906310800b007aee7ca1199sm730053ejx.10.2022.11.17.10.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 10:40:55 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 7/8] drm/simpledrm: Support the XB24/AB24 format
Date:   Thu, 17 Nov 2022 19:40:38 +0100
Message-Id: <20221117184039.2291937-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221117184039.2291937-1-thierry.reding@gmail.com>
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add XB24 and AB24 to the list of supported formats. The format helpers
support conversion to these formats and they are documented in the
simple-framebuffer device tree bindings.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- treat AB24 as XB24 and support both at the same time

 drivers/gpu/drm/tiny/simpledrm.c       | 2 ++
 include/linux/platform_data/simplefb.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 7f39bc58da52..ba1c2057fc65 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -483,6 +483,8 @@ static int simpledrm_device_init_regulators(struct simpledrm_device *sdev)
 static const uint32_t simpledrm_primary_plane_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_RGB565,
 	//DRM_FORMAT_XRGB1555,
 	//DRM_FORMAT_ARGB1555,
diff --git a/include/linux/platform_data/simplefb.h b/include/linux/platform_data/simplefb.h
index 27ea99af6e1d..4f94d52ac99f 100644
--- a/include/linux/platform_data/simplefb.h
+++ b/include/linux/platform_data/simplefb.h
@@ -22,6 +22,7 @@
 	{ "r8g8b8", 24, {16, 8}, {8, 8}, {0, 8}, {0, 0}, DRM_FORMAT_RGB888 }, \
 	{ "x8r8g8b8", 32, {16, 8}, {8, 8}, {0, 8}, {0, 0}, DRM_FORMAT_XRGB8888 }, \
 	{ "a8r8g8b8", 32, {16, 8}, {8, 8}, {0, 8}, {24, 8}, DRM_FORMAT_ARGB8888 }, \
+	{ "x8b8g8r8", 32, {0, 8}, {8, 8}, {16, 8}, {0, 0}, DRM_FORMAT_XBGR8888 }, \
 	{ "a8b8g8r8", 32, {0, 8}, {8, 8}, {16, 8}, {24, 8}, DRM_FORMAT_ABGR8888 }, \
 	{ "x2r10g10b10", 32, {20, 10}, {10, 10}, {0, 10}, {0, 0}, DRM_FORMAT_XRGB2101010 }, \
 	{ "a2r10g10b10", 32, {20, 10}, {10, 10}, {0, 10}, {30, 2}, DRM_FORMAT_ARGB2101010 }, \
-- 
2.38.1

