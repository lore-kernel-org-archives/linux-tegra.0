Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15417CCA480
	for <linux-tegra@archiver.kernel.org>; Mon, 11 Jul 2022 15:20:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231625AbiGKPUe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:20:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232239AbiGKPUe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 11 Jul 2022 11:20:34 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13F45422FA;
        Mon, 11 Jul 2022 08:20:33 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id l23so9395269ejr.5;
        Mon, 11 Jul 2022 08:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5b8UWOyZ49xxzDiCA8+Xk3JKrtP0H16bFd6219QDvZA=;
        b=q5lmrfLR3ikjlAM0i1sUYFRVqQVSRofRgu7G4fnZ493LqjJ8qoMHiGBWWLjg+A4l5b
         QnKq/w0OZ3oE+mb5oa37llLYTvi90KQfG9vL3x+0VHTG8ixisEHFogjR07QHtxRfFZpG
         MxjzrRSq0TxQDZf50/VnvQiTfsCOZHfx60YaJgctTqEyhmFikNcry7elzdUnMrjU3UlQ
         J4vLjZtp8gyaETODWnuNeETjX3Jv2iURr8G2Mwz4xMJNiDx1htdR1lqMYZQYObRyJnd4
         g0YdHn1vDc6plunCsJaR2I6qE4kR3vQSUpF5p5cTb8PPw/k/4WzjOmpD1KtS9f8CUIGO
         rVqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5b8UWOyZ49xxzDiCA8+Xk3JKrtP0H16bFd6219QDvZA=;
        b=7hFAZ9f50BFfzz6K8ar2s7ULsaXcxQnK7T52RIVFenlEzwXrMgfyn172tDBTWAKHhz
         ksMUPtSsX95X4EGo9mjcKHis6vstSzaT6YniszQFuWnnV+9SGFkMX7p27GSdWFlv/ALe
         7AXtJA1l3xIb+cuRrok2UtcvJBS/QfbZKqtVjg2tnh7zwQJyDrpCE0lXB4uTZlLr0wX5
         Lih0+9MMwY1JLTdgyOvFjwXgJln3sPQ96yzNCeDcP8uWvQW1SibehGa2otUcG+cvz4hG
         LtdQIZBRwV3xyLKppW632YRQrUkwdTLPxMRtET2k3M6ElFnpiWImlUaeEneaVKihRXuI
         J+kA==
X-Gm-Message-State: AJIora/JHppcB7VevBYs/40hvLIiuGnMCBvPXkpoj34M4vN8A3ky0Ig3
        edJByyULA39QJZE9p+OK9L8=
X-Google-Smtp-Source: AGRyM1uZQiL59BUxwlBraRLkU617JdLwElH7er6ODVAfU4DSUbwAmDnABHuJ2ZONcQuHXbfkLKo21w==
X-Received: by 2002:a17:907:72ce:b0:722:e1a5:164c with SMTP id du14-20020a17090772ce00b00722e1a5164cmr19519590ejc.111.1657552831515;
        Mon, 11 Jul 2022 08:20:31 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id fd15-20020a056402388f00b0043adc6552d6sm1060373edb.20.2022.07.11.08.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 08:20:30 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 5/5] dt-bindings: arm: tegra: Add missing compatible strings
Date:   Mon, 11 Jul 2022 17:20:20 +0200
Message-Id: <20220711152020.688461-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220711152020.688461-1-thierry.reding@gmail.com>
References: <20220711152020.688461-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Nyan Blaze and Nyan Big, as well as Jetson Nano (P3450-0000), Darcy
(P2894-0050-A08) and Pixel C (Smaug) were never mentioned. Add them.

While at it, also fix a typo in the compatible string for Apalis Tegra30
v1.1 evaluation board.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/arm/tegra.yaml        | 50 ++++++++++++++++++-
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 49841ca272ee..187d832a14ac 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -114,6 +114,33 @@ properties:
           - const: toradex,apalis-tk1-v1.2
           - const: toradex,apalis-tk1
           - const: nvidia,tegra124
+      - items:
+          - const: google,nyan-big-rev7
+          - const: google,nyan-big-rev6
+          - const: google,nyan-big-rev5
+          - const: google,nyan-big-rev4
+          - const: google,nyan-big-rev3
+          - const: google,nyan-big-rev2
+          - const: google,nyan-big-rev1
+          - const: google,nyan-big-rev0
+          - const: google,nyan-big
+          - const: google,nyan
+          - const: nvidia,tegra124
+      - items:
+          - const: google,nyan-blaze-rev10
+          - const: google,nyan-blaze-rev9
+          - const: google,nyan-blaze-rev8
+          - const: google,nyan-blaze-rev7
+          - const: google,nyan-blaze-rev6
+          - const: google,nyan-blaze-rev5
+          - const: google,nyan-blaze-rev4
+          - const: google,nyan-blaze-rev3
+          - const: google,nyan-blaze-rev2
+          - const: google,nyan-blaze-rev1
+          - const: google,nyan-blaze-rev0
+          - const: google,nyan-blaze
+          - const: google,nyan
+          - const: nvidia,tegra124
       - items:
           - enum:
               - nvidia,norrin
@@ -121,11 +148,30 @@ properties:
           - const: nvidia,tegra124
       - items:
           - enum:
-              - nvidia,darcy
               - nvidia,p2371-0000
               - nvidia,p2371-2180
               - nvidia,p2571
-              - nvidia,p2894-0050-a08
+          - const: nvidia,tegra210
+      - description: NVIDIA Jetson Nano
+        items:
+          - const: nvidia,p3450-0000
+          - const: nvidia,tegra210
+      - description: NVIDIA Shield TV
+        items:
+          - const: nvidia,p2894-0050-a08
+          - const: nvidia,darcy
+          - const: nvidia,tegra210
+      - description: Google Pixel C
+        items:
+          - const: google,smaug-rev8
+          - const: google,smaug-rev7
+          - const: google,smaug-rev6
+          - const: google,smaug-rev5
+          - const: google,smaug-rev4
+          - const: google,smaug-rev3
+          - const: google,smaug-rev2
+          - const: google,smaug-rev1
+          - const: google,smaug
           - const: nvidia,tegra210
       - description: Jetson TX2 Developer Kit
         items:
-- 
2.36.1

