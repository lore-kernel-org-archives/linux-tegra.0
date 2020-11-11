Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121E8C388F9
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Nov 2020 15:47:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC8A6207BB
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Nov 2020 15:47:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XSMot6lV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgKKPrq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 11 Nov 2020 10:47:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:42992 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726274AbgKKPrq (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Nov 2020 10:47:46 -0500
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EECF32074B;
        Wed, 11 Nov 2020 15:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605109665;
        bh=LeU5+FDYWn5oeLQA3g3HlCIyg9cm9+2i7iakNb+8puc=;
        h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
        b=XSMot6lVZM+aEBCMmBgn8TJG+nsHLRIGdRfnSS6H5k4SFO1w5bp5fXdWwBifh++KI
         4wL7bvYhXE/tUEiGlXZ5XphXS7sju2AcSbZPYvm/WCbg5AZ7J/xEzLD+hAh05RnYit
         hU9i10K99rwZLZr1svivnHxIsSsv2yUUnsZwIbwU=
Date:   Wed, 11 Nov 2020 15:47:30 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org
In-Reply-To: <20201111103245.152189-1-jonathanh@nvidia.com>
References: <20201111103245.152189-1-jonathanh@nvidia.com>
Subject: Re: [PATCH] ASoC: tegra: Don't warn on probe deferral
Message-Id: <160510963228.12073.2844895860087376928.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 11 Nov 2020 10:32:45 +0000, Jon Hunter wrote:
> Deferred probe is an expected return value for snd_soc_register_card().
> Given that the driver deals with it properly, there's no need to output
> a warning that may potentially confuse users.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: Don't warn on probe deferral
      commit: 34d3daba23399440dedddd0f9ccd6c1057314139

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
