Return-Path: <SRS0=stlo=EC=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF80C388F9
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Oct 2020 12:55:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0F6A622453
	for <linux-tegra@archiver.kernel.org>; Tue, 27 Oct 2020 12:55:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XKbecVq1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2900329AbgJ0MzN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 27 Oct 2020 08:55:13 -0400
Received: from mail-ej1-f67.google.com ([209.85.218.67]:37659 "EHLO
        mail-ej1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439375AbgJ0MzN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 27 Oct 2020 08:55:13 -0400
Received: by mail-ej1-f67.google.com with SMTP id p9so2079801eji.4;
        Tue, 27 Oct 2020 05:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NmWbBGj0lkHe0t79tv/Jf0SQbBWE8aedRom+eTRmfzc=;
        b=XKbecVq1Ik0kDILHFzzL8d8bpttLxS6dESkXXO8J4CXuqnb9t6t5hdiFWWhOtsrxGl
         FfT1Z2nHdRwX41X1K88ruflhzopy8zrF//t+SD242mAlwU+zZ9jiY7vu0rP4YkGGKB2e
         6UkVAxr/JgGrZxP0YOzvgLTgyb+sFMkpmvl2M2R2FgzHNYkKMCPMZE/No2X6vSYkJsha
         +3U6G/kklfJ/3i/JzCoTfYQVHfV1rIvs2dycsXJOezsm+jiqnde/tx8G18la6hTkNBDt
         Ap1jpfkVhgYGFJCnlWTZfPjYdScWsMu8NR5463W1kf2sulLsq7HreIJQA4vfTLU32jvc
         Gwuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NmWbBGj0lkHe0t79tv/Jf0SQbBWE8aedRom+eTRmfzc=;
        b=WyvSObybhQCAQt4P4AIcM7nDwlLyP4c+o/QlNGKt7bO7/iyf9dPG0e99T4mX+sqUXt
         jfb1Q6bbzn6DwOH7odZ2N/irT51M6bJrntuAZ9JCkvRel+7cvF1xeVfWDtlkr5dxOvsU
         yH4TyIYKvb4mgMHEyYIRJVEHwJiDgdIgtHWBEANQMde+zV+3Ies9nPvkJPsaYuqq5vhs
         02/OqmL39ETv23fxi5yV/iO0uAKHFXQ81qQeD78+5C7bBhbYytS+jOQB+Ubfi1VQmlAS
         8FyOQ6iZZZHXxSQucZUroi3O4OR6C5262gSiABb5fbz1bLMStN5Nbd4L3LxMat6HKYoE
         bSCQ==
X-Gm-Message-State: AOAM5324XTimUFpQdatySTOEG63F9GNVXQB9eZQnrbE5YsVcqCsvADNK
        D2mSjCS+M6fLiMlbX5w2A+g=
X-Google-Smtp-Source: ABdhPJz3kwQEXps0U4CXrM9GDXdaXs2o9NBv9jhp3Vmq5iDuCFu/Vxe55NWvsrFgADjy8eqP8FsubQ==
X-Received: by 2002:a17:907:b19:: with SMTP id h25mr2372404ejl.368.1603803309253;
        Tue, 27 Oct 2020 05:55:09 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id sb29sm1013080ejb.76.2020.10.27.05.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 05:55:07 -0700 (PDT)
Date:   Tue, 27 Oct 2020 13:55:06 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, robh+dt@kernel.org,
        jonathanh@nvidia.com, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] dt-bindings: memory: tegra: Add missing swgroups
Message-ID: <20201027125506.GA1822510@ulmo>
References: <20201008003746.25659-1-nicoleotsuka@gmail.com>
 <20201008003746.25659-5-nicoleotsuka@gmail.com>
 <20201009122110.GD458338@ulmo>
 <20201009155218.GA4469@Asurada-Nvidia>
 <20201026201758.GD248919@kozik-lap>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline
