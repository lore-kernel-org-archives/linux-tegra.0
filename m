Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60BC7EE644F
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Sep 2023 09:22:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233592AbjIOJWE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Sep 2023 05:22:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233562AbjIOJVy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Sep 2023 05:21:54 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FA8B2728
        for <linux-tegra@vger.kernel.org>; Fri, 15 Sep 2023 02:21:32 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b9c907bc68so31614201fa.2
        for <linux-tegra@vger.kernel.org>; Fri, 15 Sep 2023 02:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694769690; x=1695374490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0gMxgrLH8hAqI78TYEwxUv2pVCfDSw58e/K0s6X8qpQ=;
        b=m9EHb03qwFkHFRxKPPTBlJC1GPblNh5KWKwqCWZWhUQJbXARoxmIhEC+XHs0gbdMUM
         FjVH9pV5FO4nm/eINjHGt3vMwAry3dsA8RpFnNLRs7PfedJ+ltmoqbEuWYi0T+bPboWu
         UCNqQF52/gzPm0KnNfN7JiH4icKqEOOs93xU+pSr7UhAb7LqcTuCA+Q61z69BCFv8lrn
         7Q5HKTSZAyAaRszXMjUolVIZzPMYY3IvoDJdOVwI5yIslSrTmdE053TGemztbzKyhdZG
         O+lBcIw+OuoO8mk/adF1vdjt631M9Xg31xwFl5u/4Y4r26uDrb5lt+ggvheP0afYie1m
         MAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694769690; x=1695374490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0gMxgrLH8hAqI78TYEwxUv2pVCfDSw58e/K0s6X8qpQ=;
        b=cS04aUyuN7fvfaRLNiXB8boS5M9Go4VK0OmGtbxWOreCrZn3ML7bs3Ux6hmvghP5h3
         1eeHWTEOM6DOmKDz0wgImoFoHT44cZ7NSzJ4sY0zBbLQx7AXZMofBrhw2WEuLNn6l26s
         pv0kP1YpkQope7YyUPMIcTYTi6pbmo7O6vn4ZryKB6zM1p/M9bAXvaNXgR0AqNyirKko
         VKvEsb9zJIAf0qV2MOi6KEl2aORkLcKHOrkM8Oyq7WviWLw2E791FmPp1Hu4obnkCyLT
         Ydb3DLJ3XgXbWumvxz6GjKoKygFGW5L4PfPy7aeeKV7rajJXw9aTLewxFU5sBUVQjUK8
         XVWA==
X-Gm-Message-State: AOJu0Yx+aWEWX/gtX9saeiGucf6tKJlXZGl0NLTGIsMcBOuduhXfkVxi
        bJB9eQbtV6ZsQGNipjU0qfpHFg==
X-Google-Smtp-Source: AGHT+IEW7ELR0BC0aaaD7PdqOlQ9YNfd9KQIzAAoLD8DzPpKbNrDvmiROuNK6D31n0onkDPudHUjUg==
X-Received: by 2002:a2e:9409:0:b0:2bd:1bca:ebee with SMTP id i9-20020a2e9409000000b002bd1bcaebeemr874287ljh.19.1694769690056;
        Fri, 15 Sep 2023 02:21:30 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-94-254-63-18.NA.cust.bahnhof.se. [94.254.63.18])
        by smtp.gmail.com with ESMTPSA id p8-20020a2e7408000000b002b9ec22d9fasm639376ljc.29.2023.09.15.02.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 02:21:29 -0700 (PDT)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 15/17] pmdomain: tegra: Move Kconfig option to the pmdomain subsystem
Date:   Fri, 15 Sep 2023 11:20:01 +0200
Message-Id: <20230915092003.658361-16-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915092003.658361-1-ulf.hansson@linaro.org>
References: <20230915092003.658361-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The Kconfig option belongs closer to the corresponding implementation,
hence let's move it from the soc subsystem to the pmdomain subsystem.

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: <linux-tegra@vger.kernel.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/Kconfig       | 1 +
 drivers/pmdomain/tegra/Kconfig | 6 ++++++
 drivers/soc/tegra/Kconfig      | 5 -----
 3 files changed, 7 insertions(+), 5 deletions(-)
 create mode 100644 drivers/pmdomain/tegra/Kconfig

diff --git a/drivers/pmdomain/Kconfig b/drivers/pmdomain/Kconfig
index 10c3bc2e2444..98e04589bef4 100644
--- a/drivers/pmdomain/Kconfig
+++ b/drivers/pmdomain/Kconfig
@@ -14,5 +14,6 @@ source "drivers/pmdomain/samsung/Kconfig"
 source "drivers/pmdomain/st/Kconfig"
 source "drivers/pmdomain/starfive/Kconfig"
 source "drivers/pmdomain/sunxi/Kconfig"
+source "drivers/pmdomain/tegra/Kconfig"
 
 endmenu
diff --git a/drivers/pmdomain/tegra/Kconfig b/drivers/pmdomain/tegra/Kconfig
new file mode 100644
index 000000000000..13ade6d84696
--- /dev/null
+++ b/drivers/pmdomain/tegra/Kconfig
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config SOC_TEGRA_POWERGATE_BPMP
+	def_bool y
+	depends on PM_GENERIC_DOMAINS
+	depends on TEGRA_BPMP
diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index 6f3098822969..f16beeabaa92 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -152,11 +152,6 @@ config SOC_TEGRA_PMC
 	select PM_GENERIC_DOMAINS
 	select REGMAP
 
-config SOC_TEGRA_POWERGATE_BPMP
-	def_bool y
-	depends on PM_GENERIC_DOMAINS
-	depends on TEGRA_BPMP
-
 config SOC_TEGRA20_VOLTAGE_COUPLER
 	bool "Voltage scaling support for Tegra20 SoCs"
 	depends on ARCH_TEGRA_2x_SOC || COMPILE_TEST
-- 
2.34.1

