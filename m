Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0BEEC433FE
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Nov 2022 15:28:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233189AbiKKP2w (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Nov 2022 10:28:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232901AbiKKP2t (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Nov 2022 10:28:49 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2E96B48C;
        Fri, 11 Nov 2022 07:28:47 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso3355346wmo.1;
        Fri, 11 Nov 2022 07:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrmlYHmiuesT3w3sThGxjyFJhQXRuhPRHGshJbvOvyg=;
        b=liv7QXWC1l75/X/4jY2qqYcZnijOZ9tpqbanpsntmirddiBJxN9OsAUglrCIYdkvJh
         +FyQREB49ObAAFMywHeJxcKfz+dN4yq4/EIB5Zn449ycDva1koJXFdATtZ6hQGPDTN+n
         Rrsj/4clLxNa4fytyQ7qyiJlH1bk7JeQN7WtGKdKYMyGLXvrqgr6zfIJcfuZDKwlwOfK
         /SnZWVzO4qhAb22/HZyCqgRrzDb2Ks2wqfML3ZqccIb6+Z4OKu046w75oPuJq2W45NIB
         aQP+epwuvvOsLfdrodSJw8mtDp7ij2quTB9BJ4Jq3yG/sL2MQcKUqFY6ITa9++mxZRZm
         p4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrmlYHmiuesT3w3sThGxjyFJhQXRuhPRHGshJbvOvyg=;
        b=tL3n+742RzXtF9VHrzBTVeSfK90JZGdGfrNMhfhysa64owVpqaTboI2qODhhOSlcNh
         yhH6ScrUK5LO8P5C6agA6Q97Ek8yTPtLdxUHwMxsAOH32N1KmNtxy7wEMqL+/ybV+s+F
         sqLZ2jFoiRmeAbx8n5J/7GyKXS9xcp0nvpMl1U6QULgsj9bdYvqlgIg1bD91CY5fJjGL
         liujHTVA3XbHmkTMP6BiHedAyAeF9qevmMUj+yq1ot73ucUxKWcQrW/ZVnwk9arCKWJd
         Ya8FoA8fTbXDYnNarEeWBWB7M72kHB6BhIQv0udole2PBtn9eeQDY1frB8mzcLUKDmni
         bNyg==
X-Gm-Message-State: ANoB5pmziCVdl2jZXW1XM4zZdX0rVgEmS4XF36Cjo8rJuCH5jjMTle/c
        qFFM4YmB99IgnDI7w7NG1ek=
X-Google-Smtp-Source: AA0mqf5nD58MFK6vcEaE1nAXD2dtiYJAK8/f3SgICxN9JiL3CDhMoTfWuhapVZhUhbC/kv/uNlGpZg==
X-Received: by 2002:a05:600c:3845:b0:3cf:633e:bf6a with SMTP id s5-20020a05600c384500b003cf633ebf6amr1606490wmr.63.1668180526352;
        Fri, 11 Nov 2022 07:28:46 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id o3-20020a5d58c3000000b00241727795c4sm1569798wrf.63.2022.11.11.07.28.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 07:28:45 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: clock: tegra: Document Tegra132 compatible
Date:   Fri, 11 Nov 2022 16:28:43 +0100
Message-Id: <20221111152843.627286-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221111152843.627286-1-thierry.reding@gmail.com>
References: <20221111152843.627286-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Tegra132 clock and reset controller is largely compatible with the
version found on Tegra124 but it does have slight differences in what
clocks it exposes, so a separate compatible string is needed.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/clock/nvidia,tegra124-car.yaml        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml b/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml
index 0fc55f441ac3..2d7736a10178 100644
--- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml
+++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml
@@ -27,7 +27,9 @@ description: |
 
 properties:
   compatible:
-    const: nvidia,tegra124-car
+    enum:
+      - nvidia,tegra124-car
+      - nvidia,tegra132-car
 
   reg:
     maxItems: 1
-- 
2.38.1

