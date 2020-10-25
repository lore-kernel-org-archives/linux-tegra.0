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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ECA3C5517A
	for <linux-tegra@archiver.kernel.org>; Sun, 25 Oct 2020 22:39:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E82522281
	for <linux-tegra@archiver.kernel.org>; Sun, 25 Oct 2020 22:39:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sBkYDmvo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392172AbgJYWjx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 25 Oct 2020 18:39:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1420204AbgJYWjr (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 25 Oct 2020 18:39:47 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDDAEC061755
        for <linux-tegra@vger.kernel.org>; Sun, 25 Oct 2020 15:39:45 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id x16so7769566ljh.2
        for <linux-tegra@vger.kernel.org>; Sun, 25 Oct 2020 15:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x7+3k77VziZlqAuYkKWri5r+rLW/rwKkN96g20Dr1IY=;
        b=sBkYDmvo1or+erMg6zBbz+FAXerRXx9tsFa8pC8aZqCFRWxmCJpFUw1SlikA4I51mt
         GqOBSENekpdPS1dF5UVXf25PonGkkAn95K0s7ATB20oNQk1ns2LkxVJMoBHAE2zBt8BD
         scmbo7tf2vv6Qe7Y1RhAgEnfR8efDGt8WF9J7ydXJzSiQXIlXT7o3pKVAjEW96t4UhPs
         DI8HeavosoabXJeFUfpR6UmvFch/QQsrglXygPezJJU4AMDeZ/5ft0j6x2m2peJIKHFV
         ozk7IkrQkbSxAwPGiLLEkjIq5f9TKpAFPi86cFNuMaVZpmNr7Xu0ImDn7oM417RayaYP
         cw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x7+3k77VziZlqAuYkKWri5r+rLW/rwKkN96g20Dr1IY=;
        b=qHkXkq/3LNZG8M01/NDQl/W1IFbAaytVoeXH4LeuO4sy4m9ukuIrs4Q3zquS7kw6gT
         nPD1R4wDUP4bYMoK2uO9szIf8XtVdbU+DRjzhWVNdJaJOvehYlPHMLio0D1Y5cuQVKGD
         5IJHlkoJM9qz+/1I8z8QIODtvWYFQ6iEBD4rDeZ6VnJN1SHszaP5ZcLpceE2R4pSF3Ke
         wi+2ZoiPEm3qxXSbthbqwYDJNe+OSSMjTlOgLYmoBHBpQRTXXVR+oc+96LzM+L+1on/t
         4dnHfmszINErrIj0ENnpJSN1JUEx3MJtqNnz6oJPPoMXt+kpFIo4e+4BtBSN+VCdyruA
         eFvg==
X-Gm-Message-State: AOAM530WrtcxImTFGJCRWa38Qa39vdWO9mSrt6DaDKenxbMoaSdT0uVh
        bTfqPUvra4WtFSrd65qudt0taK7uu7Y=
X-Google-Smtp-Source: ABdhPJxH9YTMMJgVye43zWAghpN1pfnixNFkjNHVyk1HnUmk7xvCSmPMB9w4+kNEpB5pxIA1nbgobw==
X-Received: by 2002:a2e:b557:: with SMTP id a23mr4880620ljn.5.1603665584510;
        Sun, 25 Oct 2020 15:39:44 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-186.dynamic.spd-mgts.ru. [109.252.193.186])
        by smtp.gmail.com with ESMTPSA id f15sm855957lfk.186.2020.10.25.15.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 15:39:44 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v1 4/6] ARM: tegra: nexus7: Improve CPU passive-cooling threshold
Date:   Mon, 26 Oct 2020 01:38:49 +0300
Message-Id: <20201025223851.6984-5-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201025223851.6984-1-digetx@gmail.com>
References: <20201025223851.6984-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The current CPU thermal limit is a bit inappropriate for Nexus 7 once
device is getting used on a daily bases. For example, currently it's may
be impossible to watch a hardware accelerated 720p video without hitting
a severe CPU throttling, which ruins user experience. This patch improves
the thermal throttling thresholds.

In my experience setting CPU thermal threshold to 57C provides the most
reasonable result, where device is a bit warm under constant load and
not getting overly hot, in the same time performance is okay. Let's bump
the passive-cooling threshold from 50C to 57C and also lower the thermal
hysteresis to 0.2C in order to make throttling more reactive.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index fa6bbec7cbc4..8d49860b135b 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -1255,9 +1255,9 @@ cpu-thermal {
 
 			trips {
 				trip0: cpu-alert0 {
-					/* start throttling at 50C */
-					temperature = <50000>;
-					hysteresis = <3000>;
+					/* throttle at 57C until temperature drops to 56.8C */
+					temperature = <57000>;
+					hysteresis = <200>;
 					type = "passive";
 				};
 
-- 
2.27.0

