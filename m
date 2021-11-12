Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E5BC433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:06:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F1EF61038
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:06:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234952AbhKLMIv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 07:08:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235014AbhKLMIl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 07:08:41 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EFC0C06120D;
        Fri, 12 Nov 2021 04:05:50 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id az33-20020a05600c602100b00333472fef04so8906783wmb.5;
        Fri, 12 Nov 2021 04:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jQt3bGvPXR3AJH0Wpc4Hw/qwqDdumuScQ+nidDp9608=;
        b=Q0NLJhMvxoDUBhxX+kO9unYZqBSqVcbcta68MU77TzmTC7hACIoJs2NNNX+gPsSLH5
         CrSQB/IcDYD3jF6vZeXEHW4S5+iSjrwJPpG+ecFv+Hcwb4KBiQ1ApsIXKhUAvyg7ArAD
         DN2fTJ451h2pHnnhCucme1yLjjmRcjy5weBekFOp0HvUG+FavGr4q0//OxbaNYF2zoEq
         +PjblR/ukcRJSOTZB5mmKEBP7v97wdcVbRNnoHHIbrzfeN3Ruk5gIIyo4JFC7P3Y5p6W
         Y+h7ht4nI0vVEDiw7Zeh9PQZnLJljm5cvaPfZ9S0dGN4xAQ33Zey5t0X8nU7Pgya4Fdg
         4ssA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jQt3bGvPXR3AJH0Wpc4Hw/qwqDdumuScQ+nidDp9608=;
        b=7j99P7VOaa4CyWLeRHNbbRlTJ4efS+OQYPtkdTHEuk/OxLkdNHC9VYrp0U/6Zi6OdM
         PJ1TG64mInd/njQ0AuhG7u/ry26hEUBUICVAeTO4yjXiPKB75yhscMMQIGha/rKV+NoE
         AXqhPBe9943aTfpymUML+VB+UNXtQRCq74NLghoa8NjbQS85BihGLLjCq3BRxXhLuQar
         WH0ly/Jo4v3BDLkDADGx6fdTXVu4SraAGz6675k4+bfH+0eOHKBsuHCdTffO1E/fPQH3
         7twzOAkmH93GpgkfOZAT89o22Nn124CUwmDDYhILe8xZ+VDAAyjTudxXf94iszOFbcBT
         D8cQ==
X-Gm-Message-State: AOAM530MB6Lw6wOPIszSh/om1B5H8zOCtJaNluHm6Cn6HRYhc/GYpFpP
        PnHsHx+BfoCTBIz093+29At8nfsyyJIYSw==
X-Google-Smtp-Source: ABdhPJyJX+kHluWymfcrgYzmiLSDh2zbxsK1tkbmFz28xquyqjT7kBs3NvkCR0ElpbAjAKYUdCZa+g==
X-Received: by 2002:a7b:c097:: with SMTP id r23mr32837502wmh.193.1636718749156;
        Fri, 12 Nov 2021 04:05:49 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id c17sm5892209wmk.23.2021.11.12.04.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:05:48 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 09/15] dt-bindings: mmc: tegra: Document Tegra234 SDHCI
Date:   Fri, 12 Nov 2021 13:05:12 +0100
Message-Id: <20211112120518.3679793-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112120518.3679793-1-thierry.reding@gmail.com>
References: <20211112120518.3679793-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add the compatible string for the SDHCI block found on the Tegra234 SoC.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
index 1c3b9bbea6b4..a361896323d0 100644
--- a/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
@@ -33,6 +33,12 @@ properties:
           - const: nvidia,tegra132-sdhci
           - const: nvidia,tegra124-sdhci
 
+      - items:
+          - enum:
+              - nvidia,tegra194-sdhci
+              - nvidia,tegra234-sdhci
+          - const: nvidia,tegra186-sdhci
+
   reg:
     maxItems: 1
 
-- 
2.33.1

