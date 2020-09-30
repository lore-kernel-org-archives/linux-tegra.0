Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A16C4727C
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 16:15:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9EDC20789
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 16:15:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vEs2gDaV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbgI3QPH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 12:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbgI3QPH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 12:15:07 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C80AC061755;
        Wed, 30 Sep 2020 09:15:07 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id j11so3717718ejk.0;
        Wed, 30 Sep 2020 09:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kE8pUQeSQicwQZVIKpx0wVouaS5mSuVoVumXEb40dpU=;
        b=vEs2gDaVZYsmIz2uXHTT7F2ngJyj01YBJq55PGeSXgHDmGf/n4UsDeXaDm46ygSWl+
         efw+9lrPs9eWvVHSNSjyZ7+KtwpVID96yPPy22qiPjtn/2ACxIo71CkXzJJRBTlmUYgw
         9CfR7CbsUp5mxsRO3P2DCZAoMUE5FhgulKrYIhghlfpFIDnbLClNbrTClv0RIYlF+074
         s8bk2o2ttzVL1idJ8S2+KbWwCgIOI95Gc/j9/yJHMHPTIgmm7Itlvgzwso/5V8W42TxM
         Sbm2Tm2Sv67JwEY7KgLv25inXUuN+0wIeVhUg7esxLG4Pavb4sbI7oyAvM8uRqZKoTPu
         YcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kE8pUQeSQicwQZVIKpx0wVouaS5mSuVoVumXEb40dpU=;
        b=UFnKY+w4esU4S7J9RT/YxfERDPAcXxRJkhHS57ikesKPCPjelglr58RK9n2GMiGUo7
         OMq6zuA7nyrgP4B3Xi/CidOoln7Yu4dOz//pSnBucqsHtdlH/fYxyA1C6h2B6vS3J2r6
         WXxvmu5wTNx6eRSSVZIN1qF6M48BmzzEwvXhMoPclvM6a9+YiupJ4Npcb0TyxpAV4HVy
         9r5PYZZpyT6pmhd5fen8fk7AEXFyNgml2WFV6e9sQzUETbs4jY7Iuwb4omFQ+uCydO61
         GdHCcV9+lGkvE+JsxWo1CDS9W51tYsnADgp/OiCkg7uU/obUSvfTlpq178olm/1pEoDJ
         3vZg==
X-Gm-Message-State: AOAM53209bq/m+jsqLtA504p9VmBqJ50tvA8CDjEsdZpOew6YSXV7OpY
        mzfCnOzpbwfAs12yStsO7gELvtRuM1o=
X-Google-Smtp-Source: ABdhPJw6+D6kvpNUGSeOdQb4MLX0XxcMPxQ+Z1guG4ri+sfmREV9+TL9tPln+WLbWcuDblAdz9OWFQ==
X-Received: by 2002:a17:906:f110:: with SMTP id gv16mr3078005ejb.257.1601482506094;
        Wed, 30 Sep 2020 09:15:06 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id dv25sm1977144ejb.69.2020.09.30.09.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 09:15:04 -0700 (PDT)
Date:   Wed, 30 Sep 2020 18:15:03 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] memory: tegra: Add
 devm_tegra_get_memory_controller()
Message-ID: <20200930161503.GF3833404@ulmo>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-2-nicoleotsuka@gmail.com>
 <20200930152320.GA3833404@ulmo>
 <ed7b4375-d06e-2750-e6fa-603ef2b60d36@gmail.com>
 <20200930160355.GC3833404@ulmo>
 <839df5d6-513f-3d77-ba5f-a1afe5d0883a@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eDB11BtaWSyaBkpc"
