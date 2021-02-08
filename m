Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD29CC433DB
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Feb 2021 18:40:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9861C64E70
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Feb 2021 18:40:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234890AbhBHSkJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 8 Feb 2021 13:40:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:57934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235447AbhBHSjm (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 8 Feb 2021 13:39:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6CDDC64E60;
        Mon,  8 Feb 2021 18:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612809542;
        bh=9TTZZw3q3O0A2iUkVrd4u4Jlc4Pb1l3noBBoy0LEpaw=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=Cx6cgD2Kad0MvzutSRSHnzVG0fwkxSbaj+4rIzLxmT1URrxpx9OsIVD1dZX67YK5T
         k9rr66QXY2zR4XghypCugiVHR9SQN9T+ihs4kallg2tq/+7XYKFnzIwKxDZiXmxD26
         Tsil81WRa6e3FLRgg1ByN+qjPbFJjQf1GnLe7nOGLeqpFgDwxyVrJWMKfr6mTbHpNU
         niwC2WE8wVxvSjp4Lid9ucWPmKLHw6op1ALmJJuTXbiYeXXwYv9ecinXgdsWqrr5oe
         lbliZNk8KP6+Jc9zOt+OAeS1MRrdEgYjPjDBzwen3CVkTFkgm8TF6duhgvF99xPEL5
         VUxlYjBmRvu9w==
From:   Mark Brown <broonie@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     alsa-devel@alsa-project.org, sharadg@nvidia.com,
        linux-kernel@vger.kernel.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        thierry.reding@gmail.com
In-Reply-To: <1612719418-5858-1-git-send-email-spujar@nvidia.com>
References: <1612719418-5858-1-git-send-email-spujar@nvidia.com>
Subject: Re: [PATCH v3 0/2] Rename audio graph export functions
Message-Id: <161280948305.10741.16503179975301818382.b4-ty@kernel.org>
Date:   Mon, 08 Feb 2021 18:38:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, 7 Feb 2021 23:06:56 +0530, Sameer Pujar wrote:
> This series renames exported functions from audio graph for a better
> global visibility. In doing so update the references in audio graph
> and Tegra audio graph card drivers.
> 
> 
> Changelog
> =========
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: audio-graph: Rename functions needed for export
      commit: 6e4ea8aace02479186b3fdaab48d7acfe06d8715
[2/2] ASoC: tegra: Add driver remove() callback
      commit: 0d7475d2a5a90127a2f87961b99bcd8f95694dd9

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
