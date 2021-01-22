Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 945B5C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 18:11:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6611923AAC
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 18:11:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728720AbhAVSKP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 13:10:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:56224 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729180AbhAVSHb (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 13:07:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 35B5423A9C;
        Fri, 22 Jan 2021 18:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611338806;
        bh=jfWhYmTTVxaG1cazeR/HhGIqbS0OtiiL6e+erMyLc2Y=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=F65aaDfqn/mSiIx35n2cGxc2iq77wYoHZBP9QyrTrewGSfTLTzt6nKH+xtJZjwiJc
         AIgB9vT8QCEdjADibu86FzmB6XKzOZ6ht61r1Oq3XAwyvjnNjlPWsrVx74VhoV0/D/
         e//Hs4oCyp+3UW66PuPnOPJlz1KMAQi1vYwObiaQkQKZjbumHx9jQJgOrPEXPmZb0i
         f8iGdeFTFE8CsgMikKyLqNGs7wTj6Q7rOVfoqWsBk1NtSYiNb8nD//gHcrpR307WV1
         UcCjWEZZsEmA+KsWxSs/+ekSv26giXDUNlFDXbdMO0tF7W/s3+Zu0MiZ3xOW6Kp154
         F0M74nIpaQBug==
From:   Mark Brown <broonie@kernel.org>
To:     Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20210122174311.28230-1-digetx@gmail.com>
References: <20210122174311.28230-1-digetx@gmail.com>
Subject: Re: [PATCH v4] regulator: Make regulator_sync_voltage() usable by coupled regulators
Message-Id: <161133876632.52278.489737063755606178.b4-ty@kernel.org>
Date:   Fri, 22 Jan 2021 18:06:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 22 Jan 2021 20:43:11 +0300, Dmitry Osipenko wrote:
> Make regulator_sync_voltage() to re-balance voltage state of a coupled
> regulators instead of changing the voltage directly.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: Make regulator_sync_voltage() usable by coupled regulators
      commit: 24be0c715617ed9bfc63fa9483f8bda1214b9763

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
