Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6399C433EB
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 19:47:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A06661989
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 19:47:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231848AbhC2TrR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Mar 2021 15:47:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231547AbhC2Tq7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Mar 2021 15:46:59 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B46A1C061756;
        Mon, 29 Mar 2021 12:46:58 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id u10so17280228lju.7;
        Mon, 29 Mar 2021 12:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U9m/vE1DNphlJsrYchwoexwhY0Aq5nAA6kFZ0qFRU/c=;
        b=urDD6gw9VyK6JzSc7OkfGqU6GGBWbk7dG4CsL8sUd+aqLVPMrTYdkikyM/1bQFy77q
         Cbdsi8/wSL4TqNEiIys7E7b6UQN1m36dKkjagcmU5ZIgrtrQcWP4DuZlnO8t/XBfLabF
         Uj5Yto7RTKEBb0opkDe9vIFPY9grlf/jOu/Q7bkUp2CNjME7aAVWJBXg4WeI1BMR95E/
         nSuveIkSw4Y+ajMHbqec2Y3lMJZW5xHjA3R+nuO7NflWUWLUpp31czn3R1Mgp8VZxf67
         8BHCmi54OdwmBq6QY4ILah31OfOVMS+YiNXFyqY7/ow08+7QYocIOsSZmMcPpz+/opUp
         LUQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U9m/vE1DNphlJsrYchwoexwhY0Aq5nAA6kFZ0qFRU/c=;
        b=KJqPBTKhynYjU5vsI9QNwS/MUs57pelYVt4vx330iLoIvGTt31uaGb2TGf/qmzWzCU
         lAb/hfESWaOmvib+sk4rZg8d9gxH7HD1KcYYYxtjMVP7jh4Ns3KwdH8hQMtnSo5gIdbz
         5+9xObop7WpHg0j5vRqUdBm5DsSaPiUwyYObZVmKyhThuC1pleCqA/YmAQfqAre2yW+d
         TUQLrWhs0ft1nukiZ5qIVX6FDpDdd/c6e7VnLd7MZCDtuFs+fSFAsBUO8vEjSCLXrbHo
         w59Zb7mIGNvdKSEyr8hyTngyCXg/upBMP1YqgF8jYXTHHfYTvR4W+tafz3uNSVHjZPKL
         Ec9Q==
X-Gm-Message-State: AOAM530l0FLJpYg3te80iaRcvxaoZMalJur3PM2UAS6uO4boa/2JuojQ
        02U8rFYF8vsOMSs8wlJ898g=
X-Google-Smtp-Source: ABdhPJxEE3REID3XCkqHkD+RLcCPqrnLL9TrPskDPfrUNLQFTH4rc9Fl/wKimpYEH6vuqB+2wwn0gQ==
X-Received: by 2002:a05:651c:d0:: with SMTP id 16mr18916830ljr.296.1617047217278;
        Mon, 29 Mar 2021 12:46:57 -0700 (PDT)
Received: from localhost.localdomain ([2a00:1370:814d:b259:a10:76ff:fe69:21b6])
        by smtp.gmail.com with ESMTPSA id p24sm1927693lfj.76.2021.03.29.12.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 12:46:57 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v1 3/6] dt-bindings: memory: tegra124: emc: Replace core regulator with power domain
Date:   Mon, 29 Mar 2021 22:45:59 +0300
Message-Id: <20210329194602.17049-4-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210329194602.17049-1-digetx@gmail.com>
References: <20210329194602.17049-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Power domain fits much better than a voltage regulator in regards to
a proper hardware description and from a software perspective as well.
Hence replace the core regulator with the power domain. Note that this
doesn't affect any existing DTBs because we haven't started to use the
regulator yet, and thus, it's okay to change it.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/memory-controllers/nvidia,tegra124-emc.yaml   | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
index 09bde65e1955..a7483547ccf8 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra124-emc.yaml
@@ -37,9 +37,10 @@ properties:
     description:
       phandle of the memory controller node
 
-  core-supply:
+  power-domains:
+    $ref: /schemas/types.yaml#/definitions/phandle
     description:
-      Phandle of voltage regulator of the SoC "core" power domain.
+      Phandle of the SoC "core" power domain.
 
   operating-points-v2:
     description:
@@ -370,7 +371,7 @@ examples:
 
         nvidia,memory-controller = <&mc>;
         operating-points-v2 = <&dvfs_opp_table>;
-        core-supply = <&vdd_core>;
+        power-domains = <&domain>;
 
         #interconnect-cells = <0>;
 
-- 
2.30.2

