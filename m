Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ED98C433E0
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 15:18:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 41E1B23884
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 15:18:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727198AbhAOPSD (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Jan 2021 10:18:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726030AbhAOPSC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jan 2021 10:18:02 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45F00C061757;
        Fri, 15 Jan 2021 07:17:22 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id a9so6181698wrt.5;
        Fri, 15 Jan 2021 07:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Rn8B8MuwQWnHgwFQsAJAfdLGa99uP8DpkyAhVSsSfbk=;
        b=E2T3IAbHP6omiSvK4BCmnPErJZQtT8mFjhg9kk0r8EzmhqXpMKoCC1diosA11ESjvv
         Fq6kG1YaRM+kt/xC3HFuRUepB/lzb5XNH32UmksJtVPO3QtSNTYTRKxP7iXRsC6zOCGa
         k8fFoxEKrA8IIxo+FvpaV29hZnCQRLKnmElgZQZTuMiGSfpij51pu4p5uWNOZlY5/9Tw
         l3o0uB8Szm99NAuOFlnsaOZJBS5ZVGY0ouVNhAXBV+mSpJ5mRzjndDX7MYaLWtYcUw/D
         O1p3eVbbu5N2L2dV6UsRAY52V/TDtAb1Jh6qD5rsX673qKHzg2vhfXK4kXi12qCqazlB
         D7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Rn8B8MuwQWnHgwFQsAJAfdLGa99uP8DpkyAhVSsSfbk=;
        b=qUmcoh6i85FvS2X0z3tFeedUCun9zME8XkislaH0coACRxXIMCMOJye1gZqW8GEDSV
         XddhILK4NJ44/Qq6ZVMfCXdOfn9NaQxy7TRfGnW3URqP0g1FoAug8he9znlX0h40QE72
         Hc/qInYzbHFVPILWxkTz6ptGdhtZBfaM3S2G6D8WJZDKIdm7xoOYdIbfQF0X53HRV6xk
         aMRgxeiSqLyYUrMAKAgMKoZNJIxwd9XGNbR14b1iG9MLaqvxVok+LQAlaHNIev6VHJC6
         PtBF8W9NyM9FRvqw8bLAU7++qZ/B1yxypA2wX++UhQPg2MwqZbfvIvnUsakypH6XIzxP
         ycIA==
X-Gm-Message-State: AOAM531LvORS5lFvPcmPC4buDyMYoDzWO0l/plHNZxkxzpCGmOLtBPss
        pJIcaKTrzsLD4ybpg1T6OrIBHCwxUCA=
X-Google-Smtp-Source: ABdhPJxG1MfvfUBsrVny1rN9Q4NK+drXL1XNjSIiahS4cwsYT6H43DunZ0iFiSP9HjUNj0UGJ7ojJA==
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr13594764wrw.386.1610723840990;
        Fri, 15 Jan 2021 07:17:20 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id o14sm12994184wmc.28.2021.01.15.07.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 07:17:19 -0800 (PST)
Date:   Fri, 15 Jan 2021 16:17:18 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/5] clk: tegra: Fix refcounting of gate clocks
Message-ID: <YAGx/vLxbz61Ccfy@ulmo>
References: <20210112122724.1712-1-digetx@gmail.com>
 <20210112122724.1712-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="nE3Hy/EvnDZdy3nP"
Content-Disposition: inline
In-Reply-To: <20210112122724.1712-3-digetx@gmail.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--nE3Hy/EvnDZdy3nP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 03:27:21PM +0300, Dmitry Osipenko wrote:
> The refcounting of the gate clocks has a bug causing the enable_refcnt
> to underflow when unused clocks are disabled. This happens because clk
> provider erroneously bumps the refcount if clock is enabled at a boot
> time, which it shouldn't be doing, and it does this only for the gate
> clocks, while peripheral clocks are using the same gate ops and the
> peripheral clocks are missing the initial bump. Hence the refcount of
> the peripheral clocks is 0 when unused clocks are disabled and then the
> counter is decremented further by the gate ops, causing the integer
> underflow.
>=20
> Fix this problem by removing the erroneous bump and by implementing the
> disable_unused() callback, which disables the unused gates properly.
>=20
> The visible effect of the bug is such that the unused clocks are never
> gated if a loaded kernel module grabs the unused clocks and starts to use
> them. In practice this shouldn't cause any real problems for the drivers
> and boards supported by the kernel today.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clk/tegra/clk-periph-gate.c | 72 +++++++++++++++++++----------
>  drivers/clk/tegra/clk-periph.c      | 11 +++++
>  2 files changed, 58 insertions(+), 25 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--nE3Hy/EvnDZdy3nP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmABsf4ACgkQ3SOs138+
s6ECxA//RfZCHoNJPDi3/f3A/5AMK2y6gZ60LAyfi7b3R8gmG4V6qvVhlbNglqSj
VuiBxeyAe+9tXd3bd8emWyi+nPvvf/bH6wOyZ44vlwTGmFwYDgci9D1h3Pz79DG4
9FOl0ve1stOk7rdvc7RdvAv2FulsoBG+CDMSo7xnsMpMKhMLpcjPJ72owhUgzEww
lXe9IDiqBKkzysvVpd8HJ06G/NW7ulfc/GOgUt9htQXVIDf0RByCvNGKbN27U93F
Gjsk1Z1OR2s5KGwFxW4ZeCdWW0ZDDtSxBc4SAyk7X3cPBDgnhKkl1nAqgA1etJi7
1FvIZTiUBDAION/3k8+aHu4xn0LrfF7ENDa6rPIp+72xQKxYvsfF4y/A/zQitKfm
4Q08Hc8c6LdMXhcimsj0gIiQ6Jinyhq4SDiuChSH1gqHAr/Vv0gRy222hlSbWMYQ
Xcjee83nm/fTRGN77BUKSHk7/u8O5viRPvwwfGDnp56ZJUnmRqMlLXgx/hpomaeU
BSucw23k4VMxGxajn4w091MkjXH0yjQpO6r7hm4+Yb/Y4UrC0dP/qNDh5av3FB26
YJGesQWHvrXM5HaIPsesK2T4gT70T66CgtZGmRD4OIUzuUvGKBR/hUmCEifrJ/IJ
v49hoqb5DAAPR9Bn//z90SUsdDvIUxcg/o8Li/41c5H61Y9pyWU=
=B5fn
-----END PGP SIGNATURE-----

--nE3Hy/EvnDZdy3nP--
