Return-Path: <SRS0=ZsAf=CP=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C774DC2D0A7
	for <linux-tegra@archiver.kernel.org>; Sun,  6 Sep 2020 19:00:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D22C208B3
	for <linux-tegra@archiver.kernel.org>; Sun,  6 Sep 2020 19:00:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFavx8lN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725803AbgIFTAo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 6 Sep 2020 15:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725931AbgIFTAm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 6 Sep 2020 15:00:42 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31DECC061575
        for <linux-tegra@vger.kernel.org>; Sun,  6 Sep 2020 12:00:42 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id k25so13545807ljg.9
        for <linux-tegra@vger.kernel.org>; Sun, 06 Sep 2020 12:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9EkVp+SQ54DpArPaSt11WrAGPImWqCk5bekVsDf8oY0=;
        b=VFavx8lNrdIzf3gllKgUc/XxTVIS/7fdP4DEBUtnbh8pbw0XIQXGPgA4N4reyoO/mV
         SlDivZoLiQaKkIOs1jWjP4X4KdWa/BOGodqVGsmfQiO7+zlB6f49DkYSxU7Lkb7EoE/D
         35ZQi5r2h7jqb7x21NzfldU+MmaGel1BCngLgQ/YorvkL1P5qLtdr75rT/WatLym6SDH
         ZlLymph80CWKqJm11p3zFUjzJaioLX0tjVJrrcbxDVIoyLt+9hxtLxpKi2MzE9t/m2sx
         eJofUrCTIZZK/C9t89pdP0uVMUaJCn/623knsv81zTwjbGMae4tVgGFYxWHtLu8MNBxr
         Yv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9EkVp+SQ54DpArPaSt11WrAGPImWqCk5bekVsDf8oY0=;
        b=mK1nkvECUw9DoELChyUYp7ZtLeBU3YwEUk/YFuKQNVfmb4GSNTYM/dV4uJAD8inWuk
         xk17yGBIDL2bHYIGq9MhXoBH0MHzbruYEpvVNC4vxKzluPJOHLf4tRHEpfdmP+L3VwDB
         rITkHK94RFXyG7lRebzOhiYiGwHI4Wv7gFhQ5XsjtkwWYU82OU+OSP14vgeRriFpWStw
         mKn8oaQsIOGIIByzdwkwWkpFEqqW06f4qUjXmVM+m3GpyqXrl5nNVrsabr/RX6fq1m2z
         oVHYqJi2EimzADAKcwtBBvOYncfVwIbVfx8V+jzicFUd1Tl7xdW2WLAFPzLCIlxLExYR
         uGRA==
X-Gm-Message-State: AOAM532MveBjOh5dVpFlw1yIqc6/SimYtszE0Q0IOmWowdfKzhS8BdNH
        UkS+7CfKl9gZRMtexQSIBeohjJSE9/M=
X-Google-Smtp-Source: ABdhPJwEkSrcSWZYrudljOuNq+ID+aemdDI7UGJoPUO1NVKiegSV8yLVz+N3HiEd2DGCixw+I9lIqw==
X-Received: by 2002:a2e:7213:: with SMTP id n19mr8596915ljc.326.1599418840452;
        Sun, 06 Sep 2020 12:00:40 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id s8sm2900756ljo.11.2020.09.06.12.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2020 12:00:39 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1 3/3] ARM: tegra: acer-a500: Remove atmel,cfg_name property
Date:   Sun,  6 Sep 2020 22:00:08 +0300
Message-Id: <20200906190008.25247-3-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200906190008.25247-1-digetx@gmail.com>
References: <20200906190008.25247-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This property was supposed to be upstreamed, but it was NAKed recently
in a favor to a better approach of firmware loading. It also turned
out that the firmware loading isn't really necessary because it's stored
in a non-volatile memory inside of the touchscreen controller and
previously the FW loading was needed in order to get touchscreen working,
but it actually was a TS driver problem which is resolved now. Hence
remove the unsupported property.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index 8a7a104b3717..1fdf4d59c188 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -443,8 +443,6 @@ touchscreen@4c {
 			compatible = "atmel,maxtouch";
 			reg = <0x4c>;
 
-			atmel,cfg_name = "maxtouch-acer-iconia-tab-a500.cfg";
-
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(V, 6) IRQ_TYPE_LEVEL_LOW>;
 
-- 
2.27.0

