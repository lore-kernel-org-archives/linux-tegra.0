Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126EEC433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 16:06:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6D1F619C0
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 16:06:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231532AbhC3QGH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 12:06:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:50526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232072AbhC3QGF (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 12:06:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D1924619C7;
        Tue, 30 Mar 2021 16:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617120365;
        bh=MjtFvE1Bg1vsCss/zAR9tf8Nc8HDiGrYU/j+daFbggU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KS3gLJKah3O07Zc+vjhueWrMuXVPdxxJ+X/ahqkiQjDJnL0q7z4WISJvXLxSCJM4p
         D6/fLVOv35YnaPV0XVUtXS870pfqjQTkOQ9gtNdXDoRmC5wxyqtHZxICTNbKDn7JxB
         rlEhESGUASrye5qWH1Ay3ORLD8vFPCD7bj25Ws+KJY8IO2ZF45cz3ICImrevHUkeOt
         E+aqZy/gxNj+9hc4RWdqqsjVRbLzJKx2QRw540bnlmrz3n0oEEJRMDn15evpvYKnks
         0TyWPDi2rcUmvFL1xEw8PFxUHZERPYuSCcmFUlDH1La9xKYqxzVd4i4Pw6KhEU0poj
         B8i01vGxCAesA==
From:   Mark Brown <broonie@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: nvidia, tegra210-ahub: Add missing child nodes
Date:   Tue, 30 Mar 2021 17:05:48 +0100
Message-Id: <161711993559.12915.14933461243345209576.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210326195003.3756394-1-robh@kernel.org>
References: <20210326195003.3756394-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 26 Mar 2021 13:50:03 -0600, Rob Herring wrote:
> The nvidia,tegra210-ahub binding is missing schema for child nodes. This
> results in warnings if 'additionalProperties: false' is set (or when the
> tools implement 'unevaluatedProperties' support). Add the child nodes
> and reference their schema if one exists.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: nvidia, tegra210-ahub: Add missing child nodes
      commit: 8b01a0d0b5c1327296b37a13c37ca7ab31841577

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
