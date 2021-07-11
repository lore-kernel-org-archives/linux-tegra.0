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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DDA6C07E96
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:49:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E52D560FE6
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:49:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231827AbhGKXwk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 11 Jul 2021 19:52:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbhGKXwj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 11 Jul 2021 19:52:39 -0400
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com [IPv6:2607:f8b0:4864:20::72e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB6DAC0613DD;
        Sun, 11 Jul 2021 16:49:50 -0700 (PDT)
Received: by mail-qk1-x72e.google.com with SMTP id r125so8647410qkf.1;
        Sun, 11 Jul 2021 16:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CNSY8UhODTxAg4eMh+nDoM93sAclOVBeBK6ccrmH+A4=;
        b=WlD7EuhbUCz2usrsAhyFevXwhJUjmumP85OGflJyMi76/5LPlmkzkhkh7Xi/ro+d9Q
         qN7pEntFam6CRtI8Bre22+lgFZMxYUqzDPkd7Hri9pSNPIm76+E0hkaikWyVyy+FI4Rt
         gzsCtA3DeAtmol+jLVdtKatCWOaEWf2vCUxDPsj5sUdnDvowpMsBkR/vazQxhC+7WoJu
         0Q2nhMkJZZLSsyQYfCEa5MOkvye/BCRiO8WIF6d4w/WIIpNL3I7mvoxu6SCTs4Zj0Jof
         ZOIicGui6Jjp19YSw0nHFxbeO/ihvWkFDnL7DQB5tNERaeDJFD8EaLu856KrXygAFKgv
         i4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CNSY8UhODTxAg4eMh+nDoM93sAclOVBeBK6ccrmH+A4=;
        b=BprGYr8f9hn1a2fayPBORyYC84GVytb0cLhyG52XjxOkOa5e8X3njjN2yTwoVkNL32
         XTgDiPgNoc//UGsjs0tTVBWkesjDBhodBCjD+NQJrxo/lF9HxdJqZmTdUps+pNvCtDzk
         RoMLh0wdHF0MT51MVK9/nwVpVufaEiTca1N4v5UXAMAVoRf9ox0jWRBf/fM5T7F0P4Eh
         e4GlVTx9xE8hYXhMo9YfWwCm30K5RFV9JcsEzZLhNZ6F1XDR05Zr9tc533ITwEU/UHkG
         WkLp2lBXP7mBDpSlK2W9G1xqjZ6vjrqCd0bMnE+Z+F6/CHOv/UYeQJVLA8RGl9lmzBgG
         rkWw==
X-Gm-Message-State: AOAM533a2TJOAog2lUS8tcEsfu4hws4tKbQFhoL1WCyp4N2uXe+Jm3GR
        gE2vlX4rULU/YKEMb/NSL0g=
X-Google-Smtp-Source: ABdhPJwQDxMkR3Wix+jUiyiTqj9jE7PZhD6IG6NlD0gjALSUpLEk7t3/G/GpKf+kgLmxKO8s64dX+Q==
X-Received: by 2002:a37:8bc7:: with SMTP id n190mr49046043qkd.113.1626047390008;
        Sun, 11 Jul 2021 16:49:50 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id d7sm5003072qth.70.2021.07.11.16.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 16:49:49 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/1] arm64: tegra194: p2888: Correct interrupt trigger type of temperature sensor
Date:   Mon, 12 Jul 2021 02:49:39 +0300
Message-Id: <20210711234939.28103-2-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210711234939.28103-1-digetx@gmail.com>
References: <20210711234939.28103-1-digetx@gmail.com>
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
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
index 7e7b0eb90c80..c4058ee36fec 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
@@ -309,7 +309,7 @@ temperature-sensor@4c {
 
 				interrupt-parent = <&gpio>;
 				interrupts = <TEGRA194_MAIN_GPIO(H, 2)
-					      IRQ_TYPE_LEVEL_LOW>;
+					      IRQ_TYPE_EDGE_FALLING>;
 				vcc-supply = <&vdd_1v8ls>;
 
 				#thermal-sensor-cells = <1>;
-- 
2.32.0

