Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA08C433F5
	for <linux-tegra@archiver.kernel.org>; Sun,  3 Oct 2021 01:32:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E18961AF7
	for <linux-tegra@archiver.kernel.org>; Sun,  3 Oct 2021 01:32:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbhJCBek (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 2 Oct 2021 21:34:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbhJCBeh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Oct 2021 21:34:37 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2047DC0613F0;
        Sat,  2 Oct 2021 18:32:51 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id d26so22537316wrb.6;
        Sat, 02 Oct 2021 18:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Tin+7T2jl9OMjVKi2OjQpwV1pcsbe+zQe5AodSlswME=;
        b=oZwfc/6QmL2+ZTBrJezdQVNMqY5j1PvUnSFKtQfDBcOaYgilo1DFGA7g5KMdlWZeoE
         WdsDmT8AM3b/127EW1/Swzv9GSIVHLNzA6alQe2YJVXST8zwKiw0/nX7nD5gh6A8GD4t
         7/oYR6dpMvjzjbOEurDsv1xwb6xA9CL0hfdxNfsAn8Xp9N/JKfhdsSduDSrbRIAzcGp8
         /h53YiUL+U3Hk+RypnNhgT+LsIzOaFQvR+8RjPkSVFgr7GgfV9LCGzSwjlvs8j4hAYqa
         OALx5/Jzvt+j3DoQuzJ7iy3Ivgld9uuV+FAT88vUM+mCYY1iR4nwH87BD1Yzx8enr3+L
         kFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Tin+7T2jl9OMjVKi2OjQpwV1pcsbe+zQe5AodSlswME=;
        b=ThDMCoK/xSPPwEtkb8ULo4hoKyilacIYtQY2HWTaZZELTCrjge82oDBDBM41QKUJOE
         ZvHNhI5+DkqeaVuPHKzprJnvgO0h1C+Z7LZ/m9rSs9Ozv5tRHZxW4U7hzZ4hfKii7q4D
         GoTUT0laEQ7VUwVtfw5hS8uY7m5CN5bH6z7V2JX5lAz+UUdJyuFNrX9upy0+zWmnZH/V
         DisPQL+UolRAtjq3+t+Wkr2y4/eoCam0Kwu6r6sQGWBWceLq398DIWuo8Fr+lRRRsG4o
         RmlVMVQqiVBXOsMPW422Ox8A8wUlhIf93DiopPrug/DiTGoG5HTmG/uQeuj18iK2M/Qt
         lLaQ==
X-Gm-Message-State: AOAM530/Bq/bFvt0s/plc05FVUDIgLKfZX2n3ioW/WvPlLuNfuWxxYsu
        eEo9RjpzfkwlUwg1PTe+PcM=
X-Google-Smtp-Source: ABdhPJy9+8LRno+lHUv8uvHjSGJ3w3vNm9oEdXLaswGjWfYWub96cHRvwkbXrfyKo+iN9x3Bdw0Ecw==
X-Received: by 2002:a05:6000:144d:: with SMTP id v13mr5784514wrx.303.1633224769794;
        Sat, 02 Oct 2021 18:32:49 -0700 (PDT)
Received: from localhost.localdomain (94-29-54-195.dynamic.spd-mgts.ru. [94.29.54.195])
        by smtp.gmail.com with ESMTPSA id 20sm12481926wme.46.2021.10.02.18.32.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 18:32:49 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 2/4] dt-bindings: memory: tegra20: emc: Document new LPDDR2 sub-node
Date:   Sun,  3 Oct 2021 04:32:33 +0300
Message-Id: <20211003013235.2357-3-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211003013235.2357-1-digetx@gmail.com>
References: <20211003013235.2357-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Some Tegra20 boards don't have RAM code stored in NVMEM, which is used for
the memory chip identification and the identity information should be read
out from LPDDR2 chip in this case. Document new sub-node containing generic
LPDDR2 properties that will be used for the memory chip identification if
RAM code isn't available. The identification is done by reading out memory
configuration values from generic LPDDR2 mode registers of SDRAM chip and
comparing them with the values of device-tree sub-node's.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../memory-controllers/nvidia,tegra20-emc.yaml  | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
index cac6842dc8f1..65f7c3898ac4 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
@@ -164,13 +164,14 @@ patternProperties:
       "#size-cells":
         const: 0
 
+      lpddr2-configuration:
+        $ref: "jedec,lpddr2.yaml#"
+        type: object
+
     patternProperties:
       "^emc-table@[0-9]+$":
         $ref: "#/$defs/emc-table"
 
-    required:
-      - nvidia,ram-code
-
     additionalProperties: false
 
 required:
@@ -186,6 +187,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/memory/lpddr2.h>
+
     external-memory-controller@7000f400 {
         compatible = "nvidia,tegra20-emc";
         reg = <0x7000f400 0x400>;
@@ -226,5 +229,13 @@ examples:
                         0x007fe010 0x00001414 0x00000000 0x00000000
                         0x00000000 0x00000000 0x00000000 0x00000000>;
             };
+
+            lpddr2-configuration {
+                jedec,lpddr2-manufacturer-id = <LPDDR2_MANID_ELPIDA>;
+                jedec,lpddr2-revision-id1 = <1>;
+                jedec,lpddr2-density-mbits = <2048>;
+                jedec,lpddr2-io-width-bits = <16>;
+                jedec,lpddr2-type = <LPDDR2_TYPE_S4>;
+            };
         };
     };
-- 
2.32.0

