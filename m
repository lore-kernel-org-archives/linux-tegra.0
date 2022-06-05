Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53E70C433EF
	for <linux-tegra@archiver.kernel.org>; Sun,  5 Jun 2022 17:16:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351385AbiFERQ2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 5 Jun 2022 13:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351436AbiFERQS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 5 Jun 2022 13:16:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 756CA35AAF;
        Sun,  5 Jun 2022 10:16:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1148F60F36;
        Sun,  5 Jun 2022 17:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 760BDC34115;
        Sun,  5 Jun 2022 17:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654449375;
        bh=ep+IDi0vxCrUwI2WmWGhmEgT4tuNXM+pFSsQKqUVb90=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=qZNVrUAAgIj7cTTj3JDs8lsj0TxiUelm/Xs34BSKho+MRFRxYaHhcm9Q76sNxLd5N
         0mtvoCSKSlKQ0Cylv/XgJxIoYn0EfYG3Dpy+BLpWVK92oXG3sVIiKA13Juw/CycFRF
         XGPZ0GyxTfv830AdF8T14VRWthTfVjXSfpF0Kwg3142TWDJdSdP6S6qNEQfkZWhKXk
         SAGr8gFwajAEwXAnDVK0WPk22sn3qdOFlli+dbDOA3D0UeDf5XoEvgoGW7JlO5PFCX
         Z2SvwDxdhOvq6jbMgC/Fmrjl1ioJHujqGT+CjnZvctpBtBOwxiNq23yTKS49gFelDK
         qq1oHBD156Ajw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 60642F03875;
        Sun,  5 Jun 2022 17:16:15 +0000 (UTC)
Subject: Re: [GIT PULL] hte: New subsystem for v5.19-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20220603113908.78777-1-thierry.reding@gmail.com>
References: <20220603113908.78777-1-thierry.reding@gmail.com>
X-PR-Tracked-List-Id: <linux-tegra.vger.kernel.org>
X-PR-Tracked-Message-Id: <20220603113908.78777-1-thierry.reding@gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/hte/for-5.19-rc1
X-PR-Tracked-Commit-Id: 5dad4eccd2b4316a84209603a28d34c6346392bb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2981436374177f78539b026ce5bcbab8c251818e
Message-Id: <165444937537.7539.12476678421599456541.pr-tracker-bot@kernel.org>
Date:   Sun, 05 Jun 2022 17:16:15 +0000
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Dipen Patel <dipenp@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The pull request you sent on Fri,  3 Jun 2022 13:39:08 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/hte/for-5.19-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2981436374177f78539b026ce5bcbab8c251818e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
