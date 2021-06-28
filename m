Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E8C1C11F64
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Jun 2021 18:09:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7647F61C76
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Jun 2021 18:09:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233425AbhF1SLm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Jun 2021 14:11:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231950AbhF1SLm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Jun 2021 14:11:42 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30702C061574;
        Mon, 28 Jun 2021 11:09:16 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id r3so7557448wmq.1;
        Mon, 28 Jun 2021 11:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PU5EmP0vK/zlk943bOw9IRW6hnBl12QCnUBMMsEYT4U=;
        b=GQPlJqWyKI4Nzj5T3iDayxFsget1QW5dDoyzUyE3y1TlFebvKsHuZnuKDQenwaUYfh
         jt1boZZiaYfpnCCMeZkuZUs1DyXNpU7j9xh6PCG7iyVcHsAFLAPZrTwdi6atm97OpMsl
         Zi341mI9S7nzIAHshizb2K03fuhosrY0SNB8hSABv0q8Jv0Ed5gN5DCsVJic2qwYQeRF
         xrJ76i3/76qwG+S/5Z/KNeGqQ4VyUp2E2Hon59M6GUge0L9H9/YEPRq7QG85TxCqeryb
         Bw9MkznJcXlspDjH2obckej3cLpW4J4rp9tAYacv0Quk1bYlvyvKYvF+FwN13ClikKXZ
         uNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PU5EmP0vK/zlk943bOw9IRW6hnBl12QCnUBMMsEYT4U=;
        b=UbTp+Dy8HM4e4eYaHQUoYjPz7n7nc+kYqbDL7oS1r1moriXsjOIIAAoVXRmGFvhPep
         XXe1JszdnS8HoxbzTQGbJdoww+JVgrpjk1h/yK5Q2+65rwX+oorEK5TR2HJ6bodqUeSq
         10IkyebehHD9oUP9fSmptgHJjlvqEhHABXLnuL4Hg0ETMw7mVVxwkhB2JxrtpsV6WHKY
         T2U7BQWI+iMc21RdwRFbydWp2B1yRhTKMqcKTqVsP3ubrxbkN1ChWk220+e3RzoqJ1Sl
         +8P+7YNxpY7ubSxW63s2E9LvXLBvC61GdC9ZRDvNtjRVHxb3UIhg2f0/fOnUraHi7PMW
         GRnw==
X-Gm-Message-State: AOAM530SzX+OenOZ694BQQh/WbUe9pZDuhmouiv/ukTPwWXWsTVetbvR
        nKj/N5OEJATkJn7e16lRvJw=
X-Google-Smtp-Source: ABdhPJww6WnF4wM3vbqWQ+u10Xvub+eJ62684M7pvUTgTJ6LKkMx8icKe24+3ov2Q2JXwDJgW3U29w==
X-Received: by 2002:a1c:7410:: with SMTP id p16mr13396114wmc.24.1624903754624;
        Mon, 28 Jun 2021 11:09:14 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id n4sm15720917wrw.21.2021.06.28.11.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jun 2021 11:09:13 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>, linux-tegra@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: tegra: Enable audio IOMMU support on Tegra194
Date:   Mon, 28 Jun 2021 20:11:18 +0200
Message-Id: <20210628181118.2295007-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210628181118.2295007-1-thierry.reding@gmail.com>
References: <20210628181118.2295007-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add iommus and interconnects properties to the ADMAIF device tree node
on Tegra194. This ensures that the correct SID is used for translation
of physical to I/O virtual addresses and that the path to system memory
is properly described, which in turn can impact the range of memory that
the device can address.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 1fa503ab390d..b957cb8df927 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -200,6 +200,10 @@ tegra_admaif: admaif@290f000 {
 						    "rx19", "tx19",
 						    "rx20", "tx20";
 					status = "disabled";
+					interconnects = <&mc TEGRA194_MEMORY_CLIENT_APEDMAR &emc>,
+							<&mc TEGRA194_MEMORY_CLIENT_APEDMAW &emc>;
+					interconnect-names = "dma-mem", "write";
+					iommus = <&smmu TEGRA194_SID_APE>;
 				};
 
 				tegra_i2s1: i2s@2901000 {
-- 
2.32.0

