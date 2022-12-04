Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94F7C63703
	for <linux-tegra@archiver.kernel.org>; Sun,  4 Dec 2022 18:29:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbiLDS3e (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 4 Dec 2022 13:29:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230406AbiLDS32 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Dec 2022 13:29:28 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 871A413CC8
        for <linux-tegra@vger.kernel.org>; Sun,  4 Dec 2022 10:29:24 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id b13so4415182lfo.3
        for <linux-tegra@vger.kernel.org>; Sun, 04 Dec 2022 10:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ryJoqPUtDVrF6ZMuGugpVvxdT6Olzct3tNuDLcoDxHw=;
        b=IfFkxwrP2J1yEUneey53OCR0QJMYN7AzZLeaCBqufcp2eaE4MYqTHjtFVJYQhKFAGq
         CS5dL2cp1T0WrQl2ZmyrY4UhTGKIs8hm+R0sw5rumVaswUPmoSGfp0NQFUxwtbllt8+u
         XAhbonsl8ib/T9GefJ6b3q0xb4S01g2gXehEpQmFcSkH4vBfvn8ZJHlcQDxiK+oGxepR
         hBk+Mujnls2YCaYsqvN2Ek9vwuGtD5hq5RsXRKpKtof3vu0oYVgTI95GbFK/sc43hlzC
         ErsbXezeV//52O9fCKNc1nCaUNLbGlbWEc1N3D/Q3Ughd6BS7soYqwCOWSulvuIJ507h
         qRYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ryJoqPUtDVrF6ZMuGugpVvxdT6Olzct3tNuDLcoDxHw=;
        b=PARyPsoqiVR9XKveFyAMlI4IJXuZQ6xFggGgU23VivUSJcAqlkdGV1DWKLNhwzT6aR
         lS+xAmkeGsGk2PBN+o02TdGvdpQsp7VY4Bv+EjhbxYn/VgGINC5dLToD3GQC5SjDwGrr
         oAh5V9nQ7v2GoVuEvxaQ+PaAwJon2ve8AozCCr0xCttV/HhvWAqiBw8Ly91UspVQB7L5
         9KZ+n95jbFje4AkeC7siJtziOqk1Krt8sY+sQ9t2ykc2JF+2KcBDrwRZ5bP2VGQ4G+wM
         8rhPK29kQeu39fxrXp4MIL3vxvWbpG/Ug5NnDzaymRoZKSw3+J7vfpDqSaSNtaemNyfu
         FTTA==
X-Gm-Message-State: ANoB5pmrrZ/MTQQqKNsG3APNIjnXjUpNJ6RVSMmFtRIlMN3tx8yy5fdS
        gsLzw5E6w7oouGpHy7roHlVGSQ==
X-Google-Smtp-Source: AA0mqf7nxPRzYRU2hJOcxiFhlwNOAUgO8BwHiwE2ub621XQoE8wygLtenUJp9XS49uHrcaozZgRRpg==
X-Received: by 2002:a19:6903:0:b0:499:8e29:2763 with SMTP id e3-20020a196903000000b004998e292763mr29560291lfc.137.1670178564112;
        Sun, 04 Dec 2022 10:29:24 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i15-20020a056512340f00b004b3b2a9f506sm1838996lfr.4.2022.12.04.10.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 10:29:23 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Joe Tessler <jrt@google.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 5/9] media: dt-bindings: chrontel,ch7322: reference common CEC properties
Date:   Sun,  4 Dec 2022 19:29:04 +0100
Message-Id: <20221204182908.138910-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
References: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Reference common HDMI CEC adapter properties to simplify the binding and
have only one place of definition for common properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/media/i2c/chrontel,ch7322.yaml   | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml b/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
index 63e5b89d2e0b..50937bf5ebda 100644
--- a/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/chrontel,ch7322.yaml
@@ -13,6 +13,9 @@ description:
   The Chrontel CH7322 is a discrete HDMI-CEC controller. It is
   programmable through I2C and drives a single CEC line.
 
+allOf:
+  - $ref: /schemas/media/cec/cec-common.yaml#
+
 properties:
   compatible:
     const: chrontel,ch7322
@@ -40,16 +43,12 @@ properties:
       if in auto mode.
     maxItems: 1
 
-  # see ../cec.txt
-  hdmi-phandle:
-    description: phandle to the HDMI controller
-
 required:
   - compatible
   - reg
   - interrupts
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1

