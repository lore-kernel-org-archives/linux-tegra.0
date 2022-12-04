Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95F42C47089
	for <linux-tegra@archiver.kernel.org>; Sun,  4 Dec 2022 18:29:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229834AbiLDS3d (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 4 Dec 2022 13:29:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230373AbiLDS31 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 4 Dec 2022 13:29:27 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A49D12D09
        for <linux-tegra@vger.kernel.org>; Sun,  4 Dec 2022 10:29:24 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id c1so15347405lfi.7
        for <linux-tegra@vger.kernel.org>; Sun, 04 Dec 2022 10:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3M3VyN+gt6ftGeaDe6rXF+qMLaJNZCrheDPOaVNkN4=;
        b=Ds+u0ZbE0sJq/iBjWNK+IxPNbNDviPYZcAp+xql3tG9OD0vWUJ8mfgXG/Vaw9ddwiW
         xEav0N5hivFM+WsRUKsisnKVi+OmcpfL+dZh8IyGIx3ry1F7tciUd61J6xe5BkkBOu35
         qcgH6KTuszPG+CggawH1zVfd+rwsK/WqTeoFO4uhXP40rVGDcGMBqo3AJ7jCC99KeYuS
         3slDIWRZWydsycY6PPEmkDMDfNgcnAMpx0XUZpzcDVZls3N9jS2EkxyZUeIlfG8lW2To
         BbA7HiVcq1qaBvak1jJPKyygT50cVcPfUrAjRvEflATLZXrFKApwLkzPdn4FeUE+3iUa
         XySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3M3VyN+gt6ftGeaDe6rXF+qMLaJNZCrheDPOaVNkN4=;
        b=3SlsWLB1tMMNOZwhgcPMsvP9IL3J8tJrXbHHOUOIlTA6DD3IivlXdQ7J0SawHf1HFD
         Tgn8FFSoe+nK89OMcODMjV9RH5fCZb0CBfUQgyrEWnf5Vf2I5OurbhkaSbPcskopaw5K
         SBZARiQsyo7+220xpN6NlZbD6Ws+9dECc5FI9YnyNJYKK7ANGjkyidvGDTZrwzxg/83O
         Cf/r/KmdlFTKKFpJIm33Oi6W5L0yOXgzIFXbzVsVP9YqNx0Zxuoq3BC4baBA2ARLWJSO
         r01P0oX7NTYQWROCLtFfBNtbBZ6h2ywkXmehlbc87E04B2bCsXyDcOYPvq9sru1V73y9
         whFg==
X-Gm-Message-State: ANoB5pm14BulZswX4dMG8SFwOQHL6bWvCc/rhy7EdVAKLxfd9RKLwVDV
        T1UnWsE0iH2Ya0GmmjXzSJNlrg==
X-Google-Smtp-Source: AA0mqf6pY51XPJcwK4YklKJNLUWc3bAAU36hqO/Jj5kXIUWVKjswhYHVnyQo7swA5lN98jdcrzxwiA==
X-Received: by 2002:a19:f713:0:b0:498:f36a:76fa with SMTP id z19-20020a19f713000000b00498f36a76famr27418948lfe.532.1670178562707;
        Sun, 04 Dec 2022 10:29:22 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i15-20020a056512340f00b004b3b2a9f506sm1838996lfr.4.2022.12.04.10.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 10:29:22 -0800 (PST)
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
Subject: [PATCH 4/9] media: dt-bindings: amlogic,meson-gx-ao-cec: reference common CEC properties
Date:   Sun,  4 Dec 2022 19:29:03 +0100
Message-Id: <20221204182908.138910-4-krzysztof.kozlowski@linaro.org>
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
 .../bindings/media/cec/amlogic,meson-gx-ao-cec.yaml        | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml b/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
index f65c9681a9f7..b1fab53418f9 100644
--- a/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
+++ b/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
@@ -33,11 +33,8 @@ properties:
   interrupts:
     maxItems: 1
 
-  hdmi-phandle:
-    description: phandle to the HDMI controller
-    $ref: /schemas/types.yaml#/definitions/phandle
-
 allOf:
+  - $ref: cec-common.yaml#
   - if:
       properties:
         compatible:
@@ -81,7 +78,7 @@ required:
   - clocks
   - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1

