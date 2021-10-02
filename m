Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13990C433EF
	for <linux-tegra@archiver.kernel.org>; Sat,  2 Oct 2021 23:35:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E1A0C61AF7
	for <linux-tegra@archiver.kernel.org>; Sat,  2 Oct 2021 23:35:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234195AbhJBXhh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 2 Oct 2021 19:37:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234063AbhJBXhg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Oct 2021 19:37:36 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80983C0613EC;
        Sat,  2 Oct 2021 16:35:48 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id l18-20020a05600c4f1200b002f8cf606262so14663519wmq.1;
        Sat, 02 Oct 2021 16:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5QeZHLVghCs6DLC29cur3iiPtjPr54ogskINtSo0wnk=;
        b=MfwJruBA9/BRaqKP6GZK7cl2lh3Yp38xU24WrGjTNzfPhNgTb4yfCvD8qAekWxzp3Q
         4BHUt6Wl8ek49y1q3ZIBTRxZjrKrh4hAhwPp4Tondezo8ARacBql6nQVkNgwJCfFqCFo
         bz/8CWlOhw8kHrxe3i+KQZWc03PnQY0Ky59vj1YRf4gTuBraalCj2ABHVhouTxUXvoIw
         fW80QjpcQ43DGcAUAmR2u7xBQv1e0SpTK7ncJquF5IzW4zCAESkkq0JcFPMET+KNDkbZ
         1kQnotsCDymIcebfFsuDxzvbviFBUIv1M5KJD8QG0E6uLCAvXNEeWUXS+13zLNE8jRXz
         98RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5QeZHLVghCs6DLC29cur3iiPtjPr54ogskINtSo0wnk=;
        b=2Ld/OiOvuscdqy3Z4cQwV+5kGACTHKZP/ayoXz0WlaISbqPjMoFc2BeXU9Z/TXF1fU
         CGFSCGJ1fLHiZ2JdWRq6N81b/9is9Vp3nkgJ8M7iMQwZDKe7gePhFpM7bJI+CIrNPjaX
         v2wB56/39Z9w/3/bMzgTLqn5GXZ4sAniJlc/2TuUgTflzPE35X4do3/lrZBjtIc/Dbdw
         IvTPT8dxTPHqeQhI5DwdL5D8fk8AQxk8odWc2OI3F8U9zbbK8DjoAwVMD14RrsVs31Xj
         qDOFsK+/0qHxwgtUlaiuGG0o/zsZv6kTTuRr2V3Fau+7Cc2Dfr4wfX45luZRQooCz5LU
         6OjQ==
X-Gm-Message-State: AOAM533an5mrsSd7OBYAF1PP4yf0M6bHiJSPWRXqT5sQT2UEKymXeQ/Y
        nba4QIDEoc4H2xsQMCttwEXH+RQD5Og=
X-Google-Smtp-Source: ABdhPJxLGgYJXFJw+Zk5FrXA+HpKo3BKb28MjcD+RZUrQnYXzFz7caP54CXHVGzXNnX+O3KdmhaHaQ==
X-Received: by 2002:a7b:c056:: with SMTP id u22mr11300886wmc.15.1633217747453;
        Sat, 02 Oct 2021 16:35:47 -0700 (PDT)
Received: from localhost.localdomain (94-29-54-195.dynamic.spd-mgts.ru. [94.29.54.195])
        by smtp.gmail.com with ESMTPSA id r2sm10487089wmq.28.2021.10.02.16.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 16:35:47 -0700 (PDT)
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
Subject: [PATCH v1 1/5] drm/bridge: tc358768: Enable reference clock
Date:   Sun,  3 Oct 2021 02:34:43 +0300
Message-Id: <20211002233447.1105-2-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211002233447.1105-1-digetx@gmail.com>
References: <20211002233447.1105-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The driver assumes that reference clock is always-enabled, but this is
hardware-dependent and not true for ASUS Transformer TF700T. Make driver
enable / disable the reference clock.

Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # Asus TF700T
Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> #TF700T
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index a3db532bbdd1..18ae6605a803 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -237,6 +237,10 @@ static void tc358768_hw_enable(struct tc358768_priv *priv)
 	if (priv->enabled)
 		return;
 
+	ret = clk_prepare_enable(priv->refclk);
+	if (ret < 0)
+		dev_err(priv->dev, "error enabling refclk (%d)\n", ret);
+
 	ret = regulator_bulk_enable(ARRAY_SIZE(priv->supplies), priv->supplies);
 	if (ret < 0)
 		dev_err(priv->dev, "error enabling regulators (%d)\n", ret);
@@ -274,6 +278,8 @@ static void tc358768_hw_disable(struct tc358768_priv *priv)
 	if (ret < 0)
 		dev_err(priv->dev, "error disabling regulators (%d)\n", ret);
 
+	clk_disable_unprepare(priv->refclk);
+
 	priv->enabled = false;
 }
 
-- 
2.32.0

