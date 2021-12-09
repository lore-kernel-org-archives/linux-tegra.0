Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972ACC433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:26:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242895AbhLIR3o (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:29:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242849AbhLIR3o (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:29:44 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31EADC061746
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:26:10 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id a9so10923109wrr.8
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:26:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1GO+LWP+0ftFzZu1gijSvoWuq3Wg7/UVL1CoHMkD1ak=;
        b=m6X4gLD0DBdK5SxESy75nWOsokb5EQ00UhRKd6WiD16Sq9AITPvfB4d+7mnCXV7x9z
         nC+s5zvOc4CMX3VhSQtHYSkNkoat4Kt4AA2UQGapgHrz+oi8JfimAxrb9IJXe23wdP/F
         qzmEZrmoLSoaDgFm+V8tf2Ux36Ze/0TzjlVyOqiowaXXd3om+Y2eaeNf8g/pLIm+siwQ
         SQtblVE1g9BUQoW26G/VcIZLsUdyY81ozq81w4rB1sUeInQW31YFsAa9dP5hJK9R27Hi
         wcJW1emknHZtT/8JVz1hoH6x9/hQefKkvVfLmcX2IDLH5oUON4NK69JoMDUUkafVzrgF
         925A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1GO+LWP+0ftFzZu1gijSvoWuq3Wg7/UVL1CoHMkD1ak=;
        b=1IZzqIWjEL/c+rRiB9TbRxZ0tn3aNfRvz/3u+jXLvoQkhsbjbulTMnftQw8X180NG5
         5uK9zBCN2a3T/ot8wGz+QRRxWHogtXIpqnU9Zy28qBT+uEDjOi/3EGgwpF3VgxkUwhbd
         Iu4zhdQ5DkAF0qc7oSqTzD8DLWoNXSkqXV6cCKsk0VzrdqEpisbYhMqDNT8r+4e+xVtc
         tGvB68klBMUjlvRjglUtpAi4o6CIa4a8Den07poyYDBf6b8JLmAxnQZDh49TYvRQkgAl
         7sGj/9xaiGJ/wT7V3YUsZ7L9f4qgCjRXv2HNibYw0LULBT3fB6U6OGHvquXyTYviZ0xD
         Aa1Q==
X-Gm-Message-State: AOAM533udLfAxCert91sEFC13ufS5cnXdgixhxipic6S+V+9j0297jrS
        ln/ZDL/eQFedlBiQL6vTsWg=
X-Google-Smtp-Source: ABdhPJwQfseReUP1gr6d43JoaLvYfLkOkNSwBUsFZ2MJ5yfrFeLcL4cMnIVRS/Nh3EFGXD/IpicXiQ==
X-Received: by 2002:a5d:4ccc:: with SMTP id c12mr8078753wrt.453.1639070768703;
        Thu, 09 Dec 2021 09:26:08 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id m1sm381360wme.39.2021.12.09.09.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:26:07 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 25/30] arm64: tegra: smaug: Remove extra PLL power supplies for XUSB
Date:   Thu,  9 Dec 2021 18:24:58 +0100
Message-Id: <20211209172503.617716-26-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The XUSB pad controller handles the various PLL power supplies, so
remove any references to them from the XUSB controller device tree
node.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index 6d59c28ff2a3..a263d51882ee 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -1642,10 +1642,6 @@ usb@70090000 {
 		dvddio-pex-supply = <&avddio_1v05>;
 		hvddio-pex-supply = <&pp1800>;
 		avdd-usb-supply = <&pp3300>;
-		avdd-pll-utmip-supply = <&pp1800>;
-		avdd-pll-uerefe-supply = <&pp1050_avdd>;
-		dvdd-pex-pll-supply = <&avddio_1v05>;
-		hvdd-pex-pll-e-supply = <&pp1800>;
 
 		status = "okay";
 	};
-- 
2.34.1

