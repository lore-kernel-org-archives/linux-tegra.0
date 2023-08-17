Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D5DC30624
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Aug 2023 14:14:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351773AbjHQOOX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Aug 2023 10:14:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351858AbjHQOOQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Aug 2023 10:14:16 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19BA42D5F
        for <linux-tegra@vger.kernel.org>; Thu, 17 Aug 2023 07:14:15 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fe15bfb1adso12564338e87.0
        for <linux-tegra@vger.kernel.org>; Thu, 17 Aug 2023 07:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692281653; x=1692886453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TWzPdt3S0jQVQwpfXzH3IM4XGyT0WqsoVCFzt2KeJbc=;
        b=RjqsxpgRCFRe/l+xqzTFylBl7WOXp/KIYRNQTPeHxDGz9OVJiiVfLwR9Zatdoa01gE
         Q2vIG/m5vo2wXCiX3XSx0KRZU8yvmDeLpffzlTgj50Gsu+F3Ak5+04qy0nBurlxr09Mc
         zjp0Jgy4MJyAAPi90LMB037LGzg+E44aDnOlFoZppw3muII6+9MvBuzS2CBv+WzPZu9R
         JrNKcpeVuBIuB9xjUJ84GVvENowkxR7/ih76wYGkUnktpQLNfoJXWry70I3DW1/kW06V
         0MpKIlJjRkO3hAyG7L0JlV9byCbJKej6JF+Qu3XfR6wnpNk8jGbqcxzplXL20ntqAgjz
         dvDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692281653; x=1692886453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TWzPdt3S0jQVQwpfXzH3IM4XGyT0WqsoVCFzt2KeJbc=;
        b=YTZ+8rv6YgSQbHaEbytFzM/tGKT4/5FMz9KhlezKIYt9eGCYF9xjmVBNZmpflZTiRT
         iRbwFBzIkb6VE9pS+WbuFMCqOe+tWsL1avePppNcwtyKmRdeqFO7iGbjMHNGlb6yPO/V
         Pxinp2+4CWehugUHb5qE6z4F3AgXSzl4YyvAkmLTqF8sA7gouIf0YGHZhyAzfimzcKeK
         LK75OHT9Ind5ZdWaVAnw5zaKDKvxGcjocPbtFjKFv0p3TcCNX8Gekix61/1a6O+pO2V1
         3DcN8QF/FefmiVYGRhCHtzvdzBQCpjTIrlmWWyAdDPY2Rjmx/fJbCy8k9Zxv0qi6sPjF
         h2OQ==
X-Gm-Message-State: AOJu0Yw/Qf9Peua+3G1yK0sQQSs/i9GK8RQYc0961v0QGxCfKbqsjIQc
        BeK1A1FDOMvK/a4t5xSeqOrd+3PaNew=
X-Google-Smtp-Source: AGHT+IGs78l03PX372DZFBCWfWwWZjOQ22751VLnSDYHCqiKtgQG1bDP4sTwFdwYIUZpfIizANH7Ug==
X-Received: by 2002:ac2:58f2:0:b0:4f8:7325:bcd4 with SMTP id v18-20020ac258f2000000b004f87325bcd4mr4287937lfo.0.1692281653155;
        Thu, 17 Aug 2023 07:14:13 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id p22-20020a170906229600b00977c7566ccbsm10140847eja.164.2023.08.17.07.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 07:14:12 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/5] arm64: tegra: Add missing current-speed for SBSA UART
Date:   Thu, 17 Aug 2023 16:14:03 +0200
Message-ID: <20230817141407.3678613-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230817141407.3678613-1-thierry.reding@gmail.com>
References: <20230817141407.3678613-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The SBSA UART device tree bindings require a current-speed property that
specifies the baud rate configured by the firmware. Add it on Jetson AGX
Orin and Jetson Orin Nano/NX.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts | 1 +
 arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi           | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
index 201a7a8a01cd..b4a6cee0b9e3 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3737-0000+p3701-0000.dts
@@ -121,6 +121,7 @@ serial@3100000 {
 		};
 
 		serial@31d0000 {
+			current-speed = <115200>;
 			status = "okay";
 		};
 
diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi
index 45c4282b63e3..90490f429074 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3768-0000.dtsi
@@ -31,6 +31,7 @@ eeprom@57 {
 		};
 
 		serial@31d0000 {
+			current-speed = <115200>;
 			status = "okay";
 		};
 
-- 
2.41.0

