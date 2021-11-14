Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 938B1C433FE
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 20:07:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C65E61152
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 20:07:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234667AbhKNUKm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Nov 2021 15:10:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234480AbhKNUKm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Nov 2021 15:10:42 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE48CC061766;
        Sun, 14 Nov 2021 12:07:44 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id b40so37672782lfv.10;
        Sun, 14 Nov 2021 12:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AkpRlmm9VStWG/9FSC9RiFG1Zeod4XIWPGAv7duUBTE=;
        b=PjQ4peGmad+WSgds8M0XV2NpLMbZmdfcTTKXkxWa2Rihcjk6oNINHI/9VGt8B+sYeo
         Wa4MwE4a7q95OhG+l9SbYtU7nq20TiinBgeDVSkDRw7Ai40WbP/YcX5hA1EmaoEPwsYU
         pOS1L5XxWSjDga9h/naONRKDbsNQc8kcFGESlcAAg+LLALEI1Dq1P60rCqVnh44dnkNw
         9RghuTdUsG1E+KwFMaxawAuhU4pDhS5B4uI9K1pdH1KZDO9F+8FFahYmwPox8a3SD+69
         k5ogDMOGo1JJTLFxupz6ZzrmrM7NIh8hYV1liuSPk1qY83wDSXXYTBCjLYXEf2ktbLQ6
         8pzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AkpRlmm9VStWG/9FSC9RiFG1Zeod4XIWPGAv7duUBTE=;
        b=SM5xSYU343JDKCIIjdaLp1HMTtaouOOGlnB0Hldies39yJcKsghaH8QglXP2XxUwNJ
         1RkjoW+kk6pF//INLZvTi0KNylZleNl2WqKzit7rtBwAjRYQFwU5jbCUaFQbe0w+BQ3U
         jMyQxXjoodRBj22bfcDwAjjifs7ftqnOHjpsU+NlUQpEaWoGW1g2EX7rLS/5M3J0ig4J
         1pd+COBTr9ahDvtB9NGIKhzb8Ql5ntP+wmOZ/FEcEkWhJZDbiap7y3iN+z2xdU7Vk7K4
         LtPlnwqmXQry5cCRcn0EO/w02u/GSfDR6wgEKCoZoumwigoB6zPvsMUUk+AzW2WqZS63
         kEqA==
X-Gm-Message-State: AOAM533UHz5CsJ9HKLyMg9ctQRbNfmvdo3dDsKeOCUmsWF7Zz4/fszXd
        PhnGHOwWRmdrcPu6Sqy61Sg=
X-Google-Smtp-Source: ABdhPJxRrlmzgYLBs1cyCcjph5vdi0HNwlsqJKW2fr1Y0Sz5Qj5qhssjE9F0Y5GxBliN2art+/jhUw==
X-Received: by 2002:a05:6512:a91:: with SMTP id m17mr20960941lfu.690.1636920463400;
        Sun, 14 Nov 2021 12:07:43 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id d30sm1204644lfv.58.2021.11.14.12.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 12:07:43 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Herring <robh+dt@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Anton Bambura <jenneron@protonmail.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] drm/panel: sharp: lq101r1sx01: Support LQ101R1SX03
Date:   Sun, 14 Nov 2021 23:07:17 +0300
Message-Id: <20211114200717.28986-3-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114200717.28986-1-digetx@gmail.com>
References: <20211114200717.28986-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Anton Bambura <jenneron@protonmail.com>

LQ101R1SX03 is compatible with LQ101R1SX01, add compatible to the driver.

Signed-off-by: Anton Bambura <jenneron@protonmail.com>
---
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
index f8cd2a42ed13..bbd1d889e069 100644
--- a/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c
@@ -304,6 +304,7 @@ static const struct drm_panel_funcs sharp_panel_funcs = {
 
 static const struct of_device_id sharp_of_match[] = {
 	{ .compatible = "sharp,lq101r1sx01", },
+	{ .compatible = "sharp,lq101r1sx03", },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, sharp_of_match);
-- 
2.33.1

