Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D60EC43462
	for <linux-tegra@archiver.kernel.org>; Wed, 31 Mar 2021 14:28:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3729B61006
	for <linux-tegra@archiver.kernel.org>; Wed, 31 Mar 2021 14:28:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236030AbhCaO2F (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 31 Mar 2021 10:28:05 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:38739 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235948AbhCaO15 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 31 Mar 2021 10:27:57 -0400
Received: by mail-oi1-f171.google.com with SMTP id v25so3560257oic.5;
        Wed, 31 Mar 2021 07:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VXRg8g46EQQdfaQQE5j+9aJCuQ11jH3qTJJtKuhoDX4=;
        b=GT0N9sswpDDrCfRK/AG/XBdkm0AFlEM71K0MVOGS3wTXpXRkPB4e9tI09nvf5zVU7k
         uMvbgq5dwkMms7xPj+5YYtztCN8iEXp6Jstpl4nq4QpX+R2D17Sis4jKatuFfR3G8d1a
         zkUNh6K5WAmykHnNeGW13upFymVnJNlw0POp6D/8/HLwICYgFx9v5B7+CkyUV5ZxWrfr
         OjEsby3ZV2il/gltoMdzMEHQhU0tMRpRqK0NfgA7u2oBFt2FuYbPUeRYGkLrlP8Eh1Vs
         9h7NlyB7RZh1VX7jpmRkEf/9SSNFMgT9cYE1diZkAW5rJ9z6UDlPPJDNyu49t2M4ZtS5
         gMcQ==
X-Gm-Message-State: AOAM530HJnmVKRcu6N+83aZN79686792kOVywp+dfUWhdU+5PBHnHmfv
        8zYeg8OQQclNKIoA3coD0A==
X-Google-Smtp-Source: ABdhPJx/r+uJSPnbV2RZAwQzxbxafoglGFYnTVKVL5A6Xbw1EwPTr5j4W6fn8n9sai+N1CGtZQsR8g==
X-Received: by 2002:a05:6808:13d0:: with SMTP id d16mr2542244oiw.169.1617200875988;
        Wed, 31 Mar 2021 07:27:55 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id v136sm451146oie.15.2021.03.31.07.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 07:27:54 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Mark Brown <broonie@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 2/3] ASoC: dt-bindings: Use OF graph schema
Date:   Wed, 31 Mar 2021 09:27:47 -0500
Message-Id: <20210331142748.2163272-3-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210331142748.2163272-1-robh@kernel.org>
References: <20210331142748.2163272-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Now that we have an OF graph schema, let's use it for the
audio-graph-port schema.

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/sound/audio-graph-port.yaml      | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 9f68142c9ae3..43e7f86e3b23 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -11,9 +11,10 @@ maintainers:
 
 select: false
 
+allOf:
+  - $ref: /schemas/graph.yaml#/$defs/port-base
+
 properties:
-  reg:
-    maxItems: 1
   prefix:
     description: "device name prefix"
     $ref: /schemas/types.yaml#/definitions/string
@@ -25,10 +26,8 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
 patternProperties:
   "^endpoint(@[0-9a-f]+)?":
-    type: object
+    $ref: /schemas/graph.yaml#/$defs/endpoint-base
     properties:
-      remote-endpoint:
-        maxItems: 1
       mclk-fs:
         description: |
           Multiplication factor between stream rate and codec mclk.
-- 
2.27.0

