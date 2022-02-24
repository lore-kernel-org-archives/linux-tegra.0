Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 503DBC433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Feb 2022 07:28:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231488AbiBXH2g (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Feb 2022 02:28:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbiBXH2g (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Feb 2022 02:28:36 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C03A0160FE1
        for <linux-tegra@vger.kernel.org>; Wed, 23 Feb 2022 23:28:06 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E8ECD3F1D9
        for <linux-tegra@vger.kernel.org>; Thu, 24 Feb 2022 07:28:04 +0000 (UTC)
Received: by mail-ej1-f70.google.com with SMTP id la22-20020a170907781600b006a7884de505so796574ejc.7
        for <linux-tegra@vger.kernel.org>; Wed, 23 Feb 2022 23:28:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:resent-from:resent-to:resent-date
         :resent-message-id:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WjlQPejglQ4l0/ZVVSaNpSupfbDyFF7DpYFPDOdJqWE=;
        b=mFe14fV2ofOZANEEQ/km/tg7sM0pA9loBwAXTx0LxbOmtuNo9tLROYPn6D+KZd7ohk
         d3tmY+e0bJpE3vcYNLOMzMlHgPvxxvIYfnR0wk7oDlEMKRDmDsvyblnQzH0QN+Hqdcdz
         d+EgoinCVwGGlF5HbWlNdG2l10W25Vzd9OvATvB0r3Zcg2nOLu4KUYZqOlfFDCGGLdal
         zjq167FKBJQagL+bqVrb/N3i9HuT4sZ4RM5ufiYgNdRA6UKbYR0/6wCSlIZjES5LYmYG
         qUMp44PlZUA3v41yK8NMLMpX0Z5C5qfnILh+hbHSOCUBN/1r3cudKHDb1PeuDKOZ65zQ
         EiAw==
X-Gm-Message-State: AOAM533Xw/8IXgkI75tIB/JIoxMeNMHPZxu+FSDTPPT2/Tz4c0KwmRiR
        +coZEwdm0gOZXuqGrxaQUVWXAMt3DAmYyf05MfULeyN7fC/V+vEhDTc2veWfVwHZw/5N2558rRt
        4Kyx0vnCnaNir7tYOqrN6/XBRM+sZrYGPDlYZLMZD
X-Received: by 2002:aa7:d403:0:b0:40f:739c:cbae with SMTP id z3-20020aa7d403000000b0040f739ccbaemr1068519edq.267.1645687683832;
        Wed, 23 Feb 2022 23:28:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzafr1w2/HjIH333Ois/tiPKgL2Mm/PUYNVegq8xv7dcSf4aQvyyujNMf28/x6oUMktTCrLsQ==
X-Received: by 2002:aa7:d403:0:b0:40f:739c:cbae with SMTP id z3-20020aa7d403000000b0040f739ccbaemr1068509edq.267.1645687683641;
        Wed, 23 Feb 2022 23:28:03 -0800 (PST)
Received: from [192.168.0.127] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id y21sm890031eda.38.2022.02.23.23.28.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Feb 2022 23:28:03 -0800 (PST)
Received: by 2002:a17:907:d86:0:0:0:0 with SMTP id go6csp753948ejc;
        Wed, 23 Feb 2022 16:34:43 -0800 (PST)
X-Received: by 2002:a05:6402:4309:b0:40f:8bf7:18cd with SMTP id m9-20020a056402430900b0040f8bf718cdmr97625edc.79.1645662882963;
        Wed, 23 Feb 2022 16:34:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645662882; cv=none;
        d=google.com; s=arc-20160816;
        b=xOv6p8/6IGo3d8qbwxuLchFRZuMGHnFOLmDYN4lf6jW6vG/BaCftHD3aUGKbwR6odf
         yC5uayzlVv1VCB4BVTyUdPteWRGSJ56XF92GPNd2XiIz6+OomL8zg23/ARZdc+lxzbqV
         cciUA5pxtw7qzCc4M97M9Y9IZytBejRB8QxL6pbHTOxmTZ25cvZChUC+YMxuiRwf5iz/
         2LdEQMlLEkZNYIyBnsIyCJ6FoBKvq37vHYOAiYSofxkBLyfllfCINbMpIBoHgNMxMwrY
         Sr+wr4hZDXoEM4hvvfY8NTIDI/m/G1qD/sZ/c4A/hQn0y671IBzQ89i/+rFDMTahh0oi
         N3xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WjlQPejglQ4l0/ZVVSaNpSupfbDyFF7DpYFPDOdJqWE=;
        b=d5KC9UDbuTL4bsDnQzGJazdO+IYafa3N2S1wKKopiXTXI4eKi3viHiYf/kNcyoAZku
         BxAavrXY6qEZ0Kv9uLT/gMXDbTHXXjE78ja5bxPTLFZrc4afJ19P57e4k+WFebooi7AT
         ZwhBiAFnpl3ILNJ6+QKX7l/hzTMXaWDmkWXIA5drfR7IQhyQ9YXpds/YyxK4E4bZY6F9
         2vQ63Hu6Tioaefjf2yMS0c/3NTM2Ijvb2/d9+FrSNrllvlUqL9PrOeaPHvPFyk6z7Gs6
         zbXSUDn4bt705bWkTWG1oEcMQIwyN4HORWFw9gwxLoR1JeeCyNW7ovWBmG05Yyh6c58H
         pCzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@chromium.org header.s=google header.b="c/jS859k";
       spf=pass (google.com: domain of jwerner@chromium.org designates 209.85.215.174 as permitted sender) smtp.mailfrom=jwerner@chromium.org
Received: from seviper.canonical.com (seviper.canonical.com. [91.189.95.10])
        by mx.google.com with ESMTPS id dt6si609027ejb.163.2022.02.23.16.34.42
        for <krzysztof.kozlowski@gapps.canonical.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Feb 2022 16:34:42 -0800 (PST)
Received-SPF: pass (google.com: domain of jwerner@chromium.org designates 209.85.215.174 as permitted sender) client-ip=209.85.215.174;
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by seviper.canonical.com (Postfix) with ESMTPS id 7E4871A2F83
        for <krzysztof.kozlowski@canonical.com>; Thu, 24 Feb 2022 00:34:42 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id 132so318451pga.5
        for <krzysztof.kozlowski@canonical.com>; Wed, 23 Feb 2022 16:34:42 -0800 (PST)
X-Received: by 2002:a63:5fd7:0:b0:338:9599:f098 with SMTP id t206-20020a635fd7000000b003389599f098mr291528pgb.226.1645662880866;
        Wed, 23 Feb 2022 16:34:40 -0800 (PST)
Received: from jwerner-p920.mtv.corp.google.com ([2620:15c:202:201:e321:1e1b:f71e:33c])
        by smtp.gmail.com with ESMTPSA id ms7-20020a17090b234700b001bc7e6fc01csm4100344pjb.40.2022.02.23.16.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 16:34:40 -0800 (PST)
From:   Julius Werner <jwerner@chromium.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Julius Werner <jwerner@chromium.org>
Subject: [PATCH 3/3] ARM: dts: Update jedec,lpddr2 revision-id binding
Date:   Wed, 23 Feb 2022 16:34:21 -0800
Message-Id: <20220224003421.3440124-4-jwerner@chromium.org>
X-Mailer: git-send-email 2.35.1.473.g83b2b277ed-goog
In-Reply-To: <20220224003421.3440124-1-jwerner@chromium.org>
References: <20220224003421.3440124-1-jwerner@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch updates the tegra20-asus-tf101 device tree to replace the
deprecated `revision-id1` binding with the new `revision-id` binding in
its "jedec,lpddr2"-compatible node. This was the only DTS in the tree
using this binding.

The revision-id2 (mode register 7) of this memory chip was not given in
the existing device tree, so let's assume 0 for now until it becomes
relevant.

Signed-off-by: Julius Werner <jwerner@chromium.org>
---
 arch/arm/boot/dts/tegra20-asus-tf101.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20-asus-tf101.dts b/arch/arm/boot/dts/tegra20-asus-tf101.dts
index 020172ee7340ec..c700f80e2a366e 100644
--- a/arch/arm/boot/dts/tegra20-asus-tf101.dts
+++ b/arch/arm/boot/dts/tegra20-asus-tf101.dts
@@ -756,7 +756,7 @@ emc-tables@3 {
 
 			lpddr2 {
 				compatible = "elpida,B8132B2PB-6D-F", "jedec,lpddr2-s4";
-				revision-id1 = <1>;
+				revision-id = <1 0>;
 				density = <2048>;
 				io-width = <16>;
 			};
-- 
2.31.0

