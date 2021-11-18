Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ECC2C433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Nov 2021 19:06:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 61BBE61179
	for <linux-tegra@archiver.kernel.org>; Thu, 18 Nov 2021 19:06:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbhKRTJE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 18 Nov 2021 14:09:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:57026 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232137AbhKRTJD (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 18 Nov 2021 14:09:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C1A19611C0;
        Thu, 18 Nov 2021 19:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637262363;
        bh=K0dhONGx5eh8ZXaYYjtDkxxtM9Z92WwRmibNsJcJ738=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=EKEu5DziBC2A7SyJ4RLec0HqRTsc2ECO9INuaYkhiTobP7At82tUH12VdGzvsWcym
         ANtj9KMhL9xoAvioDuBoyMZ0Wq2AP+w0de6muBrT+3UJlxzwF8lZ/qpI1kZm5ty+Sy
         IhpNJJ9qqd9sdU2EqsuXxK/vRjONrsDXVlXgcsID7QJt6fCYrpr6XM1sYTv365fNuN
         mg8LiajK4q1KI7z+5ynVlO2yDARalaFXHwOR3fIbEWOIZVk2KU4se5ja15A2UEdvKd
         l74ebi6Z1uANA8KKEKa98/qtRiCIEkjmg/WQTFBvpqLgm6J+OVKLusAgkHozs2jDtP
         uJyiWXl8qwj/g==
From:   Mark Brown <broonie@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>, lgirdwood@gmail.com,
        perex@perex.cz, tiwai@suse.com
Cc:     linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
        jonathanh@nvidia.com, thierry.reding@gmail.com,
        linux-kernel@vger.kernel.org
In-Reply-To: <1637219231-406-1-git-send-email-spujar@nvidia.com>
References: <1637219231-406-1-git-send-email-spujar@nvidia.com>
Subject: Re: [PATCH v3 00/16] Kcontrol get/put cleanup in Tegra drivers
Message-Id: <163726236152.95988.1168935629731605987.b4-ty@kernel.org>
Date:   Thu, 18 Nov 2021 19:06:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 18 Nov 2021 12:36:55 +0530, Sameer Pujar wrote:
> There are two cleanups in the series:
>  1. Use correct value type for enum controls. This is suggested by
>     Takashi during review of v2.
> 
>  2. This series fixes kcontrol put callback in some of the Tegra drivers
>     which are used on platforms based on Tegra210 and later. The callback
>     is expected to return 1 whenever the HW update is done.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-linus

Thanks!

[01/16] ASoC: tegra: Fix wrong value type in ADMAIF
        commit: 884c6cb3b7030f75c46e55b9e625d2372708c306
[02/16] ASoC: tegra: Fix wrong value type in I2S
        commit: 8a2c2fa0c5331445c801e9241f2bb4e0e2a895a8
[03/16] ASoC: tegra: Fix wrong value type in DMIC
        commit: 559d234569a998a4004de1bd1f12da5487fb826e
[04/16] ASoC: tegra: Fix wrong value type in DSPK
        commit: 3aa0d5c8bb3f5ef622ec2764823f551a1f630711
[05/16] ASoC: tegra: Fix wrong value type in SFC
        commit: 42afca1a65661935cdd54d2e0c5d0cc2426db7af
[06/16] ASoC: tegra: Fix wrong value type in MVC
        commit: 6762965d0214df474e3a58e1d4d3ab004c5da0ea
[07/16] ASoC: tegra: Fix kcontrol put callback in ADMAIF
        commit: e2b87a18a60c02d0dcd1de801d669587e516cc4d
[08/16] ASoC: tegra: Fix kcontrol put callback in I2S
        commit: f21a9df3f7cb0005947679d7b9237c90574e229a
[09/16] ASoC: tegra: Fix kcontrol put callback in DMIC
        commit: a347dfa10262fa0a10e2b1970ea0194e3d4a3251
[10/16] ASoC: tegra: Fix kcontrol put callback in DSPK
        commit: d6202a57e79d102271d38c34481fedc9d4c79694
[11/16] ASoC: tegra: Fix kcontrol put callback in AHUB
        commit: a4e37950c9e9b126f9cbee79b8ab94a94646dcf1
[12/16] ASoC: tegra: Fix kcontrol put callback in MVC
        commit: c7b34b51bbac6ab64e873f6c9bd43564a7442e33
[13/16] ASoC: tegra: Fix kcontrol put callback in SFC
        commit: b31f8febd1850bbe74aba184779ec54552d92752
[14/16] ASoC: tegra: Fix kcontrol put callback in AMX
        commit: 8db78ace1ba897302131422ce15c5eb04510cef8
[15/16] ASoC: tegra: Fix kcontrol put callback in ADX
        commit: 3c97881b8c8a2aa8afd4d7a379b7ff03884c9e4a
[16/16] ASoC: tegra: Fix kcontrol put callback in Mixer
        commit: 8cf72c4e75a0265135d34a8e29224b4c1e92b51c

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
