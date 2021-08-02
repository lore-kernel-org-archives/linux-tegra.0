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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 503A1C4320A
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 21:20:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39FEB60F58
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 21:20:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233129AbhHBVUw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 2 Aug 2021 17:20:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232690AbhHBVUu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Aug 2021 17:20:50 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77E97C06175F;
        Mon,  2 Aug 2021 14:20:40 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id t9so23224882lfc.6;
        Mon, 02 Aug 2021 14:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xvmc8l15hNbrvN9H2NXvXrPct8+V6BEf3jgtoVaM0OU=;
        b=Aav9HhwrjQZWZKIkUod/2ak+4kN5+8kh0CJKqoqjr8xNHZG3I5StSstK+DAUwGCqQU
         PZ7uGxXIM6dyQ4jBXdmO9+fF1t0VZlrQq5+BcDzUQ0EeJAPHHmZKaDRiNFbOS0Rhrr+Q
         y7lYYr0WrMpvY2SyxxQLk71WS9SXvCKbmeTqiGRXpqVbJ51TPCkPPp0uGVYxgtqiVHFN
         ybATbEKYwsGI7E6nny9r+dSRT5mvvAGhke9AMSECYHHO55j5jc1Xob8aDlLJbqlXkCmJ
         QYx5KeVtYO0O+MnFODpXN18/fxYDJVXoKzW9bOStXG+YkWL2UdyK5KXNwLHHOwu+w9Y1
         6s2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xvmc8l15hNbrvN9H2NXvXrPct8+V6BEf3jgtoVaM0OU=;
        b=qGrniS6MMiX5wi746IStDQknUzzy6jPXICfge7h8bMiJuRn4kpOpPV+ANNzcJ0PLbQ
         Myhxa02Jxa5j7+DraT3I6MFYNkizmAkI09hYUORyf6a1/OKis1y6Hx9wcoCbWw8TRFYR
         ROMfiF52wYSvdr8NPAufvqx7mR7Zm7axa5ojsw3+9VKNIJcAMzz01b+qe6CSm12/Wdbj
         2VW7VzkBJhKIinWJ5ZA8bhRUf32olpBQVsypIzz2uuXOb2DQ4lHTUhj+NHLDrKLowE9a
         b1bz4oPg92it0Wh3/v+roQ6fsrXDBlp2gCUUwnqZ3eVPn8FM35oBI08Q6XURwOucsRAY
         mWBw==
X-Gm-Message-State: AOAM533ePkRUWe+3ZIF3clBKUVKNWLEsT/ccvqCs9tvPAInU4hX3YGIZ
        ajbY3RWMflauzZa+ii37ZOs=
X-Google-Smtp-Source: ABdhPJyJgOkwv/Jrgh1hrWwrFv2FUK+vVvDVOhY+IvpIcKFPtR1bWTGxueIbaqwG9+XqS8okN6A6VA==
X-Received: by 2002:a05:6512:3f99:: with SMTP id x25mr13635280lfa.225.1627939238844;
        Mon, 02 Aug 2021 14:20:38 -0700 (PDT)
Received: from localhost.localdomain (94-29-22-96.dynamic.spd-mgts.ru. [94.29.22.96])
        by smtp.gmail.com with ESMTPSA id p14sm764942lfa.117.2021.08.02.14.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 14:20:38 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 05/15] ARM: tegra: acer-a500: Add interrupt to temperature sensor node
Date:   Tue,  3 Aug 2021 00:19:37 +0300
Message-Id: <20210802211947.19715-6-digetx@gmail.com>
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
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index 1976c383912a..4897079680bd 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -693,6 +693,10 @@ nct1008: temperature-sensor@4c {
 			compatible = "onnn,nct1008";
 			reg = <0x4c>;
 			vcc-supply = <&vdd_3v3_sys>;
+
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(N, 6) IRQ_TYPE_EDGE_FALLING>;
+
 			#thermal-sensor-cells = <1>;
 		};
 	};
-- 
2.32.0

