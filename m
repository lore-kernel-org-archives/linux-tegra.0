Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 289C8C433F5
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 22:47:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1262F61090
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 22:47:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239706AbhJFWth (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Oct 2021 18:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239692AbhJFWtg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Oct 2021 18:49:36 -0400
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A32FFC061746;
        Wed,  6 Oct 2021 15:47:43 -0700 (PDT)
Received: by mail-qk1-x72a.google.com with SMTP id l7so4300202qkk.0;
        Wed, 06 Oct 2021 15:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eJzkAxAf4pzgN3Z1+ho4aj8iG+zpgpgw5v1wwaur2Uk=;
        b=mqfhoIhcF6l5svkA/pmE4pwHZVRlLCY1LiDwyFGHMeIc/bz1S2AEYcqrB/FOJWQWOl
         kGTTdeJG/SiKzwV98c6yqHv7K7oCtc0FaoZz729NIqevObIb+0V9/FGp0mKuw7CEMDlh
         ywsILH0N6HA4Xit5cNjHQNaaBk0SXBsqUmqqaQXF+MsdAczAsofcNJl7qi+Sbpit/JUP
         +DZNVV0Ot9TP+oi3d+UPI8j7k1Edohkc9aI+ogyyOI5OtZgOHcYoKtrnYQia5FeQWzNY
         Zu237sY3l1uB1UnZ8ZFBSvn3X2YJclWsOIOPp+LqMc+iR6n6Q2Xt8QxsXXC+swlfJwpQ
         aMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eJzkAxAf4pzgN3Z1+ho4aj8iG+zpgpgw5v1wwaur2Uk=;
        b=4tt9GK+bWQ4QA4KYaoHPY8QQ6U/KihgNUz6ooWRMfvzeSnbc6aDlU3S7zgDSeViMpt
         ewOUJe8w36eIyIWuE67In0RF0bk0MN3cN3YM2wNN0HWs1RSYkcuvoDNleEdX0JORgK14
         R9S8djnBiw0PRBGPpeKDFtKygqVcKqcHpRoH4IwnjpY3mCNKuWQy9jXnqPxbQP/aAz3G
         Q1IR289Zp/GOgPVT3Uch+AoFqCTqxdkp52nMxV86jHViCLot4mbENM56HamJNvc00uS8
         ZUO+npzhQf1GAKzDp1YmfO1wiy4YXNEFm2DJ+/7utxBW+s/rtzcrjAIZfEKt3+9t+mrm
         HM3w==
X-Gm-Message-State: AOAM530ujGh26/4g2mPvYkIbsn62vWLsBarOVSBvMYHC6nZCEfOyDRiR
        rLdk5gqXAar5kiTch81ft5jMn2kMDgU=
X-Google-Smtp-Source: ABdhPJwO/wPpPPDzjFNoo9ZNqpjkgkXY3mRRkfnTzbzLweSXj0M/86jtOjjH7S9InZTAJeZ6gvoNew==
X-Received: by 2002:a05:620a:288b:: with SMTP id j11mr645400qkp.175.1633560462867;
        Wed, 06 Oct 2021 15:47:42 -0700 (PDT)
Received: from localhost.localdomain (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.gmail.com with ESMTPSA id n11sm14738166qtk.92.2021.10.06.15.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 15:47:42 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v5 1/9] dt-bindings: Relocate DDR bindings
Date:   Thu,  7 Oct 2021 01:46:51 +0300
Message-Id: <20211006224659.21434-2-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211006224659.21434-1-digetx@gmail.com>
References: <20211006224659.21434-1-digetx@gmail.com>
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

