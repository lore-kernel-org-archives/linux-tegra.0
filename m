Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792E1C4332F
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 20:07:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5D5396112E
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 20:07:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236203AbhKNUKn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Nov 2021 15:10:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234591AbhKNUKm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Nov 2021 15:10:42 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03991C061767;
        Sun, 14 Nov 2021 12:07:45 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id 207so30765745ljf.10;
        Sun, 14 Nov 2021 12:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XpgIfSS+RMObgLYbwSybA25conQ/tCzGIbJEqeoL6Oo=;
        b=RtBUNRlgubtcgBLuCmKNmb6TsQ1nE2Y4S2lFCwr+wGhTLZYVml1Dzi/wX0UvHjG8yo
         VaG9HqBAuUOQ+0QG4q0vVWzWzPmjqID6xOdhxhEFGu/umpzpRiQFovLWyS0dZz62SLSy
         5fd5nY8gg+5weAZ8zGtt1sqT4MLRwCZ2sQOEWcSJxM8JsgpvxDnn4PV7+lcbsrztRc82
         nJNRx85jgPCveYDOSrsebXUxW8P4tXR+OLM4M3SPMgYiULUX4a7s3ztIbMZoB2xz/l0j
         6UWKmrym8TBWsv04vC6MvRZhbIkCCJ2HgGytsCptiLHXz+n8WH/dVxosjVbWzLve/4d7
         1LxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XpgIfSS+RMObgLYbwSybA25conQ/tCzGIbJEqeoL6Oo=;
        b=1K5Oxj1CuTpJ2T2CyTA2w++UnY6T5Mr/AfUAB2/KTXg6mRUnEeT6I2DABGnzrfCfSJ
         wHk2rEWajDrqpzPfxaEQplzKbmsoYyfsDFULmI8+vJZUlhRsYFqKGRVQGxYPe/uowAo9
         Yggv5lQVR+aM7uilSrSdT3R3WYaibYhbftnrZrB9BrDoK4sDxDSZcpqF321b3f2EQq/G
         nN52YWNNe1Rh6m4ZZwmXL8NabWRCEcMK9xGk4jL9PdHzs3F3ZbaR3qHHrZbAb83w6Pre
         nIyPwl/uKScaQ0iLKy3ru7eIrwZmWf2zXsfFhttvN8xYPeRjAKlwJKs8/2rDwKLUPt0R
         0liA==
X-Gm-Message-State: AOAM533pr8B7RyYn1WeqNDbquIlKJEp63b8fF6Lw17cI/wp1qlvwrLaX
        k3uzkWugDZEXDwbbM1jk6bw=
X-Google-Smtp-Source: ABdhPJwk5a8XUw/2bm1F0b0gxOiSzOZ2k6gDKu70LNL3EoxZrFn/R6f+EsiQ84Y5hT1mJXaXTTqTgQ==
X-Received: by 2002:a2e:9702:: with SMTP id r2mr33446069lji.482.1636920462712;
        Sun, 14 Nov 2021 12:07:42 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id d30sm1204644lfv.58.2021.11.14.12.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 12:07:42 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Herring <robh+dt@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Anton Bambura <jenneron@protonmail.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: sharp,lq101r1sx01: Add compatible for LQ101R1SX03
Date:   Sun, 14 Nov 2021 23:07:16 +0300
Message-Id: <20211114200717.28986-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114200717.28986-1-digetx@gmail.com>
References: <20211114200717.28986-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Anton Bambura <jenneron@protonmail.com>

LQ101R1SX03 is compatible with LQ101R1SX01, document it.

Signed-off-by: Anton Bambura <jenneron@protonmail.com>
---
 .../devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml  | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
index a679d3647dbd..f7514eb9ebda 100644
--- a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
+++ b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
@@ -30,7 +30,9 @@ allOf:
 
 properties:
   compatible:
-    const: sharp,lq101r1sx01
+    enum:
+      - sharp,lq101r1sx01
+      - sharp,lq101r1sx03
 
   reg: true
   power-supply: true
-- 
2.33.1

