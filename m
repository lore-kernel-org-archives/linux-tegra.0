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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18BE3C48BD1
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 15:44:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBB5D613AE
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 15:44:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231642AbhFKPqQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Jun 2021 11:46:16 -0400
Received: from mail-lf1-f41.google.com ([209.85.167.41]:43532 "EHLO
        mail-lf1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231294AbhFKPqP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Jun 2021 11:46:15 -0400
Received: by mail-lf1-f41.google.com with SMTP id x24so3578783lfr.10;
        Fri, 11 Jun 2021 08:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PcsWKRjGDx2mqjUWfRMpElvDs8rKHv2+VyEn9Eaz0+A=;
        b=ptJFAIc8TkmxeB15o6bz846TMCWai75j4OC77KIDe67deQlxlyJGEogmiC6CT1rY4h
         x33cAwewQy6GB4xppISKjrAtjEDaU9MtzpYiVZfRrTZPz+CcmJLcfWwZE3mhUdxhZkfF
         EYIZnDHJK6iiQV0uE4Uz0CBV6D3t2rV00COHczGeTbtjjcWdzhxF/psqhw+bOGpvduNl
         nqTIIK3ofVuV2ouv7vJ9jJoqqdGssDk0xV7MKMho6ldiCwphrFuSaGRsPIeYk/lHuNmP
         3EF8Rg9N1MlR4BChZ+OUzfKZT2M/mQ3XrTMxW4zMOHdANX9kJ2MSIVVY0WNbK1STZPho
         JYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PcsWKRjGDx2mqjUWfRMpElvDs8rKHv2+VyEn9Eaz0+A=;
        b=uf9ePxjgm9TfaX0MOX6QhIOPzKqnIHBzSmm/tR7MecdXNr15Ocjp195Y9tDdfca8Dk
         J+ehwbQ92/HLylzGBn7t1VdhOmDu9YqcfxirRNTTG7LXVfWjs/1LztNqLyXjeUANFATb
         z/NzktJOfE6jWvzMSiknrCHaAc++D0slTU0pyqcT0W3vOefXsFzawPrMQhviTjdvWlPN
         24F+iHCXb8xbyfXDo1Ac3W+lQ0jyCMf4P4U4lcJzCNovFxl/l9DlcTZIosyE0KQt+5JW
         5MlU/HLlFKBI9IsBwgaLCPe4qZUJDf6Ttc4VzuQyazKa/HxqbpkXZInVwcAoArbCLDid
         9kjg==
X-Gm-Message-State: AOAM532DoEoTREVfx0nlF5IikvVN2v/Zsh/vYbPEAcE9htb6T5FkbP6P
        rr9nq/DxbHLq5M5N9uxlZD8=
X-Google-Smtp-Source: ABdhPJyJFpBKp1PX0r64m29XgI+fy6dULwxH2rd0GyuxfwOChBL3hB9uSZYebhoVz7G1wF3r4uI3bg==
X-Received: by 2002:ac2:4c0a:: with SMTP id t10mr2935039lfq.401.1623426196335;
        Fri, 11 Jun 2021 08:43:16 -0700 (PDT)
Received: from localhost.localdomain (94-29-21-60.dynamic.spd-mgts.ru. [94.29.21.60])
        by smtp.gmail.com with ESMTPSA id l7sm762460ljc.28.2021.06.11.08.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 08:43:15 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1] memory: tegra210-emc: Make driver dependent on OF_RESERVED_MEM
Date:   Fri, 11 Jun 2021 18:42:06 +0300
Message-Id: <20210611154206.30911-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Tegra210 EMC driver requires OF_RESERVED_MEM to be enabled in order
to be useful at runtime. The OF_RESERVED_MEM is enabled by default in
defconfig, but it could disabled manually, breaking functionality of
the driver. Make driver dependent on OF_RESERVED_MEM Kconfig option,
for clarity.

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/memory/tegra/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/Kconfig b/drivers/memory/tegra/Kconfig
index f9bae36c03a3..17053eaf87b9 100644
--- a/drivers/memory/tegra/Kconfig
+++ b/drivers/memory/tegra/Kconfig
@@ -51,7 +51,7 @@ config TEGRA210_EMC_TABLE
 
 config TEGRA210_EMC
 	tristate "NVIDIA Tegra210 External Memory Controller driver"
-	depends on ARCH_TEGRA_210_SOC || COMPILE_TEST
+	depends on (ARCH_TEGRA_210_SOC && OF_RESERVED_MEM) || COMPILE_TEST
 	select TEGRA210_EMC_TABLE
 	help
 	  This driver is for the External Memory Controller (EMC) found on
-- 
2.30.2

