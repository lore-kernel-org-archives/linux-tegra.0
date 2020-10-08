Return-Path: <SRS0=64AB=DP=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B9D5C4363D
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 00:45:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C72BC20872
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 00:45:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LS+RlMnb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728074AbgJHAox (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 7 Oct 2020 20:44:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727955AbgJHAov (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Oct 2020 20:44:51 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D564DC061755;
        Wed,  7 Oct 2020 17:44:49 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id l126so2555812pfd.5;
        Wed, 07 Oct 2020 17:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=IuCBUp15lZeKEfl2Yp9frN2ksiQ3CTV4BmHQLcqxsps=;
        b=LS+RlMnbnUXM5It5pSQxgmEx464jlysolg5sKiBmgR7G9LlXxitEwRLLNhE9s/qxrv
         TQ+NOiHy04sgM3xVPwUMvuIkBijkozWpqv2U30ODPMxOnHtUcdALeJWCoRfNBnKPyg4x
         vEHW1ZjeYMDZxGS3X8mXjrbXlSFZCXchpSZEK0o+dcaOXPtiEjcUixW8hFoCNDuJTYyD
         M0p2CdpZa12MtUqCPfeUCQ+HYYvf8a21Kyazdz/OVSKN13FmpWv1aR4HW6K4Q1VaIQSE
         hwPc1kGUDViGRhTsLp7xVt+MRGW/pjrIcKEkp8f+n6gZ1PHljVMeSZOHL8a7pW1aOz9Z
         nULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=IuCBUp15lZeKEfl2Yp9frN2ksiQ3CTV4BmHQLcqxsps=;
        b=V9Ie7kJhh5OPmYWN07VtIcHCa7jspOome8hg9NcZieU2NMTLhVaJtEhAA6KjewF1DS
         PtEtBABYBsVQgEcRhSGCDKNyImlXnkJWNGjjLKaYBIOe/DOFGuHq759RccFFsxheymqc
         VADfhgO6RPkD1H2CF8Vtgb15wQByWlwtWx4nfa1WbJ7duTtdt7dqj5+ByHpjK8nuDp/H
         Ea4W2wsSqLuthmICdGPj/lnscSEg/93UBUxGsLZ43b3Kqxt/y5JzXwvOSGPlrXKWM3SR
         KXD3fg0/CKKGXcGyz/bcYu8Jfz30CMsmrKWPLiq/ZsY42rLmJO2xNTSSh1G2cTeBpIdg
         +lyA==
X-Gm-Message-State: AOAM533PcpiCV6IuczSNfuU0Bdw+cJk8xqakS1PSjgSbfBbQwQxmHmyI
        sB7wwn6AULGMgzNGkzcaEYI=
X-Google-Smtp-Source: ABdhPJyNNi1BvGMdSnSk2JD5/V8JbTuH5h06neaEf85eiiEADuim8rBItuOLsfhInv3Wzuxuy610ww==
X-Received: by 2002:a17:90b:4a0c:: with SMTP id kk12mr5295397pjb.207.1602117889393;
        Wed, 07 Oct 2020 17:44:49 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id z6sm4939922pfg.12.2020.10.07.17.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 17:44:49 -0700 (PDT)
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     krzk@kernel.org, thierry.reding@gmail.com, robh+dt@kernel.org
Cc:     jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] memory: tegra: Correct tegra210_mc_clients def values
Date:   Wed,  7 Oct 2020 17:37:43 -0700
Message-Id: <20201008003746.25659-3-nicoleotsuka@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201008003746.25659-1-nicoleotsuka@gmail.com>
References: <20201008003746.25659-1-nicoleotsuka@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Some def values are mismatched with Tegra X1 TRM, probably because
being copied from tegra124.c file. So this patch fixes them.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
---
 drivers/memory/tegra/tegra210.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/memory/tegra/tegra210.c b/drivers/memory/tegra/tegra210.c
index 088814279616..e8a7d266802c 100644
--- a/drivers/memory/tegra/tegra210.c
+++ b/drivers/memory/tegra/tegra210.c
@@ -24,7 +24,7 @@ static const struct tegra_mc_client tegra210_mc_clients[] = {
 			.reg = 0x2e8,
 			.shift = 0,
 			.mask = 0xff,
-			.def = 0xc2,
+			.def = 0x1e,
 		},
 	}, {
 		.id = 0x02,
@@ -38,7 +38,7 @@ static const struct tegra_mc_client tegra210_mc_clients[] = {
 			.reg = 0x2f4,
 			.shift = 0,
 			.mask = 0xff,
-			.def = 0xc6,
+			.def = 0x1e,
 		},
 	}, {
 		.id = 0x03,
@@ -52,7 +52,7 @@ static const struct tegra_mc_client tegra210_mc_clients[] = {
 			.reg = 0x2e8,
 			.shift = 16,
 			.mask = 0xff,
-			.def = 0x50,
+			.def = 0x1e,
 		},
 	}, {
 		.id = 0x04,
@@ -66,7 +66,7 @@ static const struct tegra_mc_client tegra210_mc_clients[] = {
 			.reg = 0x2f4,
 			.shift = 16,
 			.mask = 0xff,
-			.def = 0x50,
+			.def = 0x1e,
 		},
 	}, {
 		.id = 0x05,
@@ -80,7 +80,7 @@ static const struct tegra_mc_client tegra210_mc_clients[] = {
 			.reg = 0x2ec,
 			.shift = 0,
 			.mask = 0xff,
-			.def = 0x50,
+			.def = 0x1e,
 		},
 	}, {
 		.id = 0x06,
@@ -94,7 +94,7 @@ static const struct tegra_mc_client tegra210_mc_clients[] = {
 			.reg = 0x2f8,
 			.shift = 0,
 			.mask = 0xff,
-			.def = 0x50,
+			.def = 0x1e,
 		},
 	}, {
 		.id = 0x0e,
@@ -108,7 +108,7 @@ static const struct tegra_mc_client tegra210_mc_clients[] = {
 			.reg = 0x2e0,
 			.shift = 0,
 			.mask = 0xff,
-			.def = 0x13,
+			.def = 0x2e,
 		},
 	}, {
 		.id = 0x0f,
@@ -136,7 +136,7 @@ static const struct tegra_mc_client tegra210_mc_clients[] = {
 			.reg = 0x2f0,
 			.shift = 0,
 			.mask = 0xff,
-			.def = 0x50,
+			.def = 0x1e,
 		},
 	}, {
 		.id = 0x11,
@@ -150,7 +150,7 @@ static const struct tegra_mc_client tegra210_mc_clients[] = {
 			.reg = 0x2fc,
 			.shift = 0,
 			.mask = 0xff,
-			.def = 0x50,
+			.def = 0x1e,
 		},
 	}, {
 		.id = 0x15,
@@ -380,7 +380,7 @@ static const struct tegra_mc_client tegra210_mc_clients[] = {
 			.reg = 0x350,
 			.shift = 16,
 			.mask = 0xff,
-			.def = 0x65,
+			.def = 0x80,
 		},
 	}, {
 		.id = 0x44,
@@ -620,7 +620,7 @@ static const struct tegra_mc_client tegra210_mc_clients[] = {
 			.reg = 0x2f0,
 			.shift = 16,
 			.mask = 0xff,
-			.def = 0x50,
+			.def = 0x1e,
 		},
 	}, {
 		.id = 0x60,
@@ -648,7 +648,7 @@ static const struct tegra_mc_client tegra210_mc_clients[] = {
 			.reg = 0x3bc,
 			.shift = 0,
 			.mask = 0xff,
-			.def = 0x49,
+			.def = 0x5a,
 		},
 	}, {
 		.id = 0x62,
@@ -676,7 +676,7 @@ static const struct tegra_mc_client tegra210_mc_clients[] = {
 			.reg = 0x3c4,
 			.shift = 0,
 			.mask = 0xff,
-			.def = 0x49,
+			.def = 0x5a,
 		},
 	}, {
 		.id = 0x64,
@@ -956,7 +956,7 @@ static const struct tegra_mc_client tegra210_mc_clients[] = {
 			.reg = 0x3ec,
 			.shift = 16,
 			.mask = 0xff,
-			.def = 0xff,
+			.def = 0x80,
 		},
 	}, {
 		.id = 0x86,
-- 
2.17.1

