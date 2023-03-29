Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D535DC77B6D
	for <linux-tegra@archiver.kernel.org>; Wed, 29 Mar 2023 15:07:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbjC2PHY (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 29 Mar 2023 11:07:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbjC2PHW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 Mar 2023 11:07:22 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0465A3C15;
        Wed, 29 Mar 2023 08:07:18 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id ew6so64571980edb.7;
        Wed, 29 Mar 2023 08:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680102436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrMf3aai+e3taJoSJGgLBDUWEWSyfIPExXD7NAwNRKM=;
        b=ckmcJlIyP2JJNdzNSBMEfPwNmgjHDQmf89ceEF5Lctv02X1H62a3OHESzYs3WptarV
         3IBuZXwGN7mBEMW4FIgDxqgEFmOiC+1VHXvDGXS7q4hpk+tUnDvnKLK9aG7iFjbK9cTZ
         orXgzR2/qi6uN3vw0RV+q2+H2EbsOf++D6VZwmaTI8Lr2dG5w44xviLk5PfuGZSPKDOr
         c7BUR88YbPcH118JPI+Xj/XuUmZEoRcSyFI/W554Ym/zTu78Atg+53qlw79vSPQqRMCm
         s9RZ6ZxeaCOQgJP+mbATOLQuFPc6ZqQ/8A30WpAy50ufHVdKC1bBA5uu+cQFgGnhx834
         hj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680102436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrMf3aai+e3taJoSJGgLBDUWEWSyfIPExXD7NAwNRKM=;
        b=n7Wa49lX0YtbLjWKrUXA2E6KG4Ndlxm33xeAKjF0R7ra63HyJnFRV0d1c2qwwaQmpG
         QeGwlnFZjhR+m1h2iiSekwgxuO3UfkaseQ5v/4vLL41vXcvwjLiLYGyj3UIpgVIhGYAQ
         NRriP7i1NoWbvNHwgdzWVR4mco1Kc1Q7eO8SkzHxs6He82w0eEAU2QuF56A/3aIAXdyQ
         2dafTCTG3D5+riMbhkcZl06oPojSMHduX6oBE6awrHUSDPNNdw11HVQ8oaRgQ4dN1NcC
         p2W/+I9AlnqK/puVAXpTREQSCSlbeosSmFz4dNzda/cq3LI2Q+vBHI4RSn58Mtb1bbP9
         n08A==
X-Gm-Message-State: AAQBX9d7SCbffSc1Up/mLCHD4cuByypIgLx2L6Uf5jjx06L83wHlW9Fy
        JhRVMk/mIOPEUXzR4Jd4aI8=
X-Google-Smtp-Source: AKy350ajj6Li6/XCqaJWazGucdL4KbmYSheXE0ztV7xUMoCXZXdj3mZGbrXbJX82xo3y3yP34RDhIw==
X-Received: by 2002:a17:907:16a6:b0:93e:1dd4:3f1e with SMTP id hc38-20020a17090716a600b0093e1dd43f1emr21292450ejc.35.1680102436596;
        Wed, 29 Mar 2023 08:07:16 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id q18-20020a50c352000000b00501d39f1d2dsm12656888edb.41.2023.03.29.08.07.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:07:16 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/4] dt-bindings: tegra: Document P3768+P3767 reference platform
Date:   Wed, 29 Mar 2023 17:07:08 +0200
Message-Id: <20230329150710.773441-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230329150710.773441-1-thierry.reding@gmail.com>
References: <20230329150710.773441-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Document the combination of the P3768 carrier board with the P3767
(Jetson Orin NX) module.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index c1a62eb1b925..8151600bcd69 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -171,5 +171,9 @@ properties:
         items:
           - const: nvidia,p3767-0000
           - const: nvidia,tegra234
+      - items:
+          - const: nvidia,p3768-0000+p3767-0000
+          - const: nvidia,p3767-0000
+          - const: nvidia,tegra234
 
 additionalProperties: true
-- 
2.40.0

