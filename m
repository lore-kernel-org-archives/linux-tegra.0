Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 913D9C04A6A
	for <linux-tegra@archiver.kernel.org>; Mon, 17 Jul 2023 16:32:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbjGQQca (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 Jul 2023 12:32:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232218AbjGQQcY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Jul 2023 12:32:24 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFDA0E60;
        Mon, 17 Jul 2023 09:32:17 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fbf09a9139so7430426e87.2;
        Mon, 17 Jul 2023 09:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689611536; x=1692203536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkMZYKcJMO3bzF3M5BPSas+elXF5SrDI7IstoXDRe7I=;
        b=FLRaUCZzv7EJKdb1I18r3bgIGMxmK6lGQvGxc56SU16KfEt4xgWPRjEBy3B+v2MvQP
         Pl6aiXlm4K81NCUxcgNQD9XhjpFYNTUT9yTCD3ubhdCpK0NYjBH/hGZIx82wuEwDVU2K
         eBlpfrfMoAM0F/3D82cdqu4HpDEwt8BGBd5Yvy2umSXVv3exejAQDL6rKtAWtiqP+mWX
         yJwG8uuUVssxHyAin96NYEVdmNjbXNBKia4Oa01PYeGtZ99L4uBsTWkcW55sbh5Vdkz6
         D7FugbapuzSvilaUhyjWxB/Un/Yspg/YsxO1CqoAkdJHZ7srIYsXamMI5+Qz6MQjwh/X
         Gm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689611536; x=1692203536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkMZYKcJMO3bzF3M5BPSas+elXF5SrDI7IstoXDRe7I=;
        b=iljsCQ+yr610KVOnTFtVF85jte/oAlSxMFe+0Uf44o/sEEUlYMfU1QDRcO6MT7+Mo6
         PhrGkYSJxWlQDAYzet6FPxq+zeXhigJbXXfPFGF/mZVA22qeEcMkyLzNOeNy5dCyf3eQ
         2/lisC67dgjR+mxazfvEIFf+FnkKXbMeuPgPyEl4oXLIf4oE2CtTQC3B+u8rhq2zx4vT
         /XkXr0c2QRY8KE/PKUy+ksNTtovptBalnIgYVJVOork2PcmwXSvfBUUTu+ACrOi1zIpi
         VjcosdpBuL1Bft9t8k62jHYG3x3Um8Qr9GUPOY2Thp5Tr+7kWUJ4ZxsfuJESsZFnKv3C
         64Cw==
X-Gm-Message-State: ABy/qLZ9HLvwVbHHa+Zy7SUrAb5ZhAQM/02Z+ONFptqQd7HA2ktOOpu+
        fDgdCJRgNUb1bYn4ttH5wYSz8tyRLzs=
X-Google-Smtp-Source: APBJJlHDoou+J9vJDQS9FLu+Vy0VM05UD1eDD3ukcfBTyZD5shGrCY5aWB8zi7TCTLyGgqtAiQHdLw==
X-Received: by 2002:ac2:48a8:0:b0:4f8:5717:e421 with SMTP id u8-20020ac248a8000000b004f85717e421mr7849928lfg.40.1689611535711;
        Mon, 17 Jul 2023 09:32:15 -0700 (PDT)
Received: from localhost (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id l16-20020a056402125000b0051a4c1dc813sm10155894edw.82.2023.07.17.09.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 09:32:15 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/4] arm64: tegra: smaug: Remove reg-shift for high-speed UART
Date:   Mon, 17 Jul 2023 18:32:11 +0200
Message-ID: <20230717163213.1033592-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230717163213.1033592-1-thierry.reding@gmail.com>
References: <20230717163213.1033592-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The device tree bindings for the high-speed UART don't define a
reg-shift property, so delete it.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 515a0e637cb7..53805555dd2d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1320,6 +1320,7 @@ serial@70006000 {
 	uartd: serial@70006300 {
 		compatible = "nvidia,tegra30-hsuart";
 		reset-names = "serial";
+		/delete-property/ reg-shift;
 		status = "okay";
 
 		bluetooth {
-- 
2.41.0

