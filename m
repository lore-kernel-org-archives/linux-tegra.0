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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E13BC4320E
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 21:20:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06E8160F58
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 21:20:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233312AbhHBVU7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 2 Aug 2021 17:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233176AbhHBVUy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Aug 2021 17:20:54 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE64EC06175F;
        Mon,  2 Aug 2021 14:20:44 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id g13so36132485lfj.12;
        Mon, 02 Aug 2021 14:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TktwpNHSF+Wej1fEkDyfPl6h0HdQmW0Iv261nOuSRAA=;
        b=K28cQHg0KLDgRBBDY1hTmUeLuS+xbqfKHiPtJ4CEtctFddCw7ZoK7lep+9Scg9UboC
         n9eErnhNw/x5Gfj6KV0lYpfZgF8Fei2YUJETtx8D37mGegbd1fcYmhtnInv1tVHhwXyV
         +Ig0a1/hb6AYSANCKvcnvXvKgy0HPzHzB2u10qDNsS4emQmHrPMJozs2xb4D/HBEnxyw
         rA+jhVAu3jG/DRibeJvVDyvto7tj/1FbZRBjdGp8HwSPunkNGC4aH8XnNL6XD+97dl+X
         GPLPHZ+i5fUMcceGn36rlM5VJxE0t65KJjPicfTzyTsMdbOjh1qTd0coDIMdmTZfLndq
         PB1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TktwpNHSF+Wej1fEkDyfPl6h0HdQmW0Iv261nOuSRAA=;
        b=jGATK9m4o+vuFG536IysdYy8uLdSfW/o4FoupOfiOikHS8IBqPw8XbgUWxI7jIPW2/
         D5n+UqiFqdFp9PX9U/D1DiO4EvZwrqULvZIQx8qtP3rx9lsZaXmf6SVB/Q4rxzOH8Xqj
         4D/+aA9HmiWpX5L4SJhs4jr75LtxevV16hUdCVr6BqOdKtr4w8QljAE7LKTk78XZY5om
         LWySNgQXNffftaDlr432z62K06UXHrPKK+ltkRzolgjnTDp5dDPgs43d2Fs/1JqLhVys
         7IrFZ3Ie53OrqK8CT6dH1mLWpYOq3p0O2dO2vzlNiCsBzeYjBVDFP6csAH4mZWCguIj/
         pyvQ==
X-Gm-Message-State: AOAM531n0SmLNqJvS7CUA2IlmTW/to7JtyzudoczdyVZ3nhhFqTGSnM2
        A+5RBWiJ/9FxLzh09phB6Dc=
X-Google-Smtp-Source: ABdhPJxjpeEfHPefZzpx1NNXA/4Fg3p0q/H/4FbfjjSEbi5VUaYW6VFtEU5P2ps51PgssXcb6c8akw==
X-Received: by 2002:ac2:592b:: with SMTP id v11mr14197920lfi.59.1627939243349;
        Mon, 02 Aug 2021 14:20:43 -0700 (PDT)
Received: from localhost.localdomain (94-29-22-96.dynamic.spd-mgts.ru. [94.29.22.96])
        by smtp.gmail.com with ESMTPSA id p14sm764942lfa.117.2021.08.02.14.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 14:20:43 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 12/15] ARM: tegra: acer-a500: Add power supplies to accelerometer
Date:   Tue,  3 Aug 2021 00:19:44 +0300
Message-Id: <20210802211947.19715-13-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802211947.19715-1-digetx@gmail.com>
References: <20210802211947.19715-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add power supplies to accelerometer node, for completeness.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index c385b13d4faa..7f20ea506803 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -482,6 +482,9 @@ accelerometer@f {
 					interrupt-parent = <&gpio>;
 					interrupts = <TEGRA_GPIO(S, 7) IRQ_TYPE_EDGE_RISING>;
 
+					vdd-supply   = <&vdd_1v8_sys>;
+					vddio-supply = <&vdd_1v8_sys>;
+
 					mount-matrix =	 "0",  "1",  "0",
 							 "1",  "0",  "0",
 							 "0",  "0", "-1";
-- 
2.32.0

