Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E932C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:06:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 37FA060F0F
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:06:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235091AbhKLMJN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 07:09:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235016AbhKLMJE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 07:09:04 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE4D0C061205;
        Fri, 12 Nov 2021 04:06:06 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id y196so7495812wmc.3;
        Fri, 12 Nov 2021 04:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zeKFXDCOK1JKP/WgTGfGZCqCINDxzG0cnQHN+HuP6jE=;
        b=YqQdlvtW9Tsi5iU25qtoaG3ns9eAm+qb1YQdxyV8sRCEqys4ddjJuEl8v38IKSr1Gq
         ZdG+/+RRd1f5/LhrZD3RARVgBDxt5WqNXhxteeqksRD8ydXcy70IUPncFLcL6rujZTfI
         rRsn5VudBuRHZfIZdifq2WtYgubx6QnkG2Tau/rnytFlmGyNmFrWBmHWFhBriQA87mAp
         wm62vPmSJFa4aT4GuwaYhSG+G+smCXKxz1Cp4/OtAus0hAJZdr0sKlUTWxVT8oIXlgEO
         DY+uu+7dE6l9Y0i6AiQkzAI4m7/MrA66+rNLABGDRcKGe7SpYWNqvBiRm3KhHupPCtZw
         yLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zeKFXDCOK1JKP/WgTGfGZCqCINDxzG0cnQHN+HuP6jE=;
        b=YKY9LIH5smNSwbuLIR48Se9Ss7tXL7zeLnOuzg3zL46tJd5JZgWNMDL/Q+bwG29d56
         Rf3h++EO7gOenu47sNn+yZi1bGry77pnAo6oVrJvJkjsH0SuoiTZZY9uegIKG1zvJtuX
         +fxwIQBnZ5ZHirDAQmS2mGmnQsT5jqBfBnLrXZFoufiyjfEhFFKeIq7/lOBQMAFc0UC0
         ojnwQEzlAb/jR1I1fDEFPi/LdS0qtrrkIi5T6Hzzo/qMhyqVlYGS5ydLfyO/ya7wGmGv
         jvdpjaTi4yer+WpA56QtD1TrZl7TRz3e0O5zrWO06M/m7OWBp+Gi68D3DWKmVBCtsdUJ
         m2uA==
X-Gm-Message-State: AOAM532mi/kWcPXtkIHBGFDk7ima9yBO/jjpA0tRgDokAcJmUXPVyiP3
        IGF2GkoKSgxO9SOU/uMeC3AA2/UqyELspA==
X-Google-Smtp-Source: ABdhPJyuK3rtN3nf/2PIMu6ZjdZoaeswvWM2NGKoO82gEGP/6TXIuPFaPrkFFPI7mBI8nTzOvUM+kQ==
X-Received: by 2002:a7b:c841:: with SMTP id c1mr34146356wml.80.1636718765271;
        Fri, 12 Nov 2021 04:06:05 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id n15sm12141458wmq.38.2021.11.12.04.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:06:04 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 15/15] dt-bindings: serial: Document Tegra234 TCU
Date:   Fri, 12 Nov 2021 13:05:18 +0100
Message-Id: <20211112120518.3679793-16-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112120518.3679793-1-thierry.reding@gmail.com>
References: <20211112120518.3679793-1-thierry.reding@gmail.com>
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

