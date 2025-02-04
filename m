Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE78213259
	for <linux-tegra@vger.kernel.org>; Tue,  4 Feb 2025 14:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738679795; cv=none; b=XO5d7tmWLEpVYgl100XKmd4+wVmdgZ/g1w6UDcsymd6Jl9+reWqY/k9lm2VBGt2byCbRLsmfb4WV/nXUNbmLaPFOssTdaxm9L2d0b7+j+eC+2daGU8w4+9HG9vv/zUNClDe7VI79bM4rdVEdr7/JwqCRx53kl0k5CrqZCTvBUdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738679795; c=relaxed/simple;
	bh=2OfiAE3BjhZPyjDDoqHlXy1A3Xu34fHmnCjC6o04Amo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p43rgknzgwXs8i5S2kfeMcGD6pSB42ISBGw8RI3HJJrSL+mMWZKDhOMg5WE4YD/YL6H7I+drwV37kxpKnQvFWEj3KwOZ4xhtaR35vUstOZyxLIaCGCy3Rk/oYv10AtmcX9uTUgsKHRVJIM/NKQCSwwu9dU06Zl7/Ye2keeD7ksg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E0Mc9vCz; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0Mc9vCz"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43635796b48so35210825e9.0
        for <linux-tegra@vger.kernel.org>; Tue, 04 Feb 2025 06:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738679792; x=1739284592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RRXFmx47Swzpej4Yg7u4uG0EqwNxFusRlkdCHqjIDuk=;
        b=E0Mc9vCzLqWAcjRwCAK8wHIMi4HF2mfRYM3nfnmsZy9w61BWEcegiq2T5tUPuCZreK
         Q7rx4gm1B1N4EW4tkztnHotXsYSvxxPmtftIZJ48zVGNYQXw1a39ipWWjFUjpN6Kib00
         3cGdlhHrlPsl2VhJ3tJr19fcM2Xf9Ag2V8xUvSpBxHhsKNZHJpKsx6lQUyg+2C1laNru
         gsEtV5/Pw00jk1fT1dhSzSHxcEmFLPGE3szRave9lLOUgKm3G+WEXdKKjm356sk1rypD
         LnzZkk/5zqba5ObR0yG++C2Z22HSm93FXxPGz2iIysJsV4oE/xplcv0ek0912Qk+Ewj/
         WB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738679792; x=1739284592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRXFmx47Swzpej4Yg7u4uG0EqwNxFusRlkdCHqjIDuk=;
        b=LGNJwYkEaDqkiCOtlgnbGC7OAXpCQxg1V+8MFs9LB3+y/YpJVaDTrf7HuckPgGeE54
         LJmaLeaSDYNNFyPAiHxSGSUCRFmtBTdwlpRVYC/BTKzxrtHhBeJjOOi264DcKZETyTdk
         IeMfgP+Xabu2EdJuGWrFJi6yR2Gr8vK2fftb4pfDeL08iItZXwaaUYUeEKfyLTe4A0tv
         KKf+pZ7Ot8iqErQSzu5jbbm6py4x+gG5ibKVf/4V45kV9Vx/k9yzPj6ZOD5xRhRvBpj4
         6xnWRx0hTbd7unephX99T3REvihTOwn4pzq8BHkSAgYmy0RCuUgWZDaul0kTF7r73GOC
         1PIg==
X-Forwarded-Encrypted: i=1; AJvYcCVeiQ/oEDklTTkvR0CXMiAwDISoREGHS1UJ8wX8wfkdgfVMD3nQe1OBckXbgt8BPAYzgrMcrIqEbrI9/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YygRi+qplHRYMi6TIcMQdmbu3jwPDyXUcNBtZFiZ+1mQtG4ESQj
	KKH8IlVK+VzTtIHkG3e3DMeRxDqm226Yob7YGKpizKySMkZ4MWDD
X-Gm-Gg: ASbGncuPusPu6dfQA8qmq5I/6PScxWV4rc/8AXH766iSSWG8qruaXc1I174Fmug8ykJ
	whPguPyTG12RrCICU3VQoM/YGXlZVKJEZWYGoMOTZdcX8DWX4Yi+xpkbbPLSY9R/6Z70A/wt9OV
	8aOJYisSsf/06E1qxg+b3CmVX9n9fcLH+1bJUvL771JtVd7+ik1QpV81IAsqcQzL1x8Mew5rgVZ
	QL0/uAzp6DEFj37DhiIC+YCNr+n/bNG2lJa2mdefqaOKMO0nSLxebQSkzc7WkVOoxeNAzSUXCzi
	ML/+5Ja/jHxUUTYZ2bH69BOG+Ji0Pi1MbV+fqe07Dp1c59/SlmthAYL1GrKINRlT68rpweV+BCK
	DHg==
