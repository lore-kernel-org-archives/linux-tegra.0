Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A56AC433F1
	for <linux-tegra@archiver.kernel.org>; Sat, 20 Mar 2021 15:29:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF1386196F
	for <linux-tegra@archiver.kernel.org>; Sat, 20 Mar 2021 15:29:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhCTP2d (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 20 Mar 2021 11:28:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbhCTP2O (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 20 Mar 2021 11:28:14 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28943C061762;
        Sat, 20 Mar 2021 08:28:14 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id g8so7459199lfv.12;
        Sat, 20 Mar 2021 08:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=31Nhu02UaySOlzZjP4Z4oOYaHzbyJnMEsxYLdbQrBR8=;
        b=F6u/3HHKgDetdOhQzeN9GXFfTkwhueTMyF6GJr7eN+OHXoscULSUiGy21PQflT5tqk
         nV/EAq05ysh6tz8p+xTVkt0MkCyRCq9fT35EQGTDpCo8WOJesemtSvu7lCgTHhw+f6SA
         NiSM8PNb/FwWZm4Q7pMvauaMVKApB5p4eTEEDChwaBcx1f87ctM5YJ27YR/de4naggAS
         37DMTpGP9d4EOfjYbyJ4Gs8qObOtsmnU0PjUBZ5uKCeE0wqKv59r36VjTPkB1C3XSTqV
         aUl5auRVcU4aTwS87tjcjJ4INS6Tt3cHOil3aMuDVSr3OCnKfAo6NYjc5/UbhvAxcsRJ
         ODJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=31Nhu02UaySOlzZjP4Z4oOYaHzbyJnMEsxYLdbQrBR8=;
        b=HvZwmNb3R4YsjQWGh27hQEx1Etn9dOM3xlLww2p2GklCMc3UCN3LdpshLqUFY2D/FR
         Yu781pLGWbQd90cHSQXKiBt2I5tZo1H8JxZBGn6+Rd1dQzn9z9rn5bOmNWSEbzmjAP71
         7wJNKQTxFwLwoD/fLLXn3Pd8wB2P6cLigP0ydGWiGzwLnRp1MdDjS5lUHYRURGHeXmjo
         na03dH3JAV/uh+2WK5TJp8m5Q3ASAoSx7RrIFCYHfiyoyiW/dFVFEuGvAxtrw/2NUFNt
         xDNCJZct14golAPFS99kF1c62rNNi3GotMTDXhw5C5AhBLhdlox81P2iT5rVomS1V0AH
         z0tg==
X-Gm-Message-State: AOAM5319UMVHjNCIehFjVf+VHpWcRyyKJSTYWHGA3yQGLOr/OUImxdjg
        itObHlPIJ4lq8JMA4esm1Gk=
X-Google-Smtp-Source: ABdhPJyBQHR7oa5gnUc2dv9FPsDXPXT0beeMX+OlhzK5GJvgJCjMZyNkZRkf1sfL8aJkL0zhiyi1rw==
X-Received: by 2002:a19:5213:: with SMTP id m19mr3880944lfb.203.1616254092662;
        Sat, 20 Mar 2021 08:28:12 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id t17sm957024lft.224.2021.03.20.08.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 08:28:12 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc:     linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v6 5/7] MAINTAINERS: Hand Tegra clk driver to Jon and Thierry
Date:   Sat, 20 Mar 2021 18:26:46 +0300
Message-Id: <20210320152648.8389-6-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210320152648.8389-1-digetx@gmail.com>
References: <20210320152648.8389-1-digetx@gmail.com>
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
index 08f9c2b7f3b3..830ade14ee68 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17681,8 +17681,8 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git
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

