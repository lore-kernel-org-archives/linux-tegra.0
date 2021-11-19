Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E55C433FE
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:38:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2035B61108
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:38:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235964AbhKSOl7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Nov 2021 09:41:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbhKSOl7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Nov 2021 09:41:59 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A6E0C06173E;
        Fri, 19 Nov 2021 06:38:57 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id i5so18596692wrb.2;
        Fri, 19 Nov 2021 06:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ksxZhqE+zId+/zoejDP6tdFZZb2ua3WQDtdUkqDgHsk=;
        b=TcRYy4Ddb30kRLqRYnZKqGb9VcP6FYpQZOMsv40xSJibjboiBA3aXg/hc+PUFDP3ih
         rt+s/40on4qJKIn1Rty/a3H7iD2YlsYLMVcVh60+Ook5YS5MOQwwmbishlwYBoOEeluB
         hI+qfvEYvPM0e7XdvpAKbWrP4qDHkbtLl7rd6WRGBKIPo/IqYpfR8X5Vt150zGpIL6zH
         +NOwMoH++98I5Y9S2Kv5fCbfxV+1FM5CWgnrcfNkS2NrbhtTH0A41hf/kfhdKY+qqZf6
         a6D2czdiSdkKbpsPooM6RDS36gGpnCO/cdBBMiJKfJjAIfIUPS1CyaMCzMYvHC1+w2hl
         wYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ksxZhqE+zId+/zoejDP6tdFZZb2ua3WQDtdUkqDgHsk=;
        b=FUJnctoVIZl7noiRDCa7v7mZd+UZCZp9cOjaqeJ35wMt3n7aLTztpKZxH4rNH5KLqT
         FDxkupVlOj/ODJlxPji5GwS4B+1BbdMFI0OqUJq8gp7suvRgBJIBOh/8M/7LsaMdlpzq
         fOPpJ76ErZXrxHcvEUUHKei1iS81UTE7trv+EWjr1yG7o0g7u8jCy+RU820uLwoitl60
         7ngOLEKRi1j5J7SEWdRmPIQRANYjmN2r6LJhP8VudLo4X/220iRcxXbLnlVVUk8AkSQH
         bx/jlfnVBWUDChOVuvaKayJXHRMlCKoXFy40a3nARt1ytHEK+EFthJ96RmtLg1Sj1tmk
         QLFg==
X-Gm-Message-State: AOAM531EYyBG0L8Fdry6SJbtE8W9OiHcX2bbUxwjHKQsKaZE3s6piBw4
        npWqkvbUUqXPXZCzAm2mhBRSPmbFDlTp6A==
X-Google-Smtp-Source: ABdhPJxmTDKq3xk3wfNtypQt5HQJCfX2C5i8yWzbNxqsnFrR6JrNOPo8hnq5FqJ9wk6vIwGaBq1Nmw==
X-Received: by 2002:adf:f947:: with SMTP id q7mr7798305wrr.260.1637332735618;
        Fri, 19 Nov 2021 06:38:55 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id h13sm3108940wrx.82.2021.11.19.06.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 06:38:54 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 04/16] dt-bindings: mailbox: tegra: Document Tegra234 HSP
Date:   Fri, 19 Nov 2021 15:38:27 +0100
Message-Id: <20211119143839.1950739-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119143839.1950739-1-thierry.reding@gmail.com>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add the compatible string for the HSP block found on the Tegra234 SoC.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
index c43fc4c56f77..9f7a7296b57f 100644
--- a/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
+++ b/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
@@ -57,6 +57,9 @@ properties:
     oneOf:
       - const: nvidia,tegra186-hsp
       - const: nvidia,tegra194-hsp
+      - items:
+          - const: nvidia,tegra234-hsp
+          - const: nvidia,tegra194-hsp
 
   reg:
     maxItems: 1
-- 
2.33.1

