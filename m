Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A286BC433EF
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:25:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242877AbhLIR31 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:29:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233067AbhLIR3R (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:29:17 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FDEBC0617A2
        for <linux-tegra@vger.kernel.org>; Thu,  9 Dec 2021 09:25:43 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id a18so10947450wrn.6
        for <linux-tegra@vger.kernel.org>; Thu, 09 Dec 2021 09:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RZ+lQ3nOGSaOJ6GFlTPc4kgCDw1aMudLOxByeI4SLLo=;
        b=R1JGNzqxID4fT/jywcrKezJ0CkeuyQJ+Gyatg8uCEZJMKETwyU5M+xgVE2bGB9mx3m
         F3AoGn8oaB84127qT8dHq8TjqgsjSLrCpmBVxwBb65eb0ghBWSLFBex9JgNMiWk0fdvi
         yxQsDr0GbSPviAvW4sp1zCwB4C9CAFOMnn4/Zxi7mZHWGX3kW9i9AZaxtjsxPsS3QVdK
         UOGZJ1YJAR75GbpMqdCguStes3ch+TzohUN2LSiSKsTMo+vq9hA+1FmTfgGKv/R33oHn
         8BU1xOT+U0s8I3xTg0P7fO5T9xFrtaslmZe9Db+6k0HCSlUbYpqFV3OMxpt/0yi4qgEr
         tMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RZ+lQ3nOGSaOJ6GFlTPc4kgCDw1aMudLOxByeI4SLLo=;
        b=ZQIhZhdHc8UspNT1/ZyTSdqEF3Itb133FXAVyGsBcI3lSRjZi6pX3TuHj5HSogeRg3
         FbQHipwiBEdfUR1CTHzHJzo3ZfPWNrV6U3KnWdFsSlKM9bXZH/y3d/x/Xc1fMm8ysUnC
         AFAupQumuJ2SxQgUER9uLDHJ3wNdvFXSOY4fdTEOT/drXGmHSF8rnVa5oMeC8cHaY5s8
         bFBQF/nwbhsPgwd3oDbKq63LEBplq0SPhcZFS9BB5sbQ1a0wyscLU9/694uHsePWtt35
         00XqU5iTZ9gl46kS99pk8MRKZMLSikL943qaWScLfD+9w3JMzL6eJapvK1URZzdGhN4f
         kGLA==
X-Gm-Message-State: AOAM531y0bZy7YtNxRccgTv0CPKvRuuDUTYkMQdfmOlWmja9XuKClaoM
        hsDYVjrZ5LsXu2BCy6FDw3E=
X-Google-Smtp-Source: ABdhPJz+RphIu27KVwhxYTCvIwynKB1Lngsj20IAe4xHd9NsYUXW937XCuiy37aMEiuG1AELBG27fQ==
X-Received: by 2002:a5d:6d8a:: with SMTP id l10mr7852796wrs.232.1639070741809;
        Thu, 09 Dec 2021 09:25:41 -0800 (PST)
Received: from localhost ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id b14sm440562wrd.24.2021.12.09.09.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:25:40 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
Subject: [PATCH 14/30] arm64: tegra: Adjust length of CCPLEX cluster MMIO region
Date:   Thu,  9 Dec 2021 18:24:47 +0100
Message-Id: <20211209172503.617716-15-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211209172503.617716-1-thierry.reding@gmail.com>
References: <20211209172503.617716-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Tegra186 CCPLEX cluster register region is 4 MiB is length, not 4
MiB - 1. This was likely presumed to be the "limit" rather than length.
Fix it up.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra186.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
index e8886c9f54da..e4b0c9835fbe 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra186.dtsi
@@ -1215,7 +1215,7 @@ sdmmc3_1v8: sdmmc3-1v8 {
 
 	ccplex@e000000 {
 		compatible = "nvidia,tegra186-ccplex-cluster";
-		reg = <0x0 0x0e000000 0x0 0x3fffff>;
+		reg = <0x0 0x0e000000 0x0 0x400000>;
 
 		nvidia,bpmp = <&bpmp>;
 	};
-- 
2.34.1

