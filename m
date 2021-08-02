Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ECA2C432BE
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 21:20:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0687460F58
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 21:20:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233218AbhHBVUy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 2 Aug 2021 17:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233146AbhHBVUw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Aug 2021 17:20:52 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B4DFC061760;
        Mon,  2 Aug 2021 14:20:42 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id a26so36121126lfr.11;
        Mon, 02 Aug 2021 14:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=r+n6L5LnjkR3JjMOorSuNebIWgL0pmMvWc1cKkkewqM=;
        b=hZ5OZdTLnH7sMPeAnE3yDwC95Oha0Brxq+JMQZGzJ8KAb8kGAJWgYZOvFY7YlPIxIR
         4fcmj6sB3dZ4nCD9p3STqmvsjhGqIs4RhkNyOtbmv6m9AT4qIdHWPMZ9u2SQlZB5xWeL
         3cUNb8izlqxegqrBrcg8s4bJakGh6YaJ75/dfcXpT6mvP45hcoREKUqdq7Sf/k5n9VUK
         v/b5y+pxNf0oyISZcPrIIcnwl9GmRctaV/NSbNidAAngfRpn5qEJJskxOxItEjxA+kgm
         duds/OFB2KJKg0rkVzg4W+YTEjKPxXKD6ZZt6/MH9OHnp0Zu9JUf2wXA9xBPA+LahNhc
         psfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=r+n6L5LnjkR3JjMOorSuNebIWgL0pmMvWc1cKkkewqM=;
        b=j10T1bFIECiBRIppt49/scv7e4kX2E/o7JYjG3b0kZXolSDu9v7R3Wpeq8zpoEUh6e
         w3w+YXsuteLXldsGX9ZDg70QpvKRN72jD9fYuic90vNBw/9lQGPG+3LikWQBw5yMmbKe
         vuOh3FvfSzlN+xqoSCh2cfG8KaUgMysVxUlx8vo9DuSoP6n9d7O3cOOJHyBrx9X6xgna
         +AKzGnW7tkWKZuypocgQKgciUZ7NAQcQbWSiqFtuSGtJc79KcxsQC+3K1wULwxEdILRb
         IvMCwJ8nCEUlJJYhw7btxmQujS3wtxARJCyLDGtcwzkAPmHVnOOP2UjJhUIUlaHtGx9S
         uXxg==
X-Gm-Message-State: AOAM531maYhEzJgyiy38sYQkdMIfn5SNwVvmwpMe4dbRur9iVdTIFfif
        w0/cyFSoPwUpnayaBdm5vBc=
X-Google-Smtp-Source: ABdhPJz5CPEVRvyvx4zI6fmz2lOKJoyeYs5ENZFVgptkNlSizDpU6JhPOGlgioexlNCBotQGewPoog==
X-Received: by 2002:a05:6512:ea8:: with SMTP id bi40mr6166823lfb.303.1627939240812;
        Mon, 02 Aug 2021 14:20:40 -0700 (PDT)
Received: from localhost.localdomain (94-29-22-96.dynamic.spd-mgts.ru. [94.29.22.96])
        by smtp.gmail.com with ESMTPSA id p14sm764942lfa.117.2021.08.02.14.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 14:20:40 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 08/15] ARM: tegra: cardhu: Correct interrupt trigger type of temperature sensor
Date:   Tue,  3 Aug 2021 00:19:40 +0300
Message-Id: <20210802211947.19715-9-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802211947.19715-1-digetx@gmail.com>
References: <20210802211947.19715-1-digetx@gmail.com>
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
 arch/arm/boot/dts/tegra30-cardhu.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index d9dd11569d4b..448f1397e64a 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -348,7 +348,7 @@ nct1008: temperature-sensor@4c {
 			reg = <0x4c>;
 			vcc-supply = <&sys_3v3_reg>;
 			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(CC, 2) IRQ_TYPE_LEVEL_LOW>;
+			interrupts = <TEGRA_GPIO(CC, 2) IRQ_TYPE_EDGE_FALLING>;
 			#thermal-sensor-cells = <1>;
 		};
 
-- 
2.32.0

