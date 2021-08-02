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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24797C43214
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 21:20:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C8A7610CC
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 21:20:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232842AbhHBVUu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 2 Aug 2021 17:20:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232853AbhHBVUt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Aug 2021 17:20:49 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 275FBC06175F;
        Mon,  2 Aug 2021 14:20:39 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id m9so25627385ljp.7;
        Mon, 02 Aug 2021 14:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3aEiiLuv1WM/3EAtaGD2DM/Ln5cq0U6ILaZtYQuvvB8=;
        b=D9pRyWwc8xA5Ssu226RRN+2uhhPAjslLWQqlY6TXLBwUotoP0qVdA0A3HTaF4uH68A
         eTQRNWfPfulc9Y6w4OHo53PHPjNmdGozj3oFDEnbKjdrMWSP2z/7z0cKcCCwcliut/I/
         AsS/psbnWuAmj/bpKq677QpgaXJyK4Eq5sZO24w5rma2SX9JFiu4BgyL3mB4U9VtBWmr
         BzI74oz+qffpaRmHtXnXtUSrb4UgvTCdamdgh+vfwATnCuPKrtKnNUQiEjdqNmrn88nU
         vuP06tXRcbSgLusLx+AXb4mQiPsgQ7GJH2t/Aw+5XRZvZbqkbZFWjaQDxojr9Yuu65Vw
         +7tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3aEiiLuv1WM/3EAtaGD2DM/Ln5cq0U6ILaZtYQuvvB8=;
        b=I51pPWYQQKzSZOJbpQnz80JTB4E+e3yN9Gb6O3iv+SIwXfJKbVWeO3QKRnKvcUf2TT
         4El/Loj6pat3d9h/AxE5ICSZph7bowuOBMcz8F9/mZtECFw2aV/6smOXCCsvx4pnb8Q1
         RZTuUkuQ+iZV+XbD8yw87RRc8/dS+cTFU+JBH4rX/xHIxmFRJi6r8WiLzI6bZ4RPk2Nn
         ZOhnRWppsAauxVUxfzLbSeYA+l0PqynKf5anESblcmx/6rvIx9GbZhL+9tTvKRKGvIrY
         R7fHOC/uUNk1nFibBu3pko4E4MazBWufBbOab9PGmqJAGmX8IuMuSrcXnRp39n1t+oVH
         vi4w==
X-Gm-Message-State: AOAM5338MLG2a1zZ9KYyA6gKzRYZe1hzS21DIYxXBhoLuXmBPHabqmSj
        anyQTojKpjK/28AjWBT/+ps=
X-Google-Smtp-Source: ABdhPJzRsANCG0lD0+qnQZcvd171UW9xSj1bEnyp1Eofl29013JM/9kA5H4vJukaP9JVlQej/OBryw==
X-Received: by 2002:a05:651c:1108:: with SMTP id d8mr12625967ljo.127.1627939237586;
        Mon, 02 Aug 2021 14:20:37 -0700 (PDT)
Received: from localhost.localdomain (94-29-22-96.dynamic.spd-mgts.ru. [94.29.22.96])
        by smtp.gmail.com with ESMTPSA id p14sm764942lfa.117.2021.08.02.14.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 14:20:37 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 03/15] ARM: tegra: paz00: Add interrupt to temperature sensor node
Date:   Tue,  3 Aug 2021 00:19:35 +0300
Message-Id: <20210802211947.19715-4-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802211947.19715-1-digetx@gmail.com>
References: <20210802211947.19715-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The TEMP_ALERT pin of LM90 temperature sensor is connected to Tegra SoC.
Add interrupt property to the temperature sensor for completeness.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-paz00.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts
index 3180bff90756..acc816bfd233 100644
--- a/arch/arm/boot/dts/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/tegra20-paz00.dts
@@ -503,6 +503,10 @@ ldo_rtc {
 		adt7461: temperature-sensor@4c {
 			compatible = "adi,adt7461";
 			reg = <0x4c>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(N, 6) IRQ_TYPE_EDGE_FALLING>;
+
 			#thermal-sensor-cells = <1>;
 		};
 	};
-- 
2.32.0

