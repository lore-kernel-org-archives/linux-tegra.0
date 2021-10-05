Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7097C433EF
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Oct 2021 23:02:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF656611C3
	for <linux-tegra@archiver.kernel.org>; Tue,  5 Oct 2021 23:02:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236850AbhJEXEB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 5 Oct 2021 19:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236941AbhJEXDD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 5 Oct 2021 19:03:03 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B980BC06174E;
        Tue,  5 Oct 2021 16:01:11 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id n8so2329737lfk.6;
        Tue, 05 Oct 2021 16:01:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZazjXyZEVxAOGCWfu+WjAJm1Kzn5mq9JVmnxHrZ+lKg=;
        b=K93QjFCEDw5vsDQbnfutSS22rGejQGc1BkSHFS240RvVmorZMzD0s188NiKgV4F9Zg
         jk4+dh+F7cd9jkR9w7CUgXwTI/EXDzhfgeFT+JgU93pwpz95Ueg+OzbzARrnII5zjFkD
         B25lz+BD4xjDPEpKf6Jr5pkZKXOCg4/lD3sfNelIuEpNilQAbskyDbwonktN8f++BIC+
         mine29+yI36rV3Uztgjk860mFUUQL/0bNAgrq6Exsr67eOZOeAMM4KVoKeOUDLxaCgwK
         sdjeId/vntLusF0fxkLhbK7TqmJKbHOF0pTfwFl5JqyGq6/8H1jTMPG6ZhPDditw1Pdg
         TL8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZazjXyZEVxAOGCWfu+WjAJm1Kzn5mq9JVmnxHrZ+lKg=;
        b=bU2aUDRApQLR6bB8viL9CSHQ7qonGK2udhnSJOBmqB98DhXE/81A2gDR18hKeEe15a
         iGVRr1rE2qYXGxAAZ88gLS1n5S3xobM+5dwvcBqrpIcdBiqmsEbzujY24Fzw805F/rXt
         z9I3L/n0ibxocpvhbfylZF5XtvOl390Edvmelh1vTYqNrwJfq3DUVKYHPJVDltGfEZns
         RPJw/xLJQ3iVOD/qepaWWVzWuqR3YzZ4Ov5qOlHp71kdYS+Tim80aVgujd8eFOnuaJkJ
         iKDMvleNfjqS19ciAxur6tT+hpdRH9+s5akEmxpyM1/5b2PmYN59eAEf76/aAPk4oDIJ
         sQ+g==
X-Gm-Message-State: AOAM532qj2mIZ8PdmG7QPVzfQ4MyMXt6X6sc8WA40plF+n5/q1Qe6KSf
        96zLlvAgSgoQjHNsLGBfEt0=
X-Google-Smtp-Source: ABdhPJzQt0fI/8QXYDuIuMYPmHlU8ABtaHpXR/iC7njP9IudxCEfMBPzpdaPDsWa74vK2CPNWpV4Tw==
X-Received: by 2002:a2e:1645:: with SMTP id 5mr23738842ljw.123.1633474870085;
        Tue, 05 Oct 2021 16:01:10 -0700 (PDT)
Received: from localhost.localdomain (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.gmail.com with ESMTPSA id j18sm2101125lfu.84.2021.10.05.16.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 16:01:09 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v4 5/7] dt-bindings: memory: tegra20: emc: Document new LPDDR2 sub-node
Date:   Wed,  6 Oct 2021 02:00:07 +0300
Message-Id: <20211005230009.3635-6-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211005230009.3635-1-digetx@gmail.com>
References: <20211005230009.3635-1-digetx@gmail.com>
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
comparing them with the values of device-tree 'lpddr2' sub-node.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../nvidia,tegra20-emc.yaml                   | 23 +++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
index cac6842dc8f1..2fa44951cfde 100644
--- a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
@@ -164,12 +164,20 @@ patternProperties:
       "#size-cells":
         const: 0
 
+      lpddr2:
+        $ref: "ddr/jedec,lpddr2.yaml#"
+        type: object
+
     patternProperties:
       "^emc-table@[0-9]+$":
         $ref: "#/$defs/emc-table"
 
-    required:
-      - nvidia,ram-code
+    oneOf:
+      - required:
+          - nvidia,ram-code
+
+      - required:
+          - lpddr2
 
     additionalProperties: false
 
@@ -227,4 +235,15 @@ examples:
                         0x00000000 0x00000000 0x00000000 0x00000000>;
             };
         };
+
+        emc-tables@1 {
+            reg = <1>;
+
+            lpddr2 {
+                compatible = "elpida,B8132B2PB-6D-F", "jedec,lpddr2-s4";
+                revision-id1 = <1>;
+                density = <2048>;
+                io-width = <16>;
+            };
+        };
     };
-- 
2.32.0

