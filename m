Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFADC433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 16:54:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241426AbhLIQ5f (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 11:57:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241425AbhLIQ52 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 11:57:28 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CB7CC061353;
        Thu,  9 Dec 2021 08:53:54 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id p18so4699791wmq.5;
        Thu, 09 Dec 2021 08:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eywtqqKgEuneXODvjfADOggVoqzsqrYNtKANssdIQ94=;
        b=lBRxDks09qjqi8+8Rdtd+cWauUcVMKblgJY2hoXEgVVKRStFzuye3gbOayfMPCTyX3
         t9npRe896zrEytzGVCW7K6Nkg80pXrqyjdmQG1sALZ9aw+6+VNZtcZ2ddr8ovNATkxAQ
         /Kln5N43MA5MNCcUZETsY/+LebMme0jHnuWHYqMo89HrhLHB9TXrx3sPv4uNIFEnPBVH
         s0bOleO+pyz9s32uFzN+h+gVke5ZtW9zPEK3YTbz8zyFXPEcMt9bb0vohMfFcafSI1ap
         lGkqbXVrH/4a98jDw7i1XAxz0xU6f5cpzn1beD28exd73HY2XJfmJTNg3SDcaFGkdGnm
         H6mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eywtqqKgEuneXODvjfADOggVoqzsqrYNtKANssdIQ94=;
        b=HWUvbcox+pEKv2UKtRBxIQIMN8jwE7a8Q7X7zOL1p0CYMZcVlg7smqjnNjUBR1Sz8K
         5avjgHBzcapDUm++bj+ZfklEuMdTT1UElYmNRF2M+6JtpA7Seo1fei7kAgJNUeJ1zQ/0
         xg5ExhLkkdcUYYGlll8raYZvuK/l7IcFa/ORuy9xc8m2o131MO4/CPnkosetb7Kz2FBd
         oBSzeIy6L1tZa6hMjiCDLCKEiCsrzG/pNwHM69RBKsK8TWp3OHeGgbboSbMtayxTkVJT
         bT7a79fqOYUap2P5oTAeyYbOtwIT0Q/zre/4DffOimDmvdoUxNQo+IQ91AI0h4J7xDn8
         St2g==
X-Gm-Message-State: AOAM532tIo8oLt5PFV6LL7Y59oaKWtphbgdQPBr9m52A39xZTBBO/ao+
        2wjkYXBfPrKMEvsq3zAxNHI=
X-Google-Smtp-Source: ABdhPJypZzNkEHPKJwVfoQNCzhdE2wDrwf0k5S+K14WmQV7sGIeCUwNbLOcNu+D1qq+t/H0Ig7Np/Q==
X-Received: by 2002:a05:600c:1e26:: with SMTP id ay38mr8684698wmb.14.1639068833120;
        Thu, 09 Dec 2021 08:53:53 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id v15sm242046wro.35.2021.12.09.08.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 08:53:52 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <peter.chen@freescale.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 4/4] dt-bindings: usb: tegra-xudc: Document interconnects and iommus properties
Date:   Thu,  9 Dec 2021 17:53:39 +0100
Message-Id: <20211209165339.614498-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209165339.614498-1-thierry.reding@gmail.com>
References: <20211209165339.614498-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add the interconnects, interconnect-names and iommus properties to the
device tree bindings for the Tegra XUDC controller. These are used to
describe the device's paths to and from memory.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
index 8428415896ce..a39c76b89484 100644
--- a/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
+++ b/Documentation/devicetree/bindings/usb/nvidia,tegra-xudc.yaml
@@ -59,6 +59,19 @@ properties:
       - const: fs_src
       - const: hs_src
 
+  interconnects:
+    items:
+      - description: memory read client
+      - description: memory write client
+
+  interconnect-names:
+    items:
+      - const: dma-mem # read
+      - const: write
+
+  iommus:
+    maxItems: 1
+
   power-domains:
     items:
       - description: XUSBB(device) power-domain
-- 
2.34.1

