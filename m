Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB20EB64DD
	for <linux-tegra@archiver.kernel.org>; Fri, 30 Jun 2023 04:57:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbjF3E52 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 30 Jun 2023 00:57:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjF3E51 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 30 Jun 2023 00:57:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD222694;
        Thu, 29 Jun 2023 21:57:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3DBCC61666;
        Fri, 30 Jun 2023 04:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90192C433C8;
        Fri, 30 Jun 2023 04:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688101045;
        bh=/Gv7k9nnR/yJX6bGTyZOrsOFmHR09BxZGIyqwbFXlOY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jPYSeUbh79HnMI9fKX+kCHPGRN0jYfA+GGTYWphA9GJkSI0VOuEZa2jYhyRa2JP3o
         FXcsjv2okqZMIOo6ruvEFPf9TazwJFNGthtHqtZqZ8KgpiXQauUHXc8LznmGr1mtSy
         J3wqZzSt/q73D/PIglqHoPHW1+8J4OXODN4XOZr5xhgItJg7nMLOqr+jTjPdcStH5P
         TxF3DAk+BL3sdG53Dx/v9VT1NHioDEiLwYn+G33I7Snwx2UhR0HkaaQN/n7TtkWopE
         h5YOyH3FRJAQ8CL3X98MFYum4x3BWrfotJjHK+NCZcEEdcxJAZwa16adfplXD+XoBU
         1ftKg0NAF0WbQ==
Message-ID: <862b52d5cd0f109709f6a47b03b6add6.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZJMYrVl--rCcj1cB@orome>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech> <20221018-clk-range-checks-fixes-v4-65-971d5077e7d2@cerno.tech> <700c0c62-defd-01c1-3b1d-8a760dfa194f@gmail.com> <rgvgzbebuvehxhjxgalkqswodyt5mvh7vr57synt3gsuadlpj2@j2mlwe2tozeb> <ebfdd001b9e83199ec618362b79f689c.sboyd@kernel.org> <ZJMYrVl--rCcj1cB@orome>
Subject: Re: [PATCH v4 65/68] clk: tegra: super: Switch to determine_rate
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        linux-tegra@vger.kernel.org
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
Date:   Thu, 29 Jun 2023 21:57:23 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2023-06-21 08:35:09)
>=20
> I was able to reproduce this on a Tegra30 Beaver, but the problem is
> more straightforward than this. The crash I was seeing during boot was
> because cclk_super_determine_rate() was still calling the round_rate()
> callback from tegra_clk_super_ops, which this patch removed (and added
> determine_rate() instead).
>=20
> The following fixes the problem for me. It's basically converting the
> round_rate() call to an equivalent determine_rate() call.
>=20
> Dmitry, can you verify that this fixes the issue that you were seeing?
>=20

Can you send this as a proper patch? I'd like to send this early next
week.
