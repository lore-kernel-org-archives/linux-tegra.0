Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 009D3C433F5
	for <linux-tegra@archiver.kernel.org>; Tue,  7 Dec 2021 15:08:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234061AbhLGPLc (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 7 Dec 2021 10:11:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233627AbhLGPLc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 7 Dec 2021 10:11:32 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4596C061574;
        Tue,  7 Dec 2021 07:08:01 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id q3so30110498wru.5;
        Tue, 07 Dec 2021 07:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kz7NKgHAX4IzOzsEzkgVNSG5yoJg613LjjHhieefYSs=;
        b=DaJu4kA4hziIJc/VRsLd981DFE2Xm70pe/0kMGWhcmjEzex+IzyCKg3NQhHhGovQ54
         WYNk7oJ6uALIIPcf8tsEILq768AHLpWTWEOYp8eM++CRTYBqWk8h5nRj12gWaHBbFu1I
         fNn6qnM33dutKM3wXovNqpAlsrBzR0XSC5y4n4Y7EUK+n90kohu3rQp02qiEMxz6SR5Q
         b7OEKngWTAGc9j9UVAyW+Yxd9rF+IVsfxJKU9PWJgYAw4tVJoyo85iPVC3OlGrkY7FDI
         oiKPNmotKIabCnB1FouesThRAsuOsMEwkTc1/jI5Av/lOpaupBnb1FbRG2mqaFeA4Qch
         rOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kz7NKgHAX4IzOzsEzkgVNSG5yoJg613LjjHhieefYSs=;
        b=V14lvCUUxnlPYn6+AZZbDFMmJ1GitgvX/MWXAywgCHBARavhV8ZPFMdEPF4bP3cnaM
         qVLXiCIv/1qpnGLohuEo7wfZA2jci5m6C1RqXjDXR3bF4vA1wroT1PtXOXtz2Maox9c6
         H3OSt/iCiQ9WRS3D2kNFFt6cWn/rSln32FPk97tuWusy1DyLeJo/BcBQs9sgAhbuLR0F
         nGH+fVv+55pt6XvFbzqJxw4D58cCXYrLzFiZupu4hKCqR4MkBByFjCDehGY5952YskVy
         6gmQpEy3INEAMG4XrJ97BGjomW02ll8Ma2hhi8qSiRlpTMOE7sEluoQFEFj1Y9KLHiu0
         Y9dg==
X-Gm-Message-State: AOAM532159QmTb4nqFptNpc1LOriW95FZ4d6/uKaYynuxfuuesZBaLjq
        2ad1tvgaVT1KwfeEWXBAcfYwkoSuWo9tdA==
X-Google-Smtp-Source: ABdhPJzi5WCAayxIVgprwY9uN9yJ+hQyMk2NS5u0PKHDK/xmJYBSUn/NGQnS06KDNPX8OYksua1Hfg==
X-Received: by 2002:adf:db11:: with SMTP id s17mr51219097wri.573.1638889680246;
        Tue, 07 Dec 2021 07:08:00 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id w22sm2784834wmi.27.2021.12.07.07.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 07:07:59 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: arm: pmu: Document Denver and Carmel PMUs
Date:   Tue,  7 Dec 2021 16:07:44 +0100
Message-Id: <20211207150746.444478-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add compatible strings for the NVIDIA Denver and Carmel PMUs.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/arm/pmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/pmu.yaml b/Documentation/devicetree/bindings/arm/pmu.yaml
index e17ac049e890..c6447dc86076 100644
--- a/Documentation/devicetree/bindings/arm/pmu.yaml
+++ b/Documentation/devicetree/bindings/arm/pmu.yaml
@@ -48,6 +48,8 @@ properties:
           - arm,neoverse-n1-pmu
           - brcm,vulcan-pmu
           - cavium,thunder-pmu
+          - nvidia,denver-pmu
+          - nvidia,carmel-pmu
           - qcom,krait-pmu
           - qcom,scorpion-pmu
           - qcom,scorpion-mp-pmu
-- 
2.33.1

