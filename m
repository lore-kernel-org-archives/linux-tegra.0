Return-Path: <SRS0=22zn=CX=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D416FC2BC11
	for <linux-tegra@archiver.kernel.org>; Mon, 14 Sep 2020 13:40:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7732720EDD
	for <linux-tegra@archiver.kernel.org>; Mon, 14 Sep 2020 13:40:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ep8bB0LC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgINNjw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 14 Sep 2020 09:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbgINNhq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Sep 2020 09:37:46 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2279DC06178A
        for <linux-tegra@vger.kernel.org>; Mon, 14 Sep 2020 06:37:45 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id z9so91018wmk.1
        for <linux-tegra@vger.kernel.org>; Mon, 14 Sep 2020 06:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nQZJ7yPVXRTTpaaOFiG+mf5v7oE6uXQPB9nQE0+9z00=;
        b=ep8bB0LCLxravy9N9omrB/Pi27Qr45UR/ES5/M+EAEhY+VpqNop5WWFulBd4EHVBiT
         OM1mXELjPcB5Lt+EUwMNJt8sy1pSY8sW8pjwIyC0pCnsmF/IZbZjKQEgksieO1lhqA7Z
         eL0A+d9rOsyay7LPP+JIG+SD7CB9PaHUe6PbPdpt4+f1w3VwNrVqXQ5sEGx51FlIeRJZ
         aQJODir/43Mz8XPUgfvQefimyt0pHrBLMUi6GzAA9pH6SYcrl0sr17BVxu1lzcNgiSWr
         g8FT+kP55kmqwOCoBJEpbloUKFyqmyvd4fLGtiQDbny/QaxK5ZmIF1r9dBP/oKzRMaIV
         Ob4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nQZJ7yPVXRTTpaaOFiG+mf5v7oE6uXQPB9nQE0+9z00=;
        b=oNj1D58EABLAY4bw6nsnKuUKCXPNUaVJoHp/GEjwT4EQm74hDDNnWBsyNXqaD5HEXC
         SccN9bwHUDbFRq1/5Id3pM80EfZLWV/dhVY7VfDn2rjdlwN4eX9O8KGPBbYz87NuR2WT
         60U5Hoay6Jgn1/hmha9Pb4PePvL0TBxe0YMCpO+UBujullKECfxlMrQ4xKWuc6l6POu3
         RdzseEmFvp+pZewjNkYpNFuLEBidj0njhYDcM2nIi2+2WGuY8FyhtWGvRc/6AjvXTLo5
         kkhOvzellwTqAu5kl4uNj0Ib7T5JZ++IgFbGKMp3LbUBVVGIQQ5U4FDi4Ecufxbn9oGf
         ZNnA==
X-Gm-Message-State: AOAM531Y3boQt+fkkQYaW3mopK0CqXMaXn48mcmJbBQoo7U2faGXiDhH
        ngLRoXRv1xQ56+lDQM5kGIvNd07Vrzk=
X-Google-Smtp-Source: ABdhPJzG7WYvork9Tes+VlPuNvwihHvcl8sTJrwXiV8/ppE0sStVQdkf17Btzd/hAjb0zEMqtvhefA==
X-Received: by 2002:a7b:cd06:: with SMTP id f6mr15826385wmj.66.1600090662772;
        Mon, 14 Sep 2020 06:37:42 -0700 (PDT)
Received: from arrakis.kwizart.net (lfbn-nic-1-212-171.w2-15.abo.wanadoo.fr. [2.15.59.171])
        by smtp.gmail.com with ESMTPSA id a11sm18532488wmm.18.2020.09.14.06.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 06:37:42 -0700 (PDT)
From:   Nicolas Chauvet <kwizart@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH 1/4] ARM: tegra: Add missing gpu-throt-level to tegra124 soctherm
Date:   Mon, 14 Sep 2020 15:37:36 +0200
Message-Id: <20200914133739.60020-2-kwizart@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200914133739.60020-1-kwizart@gmail.com>
References: <20200914133739.60020-1-kwizart@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On jetson-tk1 the following message can be seen:
 tegra_soctherm 700e2000.thermal-sensor: throttle-cfg: heavy: no throt prop or invalid prop

This patch will fix the invalid prop issue according to the binding.

Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>
---
 arch/arm/boot/dts/tegra124.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index 64f488ba1e72..a0fa5821a232 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -910,6 +910,7 @@ throttle-cfgs {
 			throttle_heavy: heavy {
 				nvidia,priority = <100>;
 				nvidia,cpu-throt-percent = <85>;
+				nvidia,gpu-throt-level = <TEGRA_SOCTHERM_THROT_LEVEL_HIGH>;
 
 				#cooling-cells = <2>;
 			};
-- 
2.25.4