X-Google-Smtp-Source: AGHT+IHi7/2GKpcdSjTAWwC6JBPMZH0RMa4KtzNjlcdd4DLL0nuLjpKiK5fg5XRwBNd0E03fFoUvMw==
X-Received: by 2002:a05:600c:4286:b0:436:1b0b:2633 with SMTP id 5b1f17b1804b1-43905f782a9mr26556025e9.9.1738679791319;
        Tue, 04 Feb 2025 06:36:31 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc6df51sm232194865e9.30.2025.02.04.06.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:36:29 -0800 (PST)
Date: Tue, 4 Feb 2025 15:36:27 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Mikko Perttunen <cyndis@kapsi.fi>, Robin Murphy <robin.murphy@arm.com>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, vdumpa@nvidia.com, joro@8bytes.org, will@kernel.org, 
	jonathanh@nvidia.com, baolu.lu@linux.intel.com, jsnitsel@redhat.com, jroedel@suse.de, 
	regressions@lists.linux.dev, linux-tegra@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [REGRESSION] Invalid gather when using Tegra210 media engines
Message-ID: <vfn52yxf3udhyjqrgc3binmsdjzjd2salojsvaad7hsukozknp@u6rziyz2vz2o>
References: <c6a6f114-3acd-4d56-a13b-b88978e927dc@tecnico.ulisboa.pt>
 <20250203170617.GE2296753@ziepe.ca>
 <4ea1a48c-9020-4793-ac9b-b51fc289e442@tecnico.ulisboa.pt>
 <20250203174331.GF2296753@ziepe.ca>
 <a0f776ba-bfd2-41fd-8370-14818b86bfbe@arm.com>
 <20250203191346.GG2296753@ziepe.ca>
 <ff901d60-dd54-440f-a0da-4b72052eafd6@kapsi.fi>
 <20250204132112.GH2296753@ziepe.ca>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s77jwfgx65ngiaut"
Content-Disposition: inline
In-Reply-To: <20250204132112.GH2296753@ziepe.ca>


--s77jwfgx65ngiaut
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [REGRESSION] Invalid gather when using Tegra210 media engines
MIME-Version: 1.0

On Tue, Feb 04, 2025 at 09:21:12AM -0400, Jason Gunthorpe wrote:
> On Tue, Feb 04, 2025 at 12:26:46PM +0900, Mikko Perttunen wrote:
> > On 2/4/25 4:13 AM, Jason Gunthorpe wrote:
> > > On Mon, Feb 03, 2025 at 06:49:07PM +0000, Robin Murphy wrote:
> > > > I'd hope the historical reasons for not supporting IOMMU_DOMAIN_DMA=
 in
> > > > tegra-smmu no longer apply, given that all the default domain stuff=
 has now
> > > > been integrated into host1x for the newer arm-smmu based Tegras.
> > >=20
> > > Indeed I do see appropriate looking calls to the normal DMA API, and
> > > the other mapping path is conditionalized by !host->domain.
> > >=20
> > > So, why didn't it work for Diogo? Even in identity mode the DMA API
> > > will return correct DMA addresses and the !host->domain path will skip
> > > mapping them.
> > >=20
> > > Poking around I wonder if there is some assumption that if other parts
> > > of the stack, maybe the DRM driver, are using the special domain than
> > > everyone is? It seems to blindly pass around IOVA without really
> > > checking who is consuming it.
> >=20
> > I'm not sure where that would be, but it's certainly possible given that
> > this combination of code paths wouldn't have been tested.
>=20
> I saw some weird stuff.. Like tegra_bo_pin() does:
>=20
> 	/*
> 	 * If we've manually mapped the buffer object through the IOMMU, make su=
re to return the
> 	 * existing IOVA address of our mapping.
> 	 */
> 	if (!obj->mm) {
> 	} else {
> 		map->phys =3D obj->iova;
> 		map->chunks =3D 1;
>=20
> And obj->iova isn't obviously linked to a dma map on dev.. The comment
> reads like it is making the assumption that there is only one iommu
> domain shared by everyone (without checking dev is part of that
> scheme)

Yes, that's correct. We used to have a bit more code around to deal with
single domain (Tegra SMMU is supported on some platforms where we have a
maximum of 4 address spaces, hence we have to be very careful about what
devices share which address space).

In fact the host1x and DRM drivers also support Tegra20, which didn't
have an IOMMU at all, but one of those really old GARTs. On top of that
it only supported a 32 *M*iB window. I think others have concluded that
today we can't practically use GART and it's better to use something
like CMA for those cases. So maybe that's not an argument anymore.

Most of these restrictions no longer apply as of Tegra124 (I think) and
starting with Tegra186 the IOMMU is an ARM SMMU, so none of these work-
arounds should be needed there. Most of this code exists for very legacy
reasons, but there's still people with Tegra30, Tegra114, Tegra124 and
Tegra210, all of which are susceptible to this (at least partially).

> > > Christian was telling me DMABUF had some drivers that made the
> > > (incorrect!) assumption they were all sharing translation.
> > >=20
> > > It does seem like a nice project for someone who has the hardware to
> > > rip out all of this custom domain stuff and just have the iommu layer
> > > setup a shared dma-iommu domain.
> >=20
> > This has been a long-standing project. The issue is that some boot chai=
ns
> > set up the display expecting identity mappings,

I should revive an old patch series that attempted to get rid of most of
this. The plan was indeed to remove all of the direct IOMMU API code and
use DMA API exclusively. There were a couple of issues with it, such as
performance regressions due to the extra mappings required, but I think
I got pretty far in mitigating most of those.

In the end I got frustrated with it a few years back because there are
some corner cases that I couldn't make work and testing of this becomes
increasingly complicated. And yes, display was specifically an issue on
Tegra210 platforms (earlier platforms didn't usually set up display on
boot).

One additional problem with supporting the reserved-memory identity
mappings is that existing firmware doesn't set things up correctly and
these devices are software EOL'ed, so no new releases are planned that
could contain a fix for this.

> The smmu driver can match on compatible strings and leave some devices
> in identity mode, if that helps. Other drivers are doing this to work
> around various issues.

This might indeed be a viable path. Again, we need to be careful about
the older devices, but maybe a shared dma-iommu domain would work these
days.

We definitely want to transition to a DMA IOMMU domain later on, but it
would need to be after display has had a chance to set things up. And it
would still need a firmware that actually passes the right information
to DT because otherwise we'd still get SMMU faults from the display
hardware trying to scan out from memory that it doesn't own (or I guess
scanning out garbage from memory that's now being used for other
purposes).

