Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8499C07E9A
	for <linux-tegra@archiver.kernel.org>; Mon, 12 Jul 2021 10:47:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC57B61152
	for <linux-tegra@archiver.kernel.org>; Mon, 12 Jul 2021 10:47:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234539AbhGLKun (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 12 Jul 2021 06:50:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:35384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234469AbhGLKu2 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 12 Jul 2021 06:50:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C36CA610CD;
        Mon, 12 Jul 2021 10:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626086860;
        bh=rRB64sjiBKQruseT1bEUVq+5wupC8VMPtoVNxCyIyEI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CqaBZWa8B/RzkMpNzg2pUREb4m99FHCCi+BgPzMI3gBp7KIaEjQDI15R967JPVHZN
         fy6kfNvy7u+HGV+NdZZ0jhyLagk87O22kRz7sj/RJx4ODORvj4HkdyVC3nqOCu0mip
         3628geIVhUvowjNSywPgGajW8aWQHlNc9x+pX30XdnKSAZBXH4IPeRqKp6ZnL1oSpV
         Pklg2fgfMCsbiyl3JnJP12QWxKO/qzXzWWA/OeE7XqUGFYHqFx63I6F0Ro24NCbYrO
         Y2EXbVByywveXqyWiYwTKLBoHezzRGwAIgnBQ44siYYghnsaIIRsJPZn/DhpJM146M
         7DNM2DtMMeqTA==
From:   Mark Brown <broonie@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org,
        Sameer Pujar <spujar@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: (subset) [PATCH v2 0/2] arm64: tegra: Enable audio IOMMU support on Tegra194
Date:   Mon, 12 Jul 2021 11:45:57 +0100
Message-Id: <162608623153.3192.16025207604600677942.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210708103432.1690385-1-thierry.reding@gmail.com>
References: <20210708103432.1690385-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 8 Jul 2021 12:34:30 +0200, Thierry Reding wrote:
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
      commit: 0dfc21c1a4cac321749a53c92da616d9546d00e3

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
