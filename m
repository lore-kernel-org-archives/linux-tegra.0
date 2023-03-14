Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48912C7618A
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Mar 2023 09:06:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230498AbjCNJGp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 14 Mar 2023 05:06:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230496AbjCNJGo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Mar 2023 05:06:44 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52E8698EAD
        for <linux-tegra@vger.kernel.org>; Tue, 14 Mar 2023 02:06:12 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so19621031pjg.4
        for <linux-tegra@vger.kernel.org>; Tue, 14 Mar 2023 02:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678784772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VvVKKTfClzDHbKr25iX73V342HR8rTZ6C7kPvWX0aBY=;
        b=ta4LarLUW8GVYewL3V7G52f2PnqeptY/XG+Xj++LeAYExfggHPOU6rG3/4/3rQXG+n
         AzvmQ2wQl0ABLmLB+j8uqP96pHc5Kxv0AojIqlYpcGB1hUHvyyK276Yy6PoiJmTkGYcu
         zGJWJSkXkAHoByUCG6b1z7gylywfPo1un+ivuW9QzU19dOPVUL+TdFCv2jh27+uFdlUv
         7c7ZUWQY8PPanuRhSoHepXGS5nc7Tm/aIJfcWW/45typlJNAf25mejQ/TUovv4vr0E7i
         ZjaKWWdJFJ1ZCo3L2LxQbfB4xP8RlcaiME0yAjDtKQXdfMsvfTAldgKplyZxAWY1yeil
         yyWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678784772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VvVKKTfClzDHbKr25iX73V342HR8rTZ6C7kPvWX0aBY=;
        b=Hcmsn5GgMSKhM7MIylnt6d0uHPJWkEPGbksNYUYOGk6F9HFL5EAsM2GNg2ZpQsliou
         t+faPs4VHcbuTxi3QNSbUuNk38m0lsaojc3P1dMjAwDvGb3nTgeeFIq5JbIjLIvf235L
         2jVYUCJNYSySQMGp9Gm3o2qrloIYrOHAM4DafbN0EOsbMs1Lb5XHYQKYAT819DzCFT7P
         wc8i6j3pWdqFBrLtJaiNMB6zkxaLbuBL0BKPtVqtER7DS9L9R/+yKj8ZPb6hHwwn+W1K
         rLisJvXwdzNcK+eg7G5mockresmSb8nReRDfZY3yuQutYobBThSL3anSh/fQ4AtAXZ4J
         F2vQ==
X-Gm-Message-State: AO0yUKU8wCd7uNYqUtaPJf/1o7CieDAstPLStzidlC7/nzmKijF9hHzI
        5FP3sdIJOAYx5DT/tG6PulyjFw==
X-Google-Smtp-Source: AK7set/XpT6XzJflkOougYbJXIWlZCBg7D1MY8N+0OWLt8IZY2LG8a7E83HVnkqfAtO3xcf+IpKViQ==
X-Received: by 2002:a17:902:d4cc:b0:19a:b033:2bb0 with SMTP id o12-20020a170902d4cc00b0019ab0332bb0mr43699652plg.46.1678784771688;
        Tue, 14 Mar 2023 02:06:11 -0700 (PDT)
Received: from localhost.localdomain ([49.206.34.126])
        by smtp.gmail.com with ESMTPSA id kv3-20020a17090328c300b0019c919bccf8sm1254131plb.86.2023.03.14.02.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 02:06:10 -0700 (PDT)
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
To:     u.kleine-koenig@pengutronix.de
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        alexandre.torgue@foss.st.com,
        angelogioacchino.delregno@collabora.com,
        bcm-kernel-feedback-list@broadcom.com, bleung@chromium.org,
        chrome-platform@lists.linux.dev, claudiu.beznea@microchip.com,
        conor.dooley@microchip.com, cw00.choi@samsung.com,
        daire.mcnamara@microchip.com, eddie.huang@mediatek.com,
        f.fainelli@gmail.com, groeck@chromium.org, jonathanh@nvidia.com,
        kernel@pengutronix.de, krzysztof.kozlowski@linaro.org,
        kumba@gentoo.org, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-rtc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org, matthias.bgg@gmail.com,
        mcoquelin.stm32@gmail.com, michal.simek@xilinx.com,
        miquel.raynal@bootlin.com, nicolas.ferre@microchip.com,
        patches@opensource.cirrus.com, sean.wang@mediatek.com,
        thierry.reding@gmail.com, ulli.kroll@googlemail.com,
        vincent.sunplus@gmail.com, vz@mleia.com,
        Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH 00/41] rtc: Convert to platform remove callback returning void
Date:   Tue, 14 Mar 2023 14:35:57 +0530
Message-Id: <20230314090557.41960-1-naresh.kamboju@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

> Hello,
> 
> this patch series adapts the platform drivers below drivers/rtc to use the
> .remove_new() callback. Compared to the traditional .remove() callback
> .remove_new() returns no value. This is a good thing because the driver core
> doesn't (and cannot) cope for errors during remove. The only effect of a
> non-zero return value in .remove() is that the driver core emits a warning. The
> device is removed anyhow and an early return from .remove() usually yields a
> resource leak.

This patch set applied on top of Linux next.

Build tested with gcc-12, clang-16 and clang nightly.
Boot and LTP smoketests performed on
 - qemu-x86_64
 - qemu-arm64
 - fvp-aemva
 - qemu-armv7
 - qemu-i386

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

Link,
https://qa-reports.linaro.org/~anders.roxell/linux-mainline-patches/build/lore_kernel_org_linux-arm-kernel_20230304133028_2135435-1-u_kleine-koenig_pengutronix_de/?failures_only=false#!#test-results

--
Linaro LKFT
https://lkft.linaro.org
