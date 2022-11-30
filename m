Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0456DC433FE
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Nov 2022 15:41:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbiK3PlS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Nov 2022 10:41:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbiK3PlR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Nov 2022 10:41:17 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8AA22D1D1;
        Wed, 30 Nov 2022 07:41:16 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id e27so42297733ejc.12;
        Wed, 30 Nov 2022 07:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OHBzYMaEKF+v3N2CeacpZF2sgjWxjbRAHNva5BRSw/U=;
        b=RmLe51+NcWUyHLi2ZyZlsd6zEreCrayxGFVaBZU+PjOf7wWbqYW5gJJYeMHsNNwrLc
         ZC7nOow1/SaMDstl85HOTwZdwKzpjI/7eZVn/HPe4FjOHWmVnPoLtuKt2pxbmdK4bBPe
         e1KOJSl7YXIFdz4vGTSigywwBOMqoMvTITtUifHSuWaNwvD07hcpRUnk/V77k8prsv8p
         xPDfXT/0rpcXh83ESJL9qDAAG/PVyZQizXo+5STKaOeWnIeGw4HpIWKYdUrNz1VyR7sb
         9EESH90/NMdecir1PiBkZh1MUOF/UtmqcohtFM7wVJ756kpD69OJ0ts78ujZbZZ1LzsF
         NyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OHBzYMaEKF+v3N2CeacpZF2sgjWxjbRAHNva5BRSw/U=;
        b=7DCHbIMOH/DeCgZ8Lr68ei+JYt5N39NACrEkMaWl5fU3gVVRQPgz8ljVRQYDpItxQI
         JrShTkNFSe6TYgftPohhHb3OWlqh+WobWhl/4DhXrLXFVF/UMh5ssjeTtg/K8bKKAnA8
         odr9fQOI1rDiEhgAL9AsHP0kRbpQbnApcmkLi63PXSlZvSvc1SuIOxAXqcfX/q/zrt3e
         7sErLG/sCWMaRdRhE65oQL5mwlXt+DdQ9svQypvz74lsOVPhJPSNhal0fhbceZ7Mlz09
         odrqQNxW0VQmspy7yoR9yLmi+ALueGFlxnAenqTMzpYCLG/uwjHbANZVEscE9seUNN4r
         qcbg==
X-Gm-Message-State: ANoB5pk/zR8J0fVDtKmG6jRo6JQ3p7qhy+AG0bgyOeK3+Ns+cZ1OvFx/
        oXqB11UoF/TOxcDgwu9V89E=
X-Google-Smtp-Source: AA0mqf6hM+tNavsLKnj1BRRSLlxhF4++yHBT0NnrI82n35opyj04Ucd7KfQVf2RjILnM/T+q8hGDJg==
X-Received: by 2002:a17:906:5293:b0:7b9:631c:451a with SMTP id c19-20020a170906529300b007b9631c451amr33437172ejm.283.1669822875042;
        Wed, 30 Nov 2022 07:41:15 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id q26-20020a170906389a00b007bdc2de90e6sm776661ejd.42.2022.11.30.07.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 07:41:14 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH] dt-bindings: usb: tegra-xusb: Remove path references
Date:   Wed, 30 Nov 2022 16:41:11 +0100
Message-Id: <20221130154111.1655603-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Unresolved path references are now flagged as errors when checking the
device tree binding examples, so convert them into label references.

Reported-by: Conor Dooley <conor.dooley@microchip.com>
Suggested-by: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/usb/nvidia,tegra124-xusb.yaml     | 4 +---
 .../devicetree/bindings/usb/nvidia,tegra186-xusb.yaml     | 4 +---
 .../devicetree/bindings/usb/nvidia,tegra194-xusb.yaml     | 8 ++------
 .../devicetree/bindings/usb/nvidia,tegra210-xusb.yaml     | 8 ++------
 4 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml
index 4a6616bf9bab..d6ca8c93073d 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra124-xusb.yaml
@@ -186,9 +186,7 @@ examples:
 
         nvidia,xusb-padctl = <&padctl>;
 
-        phys = <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-1}>, /* mini-PCIe USB */
-               <&{/padctl@0,7009f000/pads/usb2/lanes/usb2-2}>, /* USB A */
-               <&{/padctl@0,7009f000/pads/pcie/lanes/pcie-0}>; /* USB A */
+        phys = <&phy_usb2_1>, <&phy_usb2_2>, <&phy_pcie_0>;
         phy-names = "usb2-1", "usb2-2", "usb3-0";
 
         avddio-pex-supply = <&vdd_1v05_run>;
diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra186-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra186-xusb.yaml
index 6f62944fc597..a04c6ce1e0f6 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra186-xusb.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra186-xusb.yaml
@@ -166,8 +166,6 @@ examples:
         #address-cells = <1>;
         #size-cells = <0>;
 
-        phys = <&{/padctl@3520000/pads/usb2/lanes/usb2-0}>,
-               <&{/padctl@3520000/pads/usb2/lanes/usb2-1}>,
-               <&{/padctl@3520000/pads/usb3/lanes/usb3-0}>;
+        phys = <&phy_usb2_0>, <&phy_usb2_1>, <&phy_usb3_0>;
         phy-names = "usb2-0", "usb2-1", "usb3-0";
     };
diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra194-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra194-xusb.yaml
index 65ae9ae9b0b7..b356793f73a1 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra194-xusb.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra194-xusb.yaml
@@ -169,11 +169,7 @@ examples:
 
         nvidia,xusb-padctl = <&xusb_padctl>;
 
-        phys = <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-0}>,
-               <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-1}>,
-               <&{/bus@0/padctl@3520000/pads/usb2/lanes/usb2-3}>,
-               <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-0}>,
-               <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-2}>,
-               <&{/bus@0/padctl@3520000/pads/usb3/lanes/usb3-3}>;
+        phys = <&phy_usb2_0>, <&phy_usb2_1>, <&phy_usb2_3>, <&phy_usb3_0>,
+               <&phy_usb3_2>, <&phy_usb3_3>;
         phy-names = "usb2-0", "usb2-1", "usb2-3", "usb3-0", "usb3-2", "usb3-3";
     };
diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra210-xusb.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra210-xusb.yaml
index da1e1ec0e7c8..90296613b3a5 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra210-xusb.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra210-xusb.yaml
@@ -173,12 +173,8 @@ examples:
 
         nvidia,xusb-padctl = <&padctl>;
 
-        phys = <&{/padctl@7009f000/pads/usb2/lanes/usb2-0}>,
-               <&{/padctl@7009f000/pads/usb2/lanes/usb2-1}>,
-               <&{/padctl@7009f000/pads/usb2/lanes/usb2-2}>,
-               <&{/padctl@7009f000/pads/usb2/lanes/usb2-3}>,
-               <&{/padctl@7009f000/pads/pcie/lanes/pcie-6}>,
-               <&{/padctl@7009f000/pads/pcie/lanes/pcie-5}>;
+        phys = <&phy_usb2_0>, <&phy_usb2_1>, <&phy_usb2_2>, <&phy_usb2_3>,
+               <&phy_pcie_6>, <&phy_pcie_5>;
         phy-names = "usb2-0", "usb2-1", "usb2-2", "usb2-3", "usb3-0",
                     "usb3-1";
         dvddio-pex-supply = <&vdd_pex_1v05>;
-- 
2.38.1

