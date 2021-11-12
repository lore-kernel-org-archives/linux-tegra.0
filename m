Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5302C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:35:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB13760F93
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:35:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234980AbhKLMip (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 07:38:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234957AbhKLMio (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 07:38:44 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 158AFC061766;
        Fri, 12 Nov 2021 04:35:54 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id f7-20020a1c1f07000000b0032ee11917ceso6687914wmf.0;
        Fri, 12 Nov 2021 04:35:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pbgWBw0F4ihDl2JiKxjBpympL3NHKzsqjTlTX6/jcOM=;
        b=TgT1GPVM2imsCkUXYDzqIiRL2BFzCV86xyIDpG6AMjINteOK3JZZ+rQnPelUrY7PGm
         1TpLEoS11rJpJiRB72jWhqIFy0j2xfU9WmBGOro51Xr1scZsYt2QFaNpbFVe4QnNMeo0
         P4TpLDAVBWHZjEmcdgHbZTMsVvy3j8MJwhjlGnie2d2d7ed9HfHea6IEC0wYUxSRWoYk
         vJ6f0mGWGlrJMsMaX575pp6AX02uXokuPejmDslCfr4TrN2An+UvkNF3BTmX11oVsDnY
         6TTnie8yfJeKXkFCzLgbOeP6egrVZCNh7Zp5fcebb2NWyuOMQvsuuCWUK0uQ6tZBhz9O
         rfTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pbgWBw0F4ihDl2JiKxjBpympL3NHKzsqjTlTX6/jcOM=;
        b=D+NogTn8EImaYjIKqe13mxFM7aFR1JRlpQrJg23lpL4MpqzqQs9R7mkPRAb27p0BO1
         ZOkY/KPFaMn6E1N6IOH2V2fSz93gMTb/eKtpBR55rI4HzZFkgXef6hrtAMJZWPmyIlXF
         3EEW7mPcZWRFvp6hbtKVWrGPxTljMeKMPGZ8Neha8zH9fBywhvW3/OnIjvM5/fldW+dj
         qk23fBN8+mvxcpdwLOCN3mSHIDR5Yp1WeNECLuktB+mHRKz6QrzHAA19WlkFBZaKVl5V
         z7OMqx4kJSPX0jI08menmOMfsraehC6Un4DiO03VSmEchBaIKRSRhNUtdby6wdjQWXJN
         K/rA==
X-Gm-Message-State: AOAM530pp8FcP1fRrYEc8sscFy9WGLNBffK/BHp/kEqs/pfex5jLow/l
        XosYmpvwwy6J7i20/nGMv2I=
X-Google-Smtp-Source: ABdhPJwlfGN6eW1HR4iexTaF1FPWoEgULRPDx/0ulEj3FZBx6M89oHHBeSDactSRfDxMxPpxtS72rQ==
X-Received: by 2002:a05:600c:6d2:: with SMTP id b18mr17233324wmn.98.1636720552717;
        Fri, 12 Nov 2021 04:35:52 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id 126sm11146152wmz.28.2021.11.12.04.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:35:51 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 01/11] dt-bindings: tegra: Describe recent developer kits consistently
Date:   Fri, 12 Nov 2021 13:35:32 +0100
Message-Id: <20211112123542.3680629-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112123542.3680629-1-thierry.reding@gmail.com>
References: <20211112123542.3680629-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add descriptions to entries that were missing one and don't try to
combine multiple entries into one to avoid confusion.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/arm/tegra.yaml        | 20 ++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index d79d36ac0c44..0235b510e0b0 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -108,14 +108,17 @@ properties:
               - nvidia,p2571
               - nvidia,p2894-0050-a08
           - const: nvidia,tegra210
-      - items:
-          - enum:
-              - nvidia,p2771-0000
-              - nvidia,p3509-0000+p3636-0001
+      - description: Jetson TX2 Developer Kit
+        items:
+          - const: nvidia,p2771-0000
           - const: nvidia,tegra186
-      - items:
-          - enum:
-              - nvidia,p2972-0000
+      - description: Jetson TX2 NX Developer Kit
+        items:
+          - const: nvidia,p3509-0000+p3636-0001
+          - const: nvidia,tegra186
+      - description: Jetson AGX Xavier Developer Kit
+        items:
+          - const: nvidia,p2972-0000
           - const: nvidia,tegra194
       - description: Jetson Xavier NX
         items:
@@ -134,8 +137,7 @@ properties:
           - const: nvidia,p3509-0000+p3668-0001
           - const: nvidia,tegra194
       - items:
-          - enum:
-              - nvidia,tegra234-vdk
+          - const: nvidia,tegra234-vdk
           - const: nvidia,tegra234
 
 additionalProperties: true
-- 
2.33.1

