Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4512BC76196
	for <linux-tegra@archiver.kernel.org>; Fri, 31 Mar 2023 16:35:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231777AbjCaQfu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 31 Mar 2023 12:35:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231751AbjCaQf1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 31 Mar 2023 12:35:27 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A8FDF77A;
        Fri, 31 Mar 2023 09:32:02 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id eg48so91748419edb.13;
        Fri, 31 Mar 2023 09:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680280320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eSWFOZ9lVtzfA35QEC6o3gmLZRctPuEzmtHrF4TPjVQ=;
        b=DxKJPXMCXQcZCUv71XrXJxHCRJh7geIndMPJkn/4wQ+dLIhPtda+8N3gy6mXXHZLjW
         PaDJPPenfsO1A+bwmumlN/GDFcjd1hk1o4vAn1bzOQmvHFf5wfTQfvS1cDYreXPpaD5M
         NpAn1MXQdTiKwkyNuSnzCIMoBkiJujdelIo6UB5OBLR3zeN3VgsehQJRd10lwi60sFeE
         m8oP7CJaCo+mvfjQdfOe0IHOc4oT30QNzRYiubC3nUCDEdjARJf/AWtHTlgSNTn3B5nV
         RuUuxS46eQTDxXmQ4UYZUkR494hM/PPs2nG0urjOGuwwWqkfz9eV/huCSI/ab5WwY+Xa
         8N7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680280320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eSWFOZ9lVtzfA35QEC6o3gmLZRctPuEzmtHrF4TPjVQ=;
        b=IIf1AaxJsWTs1n6mpVv15m8yQkZfx8JRiOakXDQISAP54PM1ldGOyvO8LD6H0V3TX0
         aTTTBhNh8TcqiUxBQN+uOa7S44t4Fp3voDltOYHJ1G8XmUU3N+U1OAefarvinB3boANR
         QrD3zjHskP8SB4oo+Iv+B7heY3VZaaNGKlD7sRaMjO4inaGsPbdQ+jCfbF6SVjcbiK3s
         QhAKLFyKpzGIHQ98GVavfxJHNewQpO2abcUZ0DEp272xwrPK5fw2HZd4czTkpKXrEMD3
         9shwW/GvGq+AwDBIBNOZv5o1YrGFuQE+OAAGKJtYh/MWsVct1Q10aApUvyAyzqvyNi+y
         Uj9Q==
X-Gm-Message-State: AAQBX9f06kH0FAJXR/jKPXTLOwvIruihg0aoffbJfExmFKypJjAJSL1w
        2luXjs4raulJPZ7n2OQmpTc=
X-Google-Smtp-Source: AKy350bJb8GHgNAgQ78MqbG2WlrPKgolIg4zAUs5D0Vt2ROuuUuXfbGMF2ctK1ITmM1praBklnYddA==
X-Received: by 2002:a17:906:f29a:b0:933:816c:abb9 with SMTP id gu26-20020a170906f29a00b00933816cabb9mr8892069ejb.36.1680280320499;
        Fri, 31 Mar 2023 09:32:00 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id g3-20020a056402090300b005024459f431sm1213248edz.70.2023.03.31.09.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 09:32:00 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/4] dt-bindings: Document additional Jetson Orin NX SKUs
Date:   Fri, 31 Mar 2023 18:31:56 +0200
Message-Id: <20230331163159.17145-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Beyond the original 16 GiB SKU (0), additional SKUs exist, such as the 8
GiB SKU (1) and an internal-only SKU (2) that comes with an equipeed SD
card slot.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index aa71236f93ce..61e638c9cad7 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -215,7 +215,10 @@ properties:
           - const: nvidia,tegra234
       - description: Jetson Orin NX
         items:
-          - const: nvidia,p3767-0000
+          - enum:
+              - nvidia,p3767-0000
+              - nvidia,p3767-0001
+              - nvidia,p3767-0002
           - const: nvidia,tegra234
       - description: Jetson Orin NX Engineering Reference Developer Kit
         items:
-- 
2.40.0

