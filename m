Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 535D6C74A5B
	for <linux-tegra@archiver.kernel.org>; Wed, 29 Mar 2023 22:32:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229510AbjC2Wcg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 29 Mar 2023 18:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjC2Wcf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 Mar 2023 18:32:35 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F4061FFB;
        Wed, 29 Mar 2023 15:32:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 057D8B82340;
        Wed, 29 Mar 2023 22:32:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD8CC433EF;
        Wed, 29 Mar 2023 22:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680129151;
        bh=rzrOozTmrwuRtHt2xjwHRL8g41kAwGeO5CPWDPvbeTk=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=brLRzfD+8TsFypnXecusp3sgk3xfoy6LxpBOoQ1Ii3XwNKZVZc29NwfyZO9sUhzqy
         c9ciol+mZO8f02tEZ9MtDx5IY1IIu9rkqqoV9D+Zy6g4xaX4Ik59g8mf82mFUA67PN
         N9SnHOQ5sYDB6JSGF/I9QGhZOqEfrNQTrzvL5DfgxvJz08+Ao4rF4iZR4LMuphfflB
         xO0TxfCPGVSoNDagtpL7cETOd6TqXH8h5+80rO/isSNt8unkWZAcmU1omCfldqt3UB
         CpKUiCnaZTu9WwOzyC2t1hdhsD/46fxqmVVzU697+4ka6Jd0yP5YwepTPlIHjzq5iQ
         FVxNhGlpuOn0w==
Message-ID: <c9bfdce3487b195acc752fb9625c4dd3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230227085914.2560984-1-arnd@kernel.org>
References: <20230227085914.2560984-1-arnd@kernel.org>
Subject: Re: [PATCH] clk: tegra20: fix gcc-7 constant overflow warning
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Uwe =?utf-8?q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Miaoqian Lin <linmq006@gmail.com>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Arnd Bergmann <arnd@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Wed, 29 Mar 2023 15:32:29 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Arnd Bergmann (2023-02-27 00:59:10)
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Older gcc versions get confused by comparing a u32 value to a negative
> constant in a switch()/case block:
>=20
> drivers/clk/tegra/clk-tegra20.c: In function 'tegra20_clk_measure_input_f=
req':
> drivers/clk/tegra/clk-tegra20.c:581:2: error: case label does not reduce =
to an integer constant
>   case OSC_CTRL_OSC_FREQ_12MHZ:
>   ^~~~
> drivers/clk/tegra/clk-tegra20.c:593:2: error: case label does not reduce =
to an integer constant
>   case OSC_CTRL_OSC_FREQ_26MHZ:
>=20
> Make the constants unsigned instead.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to clk-next
