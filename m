Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E02FC433F5
	for <linux-tegra@archiver.kernel.org>; Wed,  8 Dec 2021 14:36:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235172AbhLHOjk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 8 Dec 2021 09:39:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231706AbhLHOjk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Dec 2021 09:39:40 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C8EAC061746;
        Wed,  8 Dec 2021 06:36:08 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id q3so4448114wru.5;
        Wed, 08 Dec 2021 06:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xPVIRLJod2C6UnvsCykmHGS4cWbtqfM8PoXPMuq8kp0=;
        b=m64vvWwXB3uCSJgULG5svNnBGuZ3mMy5JjfuP2/iO67iy8WmSeTzILZXAmPbnAITEe
         KlaMuIXg1orrOwvSQeLnPdOX03yW2EbUAFJbfiQOtGGANBCX/rQxBW6l3KWvucBKwgVJ
         vtguwLFUH5K1dL+Cr9CTfZUHrTZOdFDos8YxyAbnQP09lDpaHDkuaTxCZupxoUhpvLWm
         3UkSSrggCQyFeM+8nagYPXLRVOne3wneitO/f0VxIA/mjSELenuN28jJGQBYvlTz9lvj
         TPxEDe30c7+QqYPMtjzxyQ3PMNqSb9RaLXppL3+DMvJZI5dT3rM8r0fBNnhXZENA81hs
         Cglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xPVIRLJod2C6UnvsCykmHGS4cWbtqfM8PoXPMuq8kp0=;
        b=xeE0MAsiPQz0gOpdaJnQMRDtPBMvS3TPJjkxnrqcHyn801mxiG9WiS47JLa91H2vkm
         Uz1QjETragiQJFkBnAdl0LjkDFiiiPQcBIWy576DMwXpxnEgjySAdvglE6wJd0cabVe2
         81CZQGGTzkqOdQj7BU06GxBmThsq/F55CmofjFJToSrC0e5KEW9fy2M+2YZMQCL1jTQt
         B4gZmqAA1VPQHooQIzmaDZ5kySveCljsYP0u4nnY0qLYIC0jJF/arIqY1WDtXhM+kf4R
         avf2KMUB+LFqq4b4G6rnij3Q/8JMnKouykFFIiEmzP2i2QKdn1vk/DeHwNIGPtGekc8S
         Y6uA==
X-Gm-Message-State: AOAM5332x+DV4zKy2Qv5ZQGj7lwL00PiJKw83Ui9wY89JRuG0aYiOi5p
        ESavzqWup9Wd8ifVuKzBKV8=
X-Google-Smtp-Source: ABdhPJzqd7aJq7P2Y2j+5zgN3l3E5Ii/rbJvnGuTWjQSuo4IwKMg3WvwpwL+MbNdhftPZuS06OIoeQ==
X-Received: by 2002:adf:dd46:: with SMTP id u6mr61706549wrm.280.1638974166725;
        Wed, 08 Dec 2021 06:36:06 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id p8sm2823298wrx.25.2021.12.08.06.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 06:36:05 -0800 (PST)
Date:   Wed, 8 Dec 2021 15:36:02 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Will Deacon <will@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: perf: Support Denver and Carmel PMUs
Message-ID: <YbDC0sHeq49cdt0Z@orome>
References: <20211207150746.444478-1-thierry.reding@gmail.com>
 <20211207150746.444478-2-thierry.reding@gmail.com>
 <Ya+FzVuvQ3W8LOyl@FVFF77S0Q05N>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="r4zROj/eHft3UgPF"
