Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3BEAC4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 26 Nov 2021 16:37:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234710AbhKZQkv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 26 Nov 2021 11:40:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378576AbhKZQiu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 26 Nov 2021 11:38:50 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F09EC061D78;
        Fri, 26 Nov 2021 08:20:01 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id l7so19725541lja.2;
        Fri, 26 Nov 2021 08:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FxP5tB2iw5BzQOiwdyEyNre1QfPs8oOiaNDQeHGYp/A=;
        b=kzlqHTAdAhqx9uMFzd+CS4o7MQx3tt2NukcjKGssEu7kZMdW6fHarWUCrdqGzEAwPl
         fpuAPJ+zod57zNo+qtkm16mdGqs0Lh7iJJmFsIz6PMJ8AdXsA79F7/qVESlXK84AuKM1
         jATo9QykkskeMCYiqB+uKO0bxgT5WZL1Ni6iXRzMNQG1pph0oy763E1aOMuKM2wmLvQ5
         8ktA43IdTnoWWp/YlUGc4H9Jx+6+if72dzmi747LiVxyMPDfwsw+Wwj37c/TWmviZiFy
         1r77P+bQkb8YTtwu0AV9LbDAZQpvvyPyHhjYNAgOY211JJBMx6WUp/3/uGtrlDrdpbf5
         8t8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FxP5tB2iw5BzQOiwdyEyNre1QfPs8oOiaNDQeHGYp/A=;
        b=LuDaon/8mMC2qJyDV6qdmE7rseYmFwTzZ/WN92Cvzreh5fHWfcckqLMFYuzLFPItoe
         gvY1UYsGF+9oZXkGxGQCvb0GzcjiPWvHQsQfiMcBi3SnGqe73rZ5X6xas5rSxj+Rr8ER
         wcYfFt8vqYTYODZip2Sl91em+NuA7Smxs6+mDcqi/hqmsHOD3qRIh5a4+oIfGwUMgmGQ
         QfNZtGEKxnGOjhCo7FtTbSTko4FIq87SRuM5umenioWeJ5b2ngoBP3aV51mZQhWTMu5W
         peTYRRn7Oyose6C4MEjncEsA/uZb1sU2NOtirY5NhSqPie91j0AP6zXIXQuHBT6QSsCa
         3tGA==
X-Gm-Message-State: AOAM531ROoDayFtJvcnl/6N+B26kXFFOxbXzYFYCjGAoRCiCs41kIRMR
        hlGABCCIjGp35qUVXYt5BNaazK4gBEs=
X-Google-Smtp-Source: ABdhPJzxsTtZB9drLrB4WxixNDRQ7Fx6NNECUmkUX+4V5l25QUsz4gPwn3zgWqi6R9W+ucTu1kGc3w==
X-Received: by 2002:a2e:8991:: with SMTP id c17mr30947654lji.361.1637943599494;
        Fri, 26 Nov 2021 08:19:59 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru. [94.29.48.99])
        by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 08:19:58 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Agneli <poczt@protonmail.ch>, Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 19/20] ARM: tegra: acer-a500: Enable S/PDIF and HDMI audio
Date:   Fri, 26 Nov 2021 19:18:06 +0300
Message-Id: <20211126161807.15776-20-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable S/PDIF controller to enable HDMI audio support on Acer A500.
Use nvidia,fixed-parent-rate property that prevents audio rate conflict
between S/PDIF and I2S.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index db388ddd062f..f47b946627c3 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -376,8 +376,16 @@ pta {
 		};
 	};
 
+	tegra_spdif: spdif@70002400 {
+		status = "okay";
+
+		nvidia,fixed-parent-rate;
+	};
+
 	tegra_i2s1: i2s@70002800 {
 		status = "okay";
+
+		nvidia,fixed-parent-rate;
 	};
 
 	uartb: serial@70006040 {
-- 
2.33.1

