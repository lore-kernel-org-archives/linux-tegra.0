Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2597AC001DC
	for <linux-tegra@archiver.kernel.org>; Wed, 26 Jul 2023 18:25:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjGZSZj (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 26 Jul 2023 14:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbjGZSZi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Jul 2023 14:25:38 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A63511FC4
        for <linux-tegra@vger.kernel.org>; Wed, 26 Jul 2023 11:25:37 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-98e39784a85so285753466b.1
        for <linux-tegra@vger.kernel.org>; Wed, 26 Jul 2023 11:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690395936; x=1691000736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TjbPDKd6tzYf+dxp22VkRgDO+M84x0+s26OUcGchntc=;
        b=q7GL5EWpYYe9FnUMYRvQV6bS22/oNGVswzDAJRamZh09+bNycByOWPlk1rdK7D9xI1
         IU/fKIiYMNf6YVUynEcfhOyIxbz6xUesjgK28d73TWzJe8+RuPJ8IrGtYUcsdr2tMZKp
         giiO6NqrMLGE9O9blhBH6D3AO+6PZuF52tDZHlWXNdSk9mVsIwsjcYFoE5Eob3zW9+YJ
         aAXv3KPmpnzdpKAP1z93LrTPQ89J+aHUjtSrmDhEiPYO0i55N3s852RSJFEIiSLkiyJX
         w8Tk8qn/YpmLB6tN/3JyBFKzM7TxiYibQMDdrgyIwsKUCYwInQARvy8F98GgOzXaIyU5
         b4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690395936; x=1691000736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TjbPDKd6tzYf+dxp22VkRgDO+M84x0+s26OUcGchntc=;
        b=QqE/WqPu60ef247Vqlm95JwNJQt0nEpWmxjz6r1gvbrkzp7x+gWWVov7sjgC+IF3/0
         5bwtoP+ZdzzK20gVShvGQIuEyv7tu+FQqP4dbQDzWEHEzTjROBuKfg/q2taVvlX08Ci+
         5XKU1RuICbRCG3QiRMeXkkTy2BVQWG71+YShbJA3Dm5EsUZ9mOHfUR0jaU/YGBKbOdN5
         m+QaUHIFzafadMIyVWjbtpedtxCuB8y6jVvzd5gjMnhfGpArrBWj4jz/o9aB81EdgSni
         86X6MwiMUIBKSF6rD+woxoykEOzJunYDsR4UgvIje7UtA7FNQ+gnSDOkvHpSwwviYLLB
         d8ug==
X-Gm-Message-State: ABy/qLadGUvTA7L1RwghYnalQVzmHvnkhJAvp35ZUvgpQwzJabU9sYxa
        /qpyDF9/iZM4lyTh3FRYNks=
X-Google-Smtp-Source: APBJJlEn6b2p15kCflljVkhG4f2jQ81ji7qoxGHQbPafcHEg5j898T9PnFKPHv7SFff2FQz8LAM2Dg==
X-Received: by 2002:a17:907:7887:b0:98e:2413:952f with SMTP id ku7-20020a170907788700b0098e2413952fmr338297ejc.18.1690395935685;
        Wed, 26 Jul 2023 11:25:35 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id b19-20020a170906039300b0099364d9f0e2sm9940553eja.98.2023.07.26.11.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 11:25:35 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH] arm64: tegra: Add blank lines for better readability
Date:   Wed, 26 Jul 2023 20:25:32 +0200
Message-ID: <20230726182532.2291302-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add a few blank lines to visually separate blocks in the Jetson AGX Orin
device tree.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts    | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index ba0c1f03c3b5..201a7a8a01cd 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -181,6 +181,7 @@ usb2-0 {
 					mode = "otg";
 					usb-role-switch;
 					status = "okay";
+
 					port {
 						hs_typec_p1: endpoint {
 							remote-endpoint = <&hs_ucsi_ccg_p1>;
@@ -191,6 +192,7 @@ hs_typec_p1: endpoint {
 				usb2-1 {
 					mode = "host";
 					status = "okay";
+
 					port {
 						hs_typec_p0: endpoint {
 							remote-endpoint = <&hs_ucsi_ccg_p0>;
@@ -211,6 +213,7 @@ usb2-3 {
 				usb3-0 {
 					nvidia,usb2-companion = <1>;
 					status = "okay";
+
 					port {
 						ss_typec_p0: endpoint {
 							remote-endpoint = <&ss_ucsi_ccg_p0>;
@@ -221,6 +224,7 @@ ss_typec_p0: endpoint {
 				usb3-1 {
 					nvidia,usb2-companion = <0>;
 					status = "okay";
+
 					port {
 						ss_typec_p1: endpoint {
 							remote-endpoint = <&ss_ucsi_ccg_p1>;
@@ -302,6 +306,7 @@ ports {
 
 						port@0 {
 							reg = <0>;
+
 							hs_ucsi_ccg_p0: endpoint {
 								remote-endpoint = <&hs_typec_p0>;
 							};
@@ -309,6 +314,7 @@ hs_ucsi_ccg_p0: endpoint {
 
 						port@1 {
 							reg = <1>;
+
 							ss_ucsi_ccg_p0: endpoint {
 								remote-endpoint = <&ss_typec_p0>;
 							};
@@ -328,6 +334,7 @@ ports {
 
 						port@0 {
 							reg = <0>;
+
 							hs_ucsi_ccg_p1: endpoint {
 								remote-endpoint = <&hs_typec_p1>;
 							};
@@ -335,6 +342,7 @@ hs_ucsi_ccg_p1: endpoint {
 
 						port@1 {
 							reg = <1>;
+
 							ss_ucsi_ccg_p1: endpoint {
 								remote-endpoint = <&ss_typec_p1>;
 							};
-- 
2.41.0

