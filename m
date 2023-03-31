Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF54C761A6
	for <linux-tegra@archiver.kernel.org>; Fri, 31 Mar 2023 16:33:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231757AbjCaQd0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 31 Mar 2023 12:33:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231445AbjCaQdJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 31 Mar 2023 12:33:09 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5A242782A;
        Fri, 31 Mar 2023 09:29:24 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id x3so91742749edb.10;
        Fri, 31 Mar 2023 09:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680280163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5i8lYDFBL6ifzmZtjCBChz3VDiLK42k1Z2vM0fJXiFU=;
        b=TOzuN5zqfC9otSflndy0BkwbQ6l4dpBYUvGZNOtubJe0JLmjREihW2JM1KVQwuN7qS
         mBSyrl0U269DLgIwXBMXSlCmOdw+6YXM5nbgLkqZKhuGxFpR6bPZkJvpsSH1yAvCPiQB
         0KcE/z6eRR4tCMzH44DZg82YXxeGjHxFXq5MWBGtfNP6XVdBqmIxxNCHrG+CYPszYWca
         lgIXW0kc5mZFAqMPSpp8VV3S1BZWDsBGp1j+ymZbtjnTxNtKIkklAoC/iPff+ToIy6k3
         bELaGU0NiAXa4K6rZ0V1VM3ZtKcegd9xp/3Hg//YRNFOwEuvWuO6eKbB79/fcL4kc92c
         opxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680280163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5i8lYDFBL6ifzmZtjCBChz3VDiLK42k1Z2vM0fJXiFU=;
        b=IqUo7XA1oRWXz65nGZdXIESlG4R6afz1D12x/j+w+HoULHYGNULppSgrZbAveWvBur
         M4LyJXtmsGWFIL9r92MCWSnlgHRFeSA1gQda5ITyyxBYjc5lPD00wUMJ6Ezm6yZ2Hyyj
         zm1eH1cv6HII1c44EVbIahqPMs76nwxjLwA+qzWUZoBI4XcRFuzifjM+YzwEUVBVBdrD
         Ehsuz/M/eOE3EBbwivplugaNFn148FU2z1zWP6ekiU9Wv5Iqh8Wa658d0lKd5j2ZLXPi
         Fo2m8juJiVOF46r3+p7EyIMcXZRmvNueRgxAEx7664olTgxGnkiiZFCsT+8GO4yma+IS
         9NxQ==
X-Gm-Message-State: AAQBX9cjMjUJ55fOXTatjFa4V7n/l4rJpngDZMauosi9bc0nOjHO3TPq
        pag/qLlo2q7VIM1Gf7XFn0YQy9W+/Jw=
X-Google-Smtp-Source: AKy350bASESoZ1huPDFQi9+MWtCZWBbX8OdUj2UE00dZ0qvgWZDfwtXESaCxpdkGwEGttT5yOZBKEA==
X-Received: by 2002:a17:906:ecf9:b0:92e:b1dd:cff2 with SMTP id qt25-20020a170906ecf900b0092eb1ddcff2mr23556341ejb.28.1680280163143;
        Fri, 31 Mar 2023 09:29:23 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id fi11-20020a170906da0b00b0093a0e5977e2sm1112023ejb.225.2023.03.31.09.29.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 09:29:22 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 2/4] dt-bindings: tegra: Document Jetson Orin NX reference platform
Date:   Fri, 31 Mar 2023 18:29:12 +0200
Message-Id: <20230331162914.16922-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230331162914.16922-1-thierry.reding@gmail.com>
References: <20230331162914.16922-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Document the combination of the P3768 carrier board with the P3767
(Jetson Orin NX) module.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 6c13d5e5719a..aa71236f93ce 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -217,5 +217,10 @@ properties:
         items:
           - const: nvidia,p3767-0000
           - const: nvidia,tegra234
+      - description: Jetson Orin NX Engineering Reference Developer Kit
+        items:
+          - const: nvidia,p3768-0000+p3767-0000
+          - const: nvidia,p3767-0000
+          - const: nvidia,tegra234
 
 additionalProperties: true
-- 
2.40.0

