Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7EC6C433F5
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Oct 2022 12:50:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbiJGMuE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Oct 2022 08:50:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbiJGMuD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Oct 2022 08:50:03 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D005A23BF1;
        Fri,  7 Oct 2022 05:49:57 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id s30so6925633eds.1;
        Fri, 07 Oct 2022 05:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBRkFBzTwr0Layx8yRFn/SH2RZGgfSe2fyII0Qe3/MM=;
        b=VJIgYJ/IoReLEy1bc3Rcmnyf0KVESE1k2s6upBKNnWGK0/OkkoEV+CCQRxl/02qvwP
         cpy0B/rotWFufIw72HjRUcPVPOGjXaVFbtjN54MGJu5bjXP3p5Rhk6k2QARA16TwgFh5
         pnfrG/LATajYizVBkN+/cK0kOf7FuWDw4Gp3PpfrwxtKQBB/KWmQE/flEziV9X7SZkUr
         IQOV6ExJGxbJhd2A+E4qtgIp8B5eMtkgzbxZFQEU7TsrMGAAaLZZFqxm/iT21bHFF/yB
         ygp9BX6lCOVghc7yCie1sb8s7zi4yEJ1c33iGSpI6CfTARpgl0sObBO9jxLm1+TfsPev
         MFUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XBRkFBzTwr0Layx8yRFn/SH2RZGgfSe2fyII0Qe3/MM=;
        b=bgPnPg7mCOE8NGMy8VEBB2qw8dy4vooqS9e/Kmd0OkVcPUSuv83leNqtNpPbgs0qgJ
         i89mzW3JRQ0LM4qzi/pwUR7894MW9yfScn9GN8UVRFmpew0tx/wn5YgQXAlI5EzeQMBK
         xOW8OLAUeC6sx6uzlak7mHN+ev4nrPk+SRO3xzFeRMrIndbvzh9NPfv8UWdNlGvceB0C
         icQCFW4/QoTG4UuNxDZBLrg/+HFqpIJJUrRLLkmi5tCoIgWNPvFwL3Lg0fErwnRvHhcv
         DXeCJ8rt0uPGYsHlILKM8jg3VWx0C8qOCm8TVwMEcI/eGFcf+u6Z3t1Yn0LINy1xhaw4
         lMJA==
X-Gm-Message-State: ACrzQf1B0BIdYRSYPOpXZZOtPDDEwU8KaFGKIm8GJN2DNREoh9++hUqm
        HYl4n+mQg5a+tYt4zFFKWEU=
X-Google-Smtp-Source: AMsMyM68uGoAncrYPa2ZIbBvO4lb6WPzAUIT3HdjPZjERzYotAUTG3j5fbLxYS+OV9H8g0QARa9EOQ==
X-Received: by 2002:a05:6402:26d4:b0:451:280d:3533 with SMTP id x20-20020a05640226d400b00451280d3533mr4330565edd.316.1665146995668;
        Fri, 07 Oct 2022 05:49:55 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id k8-20020a17090632c800b007030c97ae62sm1153572ejk.191.2022.10.07.05.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 05:49:54 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v2 2/7] dt-bindings: display: simple-framebuffer: Document 32-bit BGR format
Date:   Fri,  7 Oct 2022 14:49:41 +0200
Message-Id: <20221007124946.406808-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221007124946.406808-1-thierry.reding@gmail.com>
References: <20221007124946.406808-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

This is a variant of the 32-bit RGB format where the red and blue
components are swapped.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/display/simple-framebuffer.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
index 3e9857eb002e..3c9f29e428a4 100644
--- a/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
+++ b/Documentation/devicetree/bindings/display/simple-framebuffer.yaml
@@ -99,6 +99,7 @@ properties:
         * `x1r5g5b5` - 16-bit pixels, d[14:10]=r, d[9:5]=g, d[4:0]=b
         * `x2r10g10b10` - 32-bit pixels, d[29:20]=r, d[19:10]=g, d[9:0]=b
         * `x8r8g8b8` - 32-bit pixels, d[23:16]=r, d[15:8]=g, d[7:0]=b
+        * `x8b8g8r8` - 32-bit pixels, d[23:16]=b, d[15:8]=g, d[7:0]=r
     enum:
       - a1r5g5b5
       - a2r10g10b10
@@ -110,6 +111,7 @@ properties:
       - x1r5g5b5
       - x2r10g10b10
       - x8r8g8b8
+      - x8b8g8r8
 
   display:
     $ref: /schemas/types.yaml#/definitions/phandle
-- 
2.37.3

