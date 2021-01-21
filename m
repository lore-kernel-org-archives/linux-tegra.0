Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4747C433E6
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 18:49:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 98E3123136
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 18:49:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbhAUSsH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Jan 2021 13:48:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727466AbhAUS0A (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Jan 2021 13:26:00 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 355CDC06178C;
        Thu, 21 Jan 2021 10:23:29 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id m22so3877692lfg.5;
        Thu, 21 Jan 2021 10:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o+6Qr9g4GUhZQovcGPL0QQ9GPJLut7iCnnUkdOOvXTs=;
        b=LKSG5HyJfv+CRE2WARL/dTEnMBsuHMPSYjspr/jwJdGYcK+PHbE2gmUUdGKufEYZrc
         5QctPpyjUXlbxgks/XoJLk6gi7vtonVv/x6eim6WFZagZuQDKnI/8SC43tXDwZQYWptl
         Glj0QaPpFrTx4+B2wNGz0BK0ZKzPKCdk2bU1dPV6eiW37Ue8Bd1Kz3ZWfKWoXsRZrPig
         FAuu0p0dVu6+iA1RHtBJCPqDDMzbd6k4xT9Nt0NuYqyKLbgRE2IYEQ0ogITMlIGCVSGK
         goiz+KLH7igTlXBStRa43dqKBkemDe8FaUHsG+mKlo8DyC6WkaIeemPVjaibmDy6nX7d
         50gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o+6Qr9g4GUhZQovcGPL0QQ9GPJLut7iCnnUkdOOvXTs=;
        b=J/sVO6EO86dIbteR0DKwc6MzFRYgE7e21HvoueDe3vc7BlSyM6qYYgVPNIBxLkgSIP
         Ngaqli8GcLuxz2AcRxYuiwP3YQBizTH2v1HtqliUCXIkG1Bi/7khkuKLQF8h09sn8H2v
         gcnxXjbQF1uY+xVQjT5x/61lOuu5czlGAAsANBvvK4OCdvGSlR+WL74aD/00dlsPayGn
         U97lynBY3I+TCl403NNHbsE97X39ZnzFWVkR+pL/STifYdvNjtd63ty/8gXMr3Me1QP2
         yjO3Smuh1u7siPIiDXBlvv7N7oQSy1E7a5AixvRJXqTzFVIOh6pL7nOOe4amYwoSzzM2
         be3g==
X-Gm-Message-State: AOAM5320eZ7HqTvvaJ0u2/nBmtRRW8EP4TNmn6iphJwiG9vAAlcKf2Ss
        bwYqM34Bxuq/bSe3ek8sezc=
X-Google-Smtp-Source: ABdhPJzHJv0Wq+Y78TWtoUAd7eukg1lEtqLwT82rLSQ1dF/iRsvB8HaBJwyCxoJdMvWBxB6maw/EGw==
X-Received: by 2002:a05:6512:2242:: with SMTP id i2mr211459lfu.573.1611253407792;
        Thu, 21 Jan 2021 10:23:27 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id f186sm600537lfd.289.2021.01.21.10.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 10:23:27 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 07/13] ARM: tegra: acer-a500: Reduce thermal throttling hysteresis to 0.2C
Date:   Thu, 21 Jan 2021 21:23:02 +0300
Message-Id: <20210121182308.16080-8-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121182308.16080-1-digetx@gmail.com>
References: <20210121182308.16080-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The 2C hysteresis is a bit too high, although CPU never gets hot on A500.
Nevertheless, let's reduce thermal throttling hysteresis to 0.2C, which is
a much more reasonable value.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index 8531abf329c6..64a303cc5395 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -1058,7 +1058,7 @@ trips {
 				trip0: cpu-alert0 {
 					/* start throttling at 50C */
 					temperature = <50000>;
-					hysteresis = <3000>;
+					hysteresis = <200>;
 					type = "passive";
 				};
 
-- 
2.29.2

