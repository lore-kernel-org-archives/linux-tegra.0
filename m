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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDDC3C48BD1
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 16:39:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB96B6101B
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Jun 2021 16:39:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbhFKQlP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Jun 2021 12:41:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbhFKQlO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Jun 2021 12:41:14 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD06FC0617AF
        for <linux-tegra@vger.kernel.org>; Fri, 11 Jun 2021 09:39:05 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id k5-20020a05600c1c85b02901affeec3ef8so9051901wms.0
        for <linux-tegra@vger.kernel.org>; Fri, 11 Jun 2021 09:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YBWXbPTt5mAHxR/Tpna375Q9I2cVf+MKeEc1yT/OvlE=;
        b=X76WYQgB9Uel+1VqQWMOhPWT0U++aPZIImiQ9bnoD5wQ/JTvWM2jmms0SpJGsSCeQ7
         KTzPxn68OKYxE7hriuI9zSt8PH4M9hMEE8tbDYKYqJEybO0/a9OhgrRUqGfxEBci06ZF
         dQUOJZE5e5BiXV1A51tfJwbUiR5VkKNRslFVYY1ed+LX+aAWiVnUTS9H6ICwvW644s4d
         qW9elTSq1oICBpZ3+gjFN1JUFRIe98pAPofJhQykutyLP+tUaWNnHeprI+331nN7pGcY
         o3paSvJmrMg8+6WOu6Yy3Zs4AlBALgtJUPaitxDqVw+QPtlvb96NF5oBN5sJq6wXMM56
         5ruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YBWXbPTt5mAHxR/Tpna375Q9I2cVf+MKeEc1yT/OvlE=;
        b=PqKUnH1EHUZ3Zakv5lTrLRhav5nQJVJin6ykov2Lb1AaWfohRfkzUh+XBAqXKt8RQx
         6sigCd/Z67AzISKm3t+fWgDcbJGZfHBcJYfvX5cvCDYmKPBY6OvapuMNoHdIT6bxW4XR
         ARKpgGla+XV0asdENFG+VJANAEIM1CjjLeghuiDBI2U0LOrkbPcSSI1mZPMoEXMIIMPu
         9996DLvNxOP1DCFdv99nJ4rqwYquxA2ngCPeP7eSOhxDTBosC0AfzPnLkNqUngWC7va5
         mB+sYXjC6Ju5Xx4StXozyG6PMVuhel2UL70kY2N32hySBlm68EuDpuQkmBPvME36h8nC
         T/tw==
X-Gm-Message-State: AOAM5305+YYgvUcQwV4CJNXnRS9ShTLmtl/mVQGJgh9WuTFPh3KQcguU
        bYzqnlFUjTw40+LCAa03fzU=
X-Google-Smtp-Source: ABdhPJyjem/qQMuuB0A5uXCtiX19rwjNxRGalVwqIGepblIsxsGMK6AvOwuFjsdwmvnvV6iVo9lWkg==
X-Received: by 2002:a1c:b087:: with SMTP id z129mr20677693wme.67.1623429543577;
        Fri, 11 Jun 2021 09:39:03 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id o5sm7783932wrw.65.2021.06.11.09.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jun 2021 09:39:02 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        "Vinod Koul linux-usb @ vger . kernel . org" <vkoul@kernel.org>,
        linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL 2/2] usb: tegra: Changes for v5.14-rc1
Date:   Fri, 11 Jun 2021 18:40:37 +0200
Message-Id: <20210611164037.3567270-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210611164037.3567270-1-thierry.reding@gmail.com>
References: <20210611164037.3567270-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Greg, Felipe,

The following changes since commit 1f9cab6cc20c6ed35c659aa25e282265275f0732:

  phy: tegra: xusb: Add wake/sleepwalk for Tegra186 (2021-06-03 14:52:45 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-5.14-usb

for you to fetch changes up to 971ee247060d88dceb72428b5d203687312884f4:

  usb: xhci: tegra: Enable ELPG for runtime/system PM (2021-06-11 18:15:46 +0200)

This is a set of changes that was supposed to go into v5.13 but missed
the window by just a couple of days. I've since taken this for a spin
in linux-next through the Tegra tree and everything seems A-OK.

Note that this includes the contents of the first pull request in this
set because of a build-time dependency. I'm assuming that all of this
will go through Greg's USB tree, in which case there's no reason to pull
in the first pull request since it's already included in this one.

Thanks,
Thierry

----------------------------------------------------------------
usb: tegra: Changes for v5.14-rc1

Implements proper suspend/resume for the XUSB controller found on recent
Tegra chips.

----------------------------------------------------------------
JC Kuo (2):
      usb: xhci: tegra: Unlink power domain devices
      usb: xhci: tegra: Enable ELPG for runtime/system PM

Thierry Reding (1):
      Merge branch 'for-5.14/phy' into for-5.14/usb

 drivers/usb/host/xhci-tegra.c | 613 +++++++++++++++++++++++++++++++++---------
 1 file changed, 482 insertions(+), 131 deletions(-)
