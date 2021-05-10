Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A956C433ED
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 21:37:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 46BB66146E
	for <linux-tegra@archiver.kernel.org>; Mon, 10 May 2021 21:37:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232839AbhEJVir (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 May 2021 17:38:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232810AbhEJVip (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 May 2021 17:38:45 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18C19C06175F;
        Mon, 10 May 2021 14:37:40 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id h4so25619886lfv.0;
        Mon, 10 May 2021 14:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K+3Jth62X/WohIFiLHRbQiwWXlpx2QSGxWVGelYy8pc=;
        b=CAJ/tD23zf4X8M5MxJeH2wJI9UgJRDFwnyrHoUCOdHLNlU8gyg6kP5/rPY3dz39zEJ
         Qj0tQr/2IQnUVdRGrcopRGkhB+utIUnnu5ZB4vRLhmdy/biTBaOu5MKrK7Cpk5jzo0Sl
         vc+jPvvynoLy43AADvQqbgNCiYHOhPcM+rVEd7T0Lbg4EYZM7HSOETZLcOyrTRZmor8d
         RN+LGzidc54cFGCaPn3Yerp6r4ipY93FZNOIrrEH20kTb5xmPat52i6Gg2bmO2z0p3Qi
         e/eJk2ssefTlR1vsanQJHjhPBgfiSU6zDKziRz90LqjGkZltOtIpW3kk8V2kre8N33+n
         laMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K+3Jth62X/WohIFiLHRbQiwWXlpx2QSGxWVGelYy8pc=;
        b=QCDF1nFPawIXdYDkbr5lZoDnucct7ASemXwAjOEFpe6ow25HEA4YGi24duEs2UmIsS
         ABRD4rOrSUrTAyd7ABgE+F5TqmImtZCYFhNFs/q+SKPbKu7MC9fdl0WntHbMFR5ZyFOU
         lBP70LGAabppyVmfkTRWSz/KROc6+Cd5MjGLwjurrudn2ovZJkdyIng5PToIOWrEGkYz
         t/pHEgtanDr9mNTMIltqbLPOCh2THUIdjGniGIVimFyjOgFv49h+NyIP9HrFE85m1Qcv
         03At2+FX9TnwtpcsG+7eWOID5x1fBLaK7F6gUtXe5MKDCp6wgh/m4wRMd0XXiFzXfZlQ
         qgAw==
X-Gm-Message-State: AOAM532AX/glbIT940DECiSkjDdtnaJsg87sB+nphaYrHT+Sgr4/yrQ2
        BfGpgLdVyI9lzO+ZWwmg3rc=
X-Google-Smtp-Source: ABdhPJyPMEM43l9T1qZgZUYflVMqPDi7gBdjn7rY0kOf3xNehNIQKhCXw/3kVSJiNx9S7V3Lt7xrLw==
X-Received: by 2002:ac2:488f:: with SMTP id x15mr18074014lfc.413.1620682658690;
        Mon, 10 May 2021 14:37:38 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id 9sm431315lfm.271.2021.05.10.14.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 14:37:38 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 2/2] memory: tegra: Enable compile testing for all drivers
Date:   Tue, 11 May 2021 00:37:29 +0300
Message-Id: <20210510213729.7095-3-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510213729.7095-1-digetx@gmail.com>
References: <20210510213729.7095-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Enable compile testing for all Tegra memory drivers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
index a70967a56e52..a910f661105f 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -2,7 +2,7 @@
 config TEGRA_MC
 	bool "NVIDIA Tegra Memory Controller support"
 	default y
-	depends on ARCH_TEGRA
+	depends on (ARCH_TEGRA || COMPILE_TEST)
 	select INTERCONNECT
 	help
 	  This driver supports the Memory Controller (MC) hardware found on
@@ -11,7 +11,7 @@ config TEGRA_MC
 config TEGRA20_EMC
 	tristate "NVIDIA Tegra20 External Memory Controller driver"
 	default y
-	depends on TEGRA_MC && ARCH_TEGRA_2x_SOC
+	depends on TEGRA_MC && (ARCH_TEGRA_2x_SOC || COMPILE_TEST)
 	select DEVFREQ_GOV_SIMPLE_ONDEMAND
 	select PM_DEVFREQ
 	help
@@ -23,7 +23,7 @@ config TEGRA20_EMC
 config TEGRA30_EMC
 	tristate "NVIDIA Tegra30 External Memory Controller driver"
 	default y
-	depends on TEGRA_MC && ARCH_TEGRA_3x_SOC
+	depends on TEGRA_MC && (ARCH_TEGRA_3x_SOC || COMPILE_TEST)
 	select PM_OPP
 	help
 	  This driver is for the External Memory Controller (EMC) found on
@@ -34,7 +34,7 @@ config TEGRA30_EMC
 config TEGRA124_EMC
 	tristate "NVIDIA Tegra124 External Memory Controller driver"
 	default y
-	depends on TEGRA_MC && ARCH_TEGRA_124_SOC
+	depends on TEGRA_MC && (ARCH_TEGRA_124_SOC || COMPILE_TEST)
 	select TEGRA124_CLK_EMC
 	select PM_OPP
 	help
@@ -49,7 +49,7 @@ config TEGRA210_EMC_TABLE
 
 config TEGRA210_EMC
 	tristate "NVIDIA Tegra210 External Memory Controller driver"
-	depends on TEGRA_MC && ARCH_TEGRA_210_SOC
+	depends on TEGRA_MC && (ARCH_TEGRA_210_SOC || COMPILE_TEST)
 	select TEGRA210_EMC_TABLE
 	help
 	  This driver is for the External Memory Controller (EMC) found on
-- 
2.30.2

