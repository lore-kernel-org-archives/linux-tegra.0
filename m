Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01AAEC433FE
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:35:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243097AbhLIRio (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:38:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237463AbhLIRin (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:38:43 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FC99C061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:35:09 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id m25-20020a7bcb99000000b0033aa12cdd33so5683025wmi.1
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:35:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NbRhaCQCk4UNKvSuIQO6aG2uxx99teC5GJ2vdqanZdM=;
        b=QjrFJzh6DISrzghuiIa9KwB2majod9OOlxXKtaz2Ej3iemj0ciIyULk7CsgYf8Gt04
         Cc0SACgYKpeh0ImmGFTnmwJyY4DtQYWWUT/JMdT/HDJ/OyN1fLCCUbkqeQFE+JjvTbIP
         fZZ212BO1XgNNmslhjbyWfjRglKm3d0I6cEGjpKTRDVWOM5bbh6mGRu8TL1Rh1GwXhF1
         /cnCyKxRk515G66D3tSOWQz6UNbUJ8q9AVoHCn0367jOKWazJD+zAXqx22KzZTZu/p/S
         gXrlOJ9WuKJoTxTP2qo/FUd103UG0lal91iYnVN6Yc0PXrq4Gtu0klzZB5kJWEWJI5M+
         /KJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NbRhaCQCk4UNKvSuIQO6aG2uxx99teC5GJ2vdqanZdM=;
        b=k3m5sRw+Dx7P7XY13PcuBtRtErv8xksZdCQWfYrRADQplQR4q/n8JJo/8Yqyq2jnp/
         PmMGerxllArdd4wPn2ZPPzZtKIyvWY52KaKOz/+c+5HNGJj3dSa+xhnGtGnWw9upoSCs
         wvi+H3GXklWbntBfVRlrH5zSjeL0LDWjdJY+nMFoUC0pbgAsNRNdqF4cDVTbKrSqzS7a
         Oxc9U3Op4srb6NcVbLsZmbZgwS+ZB4mTHMH/W5DW6P43C0vxyOYbl4xjrYXrygq1bmJ/
         3Tq94O+QiL9glX8JAZCIqtafs8XcrUg7ySyk+fk4oGic8OasxGSEExMx9GDA+WPP3+JV
         sLpw==
X-Gm-Message-State: AOAM5317gDIgxqgoOl9XYfc1q79o4DfmGy8p3jdfhB27NTBrmC6zYfgM
        R0SDcn6HBodt94ZekC48Mk8=
X-Google-Smtp-Source: ABdhPJxYw2WAta7cX9IjLH4knHwvUmIb3BwP/Cxxtl71R/0v6b+2040rJrTChNDTqRekX553DsXYjA==
X-Received: by 2002:a05:600c:210a:: with SMTP id u10mr8802331wml.33.1639071308180;
        Thu, 09 Dec 2021 09:35:08 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id c10sm327969wrb.81.2021.12.09.09.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:35:07 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 25/25] ARM: tegra: Fix I2C mux reset GPIO reference on Cardhu
Date:   Thu,  9 Dec 2021 18:33:56 +0100
Message-Id: <20211209173356.618460-26-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209173356.618460-1-thierry.reding@gmail.com>
References: <20211209173356.618460-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Use the correct "reset-gpios" property for the I2C mux reset GPIO
reference instead of the deprecated "reset-gpio" property.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/tegra30-cardhu.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index efaa39171c99..97165f233ec2 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -209,7 +209,7 @@ i2cmux@70 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0x70>;
-			reset-gpio = <&gpio TEGRA_GPIO(BB, 0) GPIO_ACTIVE_LOW>;
+			reset-gpios = <&gpio TEGRA_GPIO(BB, 0) GPIO_ACTIVE_LOW>;
 		};
 	};
 
-- 
2.34.1

