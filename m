Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D0FFC433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:26:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242817AbhLIR3e (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:29:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242861AbhLIR3b (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:29:31 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B715C0617A2
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:25:57 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id k37-20020a05600c1ca500b00330cb84834fso7129642wms.2
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rxPu9TUxohkIyJXyOf8GiJ5bjGr6b3iRWsrxqfDpfvk=;
        b=YChlKKnyPvFXZOm6Syt1E1O8Y5iUAMVeLq/byUk1dkM5e54KC598m1EcxrtSXw+6hV
         h4TSJmZwSRUCK5OA5dVX5AEswEI6bzG7u7IbEJ3YRpWGB5wHHPWdBqESeHOJB8Rre4tq
         IV2rUrKFfGEGn2ewXeGW5fg20gt59e/QuEWWH5ny1dXjh5HV8ZTOEpWI5c86OAR8f+iS
         T35OnrpaC0Zrb5/cBbPnAMQ4w+6nmiNhLYty0bNkDswYV5SGPixXRW5Q9GsnAZYiPoke
         3y1ryh6KNzFZX5SELZv6sAhR2XTSCi7NSbocAjRAVFi732dLTWfIVOV4zDGbMfV+i3LD
         PXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rxPu9TUxohkIyJXyOf8GiJ5bjGr6b3iRWsrxqfDpfvk=;
        b=PY3zZwj0xJItl7rYig0LP8sad7JZ9wtDIl0qquxrg5z61f71RQVmowPwfJaK6idMPx
         JA9Zy4Bikb4vlaZsyqBtD/rkW1iJ2V20LHzeKAaiqnMaxAFZQIyMOtGKhsSog3e5Nin8
         VpZxFNOfi0dBdYKEoN5+XNo5XrD/x5f3kM26NW4G5xVV48FsU/BKZftP0pOTJMbP352U
         w/7EJbPJo0eOQvNdRISg4ZAQGILsK2c1EU4p43iBVXWf6LNdm+QXqd9EdfG4/LjuuSPW
         R90hhX+bhjbpgaSmJm0MJHThMauOiycYVGdGTa5/d/Kot9Ty7ZS8irTsXG4KGPiVe2/C
         Z68A==
X-Gm-Message-State: AOAM530x7+izp/th/xKV0udWWw9QHigc+ZHcze++iYAZhGQ9FmF7YF7y
        vR4/O60Z2uQ3LtXqyFtOXgsrqOgnHUNlHA==
X-Google-Smtp-Source: ABdhPJy2FVeFZE0V+zDcwnYWelpc+D/8thc75fi9ezvpSJxVYWE1G6tc+9u6wq9Lu9jCsuEUFc+sWA==
X-Received: by 2002:a05:600c:1988:: with SMTP id t8mr8857091wmq.48.1639070756135;
        Thu, 09 Dec 2021 09:25:56 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id o3sm9928210wms.10.2021.12.09.09.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:25:55 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 20/30] arm64: tegra: Remove undocumented Tegra194 PCIe "core_m" clock
Date:   Thu,  9 Dec 2021 18:24:53 +0100
Message-Id: <20211209172503.617716-21-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The "core_m" clock is not documented in the Tegra194 PCIe device tree
bindings, so remove it.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 969b965ee125..941027049b9a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -2270,9 +2270,8 @@ pcie@141a0000 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pex_rst_c5_out_state>, <&clkreq_c5_bi_dir_state>;
 
-		clocks = <&bpmp TEGRA194_CLK_PEX1_CORE_5>,
-			 <&bpmp TEGRA194_CLK_PEX1_CORE_5M>;
-		clock-names = "core", "core_m";
+		clocks = <&bpmp TEGRA194_CLK_PEX1_CORE_5>;
+		clock-names = "core";
 
 		resets = <&bpmp TEGRA194_RESET_PEX1_CORE_5_APB>,
 			 <&bpmp TEGRA194_RESET_PEX1_CORE_5>;
-- 
2.34.1

