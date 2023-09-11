Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 655FECA0ED1
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Sep 2023 21:59:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237126AbjIKV4i (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 11 Sep 2023 17:56:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235878AbjIKJo6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Sep 2023 05:44:58 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78091E44
        for <linux-tegra@vger.kernel.org>; Mon, 11 Sep 2023 02:44:52 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-401ec23be82so47234015e9.0
        for <linux-tegra@vger.kernel.org>; Mon, 11 Sep 2023 02:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694425491; x=1695030291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R0/rqbO9zdTuj+XkCrDufr//URbhGp0n8nPQ9514Kz8=;
        b=PUTTscD58RX1mh/d1df8HZM2ilvxGzeYUcpXbZZn0KeldCLUphJTNhPJCBQL6PpAAs
         kN9OZntU1pYI1L+jwHustC+6iegUCtzvlcuw4PmfM0dPEK2DGXzFKuCSo4nHHZDdkbQv
         BOTNuFACAT4tdRuEudWgB86+1GBTiOtlUNuxFGYuHFQOEdu0ToUcmbBc1ftWafOaSfRi
         8k/0TqjeGe6Vkw5noos2QB63990ZS80O1DDa3MRP1yv81+g6iLJZahFrmoWE06COc/CX
         a6E+K13Go1iUeT7mNhpAaIoTuoswIsMagmZZGm5YrMBniPbsSd2tZumjseZT4Ld4r5Mh
         wPgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694425491; x=1695030291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0/rqbO9zdTuj+XkCrDufr//URbhGp0n8nPQ9514Kz8=;
        b=lDPUVXb7iIpAr2ARN+mdVl17Qcxq4/F33yaemjGDFmsu3BeTCJjinlg/R728TUfB2p
         WeA+uvE/l4edNo3OBHbHuWK1ZsznJzO/Vkhvmw9erOu9yGLC4vOpDs2HOf1q17+NSBpI
         0FW+aQhVpdfDof9nAL/51O9JNkSc4Lc7lab0eIrqr5Kr7FX6+ZoY9y63+WevqYz9d3n5
         kCAZWQoGFR1PXbkYASPdF4XUZx07xPzTrcBdBDBEjdJA1fvqq61Q9v2jwwM8g2CHw2VE
         uG++2wKx58BB7Mi4FWCJeztu2Cwyn9qFI32i9/t1yH4J9VzWVdGSyj9yme9V9nzyjSTK
         vo6w==
X-Gm-Message-State: AOJu0YxQKIRoVpzL5huYCH5g6lr5otFGYjbbHhTelajxzRcC2pUj+hj0
        cmcX/H+fxcMazcspnuA6uUS7AEjg0nPiiQbKv1o=
X-Google-Smtp-Source: AGHT+IFoi4Dei8OscALHdqZx2NassPsp3aooQcZ1UAgjVrAk+Jw6ryGdd0bnraeWRUOWi1pzfF528Q==
X-Received: by 2002:a1c:7508:0:b0:3fe:d1e9:e6b8 with SMTP id o8-20020a1c7508000000b003fed1e9e6b8mr8066631wmc.12.1694425490282;
        Mon, 11 Sep 2023 02:44:50 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:c2b1:675e:119e:2497])
        by smtp.gmail.com with ESMTPSA id c26-20020a7bc01a000000b003feeb082a9fsm9627985wmb.3.2023.09.11.02.44.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 02:44:49 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     timestamp@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] hte: tegra194: improve the GPIO-related comment
Date:   Mon, 11 Sep 2023 11:44:43 +0200
Message-Id: <20230911094443.14040-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Using any of the GPIO interfaces using the global numberspace is
deprecated. Make it clear in the comment.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
This was part of a wider series but since this is independent, I'm sending
it separately.

 drivers/hte/hte-tegra194.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
index 6fe6897047ac..9fd3c00ff695 100644
--- a/drivers/hte/hte-tegra194.c
+++ b/drivers/hte/hte-tegra194.c
@@ -407,12 +407,15 @@ static int tegra_hte_line_xlate(struct hte_chip *gc,
 		return -EINVAL;
 
 	/*
+	 * GPIO consumers can access GPIOs in two ways:
 	 *
-	 * There are two paths GPIO consumers can take as follows:
-	 * 1) The consumer (gpiolib-cdev for example) which uses GPIO global
-	 * number which gets assigned run time.
-	 * 2) The consumer passing GPIO from the DT which is assigned
-	 * statically for example by using TEGRA194_AON_GPIO gpio DT binding.
+	 * 1) Using the global GPIO numberspace.
+	 *
+	 * This is the old, now DEPRECATED method and should not be used in
+	 * new code. TODO: Check if tegra is even concerned by this.
+	 *
+	 * 2) Using GPIO descriptors that can be assigned to consumer devices
+	 * using device-tree, ACPI or lookup tables.
 	 *
 	 * The code below addresses both the consumer use cases and maps into
 	 * HTE/GTE namespace.
-- 
2.39.2

