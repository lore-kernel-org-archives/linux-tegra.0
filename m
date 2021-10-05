Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A142C4332F
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Oct 2021 23:01:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7902B61163
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Oct 2021 23:01:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236866AbhJEXDA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Oct 2021 19:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236909AbhJEXC7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Oct 2021 19:02:59 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C2D4C061749;
        Tue,  5 Oct 2021 16:01:08 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id n8so2329320lfk.6;
        Tue, 05 Oct 2021 16:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eJzkAxAf4pzgN3Z1+ho4aj8iG+zpgpgw5v1wwaur2Uk=;
        b=WQlJPb3i5Db2P1qAhx0S6/6tpo6d3hGy1p8UsLsKwGlx8QEEai/4IiHwa2KXGaGM2b
         2/gWL7QNp1Rmu3iZgaAPwKlknqc8wPEOxFzGJSY2mNRpBS1BLvKLcySNWlkeKDnhg+SD
         1qKjWbyM9NkhMeckEBnksv5KIjV0fncZYZ0gQzqyaZkYmZobSSptR4GPPUdzx9NgOJIH
         Ov7Q+qFNuenBdq+ZdFT1I/MJhijc4HJx/W141TCP+L0GSq6w3N7cU8xb5E7xLtOoldie
         AghSCmOyAPI8uUlGjZ4EV/iqMZ2RH4f7AG91NFZRHSODeTw88xCjYkEe/9OigVjD3IEM
         T3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eJzkAxAf4pzgN3Z1+ho4aj8iG+zpgpgw5v1wwaur2Uk=;
        b=yzdToKE/PbPZLG5dehvqyJLB4F2dcrtqwDs1V44juLaND60+gnE0DaLobwD2eyQp4K
         nABmVto9lekWVnWeV+4oiob1xFWedM/4V92pCTtEsaFswJsiRxt/Sl0/tr6wOvkEkGMt
         k5bjuhbijBvli8nkxoIqWhr5V4Fk01Pd8rRn4vzgwD71HXSsjCTCtb41UlhMgKDxmfO3
         cooeLnPQ4u4Ec2YkeHi+z2VmOBcSso2Gj7ILmOml46WEFed7RuqUhrmXc4O0DXKmhGwN
         J4tS20fzB7L6AQtgexZPhWOmF6BrPkYGJ9elB/yBKp/H6HW/9xpC14i5D7WdDpcW5zbK
         OVQA==
X-Gm-Message-State: AOAM530hbhkoDntXFt+QCbylV/SEWEzRTDjlbOvHB5rOqX7a4q2ON0Ih
        rlDcZNjR7AevCjY77suX3vM=
X-Google-Smtp-Source: ABdhPJz2C1hDKFyXRKW8nFmufCtfQTbfQroxulZYpGALT7mSInNfS1EM+YHgLWu7j8A3NPGNztmNww==
X-Received: by 2002:a2e:a22a:: with SMTP id i10mr24093124ljm.464.1633474866858;
        Tue, 05 Oct 2021 16:01:06 -0700 (PDT)
Received: from localhost.localdomain (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.gmail.com with ESMTPSA id j18sm2101125lfu.84.2021.10.05.16.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 16:01:06 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v4 1/7] dt-bindings: Relocate DDR bindings
Date:   Wed,  6 Oct 2021 02:00:03 +0300
Message-Id: <20211005230009.3635-2-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211005230009.3635-1-digetx@gmail.com>
References: <20211005230009.3635-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Move DDR bindings to memory-controllers directory to make them more
discoverable.

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/{ => memory-controllers}/ddr/lpddr2-timings.txt      | 0
 .../devicetree/bindings/{ => memory-controllers}/ddr/lpddr2.txt   | 0
 .../bindings/{ => memory-controllers}/ddr/lpddr3-timings.txt      | 0
 .../devicetree/bindings/{ => memory-controllers}/ddr/lpddr3.txt   | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename Documentation/devicetree/bindings/{ => memory-controllers}/ddr/lpddr2-timings.txt (100%)
 rename Documentation/devicetree/bindings/{ => memory-controllers}/ddr/lpddr2.txt (100%)
 rename Documentation/devicetree/bindings/{ => memory-controllers}/ddr/lpddr3-timings.txt (100%)
 rename Documentation/devicetree/bindings/{ => memory-controllers}/ddr/lpddr3.txt (100%)

diff --git a/Documentation/devicetree/bindings/ddr/lpddr2-timings.txt b/Documentation/devicetree/bindings/memory-controllers/ddr/lpddr2-timings.txt
similarity index 100%
rename from Documentation/devicetree/bindings/ddr/lpddr2-timings.txt
rename to Documentation/devicetree/bindings/memory-controllers/ddr/lpddr2-timings.txt
diff --git a/Documentation/devicetree/bindings/ddr/lpddr2.txt b/Documentation/devicetree/bindings/memory-controllers/ddr/lpddr2.txt
similarity index 100%
rename from Documentation/devicetree/bindings/ddr/lpddr2.txt
rename to Documentation/devicetree/bindings/memory-controllers/ddr/lpddr2.txt
diff --git a/Documentation/devicetree/bindings/ddr/lpddr3-timings.txt b/Documentation/devicetree/bindings/memory-controllers/ddr/lpddr3-timings.txt
similarity index 100%
rename from Documentation/devicetree/bindings/ddr/lpddr3-timings.txt
rename to Documentation/devicetree/bindings/memory-controllers/ddr/lpddr3-timings.txt
diff --git a/Documentation/devicetree/bindings/ddr/lpddr3.txt b/Documentation/devicetree/bindings/memory-controllers/ddr/lpddr3.txt
similarity index 100%
rename from Documentation/devicetree/bindings/ddr/lpddr3.txt
rename to Documentation/devicetree/bindings/memory-controllers/ddr/lpddr3.txt
-- 
2.32.0

