Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F487C4160E
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 16:38:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E33EB64FD9
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Mar 2021 16:38:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231789AbhCLQhy (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Mar 2021 11:37:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232288AbhCLQh2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Mar 2021 11:37:28 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFFDDC061574;
        Fri, 12 Mar 2021 08:37:27 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id f16so7538303ljm.1;
        Fri, 12 Mar 2021 08:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rN0PdNsarvpSbFNtscorTtU4WqxtotSTOEqaQtl8W7M=;
        b=T4Eqb5s0uKOimbgMRwHJO19r4JbObyXkpejxYJ4IiirFfj3XFiZOY2TCMdY5Dhp/f6
         8LQq2nmWaxldXy8KdD8QRPdkDJVYLP1uSsRONsQaUwNeq2MtxmSmduO4r9VkT58zMKPR
         Il1GnqN+8yr4Q/nidQAbZTqlNjKTop9ohiHcEulBsul6m22orFELHnX/W38kJDFbx1WK
         vUdPOtne2fJdqtqp1EkHKBfmRDM2+lupyF6p3FW2DqAVKsGf6+ztB70vmOm+rZFdk8e6
         QZ8Avsf8Zz10nrtlUxcZidVJdK0P5ogxz/vz9c4smOLnb/HqCDQsNQCj/Tev6zBtIB95
         XjgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rN0PdNsarvpSbFNtscorTtU4WqxtotSTOEqaQtl8W7M=;
        b=iPbkhjnoTkIveQOBFs4pXwPbr+ugOmeTKcKrt+bwOiMKB2vHYqOdAzCRQ2lT9KE1O5
         yjroT4hUdW6HOcEbb0SotwCedjIvBvLfHuiDz9M7bAbAhO04pdUYQxmg+ro5HmELGhmr
         qxoxEF2MsV5tozW8/PWWs8lakX1h8X3SPum3MXFiR8cJ4Objg7Xd5ct1GPU6f368Phxr
         eNrRubO5n5IteaXYnVJWHBdVgo4lXLi8TGnXDwP/39ivzP3Gg7qPBnFDUK05jNHR0xZy
         sZk/yFk9uvZd53sKdeHFiuTvJZKWTlu0JLx0s28kwVQBdenOt6xlYmR6w/Lb9j+MHR+L
         PTAQ==
X-Gm-Message-State: AOAM533PdY+tiXcpwxJZjIulq00pJAYPxlj6PHqOExZBwfsIFl5/Dorq
        M/7ZXI6BZVoxIUgN/BFXFro=
X-Google-Smtp-Source: ABdhPJy4k/UTupFu2cUtekPsBVBvVz5db2ovP5ycvoOW8WUitxTghZSNMaheATiJ1FI9BVMYnObwaQ==
X-Received: by 2002:a05:651c:2112:: with SMTP id a18mr2936789ljq.341.1615567046554;
        Fri, 12 Mar 2021 08:37:26 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id l21sm1771703lfg.300.2021.03.12.08.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 08:37:26 -0800 (PST)
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
Subject: [PATCH v4 5/7] MAINTAINERS: Hand Tegra clk driver to Jon and Thierry
Date:   Fri, 12 Mar 2021 19:36:30 +0300
Message-Id: <20210312163632.8861-6-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210312163632.8861-1-digetx@gmail.com>
References: <20210312163632.8861-1-digetx@gmail.com>
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
index b6dd8e9ebfcf..df76991aa855 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17627,8 +17627,8 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git
 N:	[^a-z]tegra
 
 TEGRA CLOCK DRIVER
-M:	Peter De Schrijver <pdeschrijver@nvidia.com>
-M:	Prashant Gaikwad <pgaikwad@nvidia.com>
+M:	Jonathan Hunter <jonathanh@nvidia.com>
+M:	Thierry Reding <thierry.reding@gmail.com>
 S:	Supported
 F:	drivers/clk/tegra/
 
-- 
2.29.2

