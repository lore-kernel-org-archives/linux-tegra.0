Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B54C433FE
	for <linux-tegra@archiver.kernel.org>; Sun,  3 Oct 2021 00:35:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F27D361AF7
	for <linux-tegra@archiver.kernel.org>; Sun,  3 Oct 2021 00:35:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234333AbhJCAh0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 2 Oct 2021 20:37:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234329AbhJCAh0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 2 Oct 2021 20:37:26 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86451C0613EC;
        Sat,  2 Oct 2021 17:35:39 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id d6so22276900wrc.11;
        Sat, 02 Oct 2021 17:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=06X1Vk3GxFqTpRd48mMK6pMRz0jC31eJOzUfk6a0210=;
        b=ZXNw8fvKxZq71+q02IvAUKhST+IiJ3INpMDzgfg54m8TAqh9a0/8wNdbVOZBVP19ME
         9yjf4ZjA6FqatoXueFn7SRSsNAOJ97LWy6fcclZbJcAbP/iMD0afRwr2ovG5WpbZgr4f
         bJzD6ViyfA0BcUeDwJ559OVl6KtO+O/S+DoTx3m4gogF7KND00uc1QI482HUDnI5dcog
         D+06fIsv7tp82KQ74A2bd1YYsiy0owj7AT2oJ3HgNPfSXkGHz8VN0WzT4vPa1GDJmPQW
         hGwydk2fyMBoXXMqo22i+ClVMWTnU3jFN9K6smnim5OUawJAlSmoar59gyI8CNtDx6Vw
         2sQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=06X1Vk3GxFqTpRd48mMK6pMRz0jC31eJOzUfk6a0210=;
        b=LHit1BFviZF0G2tz7PBPSgnjbxnsmjxEFmz9doxhFjAsFW5+5d6UaWWkHQWF/6C/so
         f+tImMo2Bggl5jyP71GJsNJoRRNuo3It8xYzNfPE7CkbgzNaZISwFmbGcNyCoC+AOOCL
         Zzgfa0ZKnj8kNGkwnyUXuhFHMGLoFcp0I7HIYP6dkzQdxQdO6pkVUqffOyLnNApbGEXM
         /TXoFMQJT0CHPAq7DiwR/Dubrxgwbe/hFJNhwAuBjYvIn056t9lBfjWn5XkTrBzO+pQn
         IhKUgVJmKABGtNQx9ZMj4wvw5J8NaYFUQgeBbmdAwnMLqsLxTk/avHlg2uSXc1Lex8jF
         +pew==
X-Gm-Message-State: AOAM530WLTiSSyre88YA7gT+E3cKL86n54uFoTzbC+tG9xY8FU1Goigu
        6UAjniLvH1hZDhS4rEWtLHo=
X-Google-Smtp-Source: ABdhPJxsN4vaEYden/l22P6h9eKf53Ia1JHhW3mNFZziqZBl4X7NnaVs1XPHqsk23xzm6zPr3MzZIg==
X-Received: by 2002:a5d:564f:: with SMTP id j15mr5614321wrw.336.1633221338210;
        Sat, 02 Oct 2021 17:35:38 -0700 (PDT)
Received: from localhost.localdomain (94-29-54-195.dynamic.spd-mgts.ru. [94.29.54.195])
        by smtp.gmail.com with ESMTPSA id m21sm10981445wmq.37.2021.10.02.17.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 17:35:38 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v2 2/4] dt-bindings: memory: tegra20: emc: Document new LPDDR2 sub-node
Date:   Sun,  3 Oct 2021 03:35:07 +0300
Message-Id: <20211003003509.28241-3-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211003003509.28241-1-digetx@gmail.com>
References: <20211003003509.28241-1-digetx@gmail.com>
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
index cac6842dc8f1..2741333591bf 100644
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
+            lpddr2-config {
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

