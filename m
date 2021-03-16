Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152C0C433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Mar 2021 07:57:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF46964FE0
	for <linux-tegra@archiver.kernel.org>; Tue, 16 Mar 2021 07:57:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231604AbhCPH4Z (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 Mar 2021 03:56:25 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37565 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233378AbhCPHz5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 Mar 2021 03:55:57 -0400
Received: from mail-ed1-f69.google.com ([209.85.208.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lM4YV-0006Qn-Qf
        for linux-tegra@vger.kernel.org; Tue, 16 Mar 2021 07:55:55 +0000
Received: by mail-ed1-f69.google.com with SMTP id q25so2477144eds.16
        for <linux-tegra@vger.kernel.org>; Tue, 16 Mar 2021 00:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c3zCpcnTqD9R3iuzYicbz3BgU7Gti7/fMZiuJzomxfc=;
        b=pOfVjnL0BeGPs4dxfPoBXAlDA7Jx0lUNzQilk8KDjHuP2CgM3KYbzrmND0WEqzBKHa
         z+Zt77fTDQWTlXYlp3BmQo3mgUIPxzY2hKC1ADovexgzMtuQDktBZkjEOAZtbndqk1cI
         DIwNa2xTSAMi9h4Jt2lsrToZKid6Ab4YIjNQx6Vmwqp17aHwDsyLv+NSe4s6CGw+mGTB
         uBtnSVHhAzWztcK4LNmIJ3Pzw6ko3vvgQwSI148ay99rSiMVdTiK3lpFzzhxC9EWIXxg
         l5EI/gwL1L2+EJ1aQH3rc4QZFz2lQt4mWy7Fx7WHJr2c498h3+CWcolj7wZ+v6fDE2kt
         zMYA==
X-Gm-Message-State: AOAM533DcTMpkhenc1ru3nFyNRSpMMqA0cwwOyxxL4kVBRuQoXw0cLFm
        WuoC8JVQxP2PSZ3piIGiZk3s9y9ZhCN6veF0il947L0NaDPArTyIPJCaQKM3CRR2uwJVKgENv16
        f/hvATp6eFGG4IMYks0VlhHbJdPdQyGuSNOaWyIcb
X-Received: by 2002:a17:906:565a:: with SMTP id v26mr28672221ejr.516.1615881355578;
        Tue, 16 Mar 2021 00:55:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzy4DMknl54WTpt12UYudRp+llCrhUI3pa8l/ZF2galgznYCyWIDeErXWmVeS6SdiN0DMpEXA==
X-Received: by 2002:a17:906:565a:: with SMTP id v26mr28672210ejr.516.1615881355445;
        Tue, 16 Mar 2021 00:55:55 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id gj13sm9023904ejb.118.2021.03.16.00.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 00:55:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v2] phy: tegra: depend on COMMON_CLK to fix compile tests
Date:   Tue, 16 Mar 2021 08:55:51 +0100
Message-Id: <20210316075551.10259-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Krzysztof Kozlowski <krzk@kernel.org>

The Tegra USB PHY driver uses Common Clock Framework thus it cannot be
built on platforms without it (e.g. compile test on MIPS with RALINK and
SOC_RT305X):

    /usr/bin/mips-linux-gnu-ld: drivers/usb/phy/phy-tegra-usb.o: in function `tegra_usb_phy_init':
    phy-tegra-usb.c:(.text+0x1dd4): undefined reference to `clk_get_parent'

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
1. Depend on COMMON_CLK always, not only for compile test.
---
 drivers/usb/phy/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/phy/Kconfig b/drivers/usb/phy/Kconfig
index 52eebcb88c1f..7500e77a7d01 100644
--- a/drivers/usb/phy/Kconfig
+++ b/drivers/usb/phy/Kconfig
@@ -163,6 +163,7 @@ config USB_MXS_PHY
 config USB_TEGRA_PHY
 	tristate "NVIDIA Tegra USB PHY Driver"
 	depends on ARCH_TEGRA || COMPILE_TEST
+	depends on COMMON_CLK
 	select USB_COMMON
 	select USB_PHY
 	select USB_ULPI
-- 
2.25.1

