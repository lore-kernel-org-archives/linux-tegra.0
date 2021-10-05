Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B02C43217
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Oct 2021 23:01:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 912BD6142A
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Oct 2021 23:01:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236928AbhJEXDB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Oct 2021 19:03:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236923AbhJEXDB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Oct 2021 19:03:01 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2D22C061749;
        Tue,  5 Oct 2021 16:01:09 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id m3so2432747lfu.2;
        Tue, 05 Oct 2021 16:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zJBbAysPZhEzfw+QShpgld2gMZtdI2/QGN8l/rJdoiM=;
        b=Y83NcGanEST0vssGF7O7AheANAOJW8E7BWD09gvmn7+CADyq8OYsb0WKftuXPB27E2
         hKbBZYeCbNk1Vy+2f9RX5KsPY7n+0m7+tOcJiCGDLu9Qk5NWqPM3k7MaMiGJKPxaqlZO
         lGWJ4k42xWSdfD7khr9ZeS6VWDTN7VyxrvA/ExoVZvKKfBF0ipmj3j9uei9eR3KvySIB
         kWgoyIUqve1tWSNrZQwXXGtifxPeLD+xvVrNMn8uqHOBFieJ8jqwFBPHfQEf0jb6M7Ey
         6uO7lyujAMUzqxjaU5/3l29OBYT9eZw9rebpG/1LWaqVsNzvdEFuFobZ/c/r06hdbAAE
         JHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zJBbAysPZhEzfw+QShpgld2gMZtdI2/QGN8l/rJdoiM=;
        b=c96OwkdAhZRll6O+fhlXItkTG/SZZXXj6VAEezJvCapWAQdF4KCrzNSz6EvudCciki
         YMuhfExpV4zEvXG4uvNsXJC8ztnPlecxFl1BNpPxEffDXQZIAxAEw9x5x1WQkanuACUx
         gH+VRwfXKmVx4PXLQwlX+0LD3WLuEN0OPnFaHVd165QzL4f5VynYloux/a5/y7kH2OlR
         fr0AI07sFgq4UFK8i2jmLRf5YQnu0ydQOIn1C7EEZzpqfxW1yd/S8lUXbCfPsV5H+4oG
         GI1DDYCVBzFuVGUCvZbBcRPNLOV4UzBexOGEUGfuUUvYxKsNpCLIrKlrNxlDeYjNsdUj
         GpRQ==
X-Gm-Message-State: AOAM531py8qtqjCaDBtw5LHwOXvjAU6WZwRGH3Q7OZcxUBv1SUEIHEsm
        h108FHOI6kArS+Iqst91Dj8=
X-Google-Smtp-Source: ABdhPJzP21fe8YZWDw1AFXGexgxBxukSozQibJfweTM5IJjnJJR2YLYS6VpQSgmciOPBKtoBhtZl3g==
X-Received: by 2002:a19:4802:: with SMTP id v2mr6128083lfa.49.1633474868209;
        Tue, 05 Oct 2021 16:01:08 -0700 (PDT)
Received: from localhost.localdomain (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.gmail.com with ESMTPSA id j18sm2101125lfu.84.2021.10.05.16.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 16:01:07 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v4 3/7] dt-bindings: memory: lpddr2: Add revision-id properties
Date:   Wed,  6 Oct 2021 02:00:05 +0300
Message-Id: <20211005230009.3635-4-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211005230009.3635-1-digetx@gmail.com>
References: <20211005230009.3635-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add optional revision-id standard LPDDR2 properties which will help to
identify memory chip.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../memory-controllers/ddr/jedec,lpddr2.yaml         | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
index d99ccad54938..01efb43c3425 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
@@ -24,6 +24,16 @@ properties:
           - enum:
               - jedec,lpddr2-nvm
 
+  revision-id1:
+    maximum: 255
+    description: |
+      Revision 1 value of SDRAM chip. Obtained from device datasheet.
+
+  revision-id2:
+    maximum: 255
+    description: |
+      Revision 2 value of SDRAM chip. Obtained from device datasheet.
+
   density:
     description: |
       Density in megabits of SDRAM chip. Obtained from device datasheet.
@@ -138,6 +148,8 @@ examples:
         compatible = "Elpida,ECB240ABACN", "jedec,lpddr2-s4";
         density = <2048>;
         io-width = <32>;
+        revision-id1 = <1>;
+        revision-id2 = <0>;
 
         tRPab-min-tck = <3>;
         tRCD-min-tck = <3>;
-- 
2.32.0