Content-Disposition: inline
In-Reply-To: <Ya+FzVuvQ3W8LOyl@FVFF77S0Q05N>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--r4zROj/eHft3UgPF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 07, 2021 at 04:03:25PM +0000, Mark Rutland wrote:
> On Tue, Dec 07, 2021 at 04:07:45PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Add support for the NVIDIA Denver and Carmel PMUs using the generic
> > PMUv3 event map for now.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  arch/arm64/kernel/perf_event.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >=20
> > diff --git a/arch/arm64/kernel/perf_event.c b/arch/arm64/kernel/perf_ev=
ent.c
> > index b4044469527e..8c8cf369c450 100644
> > --- a/arch/arm64/kernel/perf_event.c
> > +++ b/arch/arm64/kernel/perf_event.c
> > @@ -1247,6 +1247,18 @@ static int armv8_vulcan_pmu_init(struct arm_pmu =
*cpu_pmu)
> >  				       armv8_vulcan_map_event);
> >  }
> > =20
> > +static int armv8_denver_pmu_init(struct arm_pmu *cpu_pmu)
> > +{
> > +	return armv8_pmu_init_nogroups(cpu_pmu, "armv8_nvidia_denver",
> > +				       armv8_pmuv3_map_event);
> > +}
> > +
> > +static int armv8_carmel_pmu_init(struct arm_pmu *cpu_pmu)
> > +{
> > +	return armv8_pmu_init_nogroups(cpu_pmu, "armv8_nvidia_carmel",
> > +				       armv8_pmuv3_map_event);
> > +}
> > +
> >  static const struct of_device_id armv8_pmu_of_device_ids[] =3D {
> >  	{.compatible =3D "arm,armv8-pmuv3",	.data =3D armv8_pmuv3_init},
> >  	{.compatible =3D "arm,cortex-a34-pmu",	.data =3D armv8_a34_pmu_init},
> > @@ -1265,6 +1277,8 @@ static const struct of_device_id armv8_pmu_of_dev=
ice_ids[] =3D {
> >  	{.compatible =3D "arm,neoverse-n1-pmu",	.data =3D armv8_n1_pmu_init},
> >  	{.compatible =3D "cavium,thunder-pmu",	.data =3D armv8_thunder_pmu_in=
it},
> >  	{.compatible =3D "brcm,vulcan-pmu",	.data =3D armv8_vulcan_pmu_init},
> > +	{.compatible =3D "nvidia,denver-pmu",	.data =3D armv8_denver_pmu_init=
},
> > +	{.compatible =3D "nvidia,carmel-pmu",	.data =3D armv8_carmel_pmu_init=
},
>=20
> Super trivial nit, but could we please organise this alphabetically (i.e.=
 with carmel first?)
>=20
> With that:
>=20
> Acked-by: Mark Rutland <mark.rutland@arm.com>
>=20
> I see now that we messed up the order of "cavium,thunder-pmu" and
> "brcm,vulcan-pmu", but otherwise this is ordered, and it's be nice to kee=
p it
> that way. I can fix the order of those two in a separate patch.

I ordered this chronologically (Denver for Tegra186 and Carmel for
Tegra194), which seemed a bit more natural, but I can reorder this
alphabetically if you prefer.

Would Will be the right person to pick this up or should I take it
through the Tegra tree and then ARM SoC?

Thanks,
Thierry

--r4zROj/eHft3UgPF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGwwtIACgkQ3SOs138+
s6F5BA/9F7YRXPm1K8XoDtqFZ+8CLvpYKkE6JwCCO0kJ53Iy8h8rCXXfhPchj4pn
WiQVnQoG9VPh0vjcDdgeD6yGZHJoXQSP+1d7+60Qdxhrh/Altbc29LjP6yM6yZaK
dU+blxFqdqtma3JKmVg+EHFtTEHjzVEy0fEMoymb294e4tZ9ye8P5Chq3H1g+i4U
1dz+WjEsQvpqe5hKffSpTAFmo/wKCrFSque2wlNJqQJoSSkx0rj3OPSkfq2z5TNz
Rg+IAOVVhlcpRVKb1V8Uoeg4lvhxVqhMYYlt9DD6AkQ1NFIWKUzEkwCKtMwN8YhL
CGvfYaPVfwvUF7OFOq2AZP1tl4puZnNc4SCePjKPZuSczUGFFDOYp2n1vxzC4IVu
qx3qiXjatTRsh5JS4nEsLdWgj2unHIg4BiqV/0pS7tMwJpdeGRpb1kFPolHXtD+4
QwhHLRtxDToYjcBy/Dv+NkpzCvtTH+uy5n4ekeRvhmpfTqC+/b+RGHaTuBdCle4f
90mdmfTfR76rgp+9ySN8Oco+0vczPTrPh03oNfyEgeDfjd3HlgMNoDcBoNfsRprh
WDaqGhjNw8553DuFuKFNwY4qEh5lJ78n9wkoY1heVCCGHlWD2x0aKjGvw4oT3aWL
vdhFMHVHqbrAqdQT1P5LKmjOTvvmXX9L908EUewWgBLVsJ2JwWk=
=+7eP
-----END PGP SIGNATURE-----

--r4zROj/eHft3UgPF--
