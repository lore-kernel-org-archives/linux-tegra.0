Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62D09C433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Mar 2022 13:10:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356031AbiCPNLO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Mar 2022 09:11:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356043AbiCPNLN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Mar 2022 09:11:13 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B31A517D3
        for <linux-tegra@vger.kernel.org>; Wed, 16 Mar 2022 06:09:54 -0700 (PDT)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 072B83F614
        for <linux-tegra@vger.kernel.org>; Wed, 16 Mar 2022 13:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1647436191;
        bh=hMpVGD6o3TsybJH5wrGEkbZ3q6M86lmXlzkdgti+gZM=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=hNKgB24E2ym3l0o8ifQBwdd7eYQ+JMKm51173F/zHn0U41E1l9FsRMeiwbyqBrSkD
         U6OIUGGkaGqeutcZi4SKr9y9o9SHcAQfGPd3D2hZhefQazLUspAjpdzbmnqpD5Kz9g
         xn0QLxDjAQr2W3rcUHBO+tX6YIgZoP3Y0SfiBlqPdjOjkhRBybLP589j3CJe3FBTor
         gcCaX6+i0VuRoDGIeXdaXPf7vDFWaER/HlrOJgKcSgx3zyG8MMgR/1SPLv4IZFZ/4K
         6y1+sGZ0KoPp+8+SeLYh2TOMi2lWOg3lRmrFLjIhSCjZj5KtjmHKK5h+3UynGJnfw+
         3YVYqjo1rKl/A==
Received: by mail-ej1-f71.google.com with SMTP id ga31-20020a1709070c1f00b006cec400422fso1113489ejc.22
        for <linux-tegra@vger.kernel.org>; Wed, 16 Mar 2022 06:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hMpVGD6o3TsybJH5wrGEkbZ3q6M86lmXlzkdgti+gZM=;
        b=SOrgay77lfkP3Lad6USohb7Bqogys9F0cuuhzQ7nvfMzdw7n0tA0Vdj3pIiBauL2vj
         vdqFKeTiexF1eeM6AzKwiQdkaENLRcWYPKMQLk0dwH7wiJQ+RlJzt89bhVHCfYwKX8tV
         y64ET6+dABzAix8Jrmo3d48xmpidCXOo8e0YZ+9WsTFTbPlpCuwtQTrRXp9J9CTd757c
         O+Mq4pFyI9+l2QDUyk5QWAQe3MQy5o5fCsAr5SuwjKf3hqCqoqoMA8V4jWSpQUzLe8az
         oYJlGaL9CjyjAz3n2M+yQEH5Kk8FIYbzPlMGNJ8CL/3c0OsPCl3YCBmT8ppLtEjRexWr
         Uk6A==
X-Gm-Message-State: AOAM531+sUPSW0oWxlYMyu30TL3d0BpY/J72yqCWSl2S1RgwFzwYMkid
        A4YaFNr5+WW9G87OLQjqZ1AQ2gYSMNqsXJjTCVOBA2fepa5kxY2JOn1xnBzNaq1uuqy6Iyn7bXv
        lIycKXF+jd7OlSCvVJtQWPbJC7LIgALMc47e8lEx8
X-Received: by 2002:a17:906:dc8c:b0:6df:831e:76d4 with SMTP id cs12-20020a170906dc8c00b006df831e76d4mr1659355ejc.139.1647436177794;
        Wed, 16 Mar 2022 06:09:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFY00Fte9yceTYtdcLIDEMUngEA7Vv2XIZrc94QHM+xHDidA3EN1sRimJG9UK5kh8CSQEOXQ==
X-Received: by 2002:a17:906:dc8c:b0:6df:831e:76d4 with SMTP id cs12-20020a170906dc8c00b006df831e76d4mr1659302ejc.139.1647436177483;
        Wed, 16 Mar 2022 06:09:37 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id mp33-20020a1709071b2100b006db6dea7f9dsm861597ejc.168.2022.03.16.06.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 06:09:36 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Alexander Shiyan <shc_work@mail.ru>,
        Steffen Trumtrar <s.trumtrar@pengutronix.de>,
        "A.s. Dong" <aisheng.dong@nxp.com>,
        Giulio Benetti <giulio.benetti@benettiengineering.com>,
        Jesse Taube <Mr.Bossman075@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Ioana Ciornei <ioana.ciornei@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 1/2] dt-bindings: gpio: pca95xx: drop useless consumer example
Date:   Wed, 16 Mar 2022 14:08:57 +0100
Message-Id: <20220316130858.93455-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Consumer examples in the bindings of resource providers are trivial,
useless and duplication of code.  Remove the example code for consumer

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
index b6a6e742b66d..dc0fc8fc4839 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
@@ -190,14 +190,6 @@ examples:
                               "chg-status+red", "green", "blue", "en-esata",
                               "fault1", "p26", "p27";
         };
-
-        ts3a227@3b {
-            compatible = "ti,ts3a227e";
-            reg = <0x3b>;
-            interrupt-parent = <&gpio99>;
-            interrupts = <14 IRQ_TYPE_EDGE_RISING>;
-            ti,micbias = <0>; /* 2.1V */
-        };
     };
 
   - |
-- 
2.32.0

