Return-Path: <SRS0=lnQj=EA=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7827C388F7
	for <linux-tegra@archiver.kernel.org>; Sun, 25 Oct 2020 22:39:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 727C2223BD
	for <linux-tegra@archiver.kernel.org>; Sun, 25 Oct 2020 22:39:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rwb0Filp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732109AbgJYWjx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 25 Oct 2020 18:39:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1420197AbgJYWjr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 25 Oct 2020 18:39:47 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7106C0613CE
        for <linux-tegra@vger.kernel.org>; Sun, 25 Oct 2020 15:39:46 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id h20so7753284lji.9
        for <linux-tegra@vger.kernel.org>; Sun, 25 Oct 2020 15:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0Qk3xXdKFStoCVmkYrrLJkOIbrNFMTQA95tr5yu1KCw=;
        b=Rwb0FilpaSGU1ZPk81OVFxIiwzbKmcdjVvzUjZdkhEjRL02UUltitgLXQxdDlXqjtq
         nmNjVARI5Ygel+4j8bxoN7m37iI79WRIYzuuFWTcGEfeexeI3TwQDadmYi1K1q08C9K1
         068/VTYSpJPXdi9EKezaQ0eBsGGz+iALccp6YiiL0C24znfxhuyw4Nvy+jyXwbg9h2CS
         qDSg5+POHyVmwhNiymIGOCfKMOJ02i93sqwNWZzr9PrfJwk0DC1S4m1rdRG61lmvFWCq
         tjLzrao5rPGDcMm31/0zTM/9oF0ocmpSRo75URa+qB0hkiXSj7d3qE20K04KAxiCjv7E
         BHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0Qk3xXdKFStoCVmkYrrLJkOIbrNFMTQA95tr5yu1KCw=;
        b=dUJaWootD9atbP9UzmU4Rd3BL5LctKgGxp59Cl+7BZAXYll0nmdXl+WkXazMR6nj/a
         DNgq84v2S/amc5jZpWl6EVyJOOFuzhrifgdcbu96rCXMkJl8RCxobbkuuXA4jZPgUpIs
         Nicbc0vPUNObnmVaO3N885UC/kd75yjblX/TblRdIvuhE5mZVW3zEA9Gxhv7VjhfNtSf
         jvhZw15wBPbBKrst/oN7gPnL3mBiTmMKpaL45qw2B4AxhT2WKLWTzYEfPMdT53J8qoHW
         G6sP2AuFg2OkpZjQhieiiMC9CR1kF32lozL19RIIEuEjaAPS/wF5Be4K+vuMyHv8kmje
         lTjQ==
X-Gm-Message-State: AOAM533EH7EzvDr586EQcsMIKGGlrnasKWegKQgffZhTwlLPZeJeml2S
        NIUJ1QdpcEjnQsWcj1AFl17GE19H1ao=
X-Google-Smtp-Source: ABdhPJwmVQX6xQDiF0FPMXE2tjIa4BTRTyzTeDCEYJb3acYXGoI4vF/I/R7TOGbyjAREuQjCfNm3jQ==
X-Received: by 2002:a2e:b5c1:: with SMTP id g1mr4391831ljn.305.1603665585495;
        Sun, 25 Oct 2020 15:39:45 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru. [109.252.193.186])
        by smtp.gmail.com with ESMTPSA id f15sm855957lfk.186.2020.10.25.15.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 15:39:44 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1 5/6] ARM: tegra: nexus7: Add power-supply to lvds-encoder node
Date:   Mon, 26 Oct 2020 01:38:50 +0300
Message-Id: <20201025223851.6984-6-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201025223851.6984-1-digetx@gmail.com>
References: <20201025223851.6984-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The lvds-encoder binding now supports power-supply property, let's specify
it in the device-tree for completeness.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index 8d49860b135b..f8a531350998 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -1145,6 +1145,7 @@ lvds-encoder {
 		compatible = "ti,sn75lvds83", "lvds-encoder";
 
 		powerdown-gpios = <&gpio TEGRA_GPIO(N, 6) GPIO_ACTIVE_LOW>;
+		power-supply = <&vdd_3v3_sys>;
 
 		ports {
 			#address-cells = <1>;
-- 
2.27.0

