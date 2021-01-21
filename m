Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96D12C433E9
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 22:58:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47F9F23A3A
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 22:58:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726525AbhAUW6A (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Jan 2021 17:58:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726448AbhAUW54 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Jan 2021 17:57:56 -0500
Received: from mail-qv1-xf49.google.com (mail-qv1-xf49.google.com [IPv6:2607:f8b0:4864:20::f49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52EFDC06174A
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jan 2021 14:57:16 -0800 (PST)
Received: by mail-qv1-xf49.google.com with SMTP id j24so2541126qvg.8
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jan 2021 14:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=j4rzbjtP6KABLxWwLyYI2aSbVFYm4RTsvKAyzhvznIc=;
        b=Rsyebny0nKwz0BxmlbDuCmRFvFbpVCAB8r+VBNwaR3o4QtxqhBT5CnYLmGtSzCpp/2
         jVE70nElA2UoNrNd7nYpvMcvDD57wQdFrE9DS8z4zOgkop6T7EkVZhJwsEFjwtR85AEY
         iclRzYlf0JmH7L8OMfMDY/TQe1yDVBsTYkC+XdiJVNwJHTu0/twzdV6pRIe5F73SPrqe
         +Ba5X1wYEwyjhbsL2naDaJsCJasA191oxQ2LF2MLMdMBfXDLCIpG/gNic97X/djWjR7u
         DOCkav5lnENLNdnxgm6hywDXeRSU7WeH6yluDfcGbxVBrGwEOFQrNZcjresxLnd9GeLH
         BZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=j4rzbjtP6KABLxWwLyYI2aSbVFYm4RTsvKAyzhvznIc=;
        b=qixYaW684pdYGr74/uxGKtFSSPX9fL1poVDqze31IoFGNuSobbcBdmWR2UlHRgygHs
         P0VvP2vMuOtl/L6VE4pDGeScMlsPR73E7tOEmZMtFEPkVqP6pqpUHEyBNPIGnuRvdDX4
         riKx737Cn5GkpeuVUEEHHVvDyIAtqj3LeTJtyUl/0FB+reOckRZWal26q7HdygD1YH0Z
         eLRE+3xvhx24PCmpAZsbjUnWU3A6f6ryBd1noDTtazjJsjBYJ6jMgMp648Il1y5vAYYS
         amSDaa+bdfm6wNzp8WuqkBWiR3gnWO1UZuhkVY8r4EaJiQL/U02bSWnI4gj74vbCHrzm
         WjcA==
X-Gm-Message-State: AOAM5309jHOpno1OqWttti/QHukJIw/FdcbcQqpW+u2JcJXtiy/UG6/l
        /IBa0ehO9oIk+8PK2Fb4VhjKYy9ztBHJ3bQ=
X-Google-Smtp-Source: ABdhPJx0NBdy8RBsm1t/01e7aGi8ELAAFrlYM7hMKQPVamkU3FpnJK3qauqXtEVArv7o3wfWAPHKhVMTVIHl18o=
Sender: "saravanak via sendgmr" <saravanak@saravanak.san.corp.google.com>
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:7220:84ff:fe09:fedc])
 (user=saravanak job=sendgmr) by 2002:a0c:cd01:: with SMTP id
 b1mr1986113qvm.21.1611269835503; Thu, 21 Jan 2021 14:57:15 -0800 (PST)
Date:   Thu, 21 Jan 2021 14:57:10 -0800
Message-Id: <20210121225712.1118239-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH v2 0/2] of: property: Add fw_devlink support for more props
From:   Saravana Kannan <saravanak@google.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Saravana Kannan <saravanak@google.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Marc Zyngier <maz@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Sending again because I messed up the To/Cc for the coverletter.

This series combines two patches [1] [2] that'd conflict.

Greg,

Can you please pull this into driver-core-next?

-Saravana

[1] - https://lore.kernel.org/lkml/20210115210159.3090203-1-saravanak@google.com/
[2] - https://lore.kernel.org/lkml/20201218210750.3455872-1-saravanak@google.com/

Individual -> Series:
Patch 1/2: Addressed Geert's gpio-hog problem with gpio[s] property
Patch 2/2: Switched to using of_irq_find_parent()

v1 -> v2:
Patch 1/2: Added the Reviewed-by tags
Patch 2/2: Updated commit text and comments. Added Reviewed-by tags.

Saravana Kannan (2):
  of: property: Add fw_devlink support for "gpio" and "gpios" binding
  of: property: Add fw_devlink support for interrupts

 drivers/of/property.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

-- 
2.30.0.296.g2bfb1c46d8-goog

