Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E40C761A6
	for <linux-tegra@archiver.kernel.org>; Fri, 31 Mar 2023 16:35:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232818AbjCaQfv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 31 Mar 2023 12:35:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231992AbjCaQf2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 31 Mar 2023 12:35:28 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D881A24AE5;
        Fri, 31 Mar 2023 09:32:03 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id eh3so91776769edb.11;
        Fri, 31 Mar 2023 09:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680280322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wd6c/aI1nNCWAWuVv83g/pkxtNRiXsOLwIe8KIX8H8=;
        b=K5ilFa4MdHlQTn/MqS8Pci1e6ALIGK8dcIZhNDLBN1RJRovCn7mQC0hHZPSmJMcoFM
         +CaeaHnVwddFWMhu7Nl5eccEUSecL501DbKd6hW1VYN+RqKp849dfWbCQCNBK/gUvpQJ
         /Cmr1/1Rxa5IKX1AEAvPBa1RjWNnJstNoktr9SX11upYBglY39zpTbHw0kME2jjVcQm6
         AmVAiEdu9FUi+t9sonJ55udIKAEB/87w9vsJx9PeGp1VLui/QO/SAQehS1Tw84PNozWy
         +NhV30iEwxhPgkPHDqiQ+th6IOiFq0HYnphN7ZeqvkiEgQlEKhb0+q9XFDafRkIDMBvz
         LDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680280322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7wd6c/aI1nNCWAWuVv83g/pkxtNRiXsOLwIe8KIX8H8=;
        b=iAKwT7Pec2Ntn6TE0WnsnylpMig+v8bzRXn3uLr7b90T0yHBZw/SMnwB7FP8DqGmzR
         zRofDN6/30Madch5+SXWVjTm5SerS6P3tncpuGXxPNwq0RtwZihkY8pCkenfy5fvhHHF
         0g9PGTwxj05+EL0SjxrgMaXweaybyB3UAoJYJAnF5YIyi6ErqYba7aJN2kk4gFq45cHq
         gXhSeXmqjKZ/nVLg+MnzD9OSWyO2GNisKyOnRe4E5k61Vt2lSwhURYqmKRpcNgelQ9ft
         t6/XhIobMG1Po3NjkvC/eTN/mcsG38GTBvfO3J6QfZeVoxJzjVqm4f7QqSUa8/lqaFLC
         N/Eg==
X-Gm-Message-State: AAQBX9fxd3lodunl8UaKK2tTqh5RMBxDPFK2X+5TPdQf7bYZ5BQBeWKE
        to2llAmlRqTAhUEjpsVkjoidEQ4fuwk=
X-Google-Smtp-Source: AKy350aYeXrXx+mJlIJZshNoq/qv5IMvaUzKHqd4QKaui6o8XGO3gCqgyxVw2g5X4a7wVkP4JJK7aQ==
X-Received: by 2002:a05:6402:12cc:b0:4f9:f07d:a978 with SMTP id k12-20020a05640212cc00b004f9f07da978mr25605313edx.5.1680280322310;
        Fri, 31 Mar 2023 09:32:02 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id e9-20020a50a689000000b004fd2a7aa1ecsm1244257edc.32.2023.03.31.09.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 09:32:01 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] dt-bindings: tegra: Document Jetson Orin Nano Developer Kit
Date:   Fri, 31 Mar 2023 18:31:58 +0200
Message-Id: <20230331163159.17145-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230331163159.17145-1-thierry.reding@gmail.com>
References: <20230331163159.17145-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Jetson Orin Nano Developer Kit pairs the Jetson Orin Nano devkit
module with the P3768 carrier board.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 60c151da5e06..585cf1355dd4 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -232,5 +232,10 @@ properties:
           - const: nvidia,p3768-0000+p3767-0000
           - const: nvidia,p3767-0000
           - const: nvidia,tegra234
+      - description: Jetson Orin Nano Developer Kit
+        items:
+          - const: nvidia,p3768-0000+p3767-0005
+          - const: nvidia,p3767-0005
+          - const: nvidia,tegra234
 
 additionalProperties: true
-- 
2.40.0

