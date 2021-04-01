Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47E80C43461
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 10:17:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C3F466108B
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 10:17:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233994AbhDAKRX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Apr 2021 06:17:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:38712 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233926AbhDAKRH (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 1 Apr 2021 06:17:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CBF2B610CA;
        Thu,  1 Apr 2021 10:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617272227;
        bh=EIrQgPFlkTqPA7xToyxwP9zrW21fScMH9YJARgGuBdA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i1b4LWb5h3mxG99vNqWH6h6CoSFG+jtujoAX5FHkpc8zcbZjk95+SJiZy8AtG6UAf
         rb1YgjLA6JBv3BZ/7WU4On9MsvA9raSQxcN399IycTRm5L8UEFYNH4YfgVpbLhC88U
         YgXTweGlccahyPmaHb1FQoq0HpdqJcgua4JG+pEfFf07GS2+xNF5cyVBm0brk0X+Df
         4npDaFC0O+ccya0UYNJuRLjKWbyRu7BexQIIYJPz3ZGxVEuur+pyWf32+RmWaJUvVd
         rZdT6j8gbJyseq+UanJzKqfN+QEFExmxth9kY3vjyXTAmQSbd1XuGXcUFXsSgliXpn
         3cvQKPU5XEA1w==
From:   Mark Brown <broonie@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        devicetree@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Lubomir Rintel <lkundrak@v3.sk>, alsa-devel@alsa-project.org
Subject: Re: [PATCH v2 0/3] ASoC: dt-bindings: Rework audio-graph-port schema
Date:   Thu,  1 Apr 2021 11:16:21 +0100
Message-Id: <161726938994.2219.6158932183318290762.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210331142748.2163272-1-robh@kernel.org>
References: <20210331142748.2163272-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 31 Mar 2021 09:27:45 -0500, Rob Herring wrote:
> This series refactors the audio-graph-port.yaml schema moving the
> 'port' node out of the schema and updating to use graph.yaml schema.
> This allows users to define what each 'port' node is like other graph
> binding users.
> 
> v2:
> - Rebase on ASoC tree
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: dt-bindings: Move port/ports properties out of audio-graph-port.yaml
      commit: 9c1e0439ada9973ec99cc1e0887eb84fd26444b8
[2/3] ASoC: dt-bindings: Use OF graph schema
      commit: ec1c8302178a946986bb7b52ac7bb9ccdcdf7d92
[3/3] ASoC: dt-bindings: socionext: Use audio-graph-port schema
      commit: f1321c9766b2c9e79de268225e291dead0a8f969

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
