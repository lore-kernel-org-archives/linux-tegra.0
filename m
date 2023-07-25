Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FCDC001E0
	for <linux-tegra@archiver.kernel.org>; Tue, 25 Jul 2023 10:16:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233460AbjGYKQ5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 25 Jul 2023 06:16:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232983AbjGYKQs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 25 Jul 2023 06:16:48 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E94591BE2
        for <linux-tegra@vger.kernel.org>; Tue, 25 Jul 2023 03:16:29 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-993d1f899d7so915886366b.2
        for <linux-tegra@vger.kernel.org>; Tue, 25 Jul 2023 03:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690280188; x=1690884988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qh91NfZ3U4C6egIsotV0MBnxWbLv8ptyWOp86GqgOLI=;
        b=y1Trlnb4gB4mMV4VUMtKvQCOE5d+e2N3T7I2rUWDAWcYxUHtecj9Bh8rgMshZVdikm
         1O/Ct4WQ3Xkr4rSfYFzsaZXtoNjQq5CK2Ct1OKaQ/rawtrP0juyFtU/X0c5uRCc6KAa4
         22j3tPkoy7NOi722CIRS2UkiWX7gQfC9zMQXnFQhE0BxTxscDLsUo/v/mzwPgIyAZutJ
         0ULT/0ordlkAJ+E7vp0EnJGosyjsm0/ETV52MAKTb+CjFU/QL5lf7soUEjBV9dpYjMiO
         qElMpzbIFwxB4rwZKJmBTf8ylm5Uya9Futfaf9Vd6OBFxLzyMfq4ZYvabARM0aHe7F4Y
         uB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690280188; x=1690884988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qh91NfZ3U4C6egIsotV0MBnxWbLv8ptyWOp86GqgOLI=;
        b=D4Wmu00lt2vYycNiLK9m3C83425P10rNh08esV3uI1t+XqPu6qYFgyT1ZoviXVxcTu
         nJ9R4e35bj6jzWVHD6g+yu76gKIqG30g6IafumZzCAQfvGBKsB2dCIlnqu4JSG594SSx
         aUcwIVBJoMY2y+Qb0o6Iyd3esrEVJAN1reD15KDq7ddw9ksywEQLJkMQTEPMj9xEbrDh
         p3vMpiZHy3ibaaDf2i8I7hvqWyzzNcvTuugDItvEuf0UPRaZTOCDNG1s8o0TEYTfBUNl
         dSvW5z8jLbRseKUYhtxq4K+GlCd3ZxRLJemkxgL0Ll11FwvIgLy2S6U9a1cMKoSl4cBR
         5vxQ==
X-Gm-Message-State: ABy/qLbYNL5pIc5iVAG0P5GXb93fEWqT4J/83QuXmRt/X7JXoKJ5ZK14
        rI1HRTXtp8raG4sqa6NrRhswjQ==
X-Google-Smtp-Source: APBJJlH33uo36eZTl/SakfzC2vCOa5Iq3OoPoR12EwPKr7KqHe676HH+tsYFj1dM6TCCidzg3zGjDA==
X-Received: by 2002:a17:906:15b:b0:993:e9b8:90f4 with SMTP id 27-20020a170906015b00b00993e9b890f4mr13107763ejh.8.1690280188528;
        Tue, 25 Jul 2023 03:16:28 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id l23-20020a1709065a9700b00997e00e78e6sm7944779ejq.112.2023.07.25.03.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 03:16:28 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot <sylvain.petinot@foss.st.com>,
        linux-tegra@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] media: dt-bindings: drop unneeded status from examples
Date:   Tue, 25 Jul 2023 12:16:25 +0200
Message-Id: <20230725101625.75162-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Example DTS should not have 'status' property.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml       | 1 -
 Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml   | 1 -
 2 files changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml b/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
index 369c48fd9bf9..a6b73498bc21 100644
--- a/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
+++ b/Documentation/devicetree/bindings/media/cec/nvidia,tegra114-cec.yaml
@@ -53,6 +53,5 @@ examples:
         interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&tegra_car TEGRA124_CLK_CEC>;
         clock-names = "cec";
-        status = "disabled";
         hdmi-phandle = <&hdmi>;
     };
diff --git a/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
index 19a39d753aad..b68141264c0e 100644
--- a/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml
@@ -143,7 +143,6 @@ examples:
         mipid02: csi2rx@14 {
             compatible = "st,st-mipid02";
             reg = <0x14>;
-            status = "okay";
             clocks = <&clk_ext_camera_12>;
             clock-names = "xclk";
             VDDE-supply = <&vdd>;
-- 
2.34.1

