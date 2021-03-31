Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C12C4360C
	for <linux-tegra@archiver.kernel.org>; Wed, 31 Mar 2021 14:28:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86C6B6101D
	for <linux-tegra@archiver.kernel.org>; Wed, 31 Mar 2021 14:28:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236062AbhCaO2G (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 31 Mar 2021 10:28:06 -0400
Received: from mail-ot1-f52.google.com ([209.85.210.52]:40827 "EHLO
        mail-ot1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235951AbhCaO2A (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 31 Mar 2021 10:28:00 -0400
Received: by mail-ot1-f52.google.com with SMTP id w31-20020a9d36220000b02901f2cbfc9743so19081306otb.7;
        Wed, 31 Mar 2021 07:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a5L9Gfl5bF9CWxUCr8sVjvHZWCe8RrXgbQdGFig1nYs=;
        b=IZkJCgd74DfkKmCuO1NJUr4ju9yJqO72gePDRAHWDarScho1v1ad0rpqB9iMp9Q6UA
         B9cIMIGNwf4v2HLuEu4ApAjx7obeoCd6n21MzeksFs8JLawMwbZnPJkGT/mVb9J//2nk
         ydu3nbpHSw0Xafo4sx2vDM16wz+IbpQNuBBExq2nhgKDrufjhqUNx/H4ztGiYP7MujF3
         Wnxd49HrosbxNpTkbIG7aZWWMcQvcTv1CJgCvgWENQ/IKHMtIBr+MRob+Hrxs90HHZQX
         FWM6QKDWq2DJvzjIS9mjn/htuyuAKnoJ6derEaRdpMVT6b/OMNtIGhRhUIyHhkkWj/Dz
         aY8w==
X-Gm-Message-State: AOAM532mrnBLpRit1qfVv8KNeNv+yKKu4D15kU7D2Ke8+7k9Fw5BxXbx
        pTkB5jr2W1m0z9326CUJlupZCAToPg==
X-Google-Smtp-Source: ABdhPJyOs4V5V3Q3Hn8BauTqhypFGiAuWczQrsYjG6DCb8QtcbtJDsu+mU39XCkUHElkU3lAcJXO9g==
X-Received: by 2002:a9d:68d7:: with SMTP id i23mr3005001oto.133.1617200879927;
        Wed, 31 Mar 2021 07:27:59 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.googlemail.com with ESMTPSA id v136sm451146oie.15.2021.03.31.07.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 07:27:56 -0700 (PDT)
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
Subject: [PATCH v2 3/3] ASoC: dt-bindings: socionext: Use audio-graph-port schema
Date:   Wed, 31 Mar 2021 09:27:48 -0500
Message-Id: <20210331142748.2163272-4-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210331142748.2163272-1-robh@kernel.org>
References: <20210331142748.2163272-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Convert the Socionext audio schemas to use audio-graph-port.yaml schema
for 'port' nodes.

The number and numbering of port nodes should be documented, but is not.
Leave a FIXME here so others don't copy.

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/sound/socionext,uniphier-aio.yaml | 8 +++-----
 .../bindings/sound/socionext,uniphier-evea.yaml           | 8 +++-----
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/socionext,uniphier-aio.yaml b/Documentation/devicetree/bindings/sound/socionext,uniphier-aio.yaml
index 4987eb91f2ab..55ae198220f4 100644
--- a/Documentation/devicetree/bindings/sound/socionext,uniphier-aio.yaml
+++ b/Documentation/devicetree/bindings/sound/socionext,uniphier-aio.yaml
@@ -46,11 +46,9 @@ properties:
 
 patternProperties:
   "^port@[0-9]$":
-    type: object
-    properties:
-      endpoint: true
-    required:
-      - endpoint
+    description: FIXME, Need to define what each port is.
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
 
 additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/sound/socionext,uniphier-evea.yaml b/Documentation/devicetree/bindings/sound/socionext,uniphier-evea.yaml
index 228168f685cf..48ddfcbbcbae 100644
--- a/Documentation/devicetree/bindings/sound/socionext,uniphier-evea.yaml
+++ b/Documentation/devicetree/bindings/sound/socionext,uniphier-evea.yaml
@@ -40,11 +40,9 @@ properties:
 
 patternProperties:
   "^port@[0-9]$":
-    type: object
-    properties:
-      endpoint: true
-    required:
-      - endpoint
+    description: FIXME, Need to define what each port is.
+    $ref: audio-graph-port.yaml#
+    unevaluatedProperties: false
 
 additionalProperties: false
 
-- 
2.27.0

