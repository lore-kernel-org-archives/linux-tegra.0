Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B50CC433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:36:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 701DA61027
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 12:36:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234988AbhKLMjC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 07:39:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234903AbhKLMjB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 07:39:01 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2E62C061767;
        Fri, 12 Nov 2021 04:36:10 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id d3so15233418wrh.8;
        Fri, 12 Nov 2021 04:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kziRFT0Le7hqG38qwsiU3vCtJ2XR7etTqEzKSn/F9Kk=;
        b=oR6bBKDpesxgQbVvfGyMwanlBIOt5iChcoqgzfnauFEIEIRYWradqbQnUQPIPCw9rF
         QWOTdwSPOaKjqTW2KS48rTk5GH1IHjwzmLDaYVeMZHJ2OeXZlFJ9pOVb1ThYi9+M4AyF
         HZa24xIrjcbU5G1+uL1Lqpihti8FEFO3IbElSCfDAw+zXNRH9gm05Mz93Y9fSJh+E5YS
         NWNGIZjTyW+3sIPQXLBn4zeDb96LPnrsiPqMCr5AlgQLDDfOgHQfQu8SWgoLrM7hcny3
         gyBJhXah6U8tQUVvfhJDrmXAsVP7QjAp11pIdj4LdXTVJZCIGIzygkwLTHJXDQGaBZGX
         2cbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kziRFT0Le7hqG38qwsiU3vCtJ2XR7etTqEzKSn/F9Kk=;
        b=20+cyerM3vyxiS7jakikTKlOCImJfOS1mbcqJja23vF994DuU0mrEwdmy9nmIYK6BD
         Ymh50xoe2GGxDffELKBL0EciL4Csbv2I4LY4pA9pfcHKuCcyly6O6X7+iYRubkjKfeVa
         4bi5oBqO/9O+e/8oZBrBSxbcrCe3zvtllbWV2/QKaT7kdnbCCbHoEXnQvnuvxa6CEnuB
         HI61HAGmORhe38Sc2RXRJVUdXYh+YCWSJLsZRUSRLy/gO+Mr9pNQgIhxHqIB7/L2GYiJ
         mDlwFvC4accrT1sdcysnzPstmvDunWklVhoCE0NIR7SjSbDFHHdTUmt3smImP1q+0f8i
         n41w==
X-Gm-Message-State: AOAM532Uj3Ny5SAbXG0KsDRrTCmd48HsKS/Cyxd4tBolIyq37yBTGznd
        0GNG7nPDFDMkBTxFGZEQ+gU=
X-Google-Smtp-Source: ABdhPJwI6R+nrJ4ZCDa2lNrzl4ym1DYmHNkVhR2A5kv7THVyKjgU/4DyiAJJNaau9e3gJ/s+GSwRhw==
X-Received: by 2002:a05:6000:12c5:: with SMTP id l5mr18145637wrx.173.1636720569524;
        Fri, 12 Nov 2021 04:36:09 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id c79sm5564840wme.43.2021.11.12.04.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 04:36:08 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 07/11] arm64: tegra: Add clock for Tegra234 RTC
Date:   Fri, 12 Nov 2021 13:35:38 +0100
Message-Id: <20211112123542.3680629-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112123542.3680629-1-thierry.reding@gmail.com>
References: <20211112123542.3680629-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

The RTC device requires a clock. Add it.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 28961ed31d87..400c01acc19f 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -93,6 +93,8 @@ rtc@c2a0000 {
 			reg = <0x0c2a0000 0x10000>;
 			interrupt-parent = <&pmc>;
 			interrupts = <73 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&bpmp TEGRA234_CLK_CLK_32K>;
+			clock-names = "rtc";
 			status = "disabled";
 		};
 
-- 
2.33.1

