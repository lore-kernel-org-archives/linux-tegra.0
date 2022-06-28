Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C31C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 28 Jun 2022 12:37:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343918AbiF1Mhi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 28 Jun 2022 08:37:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345870AbiF1Mha (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 28 Jun 2022 08:37:30 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ED002ED77;
        Tue, 28 Jun 2022 05:37:28 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id s1so17474548wra.9;
        Tue, 28 Jun 2022 05:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hO4xZJ8wf0/DTFCvduIwbZI6kG2ObiNzhghsCYCED2Q=;
        b=AH4KD7RJe/xPX4OlMAG12nnSAesrDxWjsbRIKrBU1Gcyhh8/9KPUyTgIQRR2cqreQb
         Gd4u3y4m3C64UIffdcTKOX1nPbphiWX3S83wkuz/bRaP9Tye6jlVmnOtREu39tlnBe5k
         HB7tNruryUNECrI5mgpePBpWtLJX2Fio7xGMV0fHZT/ULJYPdM0YInQeBBQx5j1BnyPj
         jwiW7JN93XjZCqNV/zM2oNoQd7m+g8NXDBDySpDKJZqzeh98m0AlTgMeOpREGuKlot4N
         qosX7FkFVExqyXlqN7/2jO5a8CDf+TgUvvg/Mycgs1VvqxSFX3Hq4p0Ne3NxTq61Uwrn
         Ladg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hO4xZJ8wf0/DTFCvduIwbZI6kG2ObiNzhghsCYCED2Q=;
        b=IWB5oOFvEnU8ANt8NTwUAfHHztA9pdgkuUKQeWivhqVDEqjPQHmq/SdYyK8/W6j5jx
         Rv3Dl3BGjBvUSANm+VlAK+tgNslEM6qmSagt16BSydKebj0WYWID78sHYZ3/DPX85JP7
         cJF1k9uwkG8qkcVWjU0ke8jc/I0rasH3eL1paEDZZvrJNm9VFU2QJcJWIG1sLWdJXpPq
         OJwiB/YiVOHjm0993eeKPp/Z7jeWNcSo7KdjHH/sylqQScvFJ8R8ukAiibjRn/mGwZE0
         SLgFGVyIdcpxDYkwrQ/jSLxgtY53kCbu8lIXtuq5TbD4vluZWs1cOvj9r0gKnM0ZkDSm
         dQmg==
X-Gm-Message-State: AJIora+YNmbttUAUaGkJbh6OIGD9+1bWLQYdA6q392PAD+2KBt25iSez
        F39rImEOdoEWsU2UBXN7x1E=
X-Google-Smtp-Source: AGRyM1vS0j2HO+36idxzV49a+8a/zbG6qBBbnke5JHVFmt+B23ped614wbuLdrlFkQJJxWP1tLRqaA==
X-Received: by 2002:a05:6000:1a8b:b0:219:ad61:f4e3 with SMTP id f11-20020a0560001a8b00b00219ad61f4e3mr19011337wry.190.1656419847027;
        Tue, 28 Jun 2022 05:37:27 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id c2-20020a1c3502000000b0039c5328ad92sm21771372wma.41.2022.06.28.05.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jun 2022 05:37:25 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Sumit Gupta <sumitg@nvidia.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH] dt-bindings: tegra-ccplex-cluster: Remove status from required properties
Date:   Tue, 28 Jun 2022 14:37:22 +0200
Message-Id: <20220628123722.3678140-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The "status" property is implied to be "okay" if it isn't present, so do
not mark it as required.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/arm/tegra/nvidia,tegra-ccplex-cluster.yaml          | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra-ccplex-cluster.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra-ccplex-cluster.yaml
index 8c6543b5c0dc..711bb4d08c60 100644
--- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra-ccplex-cluster.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra-ccplex-cluster.yaml
@@ -40,7 +40,6 @@ required:
   - compatible
   - reg
   - nvidia,bpmp
-  - status
 
 examples:
   - |
-- 
2.36.1

