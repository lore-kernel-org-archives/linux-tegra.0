Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A826C77B6E
	for <linux-tegra@archiver.kernel.org>; Fri, 31 Mar 2023 16:35:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232035AbjCaQfw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 31 Mar 2023 12:35:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231950AbjCaQf2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 31 Mar 2023 12:35:28 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E126A25577;
        Fri, 31 Mar 2023 09:32:02 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id i5so92053266eda.0;
        Fri, 31 Mar 2023 09:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680280321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pSQIKLKXiF7LRmMa7I/PipsMIQk9s4rxRc1/n8fch/g=;
        b=MAZIIJC61MnAcCkhSAozC0jndvjPSx8WuhnIn3xnnOxXsUvIQnYQVErZ9jIBeCExET
         XVbE5Pc8QiJQZ9VG9UV2nrOvAPFhDUhvQ6jj1GDwWBdV0TxuNcO8tCYnbzF1rVDvbcjx
         449iW4yo9oiusLNmGeanQpyleyOJn+Y/2EmzeK3OWURdT32WB8r41dwFmGmbnBeKjPi2
         VESvYMPw9tIh4FOeFp//Lay+3hAJzBzNfEkDKhEPITprJspVIbElQTkXH4Fi78Si6e3B
         jom3FK3YgehACv6RBwpeFDidWa0tPNBWwxIKIzurqA/0WAgQ0mPjOfG4IMoWJbJKQOPz
         4rXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680280321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pSQIKLKXiF7LRmMa7I/PipsMIQk9s4rxRc1/n8fch/g=;
        b=IkySNTVfUrtAbBymXB5X8p3SjQ6XVNdJuAKVzxP9cOjw9Tnv5UBkvGf7GiKM1GVJsv
         L7n43jBEgQkHeRI+ArxbzjiK7DhVKp3DTDJ9Ocb2Wame+fwh7+2UeLW5fpDLllrIJ2XU
         gPl9ct1BV+puzfCO6daFbXs2b+ZKhJH/08fsvnq6cQe710vjHYWpofeRYzMhBT/uqcHF
         8SgHs/vbqhw1NF2I9kv0OHHINog5rboDIGNlVNwzBCp4JRhgIP5dNJfgFct4uOh62bZP
         DFUbE5hfMYPvm1RIal9JhQ+PyOXfGgrqpytXzyPkNS0hMwT9sdbqrQib5asdclEPzP1g
         X7Ug==
X-Gm-Message-State: AAQBX9fEqfHnrh35qIb9MUkPVA0y1qFWhGd3QKg2jG10pqNqxWpPv7ZB
        BsxYM7iiUkBaCEJ9lGq4Ps4=
X-Google-Smtp-Source: AKy350arCGnQu7/WifGjz4ey+VQ4rV3YVC/QibabcRim7stpZFsrc97KOfZxc24vl84rrBhlG16CRQ==
X-Received: by 2002:a05:6402:1486:b0:501:cced:9c6c with SMTP id e6-20020a056402148600b00501cced9c6cmr25678100edv.7.1680280321424;
        Fri, 31 Mar 2023 09:32:01 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id i5-20020a50d745000000b004fa19f5ba99sm1227871edj.79.2023.03.31.09.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 09:32:01 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/4] dt-bindings: tegra: Document Jetson Orin Nano
Date:   Fri, 31 Mar 2023 18:31:57 +0200
Message-Id: <20230331163159.17145-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230331163159.17145-1-thierry.reding@gmail.com>
References: <20230331163159.17145-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Jetson Orin Nano is the little sibling of the Jetson Orin NX.
Document the corresponding compatible strings for these devices.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 61e638c9cad7..60c151da5e06 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -220,6 +220,13 @@ properties:
               - nvidia,p3767-0001
               - nvidia,p3767-0002
           - const: nvidia,tegra234
+      - description: Jetson Orin Nano
+        items:
+          - enum:
+              - nvidia,p3767-0003
+              - nvidia,p3767-0004
+              - nvidia,p3767-0005
+          - const: nvidia,tegra234
       - description: Jetson Orin NX Engineering Reference Developer Kit
         items:
           - const: nvidia,p3768-0000+p3767-0000
-- 
2.40.0

