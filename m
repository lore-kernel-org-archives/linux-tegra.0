Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDEF8C4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:39:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B81A86142A
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:39:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235990AbhKSOm3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Nov 2021 09:42:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233963AbhKSOm3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Nov 2021 09:42:29 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C59DC061574;
        Fri, 19 Nov 2021 06:39:27 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id u1so18505769wru.13;
        Fri, 19 Nov 2021 06:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zeKFXDCOK1JKP/WgTGfGZCqCINDxzG0cnQHN+HuP6jE=;
        b=e/hYgUINDWKWu+hunJDTboMvSEFWzMucP05H+3J9UZq9X5Uz5h1ZZZH6KacL07Kev/
         2F7LnONvLEZMytV2wkduOfzkVac8mFokfMuZRH29qM676ACVYV/bEmtIS060f0m8VB9E
         3yx7aXPCcpZC1TOBh70yUgeIg+TfFbWmaYJTKjBMu2elhgVvl+kbiHKDhbEM4AxpC6/n
         QdlamVxZPdqe4DXgiMYurm7Lt6CWcPvrHel18yMJ8Bhob0K7rRuzh0TPLlVDuZgkKc2F
         7EUM8hZvFPCbHjUroIAHcklJGqBHEHahT4MuUAInwEWIcfZfWrthNkJs+P61uTbrqmDZ
         5r8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zeKFXDCOK1JKP/WgTGfGZCqCINDxzG0cnQHN+HuP6jE=;
        b=pNICT+Mo/bTKf8vOEAc9zT+O2P8qYWobi/EAWjZ1MfUZZrR5ucq86i6tfwo5NWSTFZ
         zV4xclef5Rt+pGlIR555JZyvLq90bl8QpEZMAtgpg92nUDfEGSM96adpBB/zeMJcr/MG
         oMENYMF0hXQM5yjmHRoBeAg6cxxfF/ufqrIdPH3rVtEd0DdkTrdJ0DHMlzKyOmUVy3uU
         TO4+KWZ7ovgyuSzElnrB+pSwafnimZ1hPD/P1nWfomvSI6Kuaj1MayZ31rIpGtR9fLap
         389KxAqUts6meCGSUFmhu37PAJFRU71pVvM/L2YVxA6twRS8fCACKtAtezA+lZRcYV0I
         tuDg==
X-Gm-Message-State: AOAM532jiomoMz3H5WREP2ZaXtmwlDObYUKVGNmNNi/qOeREX84CpSjN
        himdbEP2J7I3wAc8dauH51k=
X-Google-Smtp-Source: ABdhPJyYTRYl13JhHgXfELFbTAtF7IJlLsIIuP26yEa72zdkGK8O1XtC0z8IUQqcw0DadVfuZdZfMA==
X-Received: by 2002:adf:a194:: with SMTP id u20mr7790281wru.153.1637332766134;
        Fri, 19 Nov 2021 06:39:26 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id d7sm3031770wrw.87.2021.11.19.06.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 06:39:25 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 16/16] dt-bindings: serial: Document Tegra234 TCU
Date:   Fri, 19 Nov 2021 15:38:39 +0100
Message-Id: <20211119143839.1950739-17-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119143839.1950739-1-thierry.reding@gmail.com>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add the compatible string for the TCU found on the Tegra234 SoC.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/serial/nvidia,tegra194-tcu.yaml    | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml b/Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml
index 7987eca0bb52..e2d111b3e0b0 100644
--- a/Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml
+++ b/Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml
@@ -22,7 +22,12 @@ properties:
     pattern: "^serial(@.*)?$"
 
   compatible:
-    const: nvidia,tegra194-tcu
+    oneOf:
+      - const: nvidia,tegra194-tcu
+      - items:
+          - enum:
+              - nvidia,tegra234-tcu
+          - const: nvidia,tegra194-tcu
 
   mbox-names:
     items:
-- 
2.33.1

