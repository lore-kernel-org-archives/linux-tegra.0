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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1437C388F7
	for <linux-tegra@archiver.kernel.org>; Sun, 25 Oct 2020 22:40:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94C16223BE
	for <linux-tegra@archiver.kernel.org>; Sun, 25 Oct 2020 22:40:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqp3WS0z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1420244AbgJYWkq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 25 Oct 2020 18:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1420177AbgJYWjo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 25 Oct 2020 18:39:44 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DFD4C0613CE
        for <linux-tegra@vger.kernel.org>; Sun, 25 Oct 2020 15:39:44 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id h6so9438022lfj.3
        for <linux-tegra@vger.kernel.org>; Sun, 25 Oct 2020 15:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/kftxjSXDqKAh3RCNvkPc5vzqLKoISP/BM3HFWQ3z9I=;
        b=lqp3WS0zPak1QrRE7TwGIDWgkqePSSMQaxKpKXY/DtyzpPcL6yWFgYWkGXdtEg9YaB
         axsStG2ecYJ2iuxLTMmnYba4f7GsY/ZW1zUVVzJl/XDJcX04994/hXe8Efc5gzQKJ/HN
         x9yrG0GTvvnPKSBgyDrVINECKJ8mKv00xCxQAODZ0YPP66R3SjC+RiCH80pdk7nTVMZE
         HpD23hQhYLbHEbASfVpnTcLxvq9hT/dZ8xdTco5pgiwVWgHhrxrM5PzdShR+fsorVeMW
         wvzHUOZH0t5YVB4rm3l7WVB+9GD8yMUamTiEzJP5TwbWsUMtY/t4IvwJpNaiha6Q+llz
         oWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/kftxjSXDqKAh3RCNvkPc5vzqLKoISP/BM3HFWQ3z9I=;
        b=TcqgfSj7QLlJL6n8Tbl8ODECdFc3Em5L7+CZ0X8ULnvd47Vs90fR6fQ+ZDFkirsut3
         0h4dSgHtbgKCGCj6XJ1Km0tNJdBPqKg7QRFo5O6WBBiYQWqpbHRtGE2rjAXE1OBxHycB
         1PoHU9Yq4ZWx/R69kj84oqdB1mVdrke956Bq0DUqmMdy9oahLmq5cFAjpwnFLtOH2EUe
         5ZXqxsHI46y4eKQPwHhIHyLl/W6PjwMR57pnGklMAAJPlbahwCoGtTrkQvZ1ioSpZj/c
         Ffmb9VlcFM3RiNe11ZZ6E8/cNELhnkTQOjUDPdHIUi7XtYIJuz9ogTRQQLM2+wtGiNYc
         GkiQ==
X-Gm-Message-State: AOAM530ffTgPvb5OHol4YyUFgMfrQ8qFEUGctnywgUVmDQaBqyDqCjvu
        u5iV5/1oVC9PCPWKh1WPGJsOpwyWzGE=
X-Google-Smtp-Source: ABdhPJzWt2eFxFhlfB89klHO+LCVFu4UrOC282E88DOl82t8udp9SObe/b8fccgdZlP7iCpSHoWf7Q==
X-Received: by 2002:ac2:5e6c:: with SMTP id a12mr4496399lfr.568.1603665582928;
        Sun, 25 Oct 2020 15:39:42 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru. [109.252.193.186])
        by smtp.gmail.com with ESMTPSA id f15sm855957lfk.186.2020.10.25.15.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 15:39:42 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1 2/6] ARM: tegra: acer-a500: Add power-supply to lvds-encoder node
Date:   Mon, 26 Oct 2020 01:38:47 +0300
Message-Id: <20201025223851.6984-3-digetx@gmail.com>
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
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index 372cc1b17eaf..dd6fb134ee39 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -907,6 +907,7 @@ lvds-encoder {
 		compatible = "ti,sn75lvds83", "lvds-encoder";
 
 		powerdown-gpios = <&gpio TEGRA_GPIO(B, 2) GPIO_ACTIVE_LOW>;
+		power-supply = <&vdd_3v3_sys>;
 
 		ports {
 			#address-cells = <1>;
-- 
2.27.0

