Return-Path: <SRS0=lnQj=EA=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFBDC5517A
	for <linux-tegra@archiver.kernel.org>; Sun, 25 Oct 2020 22:40:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F63F222EC
	for <linux-tegra@archiver.kernel.org>; Sun, 25 Oct 2020 22:40:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GciVH1rF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410359AbgJYWkq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 25 Oct 2020 18:40:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728277AbgJYWjo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 25 Oct 2020 18:39:44 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93552C0613CE
        for <linux-tegra@vger.kernel.org>; Sun, 25 Oct 2020 15:39:43 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id y16so7765391ljk.1
        for <linux-tegra@vger.kernel.org>; Sun, 25 Oct 2020 15:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G7XTh0Xz2PaM+NDv47By4VIJt2jNpKXeOTdI+p5weYI=;
        b=GciVH1rFVNCLmdWysm+wPS7H90eOC1mbRk5OYDqaRXAQj0O932h9Vv67tJrohqMAGL
         TFHVm/NpnWZZ/G0i92ubT3FgijWskVuhVT7Yt5qXFhWBUaZ6XsN+J1TeUkXkRMXykWlz
         0cr7qS2uhZ1Fkiw7qo7hCuMWkNdbLNQmG3hqZFiA2psbOtYPzhNmIv1AKtLJdhEd6N4K
         thq9BPCyog4LiLzH3ucbob23bBiLN/pInUd64VBFPHWn9zaasUYvGTTQbNhwyFgaG/2A
         sWCSAM/61F4KJDXcdDyA+ZBnHznTbKhJ/fZVtQX9Y3Z2yrxPWuzNVdgrPOW9oXeqyx0A
         xI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G7XTh0Xz2PaM+NDv47By4VIJt2jNpKXeOTdI+p5weYI=;
        b=FnLkNfJ0tyWQYD6Vv5Oe7IrQUYTznC9XIBPYWp0XxXzYz7CgXPhs1M6TmvIT0QCNtY
         jEImmEf8w2rv5yvZsjVffHZmI7zvlIZ5N6iqBq6wv9FQSjEI13oZ7H5Zt/YBH2oBpcjG
         uG6vCILij17DE5ovB/8JCyFxC10NTEgn5T8yQ38BGkyeDyb2Gtht1v7+MxT2ham6ej59
         KBwSOFgY1hJQz6ylFAIqIqAmQ42RyRCGCuRMDVL10KlxSSMxJoLSh3kFvWH/9pfDqtNL
         5K7rzRHlO4aP4jplN1wnQQA3t3bh912MAgW2h0627j2gJh6OGYWTAi6AmE+Wm8PcIb+U
         y0+w==
X-Gm-Message-State: AOAM533KprbqzuVzY/3YdC0t8ySWgs+qLBnDMErI7lDf5EPVKi/slM4X
        mYfNm4v9t6UNlkIXT6swS74=
X-Google-Smtp-Source: ABdhPJweC69mkE6RMJgQOKTayeW2tOo1mVg4KaBpos0+w0POjUmY2n15qCS7wUu0g1E1enKH/MttoA==
X-Received: by 2002:a2e:a376:: with SMTP id i22mr4820738ljn.325.1603665582120;
        Sun, 25 Oct 2020 15:39:42 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru. [109.252.193.186])
        by smtp.gmail.com with ESMTPSA id f15sm855957lfk.186.2020.10.25.15.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 15:39:41 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/6] ARM: tegra: acer-a500: Correct thermal zone names
Date:   Mon, 26 Oct 2020 01:38:46 +0300
Message-Id: <20201025223851.6984-2-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201025223851.6984-1-digetx@gmail.com>
References: <20201025223851.6984-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Rename thermal zones in order fix dt_binding_check warning telling that
names do not match the expected pattern.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index a0b829738e8f..372cc1b17eaf 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -1020,14 +1020,14 @@ sound {
 	};
 
 	thermal-zones {
-		nct1008-local {
+		skin-thermal {
 			polling-delay-passive = <1000>; /* milliseconds */
 			polling-delay = <0>; /* milliseconds */
 
 			thermal-sensors = <&nct1008 0>;
 		};
 
-		nct1008-remote {
+		cpu-thermal {
 			polling-delay-passive = <1000>; /* milliseconds */
 			polling-delay = <5000>; /* milliseconds */
 
-- 
2.27.0

