Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70221C77B7A
	for <linux-tegra@archiver.kernel.org>; Thu, 25 May 2023 09:42:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234515AbjEYJmo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 May 2023 05:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234050AbjEYJmn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 May 2023 05:42:43 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6679A191;
        Thu, 25 May 2023 02:42:42 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-514454733b8so498932a12.3;
        Thu, 25 May 2023 02:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685007761; x=1687599761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6XQd90nNPC5bHeVCXpgMeDPAKRWOlZYVAdkPI9BTXzc=;
        b=Q9zGzrF7z7hlFMbq0YtWmAN+STRLx6HxRirDP1yrRIwPbDuzGDlVvxPfTGXdsOaQ7u
         TSZHnTYoRxvRycLXTzlxRRwmbKXjsVZ59OByukgyGazP4uLHjvcsI4BQa10cRCYd+ZF/
         mRgVTkKAsw6Qw1hmI8fAmWnWiHo94fd7NzlQWw4ogyvNWzCvNNPT/zAvajc7uBmD2apl
         VwVSM+BYOp+gcB+8cTVcdDVZDpR/nFk1qg/ppox4ecBEzvSLFF1Z+2intVEF6iA8psh7
         bUHOLDPF6tyMEvyBeoIqHzPPdMuj2siasEQxr7kJuJMS1vSlXBSOiNUBa67ITzkCuhHT
         /MMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685007761; x=1687599761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6XQd90nNPC5bHeVCXpgMeDPAKRWOlZYVAdkPI9BTXzc=;
        b=IIjmrC5xQe2nwpGNupkq/LuGRHwbV/Q3tWSlVrIYEn5EEpubBe8IZXeyRWy35VDyN9
         V+mfxDSLv16SJJQsE58EJbQrXLUVKGGccisor5r7r3VVRka1TkvejMI7eOoYVHA3Dvda
         S+2IIeVvha2aH8fb0+qZTEmLw+/9jEuE4y3oiW2oms9eaL/CGoGd1D8jkFfyPc+mIO15
         zB4nUHgWivPD1phZbsmS2HEX0eJ3v5MpF2B9znSMRXFH5RKG/btswTuJ1Zc/N1PcMUGk
         hSuZr0klQdgf6qDGKSA6dMVrqvirEi7/iQcng6+7X83wLrQwTLHYejf2UytxOt0KxLIe
         c2aQ==
X-Gm-Message-State: AC+VfDyhB3eCFIgF43rBAb1xWuq2nggM2TKDCi1ctbtEZ2EtqcZKoNYR
        38tIEVQWBDSm4cs7ism7yOLkOwf1dE0=
X-Google-Smtp-Source: ACHHUZ4hCYebNsaawH3EjvG+NnzYstOSTEu0rUk9IvAP//0je2d5iAzMdSrhBMjJbsacR0JCFY6KCA==
X-Received: by 2002:a17:907:3faa:b0:970:c9f:2db6 with SMTP id hr42-20020a1709073faa00b009700c9f2db6mr905381ejc.63.1685007760531;
        Thu, 25 May 2023 02:42:40 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id q18-20020a170906b29200b0095844605bb8sm617552ejz.10.2023.05.25.02.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 02:42:40 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH] dt-bindings: usb: tegra-xudc: Remove extraneous PHYs
Date:   Thu, 25 May 2023 11:42:37 +0200
Message-Id: <20230525094237.2846682-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The USB device controller on Tegra210 and later supports one USB 2/3
port, so only a single pair of PHYs is needed. Drop any of the extra
PHYs from the bindings.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml         | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
index e2270ce0c56b..c6e661e8915c 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
@@ -91,6 +91,7 @@ properties:
 
   phys:
     minItems: 1
+    maxItems: 2
     description:
       Must contain an entry for each entry in phy-names.
       See ../phy/phy-bindings.txt for details.
@@ -99,13 +100,7 @@ properties:
     minItems: 1
     items:
       - const: usb2-0
-      - const: usb2-1
-      - const: usb2-2
-      - const: usb2-3
       - const: usb3-0
-      - const: usb3-1
-      - const: usb3-2
-      - const: usb3-3
 
   avddio-usb-supply:
     description: PCIe/USB3 analog logic power supply. Must supply 1.05 V.
-- 
2.40.1