In-Reply-To: <20201026201758.GD248919@kozik-lap>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2020 at 09:17:58PM +0100, Krzysztof Kozlowski wrote:
> On Fri, Oct 09, 2020 at 08:52:18AM -0700, Nicolin Chen wrote:
> > On Fri, Oct 09, 2020 at 02:21:10PM +0200, Thierry Reding wrote:
> > > On Wed, Oct 07, 2020 at 05:37:45PM -0700, Nicolin Chen wrote:
> > > > According to Tegra X1 TRM, there are missing swgroups in the
> > > > tegra210_swgroups list. So this patch adds them in bindings.
> > > >=20
> > > > Note that the TEGRA_SWGROUP_GPU (in list) should be actually
> > > > TEGRA_SWGROUP_GPUB (in TRM), yet TEGRA_SWGROUP_GPU (in TRM)
> > > > is not being used -- only TEGRA_SWGROUP_GPUB (in TRM) is. So
> > > > this patch does not add TEGRA_SWGROUP_GPU (in TRM) and keeps
> > > > TEGRA_SWGROUP_GPU (in list) as it is.
> > > >=20
> > > > Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> > > > ---
> > > >  include/dt-bindings/memory/tegra210-mc.h | 10 ++++++++++
> > > >  1 file changed, 10 insertions(+)
> > > >=20
> > > > diff --git a/include/dt-bindings/memory/tegra210-mc.h b/include/dt-=
bindings/memory/tegra210-mc.h
> > > > index c226cba9e077..f9fcb18a6d9b 100644
> > > > --- a/include/dt-bindings/memory/tegra210-mc.h
> > > > +++ b/include/dt-bindings/memory/tegra210-mc.h
> > > > @@ -33,6 +33,16 @@
> > > >  #define TEGRA_SWGROUP_AXIAP	28
> > > >  #define TEGRA_SWGROUP_ETR	29
> > > >  #define TEGRA_SWGROUP_TSECB	30
> > > > +#define TEGRA_SWGROUP_NV	31
> > > > +#define TEGRA_SWGROUP_NV2	32
> > > > +#define TEGRA_SWGROUP_PPCS1	33
> > > > +#define TEGRA_SWGROUP_DC1	34
> > > > +#define TEGRA_SWGROUP_PPCS2	35
> > > > +#define TEGRA_SWGROUP_HC1	36
> > > > +#define TEGRA_SWGROUP_SE1	37
> > > > +#define TEGRA_SWGROUP_TSEC1	38
> > > > +#define TEGRA_SWGROUP_TSECB1	39
> > > > +#define TEGRA_SWGROUP_NVDEC1	40
> > >=20
> > > I'm not sure this is right. The existing list is based on "Table 4:
> > > Client to Software Name Mapping" from page 28 of the Tegra X1 TRM, and
> > > none of these new swgroups seem to be present in that table.
> >=20
> > I went through all the MC_SMMU_XX_ASID_0 registers. All of
> > them have their own ASID registers that I added in PATCH-5.
>=20
> Thierry,
>=20
> Any follow ups on this topic? Does it require a fix or looks correct?

This does indeed look correct, based on what registers exist for these.
It'd be good to know how Nicolin expects these to be used, since these
are currently not listed in device tree. There's certainly some like
TSEC or NVDEC that we don't support (yet) upstream, but things like DC1
and HC1 already have equivalents that we use, so I'm not sure how we'll
integrate these new ones.

I suppose it doesn't really matter if any of these end up being unused,
so:

Acked-by: Thierry Reding <treding@nvidia.com>

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+YGKUACgkQ3SOs138+
s6HdXQ/9GY5+CG+UleVCHEphwtCAPS/kk6cf5OqVlP0/1Txw2gaC5IA0IlgZBcrI
TB2IxEFKsQQV4yIeGqWfrBpHw3vq3NN0T281dzvp7Qt4L0ZW0ZukGerMJu+OrDEt
d5nkbkqblillWQtd3Gh42GOxIF5E/ZTFuW+jrSOJZX5Q4Fd6c0nkU9+sUxj+SsD2
lUX7u+fCYP3U11kx6dxbhTm6cXGDzVNwXUu789DSIq97vL8IpvjlkfM3BGb5P30/
m0Nxv2YtnxaggYR7jFtxFkZz6mXDlTMsMv4h6EmKGVXPchj8kj8Te7u8IKblX3wC
yx88smlCqCLhFYhJY/v8kL4oYve6e4FIL1Fl/VbU+1Vy+dOwcx+LMM/gfCIOg6Un
VMjtNqAa9TOIZxtPTOsRZa6CgY6UzjRzhWPzjhOGFq4ndsvRMNl9al0l9Qu6tFEJ
BH2uHj8rcAhv8bebLwPhTBYmHciBJL2Rl711LCPY8wubPOwQwAAnf9hwfRAzui+/
11V3EFh/8LEebyQGzuVc57E5xVKcW9o6IIayZRvI+LZ0eNAJ0E1TGzXePyUv8izY
QVPUp/bPG0OUCmPM7P2A2c9uDeMO2qI6yGFz1lkG3yvUy+05hTNvuL0oZICNPesz
LlhxnJ5I8TvPiTTGXn5e7aEGhFSRc0CjAiXFm9rCkiJtMuPbzas=
=H//q
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
