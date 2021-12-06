Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11352C433F5
	for <linux-tegra@archiver.kernel.org>; Mon,  6 Dec 2021 16:10:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1389558AbhLFQOE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 6 Dec 2021 11:14:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1388161AbhLFQN1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 6 Dec 2021 11:13:27 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0AFBC08E9B9;
        Mon,  6 Dec 2021 07:56:01 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id d24so23546139wra.0;
        Mon, 06 Dec 2021 07:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mX/SbYbQRXeq1Xuw1o88w2bN5ZHKdhZTa60t7J17Fac=;
        b=S6Om9MvDnuVQ/9W5ez8t+9jOVzmiLEcxYJ/MqSekuyxnQmpJQ0JbpUiAtuwME/zVkv
         PsJlvFevKamOBzq5MFXAnHKz/kIIHA5SX8KKKUVnHPnoBIQ505D0mIBNM1KGarf2eNMP
         HvcTCD3LkdxNXig09WOxgE4uAkGXPrGUOaGqa9U42N8sKyPUEr0jnqUDnFmKUuCmTexM
         OaUYzb8ReWpbdH2gUouQtdUoQGnelMimenWvsPFyW77WrjSVSkAgOukaogcJmOOGzh4X
         dfYvL8VDzkEebeQgoNfic5pHcACMSpGNKQbdmgj0Lq0EqkvXMK1tBYQXOVV2WhuxouSX
         W3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mX/SbYbQRXeq1Xuw1o88w2bN5ZHKdhZTa60t7J17Fac=;
        b=7ZARuzljzZyUUO8qYTfp7Ig+DgDGWaJYFRQIxx0waUkle0B3kIMk5JqzmLZ1fjdQ26
         powkTj21z3KoIxl44hBiTnpRvwB9WZcLqm0RlWz5W0IFxlSJnXNqgO22zbUwU/suOtB9
         f0GpRVtvsdTOpVDR3fqWpwpLhhIXui4MCdl4bN4dUhOWsIWlAYOPfB2hg+RLjNetRH3O
         jWxqmMRzwjEPosjG/i/bXmlzDvr6QRUt3f1H3Eyg5mT3tUO5Mln6AdIwvIHNAthjpwvw
         +sqLHtNmlHJH1QPzUvSRzYxxSrffSuVlafGZTB3YMeoe41EBbc7bwfKQJQCgVSYd7tGM
         ZLIQ==
X-Gm-Message-State: AOAM532mh8A4eaRR0V7xvhzK1pjDBGDS7/yt/8MicNL2yM2ZqnI27UHN
        ta0Usa/XbQPEjpOA+3K2BGwwwcfkPAo=
X-Google-Smtp-Source: ABdhPJwiQ2rThzXmbh3xntV+tYVqHTC/PFOalvGAOKAApF6BDQnxpyLQnMQ3bDJvr13OhRc3GQ/JgQ==
X-Received: by 2002:a05:6000:181:: with SMTP id p1mr44754857wrx.292.1638806160478;
        Mon, 06 Dec 2021 07:56:00 -0800 (PST)
Received: from localhost (pd9e51d39.dip0.t-ipconnect.de. [217.229.29.57])
        by smtp.gmail.com with ESMTPSA id d7sm11383872wrw.87.2021.12.06.07.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Dec 2021 07:55:59 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Nagarjuna Kristam <nkristam@nvidia.com>,
        JC Kuo <jckuo@nvidia.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH] dt-bindings: usb: tegra-xudc: Document interconnects and iommus properties
Date:   Mon,  6 Dec 2021 16:55:59 +0100
Message-Id: <20211206155559.232550-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
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
2.33.1

