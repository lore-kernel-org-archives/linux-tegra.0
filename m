Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71BC1C27C7C
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Jan 2023 17:31:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230336AbjATRba (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Jan 2023 12:31:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230217AbjATRbX (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Jan 2023 12:31:23 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6950AC63BE;
        Fri, 20 Jan 2023 09:31:15 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id h16so5455079wrz.12;
        Fri, 20 Jan 2023 09:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZwFqfU6/YlqXS0KBaaVZd4JCQGAwP0xqxEd37sKS24=;
        b=ZraDywh9d7ehyDd9uKX3TzphmkT+E5LNT1jeGuMQiAwElzDgSj32j/nA8VVs53vtxb
         DIs82zif+vzWKP7v+s/OuPziFrvvXXt5szsSjD4j8FsDTLrZ9AHKuRco4wHJCbA4+Bw3
         S0b00m67OTdztpqXchCIY5nc5ds0HV7jYmvtNersWalRGSREGllMl9GGvvgboBCuXGg5
         kWld85tqFRFu2sNSSKSG1wnTGsiDFSRSpivVwHyTkp1TLGxBbim8VlO/2ecc745x+bnu
         sBusHCcwNWB7nLCGGeS+nvF0ciOEfBkGaw+Vvxbgjy302bRCbIpJk/dEigJ2Y5zKCAIM
         z7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZwFqfU6/YlqXS0KBaaVZd4JCQGAwP0xqxEd37sKS24=;
        b=OdtJubQY7stBt26Mbq0vdYJ4QIvLqOhLtbjjKRIdvGSubH43kBI3ji26bdeco3wErK
         Y7acmfTMbv4q1XjkHYP0fUPuT7hRRmOYyeahQUv0vilwp9Akdd0r9NW/gRgmIyGDYfKR
         OPY3P2NkJp+/cqIOZWirD+2Z8DDsTJLQzUq4Luw7eNDNZTduwP79EIFcFGrJycuuTSzw
         UhcBHo3W0msL26j2lYahw43pXCFjzAmPfOUX+b1zJIbtpvT5aILbyrNj3aXEHuVfXOJC
         xrPR79H8MQwoGfSDeFwBLfLVRmCmWG8aIipwNNLPhoqV4iS1ij8N3/roAFgUL8NYTeWT
         ySFA==
X-Gm-Message-State: AFqh2kqLJeGDy4hY0DpUwFrHVY4HWPztUHNjQRT8rg59dgZXmyei3l8l
        bHkp5S4JSAqRdBp7aEJgj8bxo0BabdI=
X-Google-Smtp-Source: AMrXdXvjz/KDGIlKl769j7Os1enZRYBV2a7KiNGRFtoo8j34hnu9C0I3CKnEFtbtc2qSZ9NCcV11hg==
X-Received: by 2002:adf:ec88:0:b0:256:ff7d:2346 with SMTP id z8-20020adfec88000000b00256ff7d2346mr13712276wrn.51.1674235873809;
        Fri, 20 Jan 2023 09:31:13 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id g11-20020a5d488b000000b002bc7e5a1171sm29510955wrq.116.2023.01.20.09.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 09:31:13 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 7/8] drm/simpledrm: Support the XB24/AB24 format
Date:   Fri, 20 Jan 2023 18:31:02 +0100
Message-Id: <20230120173103.4002342-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120173103.4002342-1-thierry.reding@gmail.com>
References: <20230120173103.4002342-1-thierry.reding@gmail.com>
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
Changes in v4:
- rebase on top of latest drm-format-helper rework

Changes in v2:
- treat AB24 as XB24 and support both at the same time

 include/linux/platform_data/simplefb.h | 1 +
 1 file changed, 1 insertion(+)

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
2.39.0

