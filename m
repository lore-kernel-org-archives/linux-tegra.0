Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3303FC433F5
	for <linux-tegra@archiver.kernel.org>; Wed, 12 Jan 2022 08:48:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351749AbiALIsg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 12 Jan 2022 03:48:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351742AbiALIsf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 12 Jan 2022 03:48:35 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 890DDC06173F
        for <linux-tegra@vger.kernel.org>; Wed, 12 Jan 2022 00:48:35 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id a5so2833905wrh.5
        for <linux-tegra@vger.kernel.org>; Wed, 12 Jan 2022 00:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RSPnyrRswexikOyiWIHNeiaTOVsRKfEItQusWN5Uic8=;
        b=cDMMDbCjvMkpAxzjaDysSyRi3J0mJWxBU8rnfU5xn/dVUh+6WSPICfuVzEJcG9nlky
         38tpSLHGG8kubFVdh4SSaeFYgs+IyNi4feq+gZOzz+xvG+iLaQNG5RzzxsHRlZ1spDwJ
         yz2JNiaHdGpeM8jjTlrVLWc49gsm3eB1AoiUME2T4e6POFKRwqFvWJ+t3YHglt9uOCr4
         SEdWvqG7iF/9Ond5Ktxex9VCillYxvWcsxwg5IMVA98l+qCeJTM8mZXVoUobqaixIrbn
         uYWbT6FZ1OiE4Ohekt5/VER0hQLXj7OZ0fHNeQIRfs3ySwxEZQmRv9akjCae4Vb+XWaF
         stbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RSPnyrRswexikOyiWIHNeiaTOVsRKfEItQusWN5Uic8=;
        b=xJY5kCjqZkc1wxcHwhCtlwMl9NuXGs0MjVBCWLt1S4yfN3axHhlzSSgbqkOJ5cdiWO
         hYM7zkEEXNCaIUv3c+kx7PnvCT92PuSY+MJb1vho9ABrFHV2GFyklZ6xkr8Q4+XWO8x0
         pt0h4k+jxatgEaglJdeUcdCB4/cEqBVYs/rSQoajde2N+rop/RqVFPYm58EWB/+NxvZj
         ronaDKBjII2Tj18HjRAGzJymf7ed4VOO9+5RTtDoNabtjG4DvEQQZ9uSuAPeVsTpgKHL
         AIQyP6fuYUAeW4cb+vFHWED0X6JalVodx3fP4yqiSomO4NMUbDs1aoVdDFcPVJzO+wId
         NFiQ==
X-Gm-Message-State: AOAM531Fh5MbzQw2bORfZg1sYATRPeOFWdsL6fom+zxW7oXwAwwa3WaT
        sVEy/k7UseigGdpAac1Tz5s=
X-Google-Smtp-Source: ABdhPJxA/TepMw2dd111vuDL70ElA1lcEhts9RoXOBo6RLQFkDyLXMy0etqdaiTSWp8S9Kj4PmqCPg==
X-Received: by 2002:a5d:5342:: with SMTP id t2mr6438232wrv.215.1641977314138;
        Wed, 12 Jan 2022 00:48:34 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id p62sm3686207wmp.10.2022.01.12.00.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 00:48:33 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Maniraj D <md@nvidia.com>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 1/2] drm/tegra: Fix planar formats on Tegra186 and later
Date:   Wed, 12 Jan 2022 09:48:27 +0100
Message-Id: <20220112084828.230780-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Use the correct pitch when programming the DC_WIN_PLANAR_STORAGE_UV
register's PITCH_U field to ensure the correct value is used in all
cases. This isn't currently causing any problems because the pitch
for both U and V planes is always the same.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/hub.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/hub.c b/drivers/gpu/drm/tegra/hub.c
index b910155f80c4..fc9813e6b2c9 100644
--- a/drivers/gpu/drm/tegra/hub.c
+++ b/drivers/gpu/drm/tegra/hub.c
@@ -673,7 +673,7 @@ static void tegra_shared_plane_atomic_update(struct drm_plane *plane,
 		tegra_plane_writel(p, upper_32_bits(base), DC_WINBUF_START_ADDR_HI_V);
 		tegra_plane_writel(p, lower_32_bits(base), DC_WINBUF_START_ADDR_V);
 
-		value = PITCH_U(fb->pitches[2]) | PITCH_V(fb->pitches[2]);
+		value = PITCH_U(fb->pitches[1]) | PITCH_V(fb->pitches[2]);
 		tegra_plane_writel(p, value, DC_WIN_PLANAR_STORAGE_UV);
 	} else {
 		tegra_plane_writel(p, 0, DC_WINBUF_START_ADDR_U);
-- 
2.34.1

