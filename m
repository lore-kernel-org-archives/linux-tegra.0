Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA8BCC433FE
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 22:49:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B279F6103D
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 22:49:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239761AbhJFWvK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Oct 2021 18:51:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239824AbhJFWtk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Oct 2021 18:49:40 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 671A1C061762;
        Wed,  6 Oct 2021 15:47:47 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id r1so4336234qta.12;
        Wed, 06 Oct 2021 15:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9bSDT4PncKUa8GX1h2NHuzdiEhd+wjlzkRZZUuWwZ9I=;
        b=JyKIn1MV6Jdo2pddeSlMq5cfLTvc9HotrStlBGS7/vJl5V+3Eshinz84bEg58BrfQX
         WD8PsjvopSrZI4vjAVEpssoT1ek+VFb2rJE5rj5Fw+Anh20JGhphEdaA7WZIqX0IzU/i
         /tVS9Bdq/meC76NPlmp2RNRnoVXgGSnKNIUxiLuX6SgJDJeJNf7DTJsdwSSGe+29d7eT
         BCTqAM4l3lFQvM0MknuR131N/YEokKsnYDqGwvyCjypn0dq4Mo/7ueGpueu1LOsE/DrD
         a0z5xDAKnP9WzjgNgtXTk6xw/ZnR1MkRFticXU6PsOZtBCPo9DWmcxgLaxUF02VzF+2Z
         8bWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9bSDT4PncKUa8GX1h2NHuzdiEhd+wjlzkRZZUuWwZ9I=;
        b=GmR3NH1Hb7PlBanwVbBz4fdM33gLTV2rBA9s4GvrX6pWDt8KqdYStyrdx1BBQZpGO+
         6/qccbewWCSiUj7NSxf6gbOvP3uss3yISBX9f4SthOwmBFeFVf5m1TEFs8BMshrU2Iw0
         UG2syFSf4YePviZJtDeJu155n5X9yYApuBSMvELjPi6tvLTKL2JlBXIMfnkGLxRUisa0
         abcstrNk0qu3c1YTHFqJebJPHN4TCAa2ZOzVkRUZEx2XfDmsDwpvVxqsAKp3jMCFSr+O
         YP+25sP258kMzM8MWmzO7eJ4NWVdCNZHYHT3fQkSNPidJq97Dc6pDagOnBDYmmlamtHA
         euTw==
X-Gm-Message-State: AOAM530n/p/5bm40OIDAecSzGA41XxbGwZLIr+xPs/0dWlUf4PqEfRMA
        vzBm8q3eqtCznkyerYhrJ2o=
X-Google-Smtp-Source: ABdhPJxUuCcumIofHgKkYaGn3ugclE05eMivx31brWMfp4xd6BucQRvE2P0hl6iN+7zCtMRC0qB7ow==
X-Received: by 2002:ac8:5ac7:: with SMTP id d7mr1024205qtd.382.1633560466623;
        Wed, 06 Oct 2021 15:47:46 -0700 (PDT)
Received: from localhost.localdomain (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.gmail.com with ESMTPSA id n11sm14738166qtk.92.2021.10.06.15.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 15:47:46 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v5 3/9] dt-bindings: memory: lpddr2: Add revision-id properties
Date:   Thu,  7 Oct 2021 01:46:53 +0300
Message-Id: <20211006224659.21434-4-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211006224659.21434-1-digetx@gmail.com>
References: <20211006224659.21434-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add optional revision-id standard LPDDR2 properties which will help to
identify memory chip.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../memory-controllers/ddr/jedec,lpddr2.yaml       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
index f931fe910ce5..fe573750577e 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
@@ -24,6 +24,18 @@ properties:
           - enum:
               - jedec,lpddr2-nvm
 
+  revision-id1:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 255
+    description: |
+      Revision 1 value of SDRAM chip. Obtained from device datasheet.
+
+  revision-id2:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maximum: 255
+    description: |
+      Revision 2 value of SDRAM chip. Obtained from device datasheet.
+
   density:
     $ref: /schemas/types.yaml#/definitions/uint32
     description: |
@@ -151,6 +163,8 @@ examples:
         compatible = "elpida,ECB240ABACN", "jedec,lpddr2-s4";
         density = <2048>;
         io-width = <32>;
+        revision-id1 = <1>;
+        revision-id2 = <0>;
 
         tRPab-min-tck = <3>;
         tRCD-min-tck = <3>;
-- 
2.32.0

