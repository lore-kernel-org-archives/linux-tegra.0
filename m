Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D625EB64D7
	for <linux-tegra@archiver.kernel.org>; Tue, 20 Jun 2023 19:09:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbjFTTJO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 20 Jun 2023 15:09:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229694AbjFTTJN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 20 Jun 2023 15:09:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE59E9B;
        Tue, 20 Jun 2023 12:09:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7F59D6142F;
        Tue, 20 Jun 2023 19:09:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46A8C433C0;
        Tue, 20 Jun 2023 19:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687288151;
        bh=nkI5tfmhaOsDvcJ1dA9Dh6elmE50z2C4gT7OjBXAIXM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=MY0+vGXnkCGHln2J7lYqrz8xV7MwkOlElkMsfOtnb2g8LVov/tRTIS5vnapZJcTAz
         FXz6CqqNM6aZRQ2Si4NrmWVJxYbFk+OjiQcxTNWMqHb8lQmvVB3+kHkxouuidSTnuR
         238sUtkCLwWIGvupTbRB7XMcggxWYqkUBHvrJ1HJB0DGhATLtUjh/T9mfdU7cv5WbT
         4K3jE5HLPkgqzmUNih353RjsmYRyfufMjCGM9AeKDYpSAejws6nWT7E6nG8ga9dVKv
         zavhuOC8/HOOhxIaAv3gDqKWSlpgORV0XdWM6zbwS246ns+zQrb9Nd6vxWmYRotaNW
         i7dgWNHKItNPQ==
Message-ID: <ebfdd001b9e83199ec618362b79f689c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <rgvgzbebuvehxhjxgalkqswodyt5mvh7vr57synt3gsuadlpj2@j2mlwe2tozeb>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech> <20221018-clk-range-checks-fixes-v4-65-971d5077e7d2@cerno.tech> <700c0c62-defd-01c1-3b1d-8a760dfa194f@gmail.com> <rgvgzbebuvehxhjxgalkqswodyt5mvh7vr57synt3gsuadlpj2@j2mlwe2tozeb>
Subject: Re: [PATCH v4 65/68] clk: tegra: super: Switch to determine_rate
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org
To:     Dmitry Osipenko <digetx@gmail.com>,
        Maxime Ripard <maxime@cerno.tech>
Date:   Tue, 20 Jun 2023 12:09:09 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Quoting Maxime Ripard (2023-06-19 00:26:19)
> On Mon, Jun 19, 2023 at 02:38:59AM +0300, Dmitry Osipenko wrote:
> > 05.05.2023 14:26, Maxime Ripard =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > >=20
> > > diff --git a/drivers/clk/tegra/clk-super.c b/drivers/clk/tegra/clk-su=
per.c
> > > index 3f3a7a203c5f..7ec47942720c 100644
> > > --- a/drivers/clk/tegra/clk-super.c
> > > +++ b/drivers/clk/tegra/clk-super.c
> > > @@ -142,15 +142,22 @@ static const struct clk_ops tegra_clk_super_mux=
_ops =3D {
> > >     .restore_context =3D clk_super_mux_restore_context,
> > >  };
> > > =20
> > > -static long clk_super_round_rate(struct clk_hw *hw, unsigned long ra=
te,
> > > -                            unsigned long *parent_rate)
> > > +static int clk_super_determine_rate(struct clk_hw *hw,
> > > +                               struct clk_rate_request *req)
> > >  {
> > >     struct tegra_clk_super_mux *super =3D to_clk_super_mux(hw);
> > >     struct clk_hw *div_hw =3D &super->frac_div.hw;
> > > +   unsigned long rate;
> > > =20
> > >     __clk_hw_set_clk(div_hw, hw);
> > > =20
> > > -   return super->div_ops->round_rate(div_hw, rate, parent_rate);
> > > +   rate =3D super->div_ops->round_rate(div_hw, req->rate,
> > > +                                     &req->best_parent_rate);
> > > +   if (rate < 0)

There's the report that this condition is never possible. Maybe the
previous code was relying on an error value sometimes. Can we add
determine_rate to the div_ops and simplify this code? I asked on the
list for that earlier.