Content-Disposition: inline
In-Reply-To: <839df5d6-513f-3d77-ba5f-a1afe5d0883a@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--eDB11BtaWSyaBkpc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 07:06:27PM +0300, Dmitry Osipenko wrote:
> 30.09.2020 19:03, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Wed, Sep 30, 2020 at 06:53:06PM +0300, Dmitry Osipenko wrote:
> >> 30.09.2020 18:23, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >>> On Wed, Sep 30, 2020 at 01:42:56AM -0700, Nicolin Chen wrote:
> >>>> From: Dmitry Osipenko <digetx@gmail.com>
> >>>>
> >>>> Multiple Tegra drivers need to retrieve Memory Controller and hence =
there
> >>>> is quite some duplication of the retrieval code among the drivers. L=
et's
> >>>> add a new common helper for the retrieval of the MC.
> >>>>
> >>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >>>> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> >>>> ---
> >>>>
> >>>> Changelog
> >>>> v2->v3:
> >>>>  * Replaced with Dimtry's devm_tegra_get_memory_controller()
> >>>> v1->v2:
> >>>>  * N/A
> >>>>
> >>>>  drivers/memory/tegra/mc.c | 39 ++++++++++++++++++++++++++++++++++++=
+++
> >>>>  include/soc/tegra/mc.h    | 17 +++++++++++++++++
> >>>>  2 files changed, 56 insertions(+)
> >>>
> >>> Let's not add this helper, please. If a device needs a reference to t=
he
> >>> memory controller, it should have a phandle to the memory controller =
in
> >>> device tree so that it can be looked up explicitly.
> >>>
> >>> Adding this helper is officially sanctioning that it's okay not to ha=
ve
> >>> that reference and that's a bad idea.
> >>
> >> And please explain why it's a bad idea, I don't see anything bad here =
at
> >> all.
> >=20
> > Well, you said yourself in a recent comment that we should avoid global
> > variables. devm_tegra_get_memory_controller() is nothing but a glorified
> > global variable.
>=20
> This is not a variable, but a common helper function which will remove
> the duplicated code and will help to avoid common mistakes like a missed
> put_device().

Yeah, you're right: this is actually much worse than a global variable.
It's a helper function that needs 50+ lines in order to effectively
access a global variable.

You could write this much simpler by doing something like this:

	static struct tegra_mc *global_mc;

	int tegra_mc_probe(...)
	{
		...

		global_mc =3D mc;

		...
	}

	struct tegra_mc *tegra_get_memory_controller(void)
	{
		return global_mc;
	}

The result is *exactly* the same, except that this is actually more
honest. Nicolin's patch *pretends* that it isn't using a global variable
by wrapping a lot of complicated code around it.

But that doesn't change the fact that this accesses a singleton object
without actually being able to tie it to the device in the first place.

Thierry

--eDB11BtaWSyaBkpc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl90rwcACgkQ3SOs138+
s6EaixAAqbOV/ijTS5FkR08q2KCQomBCj0Q4t0RdougoBkbNGOffkJbO06l69JQP
S1o6d+r6P1rpZj/2K6/7VyzCqLCa5zpA19R7/GDyBJ+DO0TSQ93WxBIf4XgVoprP
igWzDkJiEFISjKNl3MP2KjxkYFDMC/ZQy4GF3bJvRpjFq4tVCYggaAAU7aeMutxa
DnChwV37zJvFT/6bIFu4gI+VJaBjfxzn36ahS4iGUQkOgF8z7dKcXK9tUwheomYb
sdayQ1WlKlrQQ8SnrodoFDNooEhBPZeLC3O4iNonxnetZbgmoZ8xt0M0OaMnFi/M
/xSqK1eJSn7RVL0+x1hajlsuJdYYhrnKPzUzLZIdBWFcJCIXrMIZ08dpwnkTbzjv
45JoaaQlyOg4HQgSuWi/p0p709nzuY9lJID+/2R4HwkKDgVC/NdCtHJHgoZBHqyF
khK3kGeXhfQfsNjPfjbbZoADbymdTAt7W5VebFpIjtXooXmeyTX1uBVGRgrpnBD/
WIi1Z8GO3slDFlGk7RukIUqgvzwy/YJopV/E7oLsg/4V6SloATkgVCPNUrGiBmVu
5x3n9/ES2Uye/ALQa1TPJ4Jg155hqPrnxA6EYicSiVfHOjfMsECZGXinGiAIo6rX
4JKNpEcoJan0+1BcPKjTfXVMzU6pZcjbqgBbTi4qViDSxtYKkGQ=
=u6UA
-----END PGP SIGNATURE-----

--eDB11BtaWSyaBkpc--
