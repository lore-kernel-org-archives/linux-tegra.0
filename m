Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4549EC55ABD
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 21:38:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D53C320809
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Nov 2020 21:38:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ahh06S4Z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727275AbgKJVil (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 10 Nov 2020 16:38:41 -0500
Received: from mail.kernel.org ([198.145.29.99]:40718 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731788AbgKJViY (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Nov 2020 16:38:24 -0500
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2678B20797;
        Tue, 10 Nov 2020 21:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605044303;
        bh=2QfsYMTIGqExf5FNUHJ1un67gfZSsrKQPoWVhdIAHqk=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=ahh06S4Z3wkwZo6EIiwVGN+Ce0SFmInaxqHOerbq2kKutFpkbJ+9Oul/50G+wurdI
         R2giXYHGmmyiXsenxUu4Dxl7T2AoNwhyww7zufS0QCm/IWWYs2Sog4rjIt8RIorvGr
         nBzR+4yxjyd/SGtvJZjMWiefyVrPDODpEcFl84F4=
Date:   Tue, 10 Nov 2020 21:38:09 +0000
From:   Mark Brown <broonie@kernel.org>
To:     tiwai@suse.com, pierre-louis.bossart@linux.intel.com,
        lgirdwood@gmail.com, kuninori.morimoto.gx@renesas.com,
        perex@perex.cz, Sameer Pujar <spujar@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, sharadg@nvidia.com,
        linux-kernel@vger.kernel.org
In-Reply-To: <1604329814-24779-1-git-send-email-spujar@nvidia.com>
References: <1604329814-24779-1-git-send-email-spujar@nvidia.com>
Subject: Re: [PATCH v5 0/7] Audio Graph Updates
Message-Id: <160504428418.41991.4621142388350710965.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 2 Nov 2020 20:40:07 +0530, Sameer Pujar wrote:
> This series is a prepraration for using generic graph driver for Tegra210
> audio. Tegra audio graph series will be sent in a separate series because
> it has some dependency over other series for documentation work. This
> series can focus on the generic ASoC driver updates. Below are the summary
> of changes done.
> 
>  * Support multiple instances of a component. For example there can be
>    multiple I2S devices which can use the same component driver.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/7] ASoC: soc-core: Fix component name_prefix parsing
      commit: 3256ef984b016fc8491f34cad594168b4b500317
[2/7] ASoC: soc-pcm: Get all BEs along DAPM path
      commit: aa293777bfeb75fb8872565ef99cc0e8b98b5c7d
[3/7] ASoC: audio-graph: Use of_node and DAI for DPCM DAI link names
      commit: e6aeb375d25dba56c4089b1d6aa0a77fe218ef3b
[4/7] ASoC: audio-graph: Identify 'no_pcm' DAI links for DPCM
      commit: c21cbb526c0a105d582299839a9c4244dd6bf38a
[5/7] ASoC: audio-graph: Support empty Codec endpoint
      commit: 930dd47d74023e7c94a7c256279e12924c14475d
[6/7] ASoC: audio-graph: Expose new members for asoc_simple_priv
      commit: d09c774f2f9ff25817866b70f1fb9603e5196971
[7/7] ASoC: audio-graph: Expose helpers from audio graph
      commit: e32b100bc6ecbc390aae728fc7d2a3e247faa8a7

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
