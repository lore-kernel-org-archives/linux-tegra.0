Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D69C83F3E
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Sep 2023 19:00:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237111AbjIETAn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Sep 2023 15:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240212AbjIETAi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Sep 2023 15:00:38 -0400
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59589CC3
        for <linux-tegra@vger.kernel.org>; Tue,  5 Sep 2023 12:00:11 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4018af103bcso1013495e9.1
        for <linux-tegra@vger.kernel.org>; Tue, 05 Sep 2023 12:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1693940020; x=1694544820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6tn4Tgcsi1O0hqP3FN/fJ4KrpHQM0EtczTKadJgTtw=;
        b=p5Pm7Z7GtX7f2t7IG4RS/bbIikv2+cKC0ePo8uJt1sCuIrmGSi86NIq34dHd7s1AVt
         74etZCM3bQp7igU+wbL4YcKx++R94GZw4O3msJcc9DJoTYfeSofvrznfchAy6NI+O8RW
         IHMiiaeuavak/TknzGviS7L60EHvlsoutDxhT13rp5cIOXQMd2Zd1ILUUC1N5cGMTXd6
         L+yTOcKMJghfURp7PP2aNNTJ+DwFLcMpDkuIMc7aZjR6rAfJo3JDtv5iboe4ZrRm1cjQ
         0U3ZhkRdlSb3VoRw3Dao7LqgdQlj4CQmMJgcFx1v7p2O/ONpGsK3UT2eWRRtIhCMJJ8A
         EdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693940020; x=1694544820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6tn4Tgcsi1O0hqP3FN/fJ4KrpHQM0EtczTKadJgTtw=;
        b=cYPDFjIHruLkZhvA2NSuqA6DbCqasy3posVdjkR0FnQ2JPkuAHw1M8ABJRUPDRr47g
         vFpFETElsFRR1czJMYfSrf9ZxfD4EHtj6b42rGQ/9WrW9ddw2rE+mKx0rr4+KwFG0sgA
         aZvaVCUKM9o4vvZJUX/CB2+4G3DQFV0EZgBE9c/LFIcp9kY4fiiwMyNyKxwr5OaUrauU
         3xoJdriE8Gn7YBJ6ViAO3CIp9a5pjd4PlbMWToC4FfokI+8MgsI5IAifIOZC7XVFWiKD
         WqQD36EwUxJdyIRTvgEXDPNYsHnvKkXcWMDuuqqXLYS+JiMWk6/xvtJxUBup+jcLVBIs
         lxSg==
X-Gm-Message-State: AOJu0YxLboUGG2VyVJ+oog3MolQKr9od2ntmGAdnznR2R39W7doswYnr
        ylf2YEWuc/SgXs90YlBwNvq4+A==
X-Google-Smtp-Source: AGHT+IHaOumSDU3nr/8PNaqRqHS3aAWO3c0eVyPkb5h63GCpGBG6kfLxrczPHvapwSdIRLtHe1YhsQ==
X-Received: by 2002:a7b:ce90:0:b0:3fe:1b5e:82 with SMTP id q16-20020a7bce90000000b003fe1b5e0082mr547652wmj.20.1693940020693;
        Tue, 05 Sep 2023 11:53:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:7a54:5dbc:6d09:48b7])
        by smtp.gmail.com with ESMTPSA id 17-20020a05600c249100b003fbc30825fbsm17550010wms.39.2023.09.05.11.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 11:53:40 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Dipen Patel <dipenp@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH 12/21] hte: allow building modules with COMPILE_TEST enabled
Date:   Tue,  5 Sep 2023 20:53:00 +0200
Message-Id: <20230905185309.131295-13-brgl@bgdev.pl>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230905185309.131295-1-brgl@bgdev.pl>
References: <20230905185309.131295-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Allow building all HTE modules with COMPILE_TEST Kconfig option enabled.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/hte/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hte/Kconfig b/drivers/hte/Kconfig
index cf29e0218bae..083e67492bf2 100644
--- a/drivers/hte/Kconfig
+++ b/drivers/hte/Kconfig
@@ -16,7 +16,7 @@ if HTE
 
 config HTE_TEGRA194
 	tristate "NVIDIA Tegra194 HTE Support"
-	depends on ARCH_TEGRA_194_SOC
+	depends on (ARCH_TEGRA_194_SOC || COMPILE_TEST)
 	help
 	  Enable this option for integrated hardware timestamping engine also
 	  known as generic timestamping engine (GTE) support on NVIDIA Tegra194
@@ -25,7 +25,7 @@ config HTE_TEGRA194
 
 config HTE_TEGRA194_TEST
         tristate "NVIDIA Tegra194 HTE Test"
-        depends on HTE_TEGRA194
+        depends on (HTE_TEGRA194 || COMPILE_TEST)
         help
 	  The NVIDIA Tegra194 GTE test driver demonstrates how to use HTE
 	  framework to timestamp GPIO and LIC IRQ lines.
-- 
2.39.2

