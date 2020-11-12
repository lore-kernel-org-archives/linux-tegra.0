Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE8FC2D0E4
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Nov 2020 23:03:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 713C720A8B
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Nov 2020 23:03:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oy5fulZH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726429AbgKLXDX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 12 Nov 2020 18:03:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725929AbgKLXDW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Nov 2020 18:03:22 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6505AC0613D1
        for <linux-tegra@vger.kernel.org>; Thu, 12 Nov 2020 15:03:22 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id w15so3061598lji.10
        for <linux-tegra@vger.kernel.org>; Thu, 12 Nov 2020 15:03:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Azk0A7jVz4n0xFGnPcd+eF6bF32aasHnRZB1lZqJcBE=;
        b=oy5fulZHJGw1VEKjko86q9Fecu/ZYihWolk3QCZBJXfrJlyQM7waUXFFyrtX1h9e2J
         NuNY1ne9KHHtbI22rZwtKCQfzyGG09oy7ay4DAy5/BOsD9PEHGmWJdk8v26K7/kBrsW2
         WufDtfFrxxheJ89oJ2nxg8qkheBzLPjuJc6Va81ZWcJ6QxRM+0EwJrba6DfAYtcRrYyt
         J4K9UC8wEcRNhwiDBGB/XUiCQEA6bKad5bjHVKVNdKTkRgKMmBusGkvvvqOyTXuZVaxK
         AJGL7DIKs1DaJbkUoPBhFvQiGTAqrnkvS/40kbefseRNULN3BTa7VxUY4SQsSvd25UPK
         1obg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Azk0A7jVz4n0xFGnPcd+eF6bF32aasHnRZB1lZqJcBE=;
        b=LvONJQOro8imUQFFbKgkr/+3H6iXDbUdt0YMJXw0yUTlYVM0HUz8IH+tj69BAKAPOI
         Cu6rrpd34NwZoT2DlFiAOBUthP66iZqpmGJGB5joWYx16mZ+fXzfQnrSzm9ipjmkDUwE
         /RVnnaQdyFlmmcMuaVWYICUtMyBUWCaKWuSFGWEq28PoqaiS/JtbeBXhF7lQdS8B58k5
         wd65cS4MPLrutO7LHm+E7VCAUoHgpB6K7133eyhkBjGZSWA2EjFTcRY/077NNpT5xxFS
         ypycFHYM+zzj1Zf13CC5Wsz9R48EQBcp3zETgXn12dA3ia8vqsTLhFw1iD7bF/RjbKz5
         ZC9g==
X-Gm-Message-State: AOAM5304zu3XBknqI8Ldtzx1ZMxoWxCInUoHuBFerD29zVLUTcILbUYU
        EGMdF4OGgK/QttKcLWOw7/o=
X-Google-Smtp-Source: ABdhPJy7DYrgeZ9jxNBessBirD+DaqvaXRJMulhkugXMDwd16pjYWPwS51COVYi+ELKlYMhHAWzB6w==
X-Received: by 2002:a2e:8816:: with SMTP id x22mr821061ljh.78.1605222200965;
        Thu, 12 Nov 2020 15:03:20 -0800 (PST)
Received: from localhost.localdomain (109-252-193-159.dynamic.spd-mgts.ru. [109.252.193.159])
        by smtp.gmail.com with ESMTPSA id s26sm905126ljj.105.2020.11.12.15.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2020 15:03:20 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v3] ARM: tegra: nexus7: Set video decoder clock rate to 408MHz
Date:   Fri, 13 Nov 2020 02:02:57 +0300
Message-Id: <20201112230257.30430-1-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The default 600MHz is technically unsupported on Nexus 7. Assign VDE clock
to 408MHz, which is supported by all hardware versions.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---

Changelog:

v3: - Rebased patch properly, fixed merge conflict.

 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index 8def1d2e34f9..b284e32debca 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -90,6 +90,12 @@ init-low-power-mode-hog {
 		};
 	};
 
+	vde@6001a000 {
+		assigned-clocks = <&tegra_car TEGRA30_CLK_VDE>;
+		assigned-clock-parents = <&tegra_car TEGRA30_CLK_PLL_P>;
+		assigned-clock-rates = <408000000>;
+	};
+
 	pinmux@70000868 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&state_default>;
-- 
2.29.2

