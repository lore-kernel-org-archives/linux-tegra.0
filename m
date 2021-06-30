Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 632FDC11F65
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Jun 2021 16:11:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D5AD6135C
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Jun 2021 16:11:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232042AbhF3QNl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Jun 2021 12:13:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:35242 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232027AbhF3QNj (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Jun 2021 12:13:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A1DD61456;
        Wed, 30 Jun 2021 16:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625069470;
        bh=tS9UOkmHfzsDiNUImRMpoSlMeUJv0SfmW99iaB0fyqs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=UY+gmNXatbjEY9Il2jN9pHQO7EtNS5/veu/rwgzFRZEZU6Jf6xY6/gvNj1HfO7vBp
         KiRNt5lcbzaYyOMCqjgP/NmAaIPEURE708kZiMQH00zkZYdKGJ4l+QHwqHSx3KhCMS
         yGJ2lqfg2syPDZlthTnBrTERONMFqLZv8PwsjNPzHSUKzQc6KOyLUelvHdgdYnZKsc
         raEY7eTJMPJFrD2DaRb6NzGOK+tKGMnP/PY4MPi98LUxnhVLDi4c7viXSIhEVq05sL
         a0M83yuoX23qjA6jO7SMhaJAMu0bQM1z3ZP07iFqE54yTwrx/OTsO7j20wkDPr2rYj
         j8RQ96BLdV89A==
From:   Mark Brown <broonie@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: (subset) [PATCH 0/2] arm64: tegra: Enable audio IOMMU support on Tegra194
Date:   Wed, 30 Jun 2021 17:10:33 +0100
Message-Id: <162506854659.43525.4480397285287043164.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210628181118.2295007-1-thierry.reding@gmail.com>
References: <20210628181118.2295007-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 28 Jun 2021 20:11:16 +0200, Thierry Reding wrote:
> This small series addresses a minor issue with how IOMMU support is
> wired up on various Tegra generations. Currently the virtual "card"
> device is used to allocate DMA memory for, but since that device does
> not actually exist, the path to memory cannot be correctly described.
> 
> To address this, this series moves to using the ADMAIF as the DMA device
> for audio. This is a real device that can have a proper DMA mask set and
> with which a stream ID can be associated with in the SMMU. The memory
> accesses technically originate from the ADMA controller (that the ADMAIF
> uses), but DMA channel are dynamically allocated at runtime while DMA
> memory is allocated at driver load time, drivers won't have access to
> the ADMA device yet.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: tegra: Use ADMAIF component for DMA allocations
      commit: e6b66edfef64698d4d9ed3847c95cdfab9bde579

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
