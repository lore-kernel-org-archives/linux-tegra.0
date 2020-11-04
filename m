Return-Path: <SRS0=aGvU=EK=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E4CC4741F
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 14:13:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B88DC223AB
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 14:13:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GFmGr5jD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726849AbgKDONI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 4 Nov 2020 09:13:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729883AbgKDONG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 Nov 2020 09:13:06 -0500
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B29D4C061A4A
        for <linux-tegra@vger.kernel.org>; Wed,  4 Nov 2020 06:13:05 -0800 (PST)
Received: by mail-lj1-x241.google.com with SMTP id o13so14806804ljj.11
        for <linux-tegra@vger.kernel.org>; Wed, 04 Nov 2020 06:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k7gw6qW2lC2yTszXrzNJc/JVFfUwx/vfMuC7Ix7Oz4M=;
        b=GFmGr5jDSACpN8oAnDARj7iSTEIOFtJ6B73rrbijL91JwnqNuaMGSfmisgGVyB5p4M
         6wn97P9nWMJi6WXJ13H31hBM99sj6d2z4cprrZh0TcOQ834FHVBemckPW5G56rhBjO2o
         qN/PK5CvNZq+VvKITZKKip20n71bZQvlcnEIZ2h+PY36hYAwMBlCd3D14Q97BP2c0KUu
         J1Aqjcpn8okh5ZNtMw2wclmZNxnBIqZ/7tNrBZX5ErHBSNKtW12/p+bL0fHl6gu87mY8
         j9jyGWB3lgdFZX80ERqbk7cSKrWz7kfdq+Y1T8fSJHJ97P1gq1gTMH8Bbb6zswAlCjUR
         +btg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k7gw6qW2lC2yTszXrzNJc/JVFfUwx/vfMuC7Ix7Oz4M=;
        b=MID/dWgg/Jkt7BJZVFBBp1awwz/lbvivgRYb1d/JYjvx7cCuaY6jNcXPTq9Ydlt8jP
         8eMSNw13qyaDnHQDdSCY+ZdopJO62FKCRv5CJYwNi1eVMEG8ATn4wdxQN7WjZM9CCGpU
         ke0y3ojavFdMGsF4zwPzfg97qJ0KXacaLoiOHvZeGtgKMDPbXiVg4SkKlSoXbJZVQ28P
         HfdWobbZa7c7jawdp9FWaKan2dYrnH6SCWBkWLUfkdsVDL8EmaD2sPAUMLfzSKaXuM8T
         eV5ya2Zyji6kOrRReFngPcz5zErhUtAawUUURx20U+SlcDLjV3Nb74zrrrwU79NwtaHb
         dqOg==
X-Gm-Message-State: AOAM533JHwQOOEKxkBTejdEvy6pXdJtGE3sTi/hwIC30l3iXf4K0Fssj
        d9+3A3d+Mp63BRMg6cz8+3s=
X-Google-Smtp-Source: ABdhPJyXoOkJBOJqdoJJNg6hl2Q/iHHxnP1HsU458G0D3l9/G4LVPy4LfZLgvKeJSu9xXsftGtAG0A==
X-Received: by 2002:a2e:8917:: with SMTP id d23mr10290872lji.66.1604499184281;
        Wed, 04 Nov 2020 06:13:04 -0800 (PST)
Received: from localhost.localdomain (109-252-192-83.dynamic.spd-mgts.ru. [109.252.192.83])
        by smtp.gmail.com with ESMTPSA id z10sm411853lfi.76.2020.11.04.06.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2020 06:13:03 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org
Subject: [PATCH v2 3/8] ARM: tegra: nexus7: Correct thermal zone names
Date:   Wed,  4 Nov 2020 17:12:46 +0300
Message-Id: <20201104141251.25834-4-digetx@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201104141251.25834-1-digetx@gmail.com>
References: <20201104141251.25834-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Rename thermal zones in order fix dt_binding_check warning telling that
names do not match the expected pattern.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
index 2b405872ad2d..543c52cd8260 100644
--- a/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
+++ b/arch/arm/boot/dts/tegra30-asus-nexus7-grouper-common.dtsi
@@ -1267,14 +1267,14 @@ sound {
 	};
 
 	thermal-zones {
-		nct72-local {
+		skin-thermal {
 			polling-delay-passive = <1000>; /* milliseconds */
 			polling-delay = <0>; /* milliseconds */
 
 			thermal-sensors = <&nct72 0>;
 		};
 
-		nct72-remote {
+		cpu-thermal {
 			polling-delay-passive = <1000>; /* milliseconds */
 			polling-delay = <5000>; /* milliseconds */
 
-- 
2.27.0

