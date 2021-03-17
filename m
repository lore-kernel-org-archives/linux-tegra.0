Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BFDC2BA4C
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Mar 2021 19:32:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B822C64F21
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Mar 2021 19:32:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233340AbhCQTbn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 17 Mar 2021 15:31:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233329AbhCQTb2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 Mar 2021 15:31:28 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4771BC06174A;
        Wed, 17 Mar 2021 12:31:28 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id j11so680668lfg.12;
        Wed, 17 Mar 2021 12:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GF3DcHHUOLlttQcVoG9eeaZ3qz6fRbPGS3Wp+pKETEc=;
        b=ZxX5+fvdVHMpjRfj4sIcBAa5A8fhI4Ibv/wFHs5CQ3T/MJmidP6ZBVKbVCYXmha4f/
         rnKNPeo0ot7BxnWJsGe/CHz+cdUKQjLr8CogAUHE4AC+6dSWQlX+u9BR8Sww+B6Y/ypf
         SjDBO+81/KxLIr7CpU6mwxe9D+jAYBrX/WjHYNAh8mLwvonS8T0HTGCOhZhpJShD42B0
         hOVL/o8jjvODY+Sf7a0vQUI25ykC2LLzOxie6JwRM6eB7Suu12HwUdPATVW3mPpWG8L/
         IOfzpABIubTH/1pIBfYXSqwP1aRX84SaWYPMmKbZ230CnIl6lVmgnwFOrOqNWi1VC9Zv
         bATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GF3DcHHUOLlttQcVoG9eeaZ3qz6fRbPGS3Wp+pKETEc=;
        b=RPO/fdTPq60WAgG4To5Jov9OCIGlpcxAU6tPMmz9wEYy/NxP9GlSjHjV46geTMHAJS
         bc/mRIEi56QETU7eU5dZ95F705NKoYkVr4hSVLr7zj9NLii7KBrNBf2WlwSUdUhqj75f
         9sPKvuQ0SqSxU5zWuSK1pY0jIXyvM++EUL+h18bb61FrvWy50mVNOXnjWrxsBFAHQjLC
         HxAnZnsuZKxEwnTM6eVo1eyEi+GVAQ0kBXZWoY9UTdf/dHBeZVHuhYlhgr9ik5tr6+Rs
         cfMK9759FgBkVS6XAHWcosAVHG6zr63G3sRHDFHmDQXFv09cQcxSXfedDs9SJYLIl4hX
         yxxw==
X-Gm-Message-State: AOAM5330qwOf00ftzbxSBrpbrYP6l79kl7RLyaqohSyBz+upOBtM0NdX
        nd2CjO2ppluK5sfG63B/Ydg=
X-Google-Smtp-Source: ABdhPJwj9OkxvY7Blrzy/r097Y6aXaAtpJhwXmyMYPiEHgK5I15UXIxfvynAYpa9zbNmxJhURxTTow==
X-Received: by 2002:a05:6512:6c4:: with SMTP id u4mr3043158lff.289.1616009486853;
        Wed, 17 Mar 2021 12:31:26 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id q24sm3623098lji.40.2021.03.17.12.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 12:31:26 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v5 5/7] MAINTAINERS: Hand Tegra clk driver to Jon and Thierry
Date:   Wed, 17 Mar 2021 22:30:04 +0300
Message-Id: <20210317193006.29633-6-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210317193006.29633-1-digetx@gmail.com>
References: <20210317193006.29633-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Peter and Prashant aren't actively maintaining Tegra clock driver anymore.
Jonathan and Thierry will pick up maintaining of the driver from now on.

Acked-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 CREDITS     | 6 ++++++
 MAINTAINERS | 4 ++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/CREDITS b/CREDITS
index cf8e23498a34..5577a2bdd93a 100644
--- a/CREDITS
+++ b/CREDITS
@@ -1250,6 +1250,10 @@ S: 29 Duchifat St.
 S: Ra'anana 4372029
 S: Israel
 
+N: Prashant Gaikwad
+E: pgaikwad@nvidia.com
+D: Maintained NVIDIA Tegra clock driver
+
 N: Kumar Gala
 E: galak@kernel.crashing.org
 D: Embedded PowerPC 6xx/7xx/74xx/82xx/83xx/85xx support
@@ -3387,7 +3391,9 @@ E:
 D: Macintosh IDE Driver
 
 N: Peter De Schrijver
+E: pdeschrijver@nvidia.com
 E: stud11@cc4.kuleuven.ac.be
+D: Maintained NVIDIA Tegra clock driver
 D: Mitsumi CD-ROM driver patches March version
 S: Molenbaan 29
 S: B2240 Zandhoven
diff --git a/MAINTAINERS b/MAINTAINERS
index b2baeb5e4a68..bee0e25510a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17634,8 +17634,8 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git
 N:	[^a-z]tegra
 
 TEGRA CLOCK DRIVER
-M:	Peter De Schrijver <pdeschrijver@nvidia.com>
-M:	Prashant Gaikwad <pgaikwad@nvidia.com>
+M:	Jonathan Hunter <jonathanh@nvidia.com>
+M:	Thierry Reding <thierry.reding@gmail.com>
 S:	Supported
 F:	drivers/clk/tegra/
 
-- 
2.30.2

