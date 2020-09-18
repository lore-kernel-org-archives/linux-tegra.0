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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FA6C43463
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Sep 2020 15:03:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EFFDD21D7B
	for <linux-tegra@archiver.kernel.org>; Fri, 18 Sep 2020 15:03:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ue89Aq0z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgIRPDN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 18 Sep 2020 11:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgIRPDN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 18 Sep 2020 11:03:13 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1701C0613CE
        for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2020 08:03:12 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id z9so5905635wmk.1
        for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2020 08:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1qKzeSW5r/FU37oFleaqW+7BnwDvRMS2XHIjQKn0VIk=;
        b=Ue89Aq0zA3ynws8rvUdVzHVjO7FqKIoCvecdg1tTivA3qSwgfSbo5jS6cP+nVh9AGo
         AnO7b5Y9uf0v15nIw8DPkgSGD/2YfbC7Gu/rdFBaByKz3bfzXg2wUZvVC/jGGNi+/Zw7
         UjEBtP9g3T5YOuwIgkKED5CVdJm0KDtDUoUyd1MHgTYoUAi+aO92fhZTgVkhXLBNq2BC
         /+KKOYO3IcPlVz8FNZADsTggtPduGH4kov7he0KgQLNyNcTuuYvamIsVYcKBiGTEe2Us
         rcWkAm/9rlb60VomjYWK8clYvPhphii5Mwzop57uD/Iib7wnTMm3yZumrdXz73/mBqWt
         Q/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1qKzeSW5r/FU37oFleaqW+7BnwDvRMS2XHIjQKn0VIk=;
        b=QBtMvrw7VpELftYqfU9MjNJTwsyVmC/yxPyDnmOnvHXePV4E7QLy6DM68uDPv9RKVB
         Rj/9+drWJ58/ezyDOetb6hb6btgtUmEJH9dotgW7kA6xB4Nzu4qutoFmfhxd268vT+Ci
         Wfp/A6Yu9QQnE3STZsdTQDKSITMlbgSuzV2iNz5W5syZUqy+R8d21US3+2Et6L7PSccg
         CAJ0AmOzDBLuQz64uWm2RjtRf++Q0bMtDXBtAjDUBqNasXFxTenSaQShz/SUqKiBjbEm
         qY27QRHhGsGfwBKPOeYJEyB3tdIVFzKswhhh6S4dlltYaDEHqaX/aI8kcd+GV/J/2TlU
         FMsQ==
X-Gm-Message-State: AOAM532qCk6Ct3is3O0L7d8meZ6zy46zhgMTYbTiJ5jutyIFHr8xC7Z2
        x+Fy+SD/XMxCyi7DgOf+pWs=
X-Google-Smtp-Source: ABdhPJz0qupsUhKOvffrkUG/2ijwCDfKvmbsCH5+lIm/TEn/vpp6adJcxyTUW+XSBMtFOhnNsw/Ttw==
X-Received: by 2002:a7b:c751:: with SMTP id w17mr15627189wmk.97.1600441391274;
        Fri, 18 Sep 2020 08:03:11 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id z14sm5786100wrs.76.2020.09.18.08.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 08:03:10 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/6] dt-bindings: Changes for v5.10-rc1
Date:   Fri, 18 Sep 2020 17:02:58 +0200
Message-Id: <20200918150303.3938852-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.10-dt-bindings

for you to fetch changes up to 2312c291f6ac340af88eee0867fdfdfa2299ffc3:

  dt-bindings: power: supply: Add device-tree binding for Summit SMB3xx (2020-09-18 15:54:50 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.10-rc1

This set of changes adds compatible strings for Tegra234 to existing
device tree bindings.

----------------------------------------------------------------
David Heidelberg (1):
      dt-bindings: power: supply: Add device-tree binding for Summit SMB3xx

Thierry Reding (6):
      dt-bindings: misc: tegra-apbmisc: Add missing compatible strings
      dt-bindings: misc: tegra186-misc: Add missing compatible string
      dt-bindings: misc: tegra186-misc: Add Tegra234 support
      dt-bindings: tegra: Add Tegra234 VDK compatible
      dt-bindings: fuse: tegra: Add Tegra234 support
      dt-bindings: tegra: pmc: Add Tegra234 support

 Documentation/devicetree/bindings/arm/tegra.yaml   |   4 +
 .../bindings/arm/tegra/nvidia,tegra186-pmc.txt     |   3 +-
 .../bindings/fuse/nvidia,tegra20-fuse.txt          |   1 +
 .../bindings/misc/nvidia,tegra186-misc.txt         |   8 +-
 .../bindings/misc/nvidia,tegra20-apbmisc.txt       |  13 +-
 .../power/supply/summit,smb347-charger.yaml        | 152 +++++++++++++++++++++
 include/dt-bindings/power/summit,smb347-charger.h  |  19 +++
 7 files changed, 191 insertions(+), 9 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/supply/summit,smb347-charger.yaml
 create mode 100644 include/dt-bindings/power/summit,smb347-charger.h
