Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 504B5EB64D0
	for <linux-tegra@archiver.kernel.org>; Tue, 13 Jun 2023 16:29:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjFMQ3Z (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 13 Jun 2023 12:29:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbjFMQ3Z (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 13 Jun 2023 12:29:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55123A6
        for <linux-tegra@vger.kernel.org>; Tue, 13 Jun 2023 09:29:24 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id EF2B962BFC
        for <linux-tegra@vger.kernel.org>; Tue, 13 Jun 2023 16:29:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A638C433F0;
        Tue, 13 Jun 2023 16:29:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686673762;
        bh=b/2NAxVPLjyTsQ54uD0b0Z8iQWQQ+kB19gD3AtEcAHY=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=dsgD/DjZ8eOnZexUeVMG5J6CXAeEnUtf/IgstYOUe4zr+HygMtZsFXCprtm8lpyb9
         KToIEjNthxomvWRhnHL2IFVWBAXK4jDC7l9yJ0hZA8pCJL6gGeNDqtmG+9joq4XVvu
         ovi9WDleofwL35InbpNF13z749MNQeUOqHV8BWZt66TILdbNMDHrbhbr0Dl4F74AGg
         pk6vMTLcoNQz2rxfk6L4Qxs0qPQcI5F5wdnLo3zF03mBlj6a3++P7/ZPAD3LtrySdk
         X2a47haqxWkxSipqfgM1KVRdZm3b2TXtxq1zbbqcoVpo16Make33N/itU1dCEZtvgA
         mjQqph3gie4pg==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
In-Reply-To: <20230613093453.13927-1-jonathanh@nvidia.com>
References: <20230613093453.13927-1-jonathanh@nvidia.com>
Subject: Re: [PATCH] ASoC: tegra: Fix Master Volume Control
Message-Id: <168667376026.116493.5051777673041292813.b4-ty@kernel.org>
Date:   Tue, 13 Jun 2023 17:29:20 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 13 Jun 2023 10:34:53 +0100, Jon Hunter wrote:
> Commit 3ed2b549b39f ("ALSA: pcm: fix wait_time calculations") corrected
> the PCM wait_time calculations and in doing so reduced the calculated
> wait_time. This exposed an issue with the Tegra Master Volume Control
> (MVC) device where the reduced wait_time caused the MVC to fail. For now
> fix this by setting the default wait_time for Tegra to be 500ms.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: Fix Master Volume Control
      commit: f9fd804aa0a36f15a35ca070ec4c52650876cc29

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

