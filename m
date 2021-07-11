Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78498C07E9C
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:44:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E11561055
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:44:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232371AbhGKXre (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 11 Jul 2021 19:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231337AbhGKXre (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 11 Jul 2021 19:47:34 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D71B2C0613DD;
        Sun, 11 Jul 2021 16:44:45 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id r125so8638098qkf.1;
        Sun, 11 Jul 2021 16:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PNowlSwvcTS9bTIRnCm1vrvIMba1oVNTEUtUuES2GQQ=;
        b=VYSe9+WhhrRHV9hfsPXMU7Fwjprxrm5WhM2JzlcNqq3f9t9/w0+gYDLQLcsZGapBJm
         FmGJQA5n/bEg+2eSXpArEIhwO41X/t0LvgqqDnnkvlfBoHDO95CBOg7uq+uwuIJ1WAs9
         2lTusq/lDoMDTlQDEK6k3lsqs9NsOcdUFNvCflHn5c4VU3DKki8km+MyZUI4vvL59Kjr
         FOhfCU8qxX2Xn7l1J55KeFJ/uZ0KscH9uyckgajqHoSBlPdj8czb8oWcSgiMJZNr7R3H
         io5EfAHx4yGKpHl9gf+zGtX5SiK4KB8VtWE977f/WS2rxrgZttz2U+Q5pVrrmVfY61P4
         l1Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PNowlSwvcTS9bTIRnCm1vrvIMba1oVNTEUtUuES2GQQ=;
        b=KkDr8DREMfZZQ/IIaNyA3eKX49vcYVxOzXOSJg6jlUz2gek0buWOtowR79mBP6WQ+Y
         UvWe8ZH24cFfasVJPiDwOhxgNJjQ3mb8d4MMy4cPnrMMPRJLOkgr4BzWOS0qawLhldxL
         sm46b+sFuqPa0CT8jitnttXspHGANAa9MLdTJ/ucNSogwDH41/oTMUzeicUCQdViXowv
         KYFWZETn/qJ1y4t3y+cjeCf3lbIiT/eq3vUCEHKUCZ0Kf9ms9z06LRAejQwperyDMB/N
         xSfl0JA6UPjr6iw/r9NWenzHuZ1lLAQnQMlDIz3osFfSUKCeDWal7ujj/q5fpLfkukmn
         9SeQ==
X-Gm-Message-State: AOAM531HwLbkrG8gEtYN22ieceXjrIXtlTNL/LQGlWTHbSJilY1Wh0Zm
        SWU4YfQ59PwUkRPt7W2O1+Y=
X-Google-Smtp-Source: ABdhPJx62orPXGagV8XHa3KDo+xQfkeKQqjuSil+K0kCylxycfHtWVJnC8vx4XSpnnEjq2J2YeS84Q==
X-Received: by 2002:ae9:f805:: with SMTP id x5mr38068764qkh.373.1626047085022;
        Sun, 11 Jul 2021 16:44:45 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id e123sm2146507qkf.103.2021.07.11.16.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 16:44:44 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 06/13] ARM: tegra: nyan: Correct interrupt trigger type of temperature sensor
Date:   Mon, 12 Jul 2021 02:43:56 +0300
Message-Id: <20210711234403.24691-7-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210711234403.24691-1-digetx@gmail.com>
References: <20210711234403.24691-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The LM90 temperature sensor should use edge-triggered interrupt because
LM90 hardware doesn't deassert interrupt line until temperature is back
to normal state, which results in interrupt storm. Correct the interrupt
trigger type.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra124-nyan.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/tegra124-nyan.dtsi
index 5f71add38dfe..63a81270300a 100644
--- a/arch/arm/boot/dts/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
@@ -91,7 +91,7 @@ temperature-sensor@4c {
 			compatible = "ti,tmp451";
 			reg = <0x4c>;
 			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(I, 6) IRQ_TYPE_LEVEL_LOW>;
+			interrupts = <TEGRA_GPIO(I, 6) IRQ_TYPE_EDGE_FALLING>;
 
 			#thermal-sensor-cells = <1>;
 		};
-- 
2.32.0

