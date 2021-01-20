Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A23D2C433DB
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 08:07:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 534362313A
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 08:07:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730305AbhATIHh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 20 Jan 2021 03:07:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730517AbhATIGG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 20 Jan 2021 03:06:06 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEBCDC061575
        for <linux-tegra@vger.kernel.org>; Wed, 20 Jan 2021 00:05:25 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id p80so27314111ybg.10
        for <linux-tegra@vger.kernel.org>; Wed, 20 Jan 2021 00:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:message-id:mime-version:subject:from:to:cc;
        bh=byXc9pQI7vMYVbE49N9U/uHw5G1avW8TqGJiGbgNU14=;
        b=Fwx8k3030gn0USKf9qO1Eh5HsjG3PitR+SvtNXAARBRbqK1dbYZ0E21ItKu+wV8X5P
         10vEPiKx0dm8gtIlaN1XUyqLvN2zLcAJH3e5Xm4a0KHFNHhA2yZ/iUCHtxuEC68nZrJX
         /GgGYZ/6Nxa5Y3LPuuKPKOldR6fMjOTgFFV6KzMMUJAZ+Yt5MGP7OCUoTQbKrHvflmnr
         Aj1odJhDhnm63/c2hdGESokrhaL9VYxu7w4NHMfigxAzW5FLVHsdyfe3Fbfc0fX3UKEk
         5CAkvDF4+AmSUUwBaASJZts9OVrG6WOncmoHn+FelV6F6OgV/51LkSzopYOe3Pb2nlIV
         jLcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
         :to:cc;
        bh=byXc9pQI7vMYVbE49N9U/uHw5G1avW8TqGJiGbgNU14=;
        b=f2C5rDlXezdPyK6K7buwfeRu1ItAiy/mejoKQfiy5j8FmlPEhaBJ63WGHmC7x+0G4h
         M/m0EUoZy5HKrCG7zZah1BLJFNbV1iA+hg0l5ZwHIYkq6fkln3kHn3L+ePgI29dfJaLo
         bqmLndqlCTVR2IkaJuwZkFjqF0MdCFu8IHN/gS3YGGgxq+QgHOOdcxSWMuCkT5Mb1Nsv
         DfGXS9JFk+2tGGZ/ddvXpJjV7KJkcG9x5JBSzGe1T8TG8Pu1pDhMeBoLLgYyeuOHGTF4
         mpxjVMHX3RZUTls9GQkap10bZqBKLge57NmJ0HLnM5NtyWiArGAzP0nIJV7/4oPU9c3E
         ScsQ==
X-Gm-Message-State: AOAM531EZFzP24puwP4YhFu5dCcsgyr8SY6sM8nCUgpB1sxcHpRUaP2E
        zAuUecVsMAA91NgdlK6G+gmtxDJEoGP5KHM=
X-Google-Smtp-Source: ABdhPJyvlDYBk408bidV2X60WKYG8MbXAvvDC1Be7kc6bCfpGeJDmIrGoyIDF0l5x2Hw1S7cMzr+rxE5EWY6LAM=
Sender: "saravanak via sendgmr" <saravanak@saravanak.san.corp.google.com>
X-Received: from saravanak.san.corp.google.com ([2620:15c:2d:3:7220:84ff:fe09:fedc])
 (user=saravanak job=sendgmr) by 2002:a25:45c3:: with SMTP id
 s186mr4746557yba.435.1611129925136; Wed, 20 Jan 2021 00:05:25 -0800 (PST)
Date:   Wed, 20 Jan 2021 00:05:19 -0800
Message-Id: <20210120080522.471120-1-saravanak@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
Subject: [PATCH v1 0/2] of: property: Add fw_devlink support for more props
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

This series combines two patches [1] [2] that'd conflict.

Rob/Greg,

I think this should go into driver-core-next since Patch 1/2 fixes
issues caused by a patch in driver-core-next.

Patch 2/2 also touches the same locations. So, combining both into a
series.

Marc,

I'll add support for interrupt-map separately. It'll probably need to be
its own series because it'll need some refactor. I don't want to block
Patch 2/2 on that.

-Saravana

[1] - https://lore.kernel.org/lkml/20210115210159.3090203-1-saravanak@google.com/
[2] - https://lore.kernel.org/lkml/20201218210750.3455872-1-saravanak@google.com/

Individual -> Series:
Patch 1/2: Addressed Geert's gpio-hog problem with gpio[s] property
Patch 2/2: Switched to using of_irq_find_parent()

Saravana Kannan (2):
  of: property: Add fw_devlink support for "gpio" and "gpios" binding
  of: property: Add fw_devlink support for interrupts

 drivers/of/property.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

-- 
2.30.0.284.gd98b1dd5eaa7-goog

