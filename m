Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6CA2C0015E
	for <linux-tegra@archiver.kernel.org>; Wed, 26 Jul 2023 18:50:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230417AbjGZSuR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 26 Jul 2023 14:50:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230289AbjGZSuQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 26 Jul 2023 14:50:16 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 639F51FEC;
        Wed, 26 Jul 2023 11:50:15 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51bece5d935so118292a12.1;
        Wed, 26 Jul 2023 11:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690397414; x=1691002214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0rexRK7W4l8v0wLlIEa95N82SjV397HKJ5Yeg85wQoY=;
        b=rHR7Fjr5s2ZyL+v0ZiEN80ULCDHd60Ht0s/fUebR0wpKmD816gIlrKyhzYVh34VWeK
         olQd2SVyUEyVegm3+6VY9T/sQ9tiJ0Fa9QPoiEo623j7KwAO0WSymOkWDXENoUlswFtv
         4gqNuLQO7eTh2wvNuVu1wjbikJNzJdpDOt+QL00nkrI3iGHx44Ji95MqYIa3s/ajLCqD
         6zfDmhJt5KE9A0iz4Q1CvHDhNPKKATx0Az7X9xmFaf4kKeZZPGT7C8QhkGAsvjPGAIOq
         aC6EMwDvlvO28eeT1gPh0E4IQxbnZKCJDOuJFzF+ky7rGE5pK9wHA6eM5zEb8uttxcO4
         0PHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690397414; x=1691002214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0rexRK7W4l8v0wLlIEa95N82SjV397HKJ5Yeg85wQoY=;
        b=CZhky1kWSzbR3nvPf72ApAsW9YnDWyNNXP1mLLvhuFbtLAowXE44y75ZTn854a5W3Y
         9CSIgFu7psMnGt9iIQDOA6qZde3G2cTuAs+1qtdqjoOX6xaNorg+igV4z1PWMK1Y+BTL
         /NaAp4w6Yb4bu1FQKX1Kohxt77ITwwi8Yt+lmCVTNU5k6QXNu9VayfO52/BmsUym40zF
         1NcTHRD6C553l0dgKvHIZqtn+3FGOYx8/k64r7Xj4ac4D+U5hX2xl+lSkkD7p/ff6Qpf
         0bLJG41fEbR3/DJImloCVqzz22E3g72pzfNwssI2MJF6nSEYbbubiDr/jj66sy8cPv2/
         srxw==
X-Gm-Message-State: ABy/qLZYau0xikF9P21Oa9TPNWiT9zuY/t5j8a0gUC/YyvOvRIC/VRq8
        CfpVN0JRLQSKvRUrGKE+E9I=
X-Google-Smtp-Source: APBJJlGZiZsN3m/zLesWuzj3qD6L6x58aHU5GUGbJfofk0Nt6MwuHCNScHOJP/779XTprGirtVjL4w==
X-Received: by 2002:aa7:da81:0:b0:522:2f8c:8953 with SMTP id q1-20020aa7da81000000b005222f8c8953mr17289eds.39.1690397413610;
        Wed, 26 Jul 2023 11:50:13 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ba28-20020a0564021adc00b0051e2670d599sm9124151edb.4.2023.07.26.11.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 11:50:13 -0700 (PDT)
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
Subject: [PATCH 3/3] ARM: tegra: Provide specific compatible string for Nexus 7 panel
Date:   Wed, 26 Jul 2023 20:50:10 +0200
Message-ID: <20230726185010.2294709-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230726185010.2294709-1-thierry.reding@gmail.com>
References: <20230726185010.2294709-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

panel-lvds alone is not a valid compatible string and we always need a
specific compatible string as well. Nexus 7 can come with one of (at
least) two panels, so pick one of them as the specific compatible
string.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../nvidia/tegra30-asus-nexus7-grouper-common.dtsi   | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
index 4fa6b20c4fdb..a9342e04b14b 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi
@@ -1092,15 +1092,11 @@ cpu3: cpu@3 {
 
 	display-panel {
 		/*
-		 * Nexus 7 supports two compatible panel models:
-		 *
-		 *  1. hydis,hv070wx2-1e0
-		 *  2. chunghwa,claa070wp03xg
-		 *
-		 * We want to use timing which is optimized for Nexus 7,
-		 * hence we need to customize the timing.
+		 * Some device variants come with a Hydis HV070WX2-1E0, but
+		 * since they are all largely compatible, we'll go with the
+		 * Chunghwa one here.
 		 */
-		compatible = "panel-lvds";
+		compatible = "chunghwa,claa070wp03xg", "panel-lvds";
 
 		width-mm = <94>;
 		height-mm = <150>;
-- 
2.41.0

