Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18645C433F5
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:25:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236159AbhLIR32 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:29:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242846AbhLIR3Y (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:29:24 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6908EC061D60
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:25:50 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id p3-20020a05600c1d8300b003334fab53afso7110588wms.3
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aS6Tu+WZ5JIr3G3uo8d/H18OVhCYr4tkNf0NiiYavfQ=;
        b=hNYAQ2qIwB0f2V7wzLAHs/ddwq1kqiSucMCmJYnYe7apvz9/YpOlwdIFUTnG5a3t26
         qocy0I9DnmY8+3MFTiyWLspvtTIBydBsUyHsh+k9omTz9WwmNIquDawiwYhY0xXvUpNI
         OYDL/XEnevHOKyAv8b61kiKLWHoBBKKnDN0YyUxsqxcSdALL7E+E2TlJK+mqI57wPzZI
         LdcnBezhkI3C6YeEa8+2qwU+Rm4vrBsQOuF7bpSyQEp/BUu26zwjFtPNWQRQG4yfeOS9
         RKvhnoswPAaXBW7rC+feqWCGCA96tk8fzaaZH2RPawYcb62clK7Tpkexnfo/7LaHQRDD
         +Ftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aS6Tu+WZ5JIr3G3uo8d/H18OVhCYr4tkNf0NiiYavfQ=;
        b=uCPVliBFlxYiXr82UUjGea5G5AXVpNYDZwo/hV1Hnych/pdCS4gWcEwvnPaR1UV4vc
         KmcpGQBCrLsMMpqtNB3LR5zGx/XbdLMVp/yPpNFfgpa5m0n936AO30eb7dy0Gxlr/ZmO
         PbOKGW2o7H97xjLckZ91QqwIBCKIMieJkZFEhYoAA6Lg1T/XS8x4tFHfnetroRxBkWOO
         sGok0GzYeXc7bh+ScvVEwniYqiXCZeL8w0vvEkrw33dHYmJSMeZQa5jXLpmYj3RarkxL
         0FHQ3cMX35g3cDEBSCLRWqrfBvXlaJcO7eUbjYxZgbuFGae9cwPlpuOPt2TcYpnS/a0U
         yuXw==
X-Gm-Message-State: AOAM531xlcQkMelB+vOpuRl/bOeS/Dx9t4Y4Cv+tkUKGArf9fG7SZkWh
        QmqGn5OPhG/LoRCCs4t5DhY=
X-Google-Smtp-Source: ABdhPJzeYXE+PqK78EZrLwq9qzsrlBw+8ZgLg+8ZRHi3y5vkDonPENg1MwAKqZ+8E1SXaGJP01/JIw==
X-Received: by 2002:a05:600c:354f:: with SMTP id i15mr8879655wmq.59.1639070748915;
        Thu, 09 Dec 2021 09:25:48 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id s24sm365721wmj.26.2021.12.09.09.25.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:25:48 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 17/30] arm64: tegra: Drop unsupported nvidia,lpdr property
Date:   Thu,  9 Dec 2021 18:24:50 +0100
Message-Id: <20211209172503.617716-18-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Tegra194 pinmux DT bindings do not define the nvidia,lpdr property,
so drop them from the device trees that have listed them.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index 14868e877c63..8bdb129c4094 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -535,7 +535,6 @@ pex_rst_c5_out_state: pex_rst_c5_out {
 				pex_rst {
 					nvidia,pins = "pex_l5_rst_n_pgg1";
 					nvidia,schmitt = <TEGRA_PIN_DISABLE>;
-					nvidia,lpdr = <TEGRA_PIN_ENABLE>;
 					nvidia,enable-input = <TEGRA_PIN_DISABLE>;
 					nvidia,io-hv = <TEGRA_PIN_ENABLE>;
 					nvidia,tristate = <TEGRA_PIN_DISABLE>;
@@ -547,7 +546,6 @@ clkreq_c5_bi_dir_state: clkreq_c5_bi_dir {
 				clkreq {
 					nvidia,pins = "pex_l5_clkreq_n_pgg0";
 					nvidia,schmitt = <TEGRA_PIN_DISABLE>;
-					nvidia,lpdr = <TEGRA_PIN_ENABLE>;
 					nvidia,enable-input = <TEGRA_PIN_ENABLE>;
 					nvidia,io-hv = <TEGRA_PIN_ENABLE>;
 					nvidia,tristate = <TEGRA_PIN_DISABLE>;
-- 
2.34.1

