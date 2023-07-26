Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B85C04E69
	for <linux-tegra@archiver.kernel.org>; Wed, 26 Jul 2023 18:49:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232147AbjGZStH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 26 Jul 2023 14:49:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232158AbjGZStG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Jul 2023 14:49:06 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CB0E1710;
        Wed, 26 Jul 2023 11:49:05 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-98e011f45ffso3027566b.3;
        Wed, 26 Jul 2023 11:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690397343; x=1691002143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7hDSqhH8BkuxZPIDoURvTqML0NlrWeio/ZXYmGlF4bQ=;
        b=sefRUsMi4isBuj+0ycXQFXqqdPaY1M/lVY5Uk15V0j89bZKHZ68se03hxBg3ena4fS
         +wU4f4futLrxq3ksaEyGmIX9QDYI98OHprIH6V4rxFMGs+VCL66gQqRKhnLDoMLRobnM
         grIVtc7ZoNMgLwuxO0GrMx/i3nvNQftn+GGhVmb0C4cB6+NKfWJOYNjul+LqYZ+HcKog
         36iveo8Ew8DKoS/gtMYn8xDPy62Ay0B0OQrIxHN0HT/VdUN6JuLjAn5WJwLWHcNQI/jt
         +56K3IeeJH7zCtqLoTxchY+nsxSa0KgokJTdmATU9u8HJBHK9AC1N3/cIczyOWakxvS+
         mIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690397343; x=1691002143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7hDSqhH8BkuxZPIDoURvTqML0NlrWeio/ZXYmGlF4bQ=;
        b=Z5LCcmDIDXP0O0K4iDOtYnlhgbgeSXzL6bN0/ahFMhh4lepEdD8WQ1yXJbAGLH2Zql
         1xnZdsv7B4XbdMAulWpa6/kQQv5TCULAdiQH22RhiLJ+zh0E3d1eIlMZjh9b4vRMDXK+
         y7PwuBiH1YJm+dBDMb+aS6fd2FElLj055EpY8PnluHWVBLDMr1oThWpEHexx8Rwfg2YO
         FaL6GRBXLTnHFDQHknj53UYlQ6N8tYSZtnKguxGxBYuqOO0rlx9OLUmoeqFrl3cVFjM5
         Pp2HzGXElSQ0r/nrmX+620mrvjweNHC6Bj2oXkhzwyPV+A24ZjpRXNOjR7Y3WfqF2A8g
         R6MA==
X-Gm-Message-State: ABy/qLYB5yxNZ0TZRq1MJy7uZDCTLDci6hW73NG2T/5uZD670tclBhn3
        TaCkx+b8q5QfvpaXPnxr7Kg=
X-Google-Smtp-Source: APBJJlFGjeZg8RvubJMrZ3BDxRJelnMBSwW516T9hXbqE08dsKnYwOHQ6rSAkg+xX21G1Pre1NzkFA==
X-Received: by 2002:a17:907:761b:b0:994:4e9c:30c6 with SMTP id jx27-20020a170907761b00b009944e9c30c6mr18372ejc.57.1690397343189;
        Wed, 26 Jul 2023 11:49:03 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id b11-20020a170906150b00b009786ae9ed50sm9903461ejd.194.2023.07.26.11.49.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 11:49:02 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH 3/3] ARM: tegra: Use Hannstar HSD101PWW2 on Pegatron Chagall
Date:   Wed, 26 Jul 2023 20:48:57 +0200
Message-ID: <20230726184857.2294570-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726184857.2294570-1-thierry.reding@gmail.com>
References: <20230726184857.2294570-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The LVDS bindings require a specific compatible string in addition to
the generic "panel-lvds". Add the HannStar HSD101PWW2 which is used on
a similar device (ASUS TF201) and seems to work fine with slightly
modified timings in DT.

Suggested-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts b/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts
index c81d5875c31c..4012f9c799a8 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-pegatron-chagall.dts
@@ -2628,7 +2628,7 @@ cpu3: cpu@3 {
 	};
 
 	display-panel {
-		compatible = "panel-lvds";
+		compatible = "hannstar,hsd101pww2", "panel-lvds";
 
 		width-mm = <217>;
 		height-mm = <136>;
-- 
2.41.0

