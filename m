Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C378EB64DC
	for <linux-tegra@archiver.kernel.org>; Mon, 17 Jul 2023 16:32:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjGQQc3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 Jul 2023 12:32:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232221AbjGQQcY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Jul 2023 12:32:24 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B4D10D5;
        Mon, 17 Jul 2023 09:32:18 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9928abc11deso663910266b.1;
        Mon, 17 Jul 2023 09:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689611536; x=1692203536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lahZGjzrtiFrb+CUs0WnOb8ILG7aeFxB4JGtkR884w=;
        b=rhWOAyNlOK82+wjItYc/2UPL9BI95ZvE2Sky790P5Cq9nGGbB1Xl4oNV/BHZpKxfqo
         bm4hfcNq23oOJsagPoYAWhDnS0qqP36fDcW08xiV7p3EBfFWgIjWVY0sNWOlHsisuOCP
         Md1n6Kv7/kmIJzYFj8IAKEO7bm32Q5toxCWuxG40g2fhuOzfd8G9a7gNFTzDSwC7EU4n
         Hykgqb/JE6xa/RFyhdTX3YwMh3wdTtKzQQg2TY1TyAvsTxZyo/eK2+7DDcCdP2k0vpiw
         uuvzsRheIJmBBH42hYUx1A3LoP4Ncm+tRTRB1Hx+6VjV6OcCeIeMxcDkLIMJIO+rXp6F
         dzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689611536; x=1692203536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lahZGjzrtiFrb+CUs0WnOb8ILG7aeFxB4JGtkR884w=;
        b=e5WYlE1JfH/uV6rQErxFXE9GgqXnDQHzctHziUc6sNM6Jf5zqTA+k7u1vDA8UoFetG
         hw0lejyEkBcCM5iHwt4kgrh3o4A/aVKlsng/RNKinM/aRcpFWUv37R+OYWH9i9AXosvD
         OX6M2rX/Zb132/dqa+3Spk+jlkPl+Tz+XjJpnX6TIEf0LjxsgILCpMUfqcTuWS8MWbiB
         SpzT28Gr8wsOcZMkwTtbEQHi+3HLnSIz/sjcfi2C+D1A2tc8faNkrbo2sp7aIA2GysOh
         wqKZX+FT5XgYJR5n2hr/P+NUaCuaojNAeazvrNve50DCoPsxqHRniCbtHrs8fSvnEDB/
         wG6A==
X-Gm-Message-State: ABy/qLbhCFFkTJSru+PEJ5sqpPjiJGtV2XAvnuO8SsAfQWnAWCozs92R
        tsQ5M+8QEya9j7GLl6Dp0XM=
X-Google-Smtp-Source: APBJJlGgLiBDp4S+YzU4NL8etLceFEz/EukMJWMQkyzQdqEVKSX0hbZD6BUsf3jxceVOlkNDXeWkCw==
X-Received: by 2002:a17:906:2213:b0:993:f996:52d4 with SMTP id s19-20020a170906221300b00993f99652d4mr11954493ejs.22.1689611536537;
        Mon, 17 Jul 2023 09:32:16 -0700 (PDT)
Received: from localhost (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id pw20-20020a17090720b400b009786ae9ed50sm9385855ejb.194.2023.07.17.09.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 09:32:16 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 3/4] arm64: tegra: Remove current-speed for SBSA UART
Date:   Mon, 17 Jul 2023 18:32:12 +0200
Message-ID: <20230717163213.1033592-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230717163213.1033592-1-thierry.reding@gmail.com>
References: <20230717163213.1033592-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The SBSA UART device tree bindings don't define a current-speed
property, so remove it.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts | 1 -
 arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts | 1 -
 arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi           | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index ca9a4e5e6a8e..21e6acd6e61c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -2106,7 +2106,6 @@ serial@3100000 {
 		};
 
 		serial@31d0000 {
-			current-speed = <115200>;
 			status = "okay";
 		};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
index 072e45ce2631..5659c76ba485 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000+p3767-0000.dts
@@ -113,7 +113,6 @@ framebuffer {
 
 	bus@0 {
 		serial@31d0000 {
-			current-speed = <115200>;
 			status = "okay";
 		};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi
index 6101bc5808bc..0f15f7d4f01f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi
@@ -31,7 +31,6 @@ eeprom@57 {
 		};
 
 		serial@31d0000 {
-			current-speed = <115200>;
 			status = "okay";
 		};
 
-- 
2.41.0

