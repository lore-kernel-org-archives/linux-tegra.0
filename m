Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B434CDB46E
	for <linux-tegra@archiver.kernel.org>; Thu, 12 Oct 2023 17:42:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344133AbjJLRml (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 12 Oct 2023 13:42:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344076AbjJLRmk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 12 Oct 2023 13:42:40 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0BD7BB
        for <linux-tegra@vger.kernel.org>; Thu, 12 Oct 2023 10:42:38 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06485C433C7;
        Thu, 12 Oct 2023 17:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697132558;
        bh=3Rqje43f72angmkB/9A+IImplnlSOfXYr0ju7Rq6x6A=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=b6fHFi3iY/oWT/KPevXnxEjuGPA8waGRRJYOLr45VcflxJfoMzMaTsANkJgcLxUzJ
         62lbBJ+rWh1H7G+0VlOVqGMZWXowgBx1jqC4dfkk1rdl1nX5jfH9IjaiWJm18UCast
         JiIr6k/ihu8WpEYusBGKDgKJ0HdyGJGNrF4d1jg/fuURQg2gLQGD35390RxUEjRrXs
         tkk6EmsC77g/25L7V1X7vIrzVPILbH3gloSqdMEzB5IFT7hDqv77MVmKc+2bKrkMEw
         tByn5g00wdvCJ98JOMsQVtKboa/Lq3Fg/aZjIpW61RjHOjTBWZPUbcyvhdro4IGbFy
         fFoIq5Hwu1jfA==
From:   Mark Brown <broonie@kernel.org>
To:     robh@kernel.org, Nathan Chancellor <nathan@kernel.org>
Cc:     lgirdwood@gmail.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, ndesaulniers@google.com, trix@redhat.com,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        llvm@lists.linux.dev, patches@lists.linux.dev
In-Reply-To: <20231011-asoc-tegra-fix-uninit-soc_data-v1-1-0ef0ab44cf48@kernel.org>
References: <20231011-asoc-tegra-fix-uninit-soc_data-v1-1-0ef0ab44cf48@kernel.org>
Subject: Re: [PATCH] ASoC: tegra: Fix -Wuninitialized in
 tegra210_amx_platform_probe()
Message-Id: <169713255573.343479.16669481673546969427.b4-ty@kernel.org>
Date:   Thu, 12 Oct 2023 18:42:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 11 Oct 2023 13:21:51 -0700, Nathan Chancellor wrote:
> Clang warns (or errors with CONFIG_WERROR=y):
> 
>   sound/soc/tegra/tegra210_amx.c:553:10: error: variable 'soc_data' is uninitialized when used here [-Werror,-Wuninitialized]
>     553 |                                             soc_data->regmap_conf);
>         |                                             ^~~~~~~~
> 
> A refactoring removed the initialization of this variable but its use
> was not updated. Use the soc_data value in the amx variable to resolve
> the warning and remove the soc_data variable, as it is now entirely
> unused.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tegra: Fix -Wuninitialized in tegra210_amx_platform_probe()
      commit: 41cb1126bed152f7679417834ad7ea39f2252dfb

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

