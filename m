Return-Path: <SRS0=WNzV=BQ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D4EC433DF
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 17:08:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05ECB20786
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 17:08:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWY/jWWU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730050AbgHFRIs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 6 Aug 2020 13:08:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730016AbgHFRGQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Aug 2020 13:06:16 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E038C00057F
        for <linux-tegra@vger.kernel.org>; Thu,  6 Aug 2020 08:41:19 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id m22so7714247eje.10
        for <linux-tegra@vger.kernel.org>; Thu, 06 Aug 2020 08:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=12jhmJExYZYp9PffxB6AUFotiLesRg+aMbEViAsDwgE=;
        b=TWY/jWWUJz7PWYY3FJ2ln8hhi1M4S9gOoFIb65cr+POuvXc8XsgNZoCjlGRKqtw1MG
         7BF150U4W+cc7J9620qG7jH4EO7Ujm7a/dzabiFFWON/3ZpHypxv84niJlgztlC5dXfj
         nLE89Sowy6lP5FqnZ4U++yd5W37YpbzE4sOpcupQb036PY/CuQ68j+GPwiBfIW8+4Dyh
         yF/Qm2sz9FrGyceZkN6l5LkxwfGZj+R9ExPeIgeStb6xF2O5uyuE7k4ENfBcc7g2NRYF
         A+OezxwkmWaR91v+/6Bv0txdOgkgDQELlvdrckt7I6Jlo82Z3DBuraGku47DWwbnYYpm
         aGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=12jhmJExYZYp9PffxB6AUFotiLesRg+aMbEViAsDwgE=;
        b=ugAtPVDjI3NXeNsFaKYiLu2RZ0jRe4SxiaWJCVn79+2fUEWje2o6aSGQ3Qw9MDZHNL
         6aI090EtjbQjHjl+0ZzxEPUf6ZyWZkqtfVh/AVaD02X2MIFOiziy/7N6MHyN1nIsp5nq
         bPfRBoS5r9W7/4VfA+41IWRmeRRc5d77Qt1SwAlNvv2JB44QBuudp5hgOyUozSBhKoyq
         bBNTnwYR8OrAQA6PDCsbB58TltmCpFfsmqQe131RGkoAvrm/AsbwrXUv0bdiwaGVyKa2
         H6GtbxumDKVSidc45vwmIi1tVi69Fbz/+tQmexGVVi4LLuh+i65EQOrxXLOC8YitIPcv
         NuKQ==
X-Gm-Message-State: AOAM532mdM4jLtESvZgirC4CLq2x+siw87PnWrH9e4C1F4wzKFRh3Ml1
        kUnoL04D79tlSu0znftgKTg=
X-Google-Smtp-Source: ABdhPJwVkL7N64Wl+V/KxY4iFWG6G7nKH0ZRPfwr2NA7d2jC4HFwVQXcAr0WLxlnc3yBPvUgo+hdtg==
X-Received: by 2002:a17:906:a413:: with SMTP id l19mr5077078ejz.15.1596728478086;
        Thu, 06 Aug 2020 08:41:18 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id bc10sm3719621edb.5.2020.08.06.08.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 08:41:16 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 3/4] arm64: tegra: Disable SD card write-protection on Jetson Nano
Date:   Thu,  6 Aug 2020 17:41:10 +0200
Message-Id: <20200806154111.3917284-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806154111.3917284-1-thierry.reding@gmail.com>
References: <20200806154111.3917284-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

There is no GPIO hooked up to the write-protection pin of the SD slot.
Make sure to describe this properly in device tree to avoid errors or
warnings being emitted by the operating system.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
index d34338b63c90..c55716c336c1 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
@@ -576,6 +576,7 @@ mmc@700b0000 {
 		bus-width = <4>;
 
 		cd-gpios = <&gpio TEGRA_GPIO(Z, 1) GPIO_ACTIVE_LOW>;
+		disable-wp;
 
 		vqmmc-supply = <&vddio_sdmmc>;
 		vmmc-supply = <&vdd_3v3_sd>;
-- 
2.27.0

