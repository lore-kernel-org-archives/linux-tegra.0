Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6054FC433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 19:48:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 224F223A56
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 19:48:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726264AbhAUSrq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Jan 2021 13:47:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725764AbhAUS0A (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Jan 2021 13:26:00 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C61BC06178B;
        Thu, 21 Jan 2021 10:23:28 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id j3so3601086ljb.9;
        Thu, 21 Jan 2021 10:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HiatAXu0lWhq9U5RWdBwNxgOQuzIndCSuyRgNWnlqxw=;
        b=km3VqF/hpIhUAyhOvwRgcpp3F5RsD+yTlIbNRgjmqxiDQsp0SAgsKmf7csQ0Y52CzX
         uWXZU29hTBPNey4LYf+OmMLFb4o/KNl83KHyXE3pHABYwqUKQ5OhXWZqq7eae6zEvLAE
         ZOTBhRP2iSl178bFCKmS7BK2WZtInlmVjkPkigbkn08KyQUAVVRnWQSbSMUJ3PU3k3dh
         BpWREHq+qcjPNAqaRVGS5MPgkssiz84rQE/zBueN5gxgsDWSP6I5aF6WdSjUYLOKmLhu
         8CgxxM4YHdTzwsWLSAF15EZPB/+QFopaMh1LsAmiFiRSPHIDX/Xk1+CITfmyU5DUKMvS
         /LTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HiatAXu0lWhq9U5RWdBwNxgOQuzIndCSuyRgNWnlqxw=;
        b=PMdTz2IHFuh9RAx28cnic73PlasznpHIcTgvQ7Sf2LPvWAk3PqcQVbrDgCvtLXIjOW
         s2aKj+yEPNSX6UOr5ic0hzAh9r2+cTzXoWVyTLTEAcrb1b6RB779xZJwUlRQ2bNbegtO
         uOw7rnTTYDPT59SY2IBTrpsgCN6P7XiKI4YzoxUhRJAvS9Q2RgeL6i8DFsPBu6adRqo7
         aXcgHxbnRfm91L6zqy+w+/3Hd3SkFR5MlIrHtTRsBGa/fdbMzEPBuZZ8uTWfMmuRcVX6
         fb8EoTACxsqLxWvEmb6aRm2j82h2UNRxDexa4XBeHtqQlo7nhZqtS+8evNAmisIjeuxi
         JK1Q==
X-Gm-Message-State: AOAM532Fu73sevBXSifkBpowJnM9N2l7CsNRBK6+PXTSWk70VztuHMdN
        Nj0TDwIiMo6AZ9kXsjrW7OI=
X-Google-Smtp-Source: ABdhPJxvTyXUmbIvvCzC2vplEzsF7W8YCxflTUTxC/031//fWtqZLBqvgcOLJTdOT9kQa50ww4l7hA==
X-Received: by 2002:a2e:8144:: with SMTP id t4mr299903ljg.9.1611253406853;
        Thu, 21 Jan 2021 10:23:26 -0800 (PST)
Received: from localhost.localdomain (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.gmail.com with ESMTPSA id f186sm600537lfd.289.2021.01.21.10.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 10:23:26 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Peter Geis <pgwipeout@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 06/13] ARM: tegra: acer-a500: Enable core voltage scaling
Date:   Thu, 21 Jan 2021 21:23:01 +0300
Message-Id: <20210121182308.16080-7-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121182308.16080-1-digetx@gmail.com>
References: <20210121182308.16080-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Allow lower core voltages on Acer A500.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index 40c1bab22155..8531abf329c6 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -578,7 +578,7 @@ sys_reg: sys {
 
 				vdd_core: sm0 {
 					regulator-name = "vdd_sm0,vdd_core";
-					regulator-min-microvolt = <1200000>;
+					regulator-min-microvolt = <950000>;
 					regulator-max-microvolt = <1300000>;
 					regulator-coupled-with = <&rtc_vdd &vdd_cpu>;
 					regulator-coupled-max-spread = <170000 550000>;
@@ -619,7 +619,7 @@ ldo1 {
 
 				rtc_vdd: ldo2 {
 					regulator-name = "vdd_ldo2,vdd_rtc";
-					regulator-min-microvolt = <1200000>;
+					regulator-min-microvolt = <950000>;
 					regulator-max-microvolt = <1300000>;
 					regulator-coupled-with = <&vdd_core &vdd_cpu>;
 					regulator-coupled-max-spread = <170000 550000>;
-- 
2.29.2

