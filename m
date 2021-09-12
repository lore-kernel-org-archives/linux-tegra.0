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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A267C433FE
	for <linux-tegra@archiver.kernel.org>; Sun, 12 Sep 2021 18:19:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7421061051
	for <linux-tegra@archiver.kernel.org>; Sun, 12 Sep 2021 18:19:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235255AbhILSUh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 12 Sep 2021 14:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235168AbhILSUg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 12 Sep 2021 14:20:36 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8139DC06175F;
        Sun, 12 Sep 2021 11:19:21 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id k4so16065739lfj.7;
        Sun, 12 Sep 2021 11:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6DJ1MRIl0Zi+gsGIXueupXObT5Ha/664YNw+4KYR5oE=;
        b=ohLbw0zB/4nPasdVpwDMpvvvh/EdiL1nRRBTRl0Nx+0UQTOCxjQ3KKr1MT9Etj1GZV
         Q0kqO5ZTGMXDhZV9i6iqqpTpWSq+E/qdUAdVxdtCQLqdJXCPDAXKwy0bHgheCkXEv88B
         m8ycxQIkddPXY2EmbovEk4LmJNReX+cPyWpIX/zgDBSekXNk3Hm0TFh2lyXjxxcfrSQ8
         nOB6YzQobCefqZXau1iZ++GQ8Oq+hx5RH3+xm8YHUAXvZJN1itWzdPBNFlA3Xat3Z6B8
         2p3IV7fgtOVPjnznJBbjK3ymcO4rG6L4mXW1aezlvakOY4Di7dPvf9Igrv4yplYbS0PR
         s6Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6DJ1MRIl0Zi+gsGIXueupXObT5Ha/664YNw+4KYR5oE=;
        b=VPIKRhViA4gJhjZGQAmObWNy0+wUkYA1jcdL3GjAecqBFflL8CSJHPUSoVotToJ6E3
         tj6vAITO10f0Qt6g64wDnP2I5Qmmx8/ofr2u6cSQP0tA2ja4G6L6K+Ni75WSf/A47ERp
         pV2Y1x0agWgE7Y1MHYmqRndeMvXRCrXeoCAXOfDM0nqHNY9yMQ65xIcRG2OZDVUtAhrs
         puH9a71qB1e84Rq4CxZpzg8t5fPrceeLoS9SrKVhiRoHUMXQQRjkAewr1uktAfGoQZtP
         q5PSZmlfI0nUVENXyv3PnbPVUWh0Z2u+hKDmOQklKePIJnSkD1DPMaUbBmH7e/bwL5sR
         agIQ==
X-Gm-Message-State: AOAM532pI3L4WAM9TtefGVrHoKBWXpOvGJs36SPmgCuJHQjiShGsXzm/
        qx0g9TMbCGebj86JcdbTn3g=
X-Google-Smtp-Source: ABdhPJwSOPwYvZv2SKUgIziagXnqpvMAAT++IwrVS5CRup+RtziLX7hH6qH3OILfB8r8bP3wn4mwEA==
X-Received: by 2002:a05:6512:3b0b:: with SMTP id f11mr6306713lfv.630.1631470759857;
        Sun, 12 Sep 2021 11:19:19 -0700 (PDT)
Received: from localhost.localdomain (46-138-83-36.dynamic.spd-mgts.ru. [46.138.83.36])
        by smtp.gmail.com with ESMTPSA id a18sm664556ljd.4.2021.09.12.11.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Sep 2021 11:19:19 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc:     devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v7 2/7] dt-bindings: phy: tegra20-usb-phy: Document properties needed for OTG mode
Date:   Sun, 12 Sep 2021 21:17:13 +0300
Message-Id: <20210912181718.1328-3-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210912181718.1328-1-digetx@gmail.com>
References: <20210912181718.1328-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

In order to support OTG mode we need these new properties:

	- interrupt
	- nvidia,pmc

Add the new properties to the binding.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../bindings/phy/nvidia,tegra20-usb-phy.yaml     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra20-usb-phy.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra20-usb-phy.yaml
index 593187234e6a..dfde0eaf66e1 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra20-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra20-usb-phy.yaml
@@ -77,6 +77,9 @@ properties:
           - const: timer
           - const: utmi-pads
 
+  interrupts:
+    maxItems: 1
+
   resets:
     oneOf:
       - maxItems: 1
@@ -199,6 +202,15 @@ properties:
     maxItems: 1
     description: GPIO used to reset the PHY.
 
+  nvidia,pmc:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: Phandle to Power Management controller.
+          - description: USB controller ID.
+    description:
+      Phandle to Power Management controller.
+
 required:
   - compatible
   - reg
@@ -320,6 +332,7 @@ examples:
         compatible = "nvidia,tegra124-usb-phy", "nvidia,tegra30-usb-phy";
         reg = <0x7d008000 0x4000>,
               <0x7d000000 0x4000>;
+        interrupts = <0 97 4>;
         phy_type = "utmi";
         clocks = <&tegra_car TEGRA124_CLK_USB3>,
                  <&tegra_car TEGRA124_CLK_PLL_U>,
@@ -338,6 +351,7 @@ examples:
         nvidia,hssquelch-level = <2>;
         nvidia,hsdiscon-level = <5>;
         nvidia,xcvr-hsslew = <12>;
+        nvidia,pmc = <&tegra_pmc 2>;
     };
 
   - |
@@ -346,6 +360,7 @@ examples:
     usb-phy@c5004000 {
         compatible = "nvidia,tegra20-usb-phy";
         reg = <0xc5004000 0x4000>;
+        interrupts = <0 21 4>;
         phy_type = "ulpi";
         clocks = <&tegra_car TEGRA20_CLK_USB2>,
                  <&tegra_car TEGRA20_CLK_PLL_U>,
@@ -354,4 +369,5 @@ examples:
         resets = <&tegra_car 58>, <&tegra_car 22>;
         reset-names = "usb", "utmi-pads";
         #phy-cells = <0>;
+        nvidia,pmc = <&tegra_pmc 1>;
     };
-- 
2.32.0

