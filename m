Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97395C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:36:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FDCC60F70
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:36:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234978AbhKLMiy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 07:38:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234894AbhKLMix (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 07:38:53 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BEDAC061766;
        Fri, 12 Nov 2021 04:36:02 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id i5so15296701wrb.2;
        Fri, 12 Nov 2021 04:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yqs+cqys/ir40BPfMGdEum8bHX5FxkNmVWBJ3EPKCqY=;
        b=ljtlTUH17GYjc6mibe/JX022skkPb4/bbHOr32h+XXdSBmwTIA8z6yqBDhacPdCJfQ
         F6RX00zZ4/cqX8mYCHLisbtQK+jScusXrW7qp7BWh9TA8RQT3D9xx9nNFD9Oysk1z6LN
         U/4pFRMWSwop63zXJUGIFWM6LVqWoatfRUqQyf+TvgkrZQTd7F7fQgju2UOkJwE17lnm
         uzDaQHsraiQ4TghQQekueJ1gypGIOF6gV5X4Fr4CSoR5hax3R3Wp7/Be3toDcODN4mQt
         qWj8tErtSmXbPGy3b8Wc10aHj+nzZX68XOWk172swnu/RAa8e4RTeniHgFYV7Q5c2h1m
         5MEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yqs+cqys/ir40BPfMGdEum8bHX5FxkNmVWBJ3EPKCqY=;
        b=m8+38226aDYnVNu+XehMcS8OTNZbSfLEqMMG+QIy495mGOj5CimpxjWCoPIgf+OsfY
         6TPBkMvOsSg+G43U1hvEIV9WZDGmFHCgOvXaM64/AXQx5hEufZujV1+43l3JuOey6HrT
         u8dE9sSyo2dJ2MOjl1mAtiJJf2XbDR+fiZPmeBs6K8Gy3UCPj/4dVzTVSr/0GjRWNXdg
         NOX1swOch9W1U9f+q8nAyGCuayN6CgLe9lLwvBA0RTdF0t/kdfKUnHhV/AmfZsRcfJYg
         SkyP6oqkHvWSLfFSRJhrVFeGUbDyodU7K4cA6h9Fzjx19P65S6WTKNnmlvOomrgyytsF
         v3DA==
X-Gm-Message-State: AOAM532BxTSfBlKSaJC6dm532Fghiy9uQQ/TwGptd+8m1dKT4pjMhUI2
        iyjWErGYYWr6Df2/UXuZAsNvXLVMmdhmzw==
X-Google-Smtp-Source: ABdhPJxLYsDk1LtGAmZcYmT1oUnGoSY9DxaSV4LgK9cJ44GEnlwGRTugI1OqVpkOWS/Wp8seeCMEFA==
X-Received: by 2002:adf:f907:: with SMTP id b7mr18779542wrr.5.1636720561266;
        Fri, 12 Nov 2021 04:36:01 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id p2sm12237673wmq.23.2021.11.12.04.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:36:00 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 04/11] dt-bindings: sram: Document NVIDIA Tegra SYSRAM
Date:   Fri, 12 Nov 2021 13:35:35 +0100
Message-Id: <20211112123542.3680629-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112123542.3680629-1-thierry.reding@gmail.com>
References: <20211112123542.3680629-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Tegra SoCs have extra on-chip RAM that can be used for inter-processor
communication. Tegra186 and later make use of it to establish a two-way
channel between the CCPLEX and BPMP. Add missing compatible strings for
Tegra186 and Tegra194 as well as a new compatible string for Tegra234.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index d4e418b6a1c1..668a9a41a775 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -31,6 +31,9 @@ properties:
         - amlogic,meson-gxbb-sram
         - arm,juno-sram-ns
         - atmel,sama5d2-securam
+        - nvidia,tegra186-sysram
+        - nvidia,tegra194-sysram
+        - nvidia,tegra234-sysram
         - qcom,rpm-msg-ram
         - rockchip,rk3288-pmu-sram
 
-- 
2.33.1

