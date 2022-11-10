Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89FC8C4332F
	for <linux-tegra@archiver.kernel.org>; Thu, 10 Nov 2022 21:36:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232369AbiKJVgW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 10 Nov 2022 16:36:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232351AbiKJVgV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 10 Nov 2022 16:36:21 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2C501144A;
        Thu, 10 Nov 2022 13:36:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7DED161E5F;
        Thu, 10 Nov 2022 21:36:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB85C433B5;
        Thu, 10 Nov 2022 21:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668116179;
        bh=dxe+GIjKXtd9ZijX1nvmNwvHzd7h4ssKNL0fXojrTW0=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=byjDznbSMjGoD0JMO0wv5616TytfFIZwLfEhThsJ2DyReWalmod7txmJCU/aBWEIX
         wZNQMEhi0WuNDexC42AmoRNNDTpdQPSpy0qLJF01BHa1GIM/sdo4IEeQ5JelMJ9AU9
         9hcUenhI+3L5aXmZg42w9yCDiRQmEeAyX1zWHGf2NZusxafxyiWFnwuvgP7vd+IrLV
         Dn75IPloNvZS97s/tYmYCq5q7aRIElNKa4qIv28Ibr3LhX9f5VJ1Q7fwPYADpozOdP
         O7MQ69YbXGwsy+gLJeCF958/AcgUYP8TmUvvOEb+OftImmoY9cdtFSPI9cVwVerAkz
         0M509VpiYmkzg==
From:   Mark Brown <broonie@kernel.org>
To:     Takashi Iwai <tiwai@suse.com>, linux-tegra@vger.kernel.org,
        Colin Ian King <colin.i.king@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Thierry Reding <thierry.reding@gmail.com>,
        alsa-devel@alsa-project.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20221108111340.115387-1-colin.i.king@gmail.com>
References: <20221108111340.115387-1-colin.i.king@gmail.com>
Subject: Re: [PATCH] ASoC: tegra: Fix spelling mistake "fliter" -> "filter"
Message-Id: <166811617747.1093199.5048769698185581160.b4-ty@kernel.org>
Date:   Thu, 10 Nov 2022 21:36:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 8 Nov 2022 11:13:40 +0000, Colin Ian King wrote:
> There is a spelling mistake in struct member fliter_structure.
> Fix it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: Fix spelling mistake "fliter" -> "filter"
      commit: f8dc9cd92fe218aa1d8720e1105c542dcd3e58f2

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
