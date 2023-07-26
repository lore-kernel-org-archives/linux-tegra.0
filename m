Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0D7C0015E
	for <linux-tegra@archiver.kernel.org>; Wed, 26 Jul 2023 18:50:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbjGZSuP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 26 Jul 2023 14:50:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjGZSuP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Jul 2023 14:50:15 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72C9B1FF2;
        Wed, 26 Jul 2023 11:50:13 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fe15bfb1adso206261e87.0;
        Wed, 26 Jul 2023 11:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690397412; x=1691002212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dZFtPpEycyUP73hHueYUMOEZtObxKgPsuopyvRqVMTw=;
        b=YPUsaa19hOA0AaPt+cec1a/M9icU0sct9k9M+7u80F9v7iqC62zn4BOXT6WuWA3zUd
         PhKBN9ydN62UKdXDlnTQCncXScDeqkwHYMBodfIZXXmD/E7eeEq5qiy2724HOs1NBuqP
         DvuRF3dUes+PnbaHE4pkXejH3KZ1ZD3Wg4tphq0UI7xQ9GQjM5ff/55R0a27VaXrm+fj
         rSlQoGsug5ORC4EzXV/2BOf8HBcAmq1EZKQAwIvgu1C2NH/fy+NhuQ8h+BY8LK+HNFuF
         kCCm2YdHlYrASf7P+UqdCrnEZR8vb7zdt7eIuddV0gLQrYQcF6s+G47Ef0NDwtMtQk21
         2h5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690397412; x=1691002212;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dZFtPpEycyUP73hHueYUMOEZtObxKgPsuopyvRqVMTw=;
        b=C8btjn3KZEJqnY1yDOcBmc0uKLBCUvJKDDqF2EHaFJRH7rJOCdyXgpqZhOiJGCi3/f
         66WpohCfdH3/Azs/ut8dGFgcfu4mLziDkDepoRtm6Rc9ggvk5iKTiK46LefFuAgxsvdf
         36ffq5dkMhbitgT7wJbCaiQ50v0eBiBT2++9CINqNWF7ytcc4IhvWKHhF3CdXRjHYeEw
         Om7EPQtOlC7q5BQYDJL6Qi45RQy2tEBrl7B8/IBkbEyWPSsaNSduTBER7jiSpV0RQ6Qf
         xgGNMZQPyW7zwHmrlbC5I3WSRBrHQHL2zhF/K6YrTUJd4TO5qaMVyJUunEPrwCJplqhv
         fw9A==
X-Gm-Message-State: ABy/qLYTBmIEP6TIbZxCKfhMcFcX3UzYzXgb+FTd4sri+W16y0Y4HGAr
        MrzlqMbVoXolVPxhvrd9UWA=
X-Google-Smtp-Source: APBJJlE+W7TOhUpEr5gF1XrOV/7mnzk+6EquVq88cSNssQjK5EMlhsYfc+/A/t1TJK0yI3B7v2Dutw==
X-Received: by 2002:a05:6512:3d0c:b0:4fb:96f3:2f4 with SMTP id d12-20020a0565123d0c00b004fb96f302f4mr16075lfv.51.1690397411409;
        Wed, 26 Jul 2023 11:50:11 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id t23-20020a05640203d700b005223f398df1sm2903091edw.91.2023.07.26.11.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 11:50:11 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: display: panel: Move Chunghwa CLAA070WP03XG to LVDS
Date:   Wed, 26 Jul 2023 20:50:08 +0200
Message-ID: <20230726185010.2294709-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Chunghwa CLAA070WP03XG is an LVDS panel, so move it to the correct
bindings file.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index 344e5df40c2f..dbbf32a8be87 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -40,6 +40,8 @@ properties:
     items:
       - enum:
           - auo,b101ew05
+          # Chunghwa Picture Tubes Ltd. 7" WXGA (800x1280) TFT LCD LVDS panel
+          - chunghwa,claa070wp03xg
           # HannStar Display Corp. HSD101PWW2 10.1" WXGA (1280x800) LVDS panel
           - hannstar,hsd101pww2
           - tbs,a711-panel
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index f4d9da4afefd..67959290b212 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -103,8 +103,6 @@ properties:
       - cdtech,s070wv95-ct16
         # Chefree CH101OLHLWH-002 10.1" (1280x800) color TFT LCD panel
       - chefree,ch101olhlwh-002
-        # Chunghwa Picture Tubes Ltd. 7" WXGA TFT LCD panel
-      - chunghwa,claa070wp03xg
         # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
       - chunghwa,claa101wa01a
         # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
-- 
2.41.0

