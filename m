Return-Path: <SRS0=kXk7=C3=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3237BC43464
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Sep 2020 15:03:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9597235FA
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Sep 2020 15:03:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ctQt0eGw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbgIRPDV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Sep 2020 11:03:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgIRPDV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Sep 2020 11:03:21 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AE7CC0613CE
        for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2020 08:03:21 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id c18so5958790wrm.9
        for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2020 08:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y9qhdBdqKt7haqnMYa8T1EtRMPe2y0qWWDUzYgf6xEg=;
        b=ctQt0eGwSdtbuxmOxMfZThK43FcwXhujW4DJx2UoQ3rSpU2YLURVg/E3eVNe5sjAqd
         IidWDl70tWcAWL9aZ3ixHMFbZiRcHQErlzFgmixdzZJUVQDjRT4glHBKTwEvNhbjMydY
         mZ9QJYafbf/522akDWxP17FFz39p94L00ppvAt9Y0UqPk/xWYEuWeCsEq8y8onokMzeJ
         XqnS/uHvZ2PkzGU4wKEgAuOSfpw5AIScN+d8cUVvEvkScMVvT+8NcINonLALK6SgaCei
         bQ44ROX+l/BiBaO70cZ+IHh+DaPuMa4HYDll9e+Wj4dzWhto1ICuJnKA+orVERsOiAB7
         Tahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y9qhdBdqKt7haqnMYa8T1EtRMPe2y0qWWDUzYgf6xEg=;
        b=sQdNxhZfOGxRlxTXh6ZyMiavPFokKsC2ER4Ei5SjBxs3NFAPYfsQ4n1psGJ+RscdFS
         WADBQ1fPnZwvUwwcYya/8h2sO5DS7TtBg/HXX9StnhLKAgcyv5b7FZUe5D+Th7rw2xOk
         mlWKfAcmzrE4U3fHB7hONs8UJFZGYxknNCYducMUSqe+zIX5VpeQZflxuAgA9OSN9ogE
         uCGChyHvNWPsXkS8CLJUQbOXpBKNLze1Lxr74ego3Yhhdg0p7JSErn+XMYY/m1VejNb5
         OedB6ETvSJBBwlSzBkHcwiBq3hnG1kbe7Nv3zYoy5HyLXck5cRkbk7OVUnoWm7rD4wuG
         JQzw==
X-Gm-Message-State: AOAM5302aS2BHV1RvmSr6TKFwtukJEER2z90vyCt+1Ja36kf6Zj5ue3C
        1EjuEYlEiro8tBGrAuP79X4=
X-Google-Smtp-Source: ABdhPJz79t/SkVV2CtQUtoMr09BkMfm8+JDc3EnMd7HAX7LKYG+EdWthhiA+VDEFbu3o5plBp+fkEA==
X-Received: by 2002:a5d:680b:: with SMTP id w11mr40720860wru.73.1600441398724;
        Fri, 18 Sep 2020 08:03:18 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id w15sm5451958wro.46.2020.09.18.08.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 08:03:18 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] ARM: tegra: Changes for v5.10-rc1
Date:   Fri, 18 Sep 2020 17:03:01 +0200
Message-Id: <20200918150303.3938852-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200918150303.3938852-1-thierry.reding@gmail.com>
References: <20200918150303.3938852-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.10-arm-dt

for you to fetch changes up to c2ef3aa464a70f73f4fc763e6f54f689c2ee6d6a:

  ARM: tegra: nexus7: Add SMB347 battery charger (2020-09-17 18:09:40 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Changes for v5.10-rc1

These changes extend support on the Nexus 7 and Acer A500 devices.

----------------------------------------------------------------
David Heidelberg (2):
      dt-bindings: power: supply: Add device-tree binding for Summit SMB3xx
      ARM: tegra: nexus7: Add SMB347 battery charger

Dmitry Osipenko (8):
      ARM: tegra: nexus7: Add aliases for MMC
      ARM: tegra: acer-a500: Add aliases for MMC
      ARM: tegra: acer-a500: Remove atmel,cfg_name property
      ARM: tegra: acer-a500: Correct PINCTRL configuration
      ARM: tegra: acer-a500: Set WiFi MMC clock rate to 50 MHz
      ARM: tegra: acer-a500: Use PLLC for WiFi MMC clock parent
      ARM: tegra: nexus7: Use PLLC for WiFi MMC clock parent
      ARM: tegra: nexus7: Add touchscreen

Thierry Reding (7):
      dt-bindings: misc: tegra-apbmisc: Add missing compatible strings
      dt-bindings: misc: tegra186-misc: Add missing compatible string
      dt-bindings: misc: tegra186-misc: Add Tegra234 support
      dt-bindings: tegra: Add Tegra234 VDK compatible
      dt-bindings: fuse: tegra: Add Tegra234 support
      dt-bindings: tegra: pmc: Add Tegra234 support
      Merge branch 'for-5.10/dt-bindings' into for-5.10/arm/dt

 Documentation/devicetree/bindings/arm/tegra.yaml   |   4 +
 .../bindings/arm/tegra/nvidia,tegra186-pmc.txt     |   3 +-
 .../bindings/fuse/nvidia,tegra20-fuse.txt          |   1 +
 .../bindings/misc/nvidia,tegra186-misc.txt         |   8 +-
 .../bindings/misc/nvidia,tegra20-apbmisc.txt       |  13 +-
 .../power/supply/summit,smb347-charger.yaml        | 152 +++++++++++++++++++++
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    |  30 ++--
 .../dts/tegra30-asus-nexus7-grouper-common.dtsi    |  54 +++++++-
 include/dt-bindings/power/summit,smb347-charger.h  |  19 +++
 9 files changed, 264 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/supply/summit,smb347-charger.yaml
 create mode 100644 include/dt-bindings/power/summit,smb347-charger.h
