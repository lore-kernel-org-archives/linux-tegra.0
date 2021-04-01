Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CA2C43470
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 10:17:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 833C6610C7
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 10:17:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234012AbhDAKRX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Apr 2021 06:17:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:38764 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233946AbhDAKRK (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 1 Apr 2021 06:17:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 038996108B;
        Thu,  1 Apr 2021 10:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617272230;
        bh=0XIMTKPbBSfQ0mStj2Kgtksi0YRnTlzwQGmNyWpKKDw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TwLJ/F9pVHytgO8o8WFfwwcD6cthVx34SLFCkhEqJEUH8D33dGAJaWfedq4nfCXRi
         elvaA1+DicvJIBSRTIHIfpCT+k0jHlmJ1ewCfaVAASUM0u2x/Q0hoBD44QAfOOw2B8
         /p4E6es6QXuACpuPgXXnfR1DTzUTg4Mk2ouH0xZAgVYrAUKWkKBWlCvXPtsf7IjQFq
         Chf7j0kJjO02uYMHXSrdEcNg6jmpL31l6PTg5/6IufxIKQlsHdfIFGFpi40X3HGZF+
         H1KQMg24oUPVpDlPdFc2KRbmuNiH86Hyt8JlKHS6cPep8tHJ/C9flBUHB0eSDnEvn/
         /uLjTIu7FJItw==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Mark Brown <broonie@kernel.org>, Sameer Pujar <spujar@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: tegra: Set driver name explicitly
Date:   Thu,  1 Apr 2021 11:16:22 +0100
Message-Id: <161726938993.2219.5747332081985016926.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210330180657.1867971-1-thierry.reding@gmail.com>
References: <20210330180657.1867971-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 30 Mar 2021 20:06:57 +0200, Thierry Reding wrote:
> The SoC sound core will generate a driver name by normalizing the card
> name. However, most of the time that name does not tell anything about
> the driver and is therefore useless for this purpose.
> 
> Make the driver name more useful by setting it explicitly during card
> initialization.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: Set driver name explicitly
      commit: 868d5c6340d878f44acf73c92923995b896b6454

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
