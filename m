Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3AC8C433F5
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Oct 2021 23:02:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92B6E61163
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Oct 2021 23:02:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236672AbhJEXEA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Oct 2021 19:04:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236934AbhJEXDC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Oct 2021 19:03:02 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00BF2C061749;
        Tue,  5 Oct 2021 16:01:11 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id m3so2432950lfu.2;
        Tue, 05 Oct 2021 16:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XW6l4UYrm0yyzmarTcv0AQ0+utEDkcMwT9ee84sdcjI=;
        b=Otx2vBOl5q73l6EoRrKRVi/KpuXf2oB9U4tLNO5lkdu4iWcKt6ZW34EBYxra+WdAh5
         ibQgpVeIDLBIhIQOZu2+sWu8UGsaMKXKy8bVv0oh+8+WQnCI6Ywikg9Lu0k3E0oGoICD
         jJ+qV9MVCZD8pId1v5i+KCrueiqYS/v2kcaZZjQWnz8xvAw/PmiNHE71msSTxfHiawa6
         tL9M0+ZPr5ZRo1IbH4xUVBtsg5fgCmiU9m3GnrNynmVGrXpSjvOclOcxd1bp2BFYnIUU
         ig5yowjjA88B23ojmPhnQkLQbAjAI1pJLwh7g2ORtKsFBCMfnF/BXT+9+WqAOvqkDTGU
         /aPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XW6l4UYrm0yyzmarTcv0AQ0+utEDkcMwT9ee84sdcjI=;
        b=VhrvRJXXF3/M9bM818hCBvHw//De61lMuYkT9xUBLcCuXV4u8C/yNtJf8koxP+tBh/
         dnyA04K26Se3qlPuxaWLKc0kowH6wtxtlelPmt4OnE4nCteRaz9OWaIWnkKRHlIJ5Jiq
         ++1RUNcWFUjT0ZBIdHV9QyB4LkIkkAYrvAmwnvtdWiqs8dQS2DGi9YNT2z7vHfPV65gJ
         BIGr4l+gXQSWQ1DZ2pKbser4YqcyXcsQ8xeRnBfcSyklQNmrb8da57o0BkTOmiUrow8J
         BX0xbXPFvfmb22SF10de2mr9Nl936orevXEsffXcuiHDPrAUTPCCPtQUCI5uBrnc1zPW
         sw4Q==
X-Gm-Message-State: AOAM531Wt406LXIBsvUr+iKfnB8OyMBK7bHLIdMP0XBHdgrxN8tmo/TG
        FBkHgqC3pIz+RRxkmP6rU1I=
X-Google-Smtp-Source: ABdhPJxev2UTZ/2i1J9Go+S+CK34gRxt+EZbPIY3uJgLRlAX+mAi8Qgdi/xZcBCWbPDwJbzvZX+V5A==
X-Received: by 2002:a05:6512:d2:: with SMTP id c18mr6353258lfp.484.1633474869428;
        Tue, 05 Oct 2021 16:01:09 -0700 (PDT)
Received: from localhost.localdomain (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.gmail.com with ESMTPSA id j18sm2101125lfu.84.2021.10.05.16.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 16:01:08 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v4 4/7] dt-bindings: memory: lpddr2: Document Elpida B8132B2PB-6D-F
Date:   Wed,  6 Oct 2021 02:00:06 +0300
Message-Id: <20211005230009.3635-5-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211005230009.3635-1-digetx@gmail.com>
References: <20211005230009.3635-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Elpida B8132B2PB-6D-F memory chip is used by ASUS Transformer TF101
tablet, add compatible for it. We need to specify this compatible it
for a device-tree node containing corresponding memory timings in order
to allow software to match the timings with the detected hardware.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
index 01efb43c3425..464d8406be3c 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - Elpida,ECB240ABACN
+              - elpida,B8132B2PB-6D-F
           - enum:
               - jedec,lpddr2-s4
       - items:
-- 
2.32.0

