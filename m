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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D65C43461
	for <linux-tegra@archiver.kernel.org>; Mon, 14 Sep 2020 13:39:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91CBA216C4
	for <linux-tegra@archiver.kernel.org>; Mon, 14 Sep 2020 13:39:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qsB3JFiI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbgINNiz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 14 Sep 2020 09:38:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbgINNht (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 14 Sep 2020 09:37:49 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EF3CC06178B
        for <linux-tegra@vger.kernel.org>; Mon, 14 Sep 2020 06:37:49 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id d4so42776wmd.5
        for <linux-tegra@vger.kernel.org>; Mon, 14 Sep 2020 06:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IQU/5no96PfQVnDWZvRJxAMbJR8IojKL6s+SB7SMMPA=;
        b=qsB3JFiIIoFf7VC8hVaXdeCovxGLCxGQg1BEyDwsmkE3arg1wdOseM/lHAUg/8AHKr
         XYsHwN83c2aRlXOYPOL1VTUiBthFV/G7Bu3am4WoDdh/5H5IuS5dVZzlIpr2ljgkAUgR
         mKf5Sg58OsROwQK0upk9kXy0Z2I48SyXsOTTDJPeDAjEu3TcxOzGla5TIEZjKtS1fIRR
         HxCVYGkuFtDY25bAHum/TNJA3SsdDvyAS0yCBfJJVhXsj7qo3dzVOKQX8b9yvCC/Iiz4
         mPLkRvqZRCIALSiWch28L3aJ7C1m7TKwSdPL1+OlwiW+FOfvezFMt8DDKwS/F9aXDhNz
         PZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IQU/5no96PfQVnDWZvRJxAMbJR8IojKL6s+SB7SMMPA=;
        b=f2TZvSMOwjF5iJ02tKMjivYaN1iWiqcWA+r26BqpCNDPrLu97gsyu2gd8qCWn3ntZI
         lXXdDQG4kh/wJEBoSVGDyZ6zCeRedUzBrfyR6Xl7ui86TbGHlJevgqrgaSIjJV8SGKrh
         fd1X4zc7GUawaqgURy7tZutuRPeXvk05UfULk7FQhDhlmIIH1i6BI+0PuNyu1is5egM/
         2zwp1EDSO9qdRthLqJ28ygf6MOWgrMssz6LOx0morcuS6sLHgWwcejvtpMYCA1zkL74j
         fXVimbCZl9hEI/TYHPwRJOTpgL90JofFxE5TgpyAOAjHb5967SBe2iBJJo4j8/Or0S0S
         jKoQ==
X-Gm-Message-State: AOAM532Ax7QGmUfaj7tKeAK0N8eym7vquoaIdc1PslpFQC4Y+cOZp83x
        SXgANReK6r+QxTlmx79osmc=
X-Google-Smtp-Source: ABdhPJxUEX0WLu+PFr4OTIX+EKQA+38Lw22k6baJmQmrmSYGblVP/nmpkKauqOZfWY5MlD/zipYzXQ==
X-Received: by 2002:a1c:2cc2:: with SMTP id s185mr3385229wms.77.1600090668150;
        Mon, 14 Sep 2020 06:37:48 -0700 (PDT)
Received: from arrakis.kwizart.net (lfbn-nic-1-212-171.w2-15.abo.wanadoo.fr. [2.15.59.171])
        by smtp.gmail.com with ESMTPSA id a11sm18532488wmm.18.2020.09.14.06.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 06:37:43 -0700 (PDT)
From:   Nicolas Chauvet <kwizart@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH 2/4] ARM: tegra: Add missing hot temperatures to tegra124 thermal-zones
Date:   Mon, 14 Sep 2020 15:37:37 +0200
Message-Id: <20200914133739.60020-3-kwizart@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200914133739.60020-1-kwizart@gmail.com>
References: <20200914133739.60020-1-kwizart@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

According to dmesg, thermal-zones for mem and cpu are missing hot
temperatures properties.

  throttrip: pll: missing hot temperature
...
  throttrip: mem: missing hot temperature
...

Adding them will clear the messages.

Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>
---
 arch/arm/boot/dts/tegra124.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
index a0fa5821a232..c71d597ace01 100644
--- a/arch/arm/boot/dts/tegra124.dtsi
+++ b/arch/arm/boot/dts/tegra124.dtsi
@@ -1248,6 +1248,11 @@ mem-shutdown-trip {
 					hysteresis = <0>;
 					type = "critical";
 				};
+				mem-throttle-trip {
+					temperature = <99000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
 			};
 
 			cooling-maps {
@@ -1299,6 +1304,11 @@ pllx-shutdown-trip {
 					hysteresis = <0>;
 					type = "critical";
 				};
+				pllx-throttle-trip {
+					temperature = <99000>;
+					hysteresis = <1000>;
+					type = "hot";
+				};
 			};
 
 			cooling-maps {
-- 
2.25.4

