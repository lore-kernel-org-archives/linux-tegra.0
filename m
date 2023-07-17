Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DCD9C04A94
	for <linux-tegra@archiver.kernel.org>; Mon, 17 Jul 2023 16:32:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231409AbjGQQcb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 Jul 2023 12:32:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232226AbjGQQcZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Jul 2023 12:32:25 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF69710D7;
        Mon, 17 Jul 2023 09:32:18 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-51cff235226so9776794a12.0;
        Mon, 17 Jul 2023 09:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689611537; x=1692203537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0J5Upn3DBPxZrnvYfR7PUHbgzBcxcSTI8e5DgmHxRE=;
        b=m7r5KJet9QxfgpoOARqSHjfFaJWKbQmY+Py2+LY37LFQqOosbUGJgeeFq9r6RQkouV
         oXx3yZmz2xXIAFDHXtXTE3xRx8vq4tNzIEOMRSuqJSHkwcHOqO+J4BwTR4IOXzdPiu96
         +eSxl7Fm+UOlZxNNswqK1jmDcoE9prgW7FTKFfC808IyrjeWGrwKud1MTQgUKW/JD4oL
         cRXZnCjsA1A2zoqsMrKhymn6pErxGNp4T6k0JXjzuxHi9LkH4KfQSEeM4mW/07VyU/6E
         0cbqUnuWSnOFEygnXd7C876eh1nrTSJXH67Lw4jjPNzSp3/RvfVShtp7T/+Q74Y2/ALd
         IOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689611537; x=1692203537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w0J5Upn3DBPxZrnvYfR7PUHbgzBcxcSTI8e5DgmHxRE=;
        b=MavzQ+xArKCC9MNhDAcYpZj+T+ohlZ2gGaamp50iB09byytWjz9WtHr3cRPcvQ5CoP
         VfzUYBt2cURrA92YhJ2rVJH13BTDk6A7Lhcjnu6SBpABEQrCB6C1zGSSGjvLb3hGjhI9
         WIsF9SIpawyXYLMsmKFh8ilfU08QGOtjRRTTejBaM6B5fHgZ/oyQO8RumMYAIfxryqdP
         fXPTAgOYtRbUUE+u2jiyRBpQxzFW5KkZuYwWlXFGjT0Zoc0EsgJxcRfdWzUjwRSNb7HC
         enHVX5ftA+sAXiSDcA4BaAv+JjyuoRLX0mIyiumJJA4s/qXcr1UBN9r2PwQMQS7CZR5x
         VJSA==
X-Gm-Message-State: ABy/qLYvEXW57eyOluFz8/CoOzE0xb8LuoTJJKFtgOOtMUgzX5pQh4ve
        S5tmuK8a+gH2iEcGyWT72Ig=
X-Google-Smtp-Source: APBJJlFu8lpK1PozcAcc0/uMUlGtSwpEYNH+JGG+hNUnCxy9CTM5m9vsWzzXcb+wmiuCz58Xi8ULzQ==
X-Received: by 2002:a05:6402:150b:b0:521:728f:d84e with SMTP id f11-20020a056402150b00b00521728fd84emr8315587edw.0.1689611537411;
        Mon, 17 Jul 2023 09:32:17 -0700 (PDT)
Received: from localhost (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id q6-20020aa7cc06000000b00521953ce6e0sm1504375edt.93.2023.07.17.09.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jul 2023 09:32:17 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 4/4] arm64: tegra: Add missing reset-names for Tegra HS UART
Date:   Mon, 17 Jul 2023 18:32:13 +0200
Message-ID: <20230717163213.1033592-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230717163213.1033592-1-thierry.reding@gmail.com>
References: <20230717163213.1033592-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The device tree bindings for the Tegra high-speed UART require the
reset-names property, so add it whenever the compatible string for the
serial port is overwritten.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
index b35044812ecf..0de6ec38af42 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra234-p3740-0002+p3701-0008.dts
@@ -71,6 +71,7 @@ aconnect@2900000 {
 
 		serial@3100000 {
 			compatible = "nvidia,tegra194-hsuart";
+			reset-names = "serial";
 			status = "okay";
 		};
 
-- 
2.41.0

