Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EE7EC433F5
	for <linux-tegra@archiver.kernel.org>; Wed,  4 May 2022 09:12:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346734AbiEDJQB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 4 May 2022 05:16:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237301AbiEDJQA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 May 2022 05:16:00 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B69D186C2
        for <linux-tegra@vger.kernel.org>; Wed,  4 May 2022 02:12:24 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id gh6so1713597ejb.0
        for <linux-tegra@vger.kernel.org>; Wed, 04 May 2022 02:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y10/WtRB7HPahgpaB6GkcIayz4hLOHPe/WbMNVnpmvQ=;
        b=CpV7Paif+/qJ9FXs9pcjTbh2qzW0fD1m6nqyPF/PFW4M2m20wfBa4x2qfJ2wzV5TJr
         U3UcVJf2NpO81WvrIyihTNZlEFeayhRnrxspiChLswrnHUToWpPwIOeFDTbdSvMWvKZz
         BYvpMvGNZN9lbAbZox0j5+hIvMr2S2dLIq6xqJt+7juuwhKZSvzlwwCJ0+sR2HXAw9r7
         6cDrjT10jfsAWe1TzJCAcUz1Obenc8qVHwOIeJMsI2P57sopAKSX2qvtjB6WSfaXhVeX
         18XXePkw0WvOi7wmBQtyRRNFaibdl1vH7vT2CNuHXnTAOXmBlZEOirOd11XcteKnwQAt
         gMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y10/WtRB7HPahgpaB6GkcIayz4hLOHPe/WbMNVnpmvQ=;
        b=LrpVcqwK1vR0YPiMZrY4/kF0IndFS3DcpYMZuD6VA5TpImIBHDqx+0yDUQc5FGSSq1
         U1c+wCcy8Ud5ROVfrtKXicMlkwP8gAk77Hv148KRAW2ZURxQ9OVgiP1H1SwTFYjq0mQ5
         jmrJr17FE4x55mLji9YFFPaK6e8t+JoKkkOr+V2L4FmEZVmeHuefgcxyFOHUWTo063iy
         7d21BAW9NvsCvphzrah38a2mN1Jgg6P30pXhFOeHY7R6bFvcvQOK+WaIOV9nO6rwY8Zw
         aouNLJYIsle/RyRV4EWzVudKNVr9wY2bCtTQARkbeVxWggthV6FL1ZV5H8MT80LbqPXm
         Fx2A==
X-Gm-Message-State: AOAM530idt+amfFDN0S0cxSsQwadAbB4fRiIKJHGRA0w/jDKyVXNlpnr
        w8LOo9dwoI6T3eSls78J8v4=
X-Google-Smtp-Source: ABdhPJyFbgBFga3HzXYNDeO7nlMta2dk+vgTxv/HV3AcrPQM/N9u7y9YwdjA/iRZgR+nvwWI4Y/dkg==
X-Received: by 2002:a17:907:6d26:b0:6f4:bba2:ebbb with SMTP id sa38-20020a1709076d2600b006f4bba2ebbbmr2188723ejc.699.1651655543034;
        Wed, 04 May 2022 02:12:23 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id hf27-20020a1709072c5b00b006f3ef214e31sm5493626ejc.151.2022.05.04.02.12.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 02:12:21 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH] soc/tegra: pmc: Select REGMAP
Date:   Wed,  4 May 2022 11:12:18 +0200
Message-Id: <20220504091218.3187685-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Commit 9d5e7c3e36eb ("soc/tegra: pmc: Provide USB sleepwalk register
map") introduced a dependency on the regmap infrastructure, so select
the corresponding Kconfig entry. This avoids failures in random builds
that may otherwise end up having SOC_TEGRA_PMC enabled but not REGMAP.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/soc/tegra/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index 8b53ed1cc67e..5725c8ef0406 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -146,6 +146,7 @@ config SOC_TEGRA_PMC
 	select GENERIC_PINCONF
 	select PM_OPP
 	select PM_GENERIC_DOMAINS
+	select REGMAP
 
 config SOC_TEGRA_POWERGATE_BPMP
 	def_bool y
-- 
2.35.1

