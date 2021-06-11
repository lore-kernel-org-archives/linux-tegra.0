Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1BD1C48BD1
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 16:39:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E2C4613BC
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 16:39:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbhFKQlR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Jun 2021 12:41:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbhFKQlQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Jun 2021 12:41:16 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4348BC061574;
        Fri, 11 Jun 2021 09:39:03 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id y7so6734536wrh.7;
        Fri, 11 Jun 2021 09:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vYIMo2kK1HR0D/HaxbggTV2mSjd3Ph79XbWAi78jtog=;
        b=HPmCRZaQTVPs7wWCO4Kdvv/bx6Mvg7TDmRumb5RWqXI7j5F4XBQQKm2HFtFi/9kNvB
         NKGdgB1EX/d9ZwdXIhGsxDnazcJ1fJWzhIWI1OW4s/UhBmzE3q0Yj6pAbRnqSi3fpq+e
         wITjoWp5qIG90SxbzngmcyM8sbtps1/F/OiM2yl521NkgRFG/TJctGxHKaGGBtl3vrfH
         SezkjZYCWnwn+wLhtfwQPCyPNHEA/NfM9ykw1IiAqQm87asbdckmp1F60YmLL87ejRZo
         Rq3MSidQyvk9SwBaEt2YjLCC/DmCA9Fa2EHkdyqAEuJ5GZCYgJ6KqRbBWqr5qc8huNcR
         CzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vYIMo2kK1HR0D/HaxbggTV2mSjd3Ph79XbWAi78jtog=;
        b=GVxJ8Pzw4DXj3N2H4uah3vRRMYJe8GB59iH36qgKSE54FAq6xBjOgbPvY/5y4KrW+4
         iwwVI+3HSYi8gLcC1rRYky1ooqxxpOVVsuR3WM4V+aEaQIrLywhM7n5UT6Im7YGVzj5D
         SkSlTaBqejojKEp3xBAYzeRSJYtclDqmZzmk2N+ffxRnZOa8APScxQg6u3SFZq3EEsZ0
         toxjZn1MrHTWoaQBokwPogqXB0ZKRaYaUJJHjYL7q/D66IIOICh5GRF6oMvoP02AWW9b
         uDmCWqm5noJDdQwr03nOjCFwSiYwLU3jrTYr+cUACHWlaqziRH/htPTrzJabhmRkaoxg
         AwZA==
X-Gm-Message-State: AOAM532TxT8zVMyNAKq2dhnWytY4KX3v5kC4alIfCPDo9yLcZL0oI844
        zkz0Zgr0BoyWMD7b+Zm4+xE=
X-Google-Smtp-Source: ABdhPJwtJKEBcxiZ9Un12SC7ERbwDyuA/+2tRc75Q2GSs7PFaDIOavICmsZji3vO74R6RhqECL1Qfw==
X-Received: by 2002:a5d:4903:: with SMTP id x3mr4887361wrq.376.1623429541940;
        Fri, 11 Jun 2021 09:39:01 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id l10sm7299105wrs.11.2021.06.11.09.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 09:39:00 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>, linux-phy@lists.infradead.org,
        linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL 1/2] phy: tegra: Changes for v5.14-rc1
Date:   Fri, 11 Jun 2021 18:40:36 +0200
Message-Id: <20210611164037.3567270-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Kishon, Vinod,

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.14-phy

for you to fetch changes up to 1f9cab6cc20c6ed35c659aa25e282265275f0732:

  phy: tegra: xusb: Add wake/sleepwalk for Tegra186 (2021-06-03 14:52:45 +0200)

There should be no need to pull this into the PHY tree because these
patches are dependencies for the second (USB) pull request in this set,
but I'm sending this out for completeness in case you need this in your
tree to resolve a conflict.

Thanks,
Thierry

----------------------------------------------------------------
phy: tegra: Changes for v5.14-rc1

This set of changes adds USB wake and sleepwalk support to Tegra210 and
Tegra186, which will be used to properly suspend and resume USB devices.

----------------------------------------------------------------
JC Kuo (7):
      phy: tegra: xusb: Move usb3 port init for Tegra210
      phy: tegra: xusb: Rearrange UPHY init on Tegra210
      phy: tegra: xusb: Add Tegra210 lane_iddq operation
      phy: tegra: xusb: Add sleepwalk and suspend/resume
      phy: tegra: xusb: Add wake/sleepwalk for Tegra210
      phy: tegra: xusb: Tegra210 host mode VBUS control
      phy: tegra: xusb: Add wake/sleepwalk for Tegra186

 drivers/phy/tegra/xusb-tegra186.c |  550 ++++++++++++-
 drivers/phy/tegra/xusb-tegra210.c | 1533 +++++++++++++++++++++++++++++++------
 drivers/phy/tegra/xusb.c          |   92 ++-
 drivers/phy/tegra/xusb.h          |   22 +-
 include/linux/phy/tegra/xusb.h    |   10 +-
 5 files changed, 1955 insertions(+), 252 deletions(-)
