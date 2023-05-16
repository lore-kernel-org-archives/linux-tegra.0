Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69332C7EE2C
	for <linux-tegra@archiver.kernel.org>; Tue, 16 May 2023 09:59:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232198AbjEPJ7J (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 16 May 2023 05:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232253AbjEPJ7I (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 16 May 2023 05:59:08 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2266E1FDA;
        Tue, 16 May 2023 02:58:59 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-9661047f8b8so2171517866b.0;
        Tue, 16 May 2023 02:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684231137; x=1686823137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wk348KK3f0AcYxOwA444MKUWHNFviE8qCB+FMKPS7HA=;
        b=T7X0AUZp++9gdjbp3POtd614MM3Jhzn8YnxhBjg3xmkYyHhBsktcyVty8IhWiep4GD
         MRZX6W3QPSsk1UCGgAnMV8zVI9KU3ebI5/ea1ICT4HbNeeYryJxUYhUdPnmgkHhYANAi
         yviuf3hFWiAT+FAB8It9OkkjRvKDOLC9ENo0qYR5ij4Pve2aPcfuncsfP9CHJMGMZ5k+
         Gq7vN4HamC5gLRHOOsGR8q1N+dHbRdPVX17xvg6xzIFgUKo3r4WaVkcGbBltiFecgmHF
         MhJSXVl1ktxJZHKvhTggo2JAadRz16gAuhbV5IC+4WriY1somsYiA/rhNRg0qqEiVBlj
         /8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684231137; x=1686823137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wk348KK3f0AcYxOwA444MKUWHNFviE8qCB+FMKPS7HA=;
        b=kTxqJlclwrFh+T2H9tPJKJo4OO7f4t3uxHAZK33Q09VvgWlnj8CNK+i80myxHaeveJ
         o7FHEXJu0kfeUAbp8E4kdL1rNzEQ/S3V1QfMz8LcRaplRP475c9TOVDpMNyjdW5dXtsT
         bD+V9Unwjy6L8CsG+tK0D9ux3TCphU9bph7ZA5nE9c0NL2XOVzWxAdcqbM+IgDrFu3gC
         u08noxwbk9CD8Gmq5HSSxgpsa8mJ2Pj9ZuIxH306VIBkfZAPoOySmM7k8EE9yLuYgRAe
         QevopYQFbdgo3V3Bv4dorocDnRosN9zdYXw7MUF50YH0yWuXpZFOhio+jymatVa6MgZH
         V6xw==
X-Gm-Message-State: AC+VfDxgOdJeWItsl8jqsXTclq6xOQXjFsQIuc/PFeu6FnP9kvS/cmzF
        LAxbah7qoN1rCEoJsREKsTA=
X-Google-Smtp-Source: ACHHUZ47HnbVNU8ECMN5P4eGtvNRQY92hpkitVYro5A28HmV5i7oOATL5xCiV0CpOnH0vfq/mDzpYA==
X-Received: by 2002:a17:907:60d2:b0:966:1284:e3e with SMTP id hv18-20020a17090760d200b0096612840e3emr31158175ejc.9.1684231137431;
        Tue, 16 May 2023 02:58:57 -0700 (PDT)
Received: from localhost (p200300e41f305300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f30:5300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id j10-20020aa7ca4a000000b005066cadcc54sm7843827edt.43.2023.05.16.02.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 02:58:57 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/3] dt-bindings: tegra: Document Jetson Orin Nano Developer Kit
Date:   Tue, 16 May 2023 11:58:49 +0200
Message-Id: <20230516095850.2426604-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230516095850.2426604-1-thierry.reding@gmail.com>
References: <20230516095850.2426604-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Jetson Orin Nano Developer Kit pairs the Jetson Orin Nano devkit
module with the P3768 carrier board.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 0be74eea8303..41c7b71b80dd 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -231,5 +231,10 @@ properties:
         items:
           - const: nvidia,p3767-0005
           - const: nvidia,tegra234
+      - description: Jetson Orin Nano Developer Kit
+        items:
+          - const: nvidia,p3768-0000+p3767-0005
+          - const: nvidia,p3767-0005
+          - const: nvidia,tegra234
 
 additionalProperties: true
-- 
2.40.1

