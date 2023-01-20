Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14402C38159
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Jan 2023 17:31:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbjATRbU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Jan 2023 12:31:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbjATRbR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Jan 2023 12:31:17 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B9D2DBC8;
        Fri, 20 Jan 2023 09:31:09 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id o17-20020a05600c511100b003db021ef437so4234707wms.4;
        Fri, 20 Jan 2023 09:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4HRh/xECMVrkAQ+rHzLh2y2hx0e7txexSDUMhaR4Ks=;
        b=KOAy7WqeTvP8+Sbxusk9elhvfXIfyG8QADBBoywCpEcBPcOP35aZ2eFIxNC8ba5J8S
         ejgpcz6IZhgQ9jtjJjsXnZV8qJ3lJwF/gXp3RXcD5Iw1lT+tDbvTzl1pEy1IdC7jjqks
         yrCtZnhYlBkJhI1HGOBOIu/IUvgeZdegsizv94t/ybFUOdb+mmXUSDb2bH5EWTiF1JzI
         57P7OTdbT1iHUgcpQCsP8xnLFNOvrS4oIzSOG+/fb3avZa5o9MFFxqRWHjUjLDWYqSMu
         tscKRJ9ohqkJvPnS9tyfJBUYEd+eLXgcDKmf9/3Im+aZ6ONe0YLvaVpYyujNycdX2gXP
         EQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D4HRh/xECMVrkAQ+rHzLh2y2hx0e7txexSDUMhaR4Ks=;
        b=iT8x8NtOr0pT3UnS4CgDLIqehEc3roZkqMBG7Ea5+K9iz65vC3qKM3yEEqR2ffeWZ1
         exQVO18WttMiFlUADVumxr86LAkUpA54gTZVOLkOCiZGP3tI9lJs1uRbDMlNYo0DI8jV
         kEx+2paxnnEtFCsD/aJ8DvfLLZec3BTSXA1OQJ9m0OtOCnXCUUkfDeU4De9kOJGSrJo9
         ktYWNKcO9WfsjmJBUJ5+B/JnC58YMd2gQv8Wih4FIj/dA6bR3Ut9kDRO4dgsonQ0tjzr
         X96Zemyps1SnqfHVYWpgeWQ+mKDOFXvz3aC4yHaj07DnnmzZZD4aKCtIKk3XfROW75I9
         FO8w==
X-Gm-Message-State: AFqh2krfcp//2133qW67ZB2dSBg7E+/Bnt16Eo+y6QbI9R4IeVbxq7Qv
        ivWl5CgLhU989QcN30I5wy0=
X-Google-Smtp-Source: AMrXdXs++sNuHqUOoSyqqneB+mzWpppVn+a3j8F11wwCSMf5OEMNBjzUd4wpvTw9gp8LCE0jyfcYHA==
X-Received: by 2002:a05:600c:1c23:b0:3db:b9f:f2e with SMTP id j35-20020a05600c1c2300b003db0b9f0f2emr13321794wms.14.1674235867778;
        Fri, 20 Jan 2023 09:31:07 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id p8-20020a5d4588000000b002bdfb97e029sm14413258wrq.19.2023.01.20.09.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 09:31:07 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/8] dt-bindings: display: simple-framebuffer: Support system memory framebuffers
Date:   Fri, 20 Jan 2023 18:30:56 +0100
Message-Id: <20230120173103.4002342-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230120173103.4002342-1-thierry.reding@gmail.com>
References: <20230120173103.4002342-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

In order to support framebuffers residing in system memory, allow the
memory-region property to override the framebuffer memory specification
in the "reg" property.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/display/simple-framebuffer.yaml      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
index dd64f70b5014..3e9857eb002e 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
@@ -63,6 +63,11 @@ properties:
   reg:
     description: Location and size of the framebuffer memory
 
+  memory-region:
+    maxItems: 1
+    description: Phandle to a node describing the memory to be used for the
+      framebuffer. If present, overrides the "reg" property (if one exists).
+
   clocks:
     description: List of clocks used by the framebuffer.
 
-- 
2.39.0

