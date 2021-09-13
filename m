Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3B9DC433FE
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Sep 2021 10:54:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DDAD61004
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Sep 2021 10:54:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239317AbhIMK4K (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Sep 2021 06:56:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:51846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239367AbhIMK4C (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Sep 2021 06:56:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86CD861004;
        Mon, 13 Sep 2021 10:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631530486;
        bh=7l+vYectJVc2pcNJ1xmipSlZuJEZCOZ/t0TzVWfHOpQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kNOWPfSdeU4ol4rp4iIs1sStfO5f1aba6ThiI63sJDvw8W6/7tKCot+ftABjHK4H4
         jxD+gIqQYBRvf2Pto3xU5Uv71cPnjg4F7RRUpaMjBHzeye8rKjtr0mXXQsLv8KwOhY
         LhaAIdpg7Wsp4eZJobeR8gOAQs5UkrYkAoOnDoY0Va7oBPWYVq2nMiLuxKO8Q+JKpj
         xaB0Cc5/caUQOLLelK523pe+pxzD+QEpoycUagWpPN6jAxB1VKWGWN7TJlshE8CmF2
         ACulhOe9EiLjp7DAEbkCOnuX9bfGK3LbB+1ZeAHwTCpDb20vIlZsJwz64VUl+kF8Jg
         yYnMtMIV9GgGw==
From:   Mark Brown <broonie@kernel.org>
To:     robh+dt@kernel.org, lgirdwood@gmail.com, thierry.reding@gmail.com,
        Sameer Pujar <spujar@nvidia.com>
Cc:     Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        jonathanh@nvidia.com, alsa-devel@alsa-project.org,
        jbrunet@baylibre.com, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, stephan@gerhold.net
Subject: Re: [PATCH v3 0/3] Convert name-prefix doc to json-schema
Date:   Mon, 13 Sep 2021 11:53:18 +0100
Message-Id: <163152996585.45703.9035282827838850495.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <1630686919-19495-1-git-send-email-spujar@nvidia.com>
References: <1630686919-19495-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 3 Sep 2021 22:05:16 +0530, Sameer Pujar wrote:
> Following are the changes:
>   - Add json-schema for 'sound-name-prefix' documentation under
>     'name-perfix.yaml'
>   - Use schema references wherever needed.
>   - Remove txt based doc
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: Add json-schema documentation for sound-name-prefix
      commit: 7f826da8e924bae7dd56b99e3760514017ca51a3
[2/3] ASoC: Use schema reference for sound-name-prefix
      commit: 82d3ec1d89fa2750fdc74e2f29c6c7ff673a2768
[3/3] ASoC: Remove name-prefix.txt
      commit: 955cc3488e6d407bac3883be630cabbead0892f4

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
