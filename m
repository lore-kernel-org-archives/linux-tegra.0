Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 074D4C433F5
	for <linux-tegra@archiver.kernel.org>; Sat,  2 Oct 2021 23:35:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E76B261AF7
	for <linux-tegra@archiver.kernel.org>; Sat,  2 Oct 2021 23:35:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234238AbhJBXhm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 2 Oct 2021 19:37:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234235AbhJBXhk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Oct 2021 19:37:40 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CC55C061714;
        Sat,  2 Oct 2021 16:35:54 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id l18-20020a05600c4f1200b002f8cf606262so14663752wmq.1;
        Sat, 02 Oct 2021 16:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MztqkJ6kEnYY3QY22MZAhVkiyYz8DlYPtSLS1AAw8jM=;
        b=GPP3XEmUpER7Jifk5aXhGuB2IdZ9dYWM7+4gi3WqJEH0myRrgZSbhORhiJGETOErNO
         mqiKtnBml/30gMd08kYdCh1ITAopXUgMmrNU05m0QyrMaQawNbEULfg78peHFVn7jZOE
         subtmm/xR+gUDM9TvJt/cLXR23UM/l6oBT+Q3i28zmodk0PSrFdwMRxnhxBYfbckoRV8
         1JRgVdlAyt0u24m0dyghSDKj45c8fODPcR4oDTawtLgetjbncU/z2BJuRKG3ruXEENmW
         UslJfT8iZPJR3mAbdDEOLZxPU4x5NG/awjGmjVwyn0eOOu4fqpNWm5fhcONrIMwlvJ63
         i8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MztqkJ6kEnYY3QY22MZAhVkiyYz8DlYPtSLS1AAw8jM=;
        b=emTg21jcCHWgOEE+hC7UA5PkbgZnNFQ/TSsxIlE2+FfGhh7X9FK/dFl7LWsMTUM5XM
         /eUj57NQKptJ4nLSb4BL9WaGonaGFVLqcNMi/sImfpDi9QR9PaHecqd2vnJ37neUeC47
         VN55MHeIlkRFDe8nmlozEw5pLPsb2PLMDtbnvNyetsCpKjgFo+xYIQkEhY0UbmCXkTR/
         PzA0hXv1EKYtgNf6dKI3hylA3POUE1xEEZBrt9t/HiXIshZcjnEPSOmr4Pk9Tnaolsmr
         wh2ODksM5HoNxEodnRIq1B6CvTEfaCoe0ncryqwAVbWF7b7sbM1hki9+9Frz/bnVs+eD
         c2mQ==
X-Gm-Message-State: AOAM532oWIS9semYolqBJPuf58nVDVOHdtSpKealg0WrSNbkoRYhNoZU
        JhLwZTaVI6GdxbWYf1V2UFI=
X-Google-Smtp-Source: ABdhPJzXoDtZo5DdB8DYLuVGO2v//b+Wp15T0u3Fxi7NnZxoVEihQFQ01yI49bal4m2C9c/LPmWnuw==
X-Received: by 2002:a05:600c:1d0b:: with SMTP id l11mr11350453wms.46.1633217752661;
        Sat, 02 Oct 2021 16:35:52 -0700 (PDT)
Received: from localhost.localdomain (94-29-54-195.dynamic.spd-mgts.ru. [94.29.54.195])
        by smtp.gmail.com with ESMTPSA id r2sm10487089wmq.28.2021.10.02.16.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 16:35:52 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 5/5] drm/bridge: tc358768: Correct BTACNTRL1 programming
Date:   Sun,  3 Oct 2021 02:34:47 +0300
Message-Id: <20211002233447.1105-6-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211002233447.1105-1-digetx@gmail.com>
References: <20211002233447.1105-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

TXTAGOCNT and RXTASURECNT bitfields of BTACNTRL1 register are swapped in
the code, correct them. Driver doesn't implement low power mode for now,
so this change doesn't make a practical difference yet.

Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # Asus TF700T
Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index cfceba5ef3b8..fd585bf925fe 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -790,7 +790,7 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 	val = tc358768_ns_to_cnt(val, dsibclk_nsk) - 1;
 	val2 = tc358768_ns_to_cnt(tc358768_to_ns((lptxcnt + 1) * dsibclk_nsk),
 				  dsibclk_nsk) - 2;
-	val |= val2 << 16;
+	val = val << 16 | val2;
 	dev_dbg(priv->dev, "BTACNTRL1: 0x%x\n", val);
 	tc358768_write(priv, TC358768_BTACNTRL1, val);
 
-- 
2.32.0

