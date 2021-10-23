Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D736C433F5
	for <linux-tegra@archiver.kernel.org>; Sat, 23 Oct 2021 19:58:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3639E60F6F
	for <linux-tegra@archiver.kernel.org>; Sat, 23 Oct 2021 19:58:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231186AbhJWUAh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 23 Oct 2021 16:00:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:34046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230230AbhJWUAd (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 23 Oct 2021 16:00:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 407BF60F4B;
        Sat, 23 Oct 2021 19:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635019093;
        bh=UE0nSct8AkiwiOVgXjSj4Xe/BOGvGKgkpKvTHjkG/I4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rWpEpinV6kSP5Yw/e+aAyeCvcZjUyNb+u5aEQbNPKdzNOtfJQqPoQ5Za4em5HIOwb
         V/NuKRpnupioJn3Whl4O7tqI3G2SS58DudTDWKFwHUaBIZGBPnS1Ce0TQ3radZCGM8
         EQRV1FnNV3Qic9sg1qktA0USPy0GV2TifnUqSgzYj0y3axS5vT9FywzEQrM//ovN07
         oABbuFS8Of+3/xU3rCkqSsUc+8kVmzho94yg4/G9GeF+vng3eRQ6u7Q2AFrmd8nonH
         u98vm8VIbxUNkBLJSC4/SjaDfrjE40KSJguillSWax7GXf7ani6BCLy+K238A5VRS4
         Bx+H52GI5hCsg==
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Thierry Reding <treding@nvidia.com>
Cc:     Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] regulator: Don't error out fixed regulator in regulator_sync_voltage()
Date:   Sat, 23 Oct 2021 20:58:02 +0100
Message-Id: <163501903135.919198.6701017250560518879.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211021183308.27786-1-digetx@gmail.com>
References: <20211021183308.27786-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 21 Oct 2021 21:33:08 +0300, Dmitry Osipenko wrote:
> Fixed regulator can't change voltage and regulator_sync_voltage()
> returns -EINVAL in this case. Make regulator_sync_voltage() to succeed
> for regulators that are incapable to change voltage.
> 
> On NVIDIA Tegra power management driver needs to sync voltage and we have
> one device (Trimslice) that uses fixed regulator which is getting synced.
> The syncing error isn't treated as fatal, but produces a noisy error
> message. This patch silences that error.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: Don't error out fixed regulator in regulator_sync_voltage()
      commit: 400d5a5da43c0e84e5aa75151082ea91f0fae3c9

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
