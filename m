Return-Path: <SRS0=J1sk=DA=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40586C4727D
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Sep 2020 00:36:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB1D7221EB
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Sep 2020 00:35:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9/3oF+i"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbgIWAf7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 22 Sep 2020 20:35:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727009AbgIWAf7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Sep 2020 20:35:59 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E3B0C061755
        for <linux-tegra@vger.kernel.org>; Tue, 22 Sep 2020 17:35:59 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id d15so20051630lfq.11
        for <linux-tegra@vger.kernel.org>; Tue, 22 Sep 2020 17:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wh0bmd82WnERx/7A70eYTa0SyXEYRvVLW5RSten10ek=;
        b=D9/3oF+i+mlNem9zI9BiJSCInTBnkjnMvpyWBFJpI0QvTodKZRNSVWi+1Vj99asTxB
         +dT4DfYvRlo2l+3vEnbTIWQ/uBoz5G7LrOxgJo1fcRPs4258rsARPhXIEdIxvl0GK27h
         e2EpQoLn/pF79aCGsNOxHZCeKNYup4E6v4gEPZB0xzWefkT74AM1CBUTwLUPeYNaIc7q
         eBdCcgpophhij6YqWVSNsIKCBaKzDBHlDnBNhvm55/ptBhAY4Svrdm7ZESAX2g63XQMT
         TedwVwJGV5Dg7FpUG58p5J0GopBK/wijxIxQdtddMKQe7XI1DE4AIJuq+vIlxq5V9krE
         5Mng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wh0bmd82WnERx/7A70eYTa0SyXEYRvVLW5RSten10ek=;
        b=V+Ue+Uczs6h5v71DtAQdZ86zDCmnenLAuK8eHdjRhQXD7arJgymHcaGbRqXoOcdlU7
         Hv+dS6u5akcVs/sBw5Vunn6+Nl+jxfQkH0j3NVJgWyKg2wLt/4w7F0+LFxG5RHxhxXLV
         +Xpg83FghEsT8ErQwf04HEyHPx8huwLIjFjMCY33NM0wko0DPwCpFSCSPYb8OLcJ7w/O
         zgM8kfWef8yAxv+6XzNHQPVa/csRIM0UEu8U1ntVZeyzU6C3PU060lFbIsFFxfnL3dgF
         pmhjanbUVoq+U54tWReVLgEa5HLt+JiOsd73T3iJpOcwTZv6ylEuMYt7ZCzObNR0opBY
         D3Gw==
X-Gm-Message-State: AOAM5319kMFrawbV9N1qDURIWrZexfWLYzzjuk9z970xhLCL9d6LY90R
        9aOOc9rueuCOexQRWVXsxzs=
X-Google-Smtp-Source: ABdhPJw+/o1mHBiX1geJekxyIHO7X3zuM6/dfHeFGIZLVgiVrDltge7epdwHCCdqD8uMoVp3ynvbaQ==
X-Received: by 2002:ac2:4c19:: with SMTP id t25mr2537592lfq.503.1600821357428;
        Tue, 22 Sep 2020 17:35:57 -0700 (PDT)
Received: from localhost.localdomain (109-252-170-211.dynamic.spd-mgts.ru. [109.252.170.211])
        by smtp.gmail.com with ESMTPSA id 134sm4039459lfd.101.2020.09.22.17.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 17:35:56 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1] soc/tegra: fuse: Drop Kconfig dependency on TEGRA20_APB_DMA
Date:   Wed, 23 Sep 2020 03:34:21 +0300
Message-Id: <20200923003421.4561-1-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The DMA subsystem could be entirely disabled in Kconfig and then the
TEGRA20_APB_DMA option isn't available too. Hence kernel configuration
fails if DMADEVICES Kconfig option is disabled due to the unsatisfiable
dependency.

The FUSE driver isn't a critical driver and currently it only provides
NVMEM interface to userspace which isn't known to be widely used, and
thus, it's fine if FUSE driver fails to load.

Let's remove the erroneous Kconfig dependency and let the FUSE driver to
fail the probing if DMA is unavailable.

Fixes: 19d41e5e9c68 ("soc/tegra: fuse: Add APB DMA dependency for Tegra20")
Reported-by: Necip Fazil Yildiran <fazilyildiran@gmail.com>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=209301
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index 976dee036470..676807c5a215 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -136,7 +136,6 @@ config SOC_TEGRA_FUSE
 	def_bool y
 	depends on ARCH_TEGRA
 	select SOC_BUS
-	select TEGRA20_APB_DMA if ARCH_TEGRA_2x_SOC
 
 config SOC_TEGRA_FLOWCTRL
 	bool
-- 
2.27.0

