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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2507AC4338F
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 21:20:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F34260F58
	for <linux-tegra@archiver.kernel.org>; Mon,  2 Aug 2021 21:20:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233235AbhHBVUz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 2 Aug 2021 17:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233105AbhHBVUw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 2 Aug 2021 17:20:52 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C44B1C061764;
        Mon,  2 Aug 2021 14:20:41 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id g13so36132272lfj.12;
        Mon, 02 Aug 2021 14:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qGeXepf/KMG3yJmBmCJiEn21XsFabFobQrJDwifVJjA=;
        b=Nhx2B03NYdzOB9560XoEzOH0NFthFn+Wk7npAHDEiS3tC8y3XtqA649//d7ys3bLPd
         4sSs12Nh9Jn+ReN5aQlU7oc4cfEZ+gWS/49luuJ3qb2tq+RY7xaMr5kJOpmktykq3y/7
         kTn3cME9XqU4WI3/zU9nOspl7kaKbTT/PgJ7RHBC0s9veFqbabivnJMiu7OAPOkvFXfK
         PfFbodqgnexbheROP5OfLzewDlaz/HWnoFAj7Ps8O+baLxhLuFMhmQALlsYjdfz4jJ4S
         Q8iieX7M+mmmb3LMdiJz5bqoZu3pj1jXFou9XaLqSPDiv/6gGjsnXrA3KK3D3s27x/59
         ce+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qGeXepf/KMG3yJmBmCJiEn21XsFabFobQrJDwifVJjA=;
        b=bGnOcTB7CB+tKflc0dkNfYCO3BNGTu9Md9AhPl1HABg4The8C/I+BvKHIPctABfpHx
         xgWmdY+Fh7cd9JowfV2CGN17R9fLGpnUoAKYdfDR2hyhkr+owJv5Q7Dbhy9cwDGobmAa
         28LU0LsdxKuwVsleNYZx36gArHbwOs4QvXGDX9cY5yFZpWqFDYrJSgwL4u3go8v5M1Tn
         JnM8+B2z5JmUJr3a/Y3J8do1wPGSgEBZDxzsNH5rT6LPW8BYtWneLPGCAKIOsFSpkOEU
         2LMsMBe0RZhmcltizlHQMvdxRAptq7BDANUhCbvdkeKd1+fjkmROXGW+L8ZjHoAyPFRw
         mpcA==
X-Gm-Message-State: AOAM530nI38y+oNgPWMtkN8f/yTNB10xcJ+Yq/QLQYtLoqPST6Vlh/UC
        +AlR5djC/Y8BeOEP2b1AmpI=
X-Google-Smtp-Source: ABdhPJxtH8VThTxTiaLp2O2Ws3CNT5TfXyGVRSP5kYagRSA6yf7pehl0GPkj2OTjbOVaHCpfBVCmsg==
X-Received: by 2002:a05:6512:1295:: with SMTP id u21mr2406572lfs.622.1627939240200;
        Mon, 02 Aug 2021 14:20:40 -0700 (PDT)
Received: from localhost.localdomain (94-29-22-96.dynamic.spd-mgts.ru. [94.29.22.96])
        by smtp.gmail.com with ESMTPSA id p14sm764942lfa.117.2021.08.02.14.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 14:20:39 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v2 07/15] ARM: tegra: apalis: Correct interrupt trigger type of temperature sensor
Date:   Tue,  3 Aug 2021 00:19:39 +0300
Message-Id: <20210802211947.19715-8-digetx@gmail.com>
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
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi | 2 +-
 arch/arm/boot/dts/tegra124-apalis.dtsi      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
index 1e30fa405fa0..cde9ae8fa04b 100644
--- a/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi
@@ -1751,7 +1751,7 @@ temp-sensor@4c {
 			compatible = "ti,tmp451";
 			reg = <0x4c>;
 			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(I, 6) IRQ_TYPE_LEVEL_LOW>;
+			interrupts = <TEGRA_GPIO(I, 6) IRQ_TYPE_EDGE_FALLING>;
 			#thermal-sensor-cells = <1>;
 			vcc-supply = <&reg_module_3v3>;
 		};
diff --git a/arch/arm/boot/dts/tegra124-apalis.dtsi b/arch/arm/boot/dts/tegra124-apalis.dtsi
index 608896f8dd52..a46d9ba9bb7a 100644
--- a/arch/arm/boot/dts/tegra124-apalis.dtsi
+++ b/arch/arm/boot/dts/tegra124-apalis.dtsi
@@ -1744,7 +1744,7 @@ temp-sensor@4c {
 			compatible = "ti,tmp451";
 			reg = <0x4c>;
 			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(I, 6) IRQ_TYPE_LEVEL_LOW>;
+			interrupts = <TEGRA_GPIO(I, 6) IRQ_TYPE_EDGE_FALLING>;
 			#thermal-sensor-cells = <1>;
 			vcc-supply = <&reg_module_3v3>;
 		};
-- 
2.32.0

