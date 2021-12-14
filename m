Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BAB8C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Dec 2021 14:28:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232993AbhLNO2y (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 14 Dec 2021 09:28:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231863AbhLNO2q (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Dec 2021 09:28:46 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 130F6C06175B;
        Tue, 14 Dec 2021 06:28:46 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id u17so32713884wrt.3;
        Tue, 14 Dec 2021 06:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=awq8J+EnjglYjadw3b6na7GHHK3TExFi3HKDbSvOXwY=;
        b=TjTc8ZsPlWsUBDzSiiTKTKNlyoYvpfkV6uvyCs19XzqLLePlLaDSv0U5R6HM44P+i1
         NPHfUKjP9OTsk+NxjWLHW7cEFG8wIxfJfSDnseJDwdhLKf4Dr03gaProGC/RGFrrjv5M
         YA9KCff+x5loW0HUka6UF3YshUnPdYWvCT7IUAydC5Zsc27Xco/5IlKDuYSQ7mQw/tWC
         uz4t1/wIUcPBDRB3iYleWEYR5Ep++5cA03CocL1Wk0l67n2nJnVMaA6/rNBrkRVQ89O9
         gDubAvggwFCY/WyFRRVujIyickM4Bsr+seVqpGKoZikkldyU1HP3EubRcB0CtIbUp0J2
         Nm4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=awq8J+EnjglYjadw3b6na7GHHK3TExFi3HKDbSvOXwY=;
        b=Eh73uNJIlvq+3JqcqWI2PCR0uTfvz5UtxkPhaSByfkklkY5JRjc+weXd1UDU7siPsu
         1oh8X+RvahiPApulUCqTCyrx2WQ3VIVVc4Kb8RsSA9C93h6y49pgaA56KrqlGCg2SDzU
         CY7vBZG9jCW2xmzPm6dbu/BMIuMC30Z4IKS3rjBah6tleb4Bqg+ksp/NvhA2Py0QKIRP
         90K43k+mVl4MMi9NaUsMjl8DU/qh6Ql+tb1fed9g5gBMhUPG96HN+zEma4xCfzex/vDp
         79LUfzFCVa6UsYxuRBGA/Y3RuA5Fwln4SNjuvUy6kHyZ+oKCqfTkxgDdjhkaOcSVtS92
         spWg==
X-Gm-Message-State: AOAM533aVOfDM48+yTR0ZRcylI8ghjFs1gRoGrgKYfJA/UtQ9CbnksPK
        +FnVSF2Lfhtk7C7Nx8PxR3o=
X-Google-Smtp-Source: ABdhPJzgRT+eLWDcKHNH+S0nfELZk/MkqDHNrAMDDsqG6kJNHWLe7JNenxdWiX2PqF7sNs1RBWAMmQ==
X-Received: by 2002:adf:ef05:: with SMTP id e5mr5916800wro.688.1639492124610;
        Tue, 14 Dec 2021 06:28:44 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id o12sm30420wrc.85.2021.12.14.06.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 06:28:43 -0800 (PST)
Date:   Tue, 14 Dec 2021 15:28:40 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: perf: Support Denver and Carmel PMUs
Message-ID: <YbiqGCJ8U9TTS3nr@orome>
References: <20211207150746.444478-1-thierry.reding@gmail.com>
 <20211207150746.444478-2-thierry.reding@gmail.com>
 <Ya+FzVuvQ3W8LOyl@FVFF77S0Q05N>
 <YbDC0sHeq49cdt0Z@orome>
 <20211214123353.GD14247@willie-the-truck>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ov6tsdrMxCrxuHnJ"
Content-Disposition: inline
In-Reply-To: <20211214123353.GD14247@willie-the-truck>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ov6tsdrMxCrxuHnJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 14, 2021 at 12:33:53PM +0000, Will Deacon wrote:
> On Wed, Dec 08, 2021 at 03:36:02PM +0100, Thierry Reding wrote:
> > On Tue, Dec 07, 2021 at 04:03:25PM +0000, Mark Rutland wrote:
> > > On Tue, Dec 07, 2021 at 04:07:45PM +0100, Thierry Reding wrote:
> > > > From: Thierry Reding <treding@nvidia.com>
> > > >=20
> > > > Add support for the NVIDIA Denver and Carmel PMUs using the generic
> > > > PMUv3 event map for now.
> > > >=20
> > > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > > ---
> > > >  arch/arm64/kernel/perf_event.c | 14 ++++++++++++++
> > > >  1 file changed, 14 insertions(+)
> > > >=20
> > > > diff --git a/arch/arm64/kernel/perf_event.c b/arch/arm64/kernel/per=
f_event.c
> > > > index b4044469527e..8c8cf369c450 100644
> > > > --- a/arch/arm64/kernel/perf_event.c
> > > > +++ b/arch/arm64/kernel/perf_event.c
> > > > @@ -1247,6 +1247,18 @@ static int armv8_vulcan_pmu_init(struct arm_=
pmu *cpu_pmu)
> > > >  				       armv8_vulcan_map_event);
> > > >  }
> > > > =20
> > > > +static int armv8_denver_pmu_init(struct arm_pmu *cpu_pmu)
> > > > +{
> > > > +	return armv8_pmu_init_nogroups(cpu_pmu, "armv8_nvidia_denver",
> > > > +				       armv8_pmuv3_map_event);
> > > > +}
> > > > +
> > > > +static int armv8_carmel_pmu_init(struct arm_pmu *cpu_pmu)
> > > > +{
> > > > +	return armv8_pmu_init_nogroups(cpu_pmu, "armv8_nvidia_carmel",
> > > > +				       armv8_pmuv3_map_event);
> > > > +}
> > > > +
> > > >  static const struct of_device_id armv8_pmu_of_device_ids[] =3D {
> > > >  	{.compatible =3D "arm,armv8-pmuv3",	.data =3D armv8_pmuv3_init},
> > > >  	{.compatible =3D "arm,cortex-a34-pmu",	.data =3D armv8_a34_pmu_in=
it},
> > > > @@ -1265,6 +1277,8 @@ static const struct of_device_id armv8_pmu_of=
_device_ids[] =3D {
> > > >  	{.compatible =3D "arm,neoverse-n1-pmu",	.data =3D armv8_n1_pmu_in=
it},
> > > >  	{.compatible =3D "cavium,thunder-pmu",	.data =3D armv8_thunder_pm=
u_init},
> > > >  	{.compatible =3D "brcm,vulcan-pmu",	.data =3D armv8_vulcan_pmu_in=
it},
> > > > +	{.compatible =3D "nvidia,denver-pmu",	.data =3D armv8_denver_pmu_=
init},
> > > > +	{.compatible =3D "nvidia,carmel-pmu",	.data =3D armv8_carmel_pmu_=
init},
> > >=20
> > > Super trivial nit, but could we please organise this alphabetically (=
i.e. with carmel first?)
> > >=20
> > > With that:
> > >=20
> > > Acked-by: Mark Rutland <mark.rutland@arm.com>
> > >=20
> > > I see now that we messed up the order of "cavium,thunder-pmu" and
> > > "brcm,vulcan-pmu", but otherwise this is ordered, and it's be nice to=
 keep it
> > > that way. I can fix the order of those two in a separate patch.
> >=20
> > I ordered this chronologically (Denver for Tegra186 and Carmel for
> > Tegra194), which seemed a bit more natural, but I can reorder this
> > alphabetically if you prefer.
> >=20
> > Would Will be the right person to pick this up or should I take it
> > through the Tegra tree and then ARM SoC?
>=20
> Sorry, I missed this somehow. I've got some perf patches pending already,=
 so
> it would be easiest for me to take this one directly (and then I can apply
> Robin's stuff on top). Is that ok?

Sure, works for me. Do you still want me to address Mark's comment
regarding the sorting order (chronological vs. alphabetical)? It wasn't
clear to me if Mark still wanted that after my explanation.

Thierry

--ov6tsdrMxCrxuHnJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG4qhgACgkQ3SOs138+
s6HekA//aX4nw4pMXXeyoIGhZimwjlUIVn9yuha9V2ZZx0kiA+Nueu4/8vAC5cjT
m5ezKLlVfxLg1D9zhHhlD5JVGoNwCh4Hdh/mSpU7e6QgulFTmXC/RSLrN6Pm9v16
e4zhuJMyMtNmmhziJIm28iNOvjaMpN60cfFbHgABpjRAiRGJ9fjESsEY1xMiRCsl
/A8ZxbbC8mUROUuhrMzOzgWgGZ59Xac7jygZSnM13qjt6rUePQRgECRKfb/k8yMz
+xCTMK89dkYjH/RMBjQDt+E6gCbFzkn3hvzDQ23NNjFEU6ZCValCtT7pK0FlAkJb
xyssWltZavh13a+N0gD8aPhGUhE+AdlF9KyY7ReIte6f0YTZQExJXfpOb4tKX8hF
b76HSxtGKnafg8STX1Il8e0E44ZSg3+kgFK2KuU4CFXuZ7PUKVWk6A3fGn11cqNg
jOraD7qHmM7QUKQkEYYYEF3OPR1fyuiaXGNMGV8mUzNCn+oCaXQttKxbEMD7Q8U7
lwMChG1ulRUkEkIx2dZQeQ0k5H6cU60SSXN6suiMTZzDxjjqhDFlwP8tB/G4yZnz
691ePhLAfAGsjiuWiwQlQO1NsbHm8sGLlJyNNRcO7k3QVItz0OiKkBODXWIbLxqr
Y1IWEwfpweho4swfjBhuDgo+BUyMNY+7R7qjovBU97PpwUUBU60=
=xLMy
-----END PGP SIGNATURE-----

--ov6tsdrMxCrxuHnJ--