> > See https://lore.kernel.org/linux-iommu/20220512190052.1152377-5-thierr=
y.reding@gmail.com/
>=20
> But using RMR seems like a better solution?

reserved-memory is the DT equivalent of ACPI's RMR, as far as I
understand. Or at least, it's the closest thing to it. We don't have
ACPI on these devices, hence why we do this via reserved-memory DT
nodes. But again, the problem is that firmware doesn't currently pass
this correctly to the kernel, so we'd need a new release for that. I'd
need to find out what can be done to achieve this. One big issue might
be that it'd be a DT ABI break, technically. So upstream Linux would
only work reliably using that new version. That might be fine if we can
make some sort of official release.

> We could perhaps also figure out some way to leave the translation in
> identity until the DRM driver completes the reset, then the DRM driver
> could activate the DMA API translation manually.

Yeah. We do something similar for Tegra186 and later where we have the
memory controller redirect accesses to the SMMU only after the device
has been attached. I'm not sure if we can do that for the old Tegra
SMMU, though. It would probably still require a firmware update to make
sure this can be properly handed off to the kernel.

Thierry

--s77jwfgx65ngiaut
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmeiJegACgkQ3SOs138+
s6FGYg//R+2hX7Er3Nt3qSKe0ctG9++lWg5Zoe3ePz3HvRIASVmsr4K5q+4Op+vI
h1oBcxXET5dpgYLGo2etIk0KmpLjflCfRB5MkzM1U1lvUGcDWyGpp75bJhDp5rDI
lNLw2Qj8VdwmcRv+t1tng5haEZtrAKN1afr7MJ6efEie5+zJIOtKrppoCw/BSkyl
Ln9KtQqE7SiaYVZIkyIhW7kr/ez09BJlssV9JtUQBDiOZnvIppKS24rNlUKqdSgN
BvFhLq7arEDyVn1TS/vzSqBmSEXtdv0oYKemiuyCFoI98JSTOLOLM1m8H0djblJ1
4m09WolC5SVMip+smHZBU9hupNKQNZcWQpdlv1KYY/PbxGsHT/O6W660yrk2R14A
fRARzZ+GMoBFzu0AVtdZi5yMKhJx3GhDv1TLCQ1prVQPn59kI/ONG44oVAoE/FLS
/ispuyxkTbx1+Aev9yR7GAzk0SQ+7j338o2VvWw9E+258WaAxxFxFulvkHakQGuH
sb1KquYznexEibF8UL9ALNnSvo5x0s2cvc9ORbS+Q8ox5ESJFoRKhIzm3QlirzMf
7j4e+SpjFhndL8LbVoqcY3BOlb0CUu5QciBWOyYIvDBz/8NpqASpxD/vBn8hycbb
4cm+4gzVLHZm3SHJ6JW3tJgW/Ev8WhlxWTvJ4EB3F2s1IdCu5Pc=
=QY9n
-----END PGP SIGNATURE-----

--s77jwfgx65ngiaut--
