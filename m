Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 207BCC433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:39:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A1D9613A3
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 14:39:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231646AbhKSOmO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Nov 2021 09:42:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235977AbhKSOmN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Nov 2021 09:42:13 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0384AC06174A;
        Fri, 19 Nov 2021 06:39:12 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id u1so18504468wru.13;
        Fri, 19 Nov 2021 06:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DvmflS0p1AV4yRC5qHHwVEmvP4IwgGTcmBAOtxdyyHA=;
        b=YnIyeLQNANbl/vDEO/LLBsH4mxXppiXaKuHyK8pttF2oMieJYDf1R0FpRaphZUDsqK
         PSldtjUgyAumZQZctIH323lnP/YIsUCDPjA1NODbuvQ0qTLtpmwqFQj6UvNT99M+HaYr
         bB6ow0Z67axt6SK9Qu/ZHvqQql3vkjyuFodZauP/eFyuxIVlzvqFFBhrQ+dZp18KnyO/
         XGxEKavf7NSLtfYjo9UQm+aW4aysfMqu6ehG/2juJH/XYKr8zZqHay5R5XDuwHbGhLlU
         ZhnbA6J6eXhPOwEF/q0fvwRrvZShtl2D1f8UZerQEgO80i98RyCiGzmK2IJUycB1DcGK
         xhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DvmflS0p1AV4yRC5qHHwVEmvP4IwgGTcmBAOtxdyyHA=;
        b=rzsezQAzY3135TiGbFbS9U6N7GbRjSJYXpCdfdXSs//6HsLlA2eJ1wNdYeZVRxNl9k
         szuMjQMNE1y6dtIu3NhDR8jqtGVf95J5yE2VfFeXkb75KT0SzPswWzLzElK13Mb2NbkN
         kDoVX1l3KaLFWQuV2voDRL7o3XismiF7Z/VXPWndLocL78SIgc9RMYs/lK1PLcVkt6jj
         gTcDEltCz2itcwoba2waLWrK9QgmZpsFZMtABY5K3VEIWbTz+YK9NIuR4Wqw4pRhoN77
         dRY5M3hsp49Y/FppOlmMdpq6LoM363QAAdVahn7aZE/ukyrd8hq1A/PqYEOQO+TOP23A
         bfNw==
X-Gm-Message-State: AOAM533GusSIMNJ+xLZredgn9GAFEWJ8HOLJ5a8fHmk5wHbIIS3jvct3
        J0vchGcoo+5PlW+LdybQ+mo=
X-Google-Smtp-Source: ABdhPJxMAeWWROc8t0vYKK6KckmT3grqLiEK1hwMS+u0HqeWoPlfNntjaOvvuKWMdYkF12EdSB5NLA==
X-Received: by 2002:a5d:648e:: with SMTP id o14mr8153037wri.69.1637332750553;
        Fri, 19 Nov 2021 06:39:10 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id h13sm3109588wrx.82.2021.11.19.06.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 06:39:09 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 10/16] dt-bindings: serial: 8250: Document Tegra234 UART
Date:   Fri, 19 Nov 2021 15:38:33 +0100
Message-Id: <20211119143839.1950739-11-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211119143839.1950739-1-thierry.reding@gmail.com>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add the compatible string for the UART found on the Tegra234 SoC.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index fa767440f281..3bab2f27b970 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -113,9 +113,10 @@ properties:
               - nvidia,tegra30-uart
               - nvidia,tegra114-uart
               - nvidia,tegra124-uart
+              - nvidia,tegra210-uart
               - nvidia,tegra186-uart
               - nvidia,tegra194-uart
-              - nvidia,tegra210-uart
+              - nvidia,tegra234-uart
           - const: nvidia,tegra20-uart
 
   reg:
-- 
2.33.1

