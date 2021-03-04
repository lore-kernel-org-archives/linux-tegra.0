Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16108C433E6
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Mar 2021 01:11:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D860364F09
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Mar 2021 01:11:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236839AbhCDBL5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 Mar 2021 20:11:57 -0500
Received: from mail.kernel.org ([198.145.29.99]:60972 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1452116AbhCDA5G (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 3 Mar 2021 19:57:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id DFE3064EA4;
        Thu,  4 Mar 2021 00:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614819385;
        bh=qTBNYYko//rWYlmfxcfRk3TNgJOLDbs/bmkNbIqT92M=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=VAZTFf+NP2cmInZ97lXLsRFZJ+HbExXyQDf6NRd5ueR5PBDkaZ8PyslIeNv6HUQ24
         mH0G+94vpW0bMB3jngU7RykvIZ65hMS4+Y/LRtuMZpWcIs/0G4lKYaxgCiX67myvMN
         Axk1xoZZ62UW21yx5mdgf4PoU0ISTUKH0+LBxnrYPosCUqVcDHI0JpV592GZU7YRCE
         BWlRkxyLe5aj492SogAp5Hg6u4pTvlN8svtQpCQALcdHfIH19axjgT6g/Ksc9iJbji
         mhTAZX+WIWrsGQqJYH3H/ELo1qm5t+OTAY2YEnx4Ka2O5hLqaUci1DFXunI3Uy6itz
         IfiTpczSRzSFw==
From:   Mark Brown <broonie@kernel.org>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Takashi Iwai <tiwai@suse.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        alsa-devel@alsa-project.org
In-Reply-To: <20210303115526.419458-1-jonathanh@nvidia.com>
References: <20210303115526.419458-1-jonathanh@nvidia.com>
Subject: Re: [PATCH V2] ASoC: soc-core: Prevent warning if no DMI table is present
Message-Id: <161481924071.9553.11233788630691178743.b4-ty@kernel.org>
Date:   Thu, 04 Mar 2021 00:54:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 3 Mar 2021 11:55:26 +0000, Jon Hunter wrote:
> Many systems do not use ACPI and hence do not provide a DMI table. On
> non-ACPI systems a warning, such as the following, is printed on boot.
> 
>  WARNING KERN tegra-audio-graph-card sound: ASoC: no DMI vendor name!
> 
> The variable 'dmi_available' is not exported and so currently cannot be
> used by kernel modules without adding an accessor. However, it is
> possible to use the function is_acpi_device_node() to determine if the
> sound card is an ACPI device and hence indicate if we expect a DMI table
> to be present. Therefore, call is_acpi_device_node() to see if we are
> using ACPI and only parse the DMI table if we are booting with ACPI.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-core: Prevent warning if no DMI table is present
      commit: c014170408bcd2e8fc726802ed16794d358742ff

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
