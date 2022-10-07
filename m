Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C49FBC433FE
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Oct 2022 15:41:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbiJGPk7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Oct 2022 11:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbiJGPk6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Oct 2022 11:40:58 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7528DD01A2;
        Fri,  7 Oct 2022 08:40:57 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id g27so7546935edf.11;
        Fri, 07 Oct 2022 08:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+gW9C0VZ1bsrVLiur8UHsUKxv1dbzktHbSlNmxzLFI=;
        b=F17Xi/Er9Nn2ezln1ZD2l6hsGP+8YdcNnsdv2QG+1jJRgki64NfqkSE/ATkyb9QbRS
         QVcCtnV7nkTdi9mrdnLsYZ4uMHlOmL6K7UzUYtHNLXxYKhkFNTjG9G3H9A1VIy/Dnuqk
         tKWxFaGQ/lSN77UZpVRV+XnnfrYGmyS19v+qGloQWZydpjMSBqQxDpz4WXhFi089YisZ
         mN7Xe6iTsKy6RsY+Jl3KzQwXNBeSFgoipMd2ex8dnPu0iwgyTOB2raqT4tkjtY/Hjkaw
         sCjG+iIWrtRA88kDEic3y69IATHK1R4MaYxgyDodK23rOsupMYNGtUWSCLvzFUh8Ld+o
         o7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o+gW9C0VZ1bsrVLiur8UHsUKxv1dbzktHbSlNmxzLFI=;
        b=fTTx13JNNr3uKe4AiW2+ugDhUVVEqdeD/m6yEtKb0X9WRdWrjbaAqsefrf/MBBwLnM
         Cj8pa8jhrSi8w23Ss6JHIdbErjh9ZpKO0bIBsDD1CgszqQHk81laUobxnYdYQ/PVAiTJ
         Ps664OrBKlWBxtvfX8mOjsXQJokC33uN+Ip53AvEzCKisZ3P2/goZVzo0hNJ2lo7V41V
         e+Qf1HaMgQG8egtJNLEAzu1op9bI0Qi63y7FFseiXMNDk3XPrx/15FiWbKR3Sf1mFjo/
         pIkNG+KjuPPOQ0lp4Kc9m8myQxjmvFtbEzTFF3wetsOJagZA0dO1JH3sqLbyN6oie6sl
         B9DQ==
X-Gm-Message-State: ACrzQf1kKbUybUn+ugyd1y3zoiGzKDH4kqc9i/PK9Mu8VMExn4wqVMfS
        HJPYF/RVND1eCflL7uM1KCg=
X-Google-Smtp-Source: AMsMyM7NHBrNt9fSbolkv9LkttKd0T512D67DSDdKafFVf+EIjL3Y0iXWvIhkplLKJGggSFxn2W3IA==
X-Received: by 2002:a05:6402:4505:b0:451:1551:7b14 with SMTP id ez5-20020a056402450500b0045115517b14mr5216471edb.300.1665157255800;
        Fri, 07 Oct 2022 08:40:55 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id q25-20020a50cc99000000b0044ef2ac2650sm1612961edi.90.2022.10.07.08.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 08:40:54 -0700 (PDT)
Date:   Fri, 7 Oct 2022 17:40:52 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH v9 5/5] iommu/tegra-smmu: Support managed domains
Message-ID: <Y0BIhMMO51m6jpVN@orome>
References: <20220923123557.866972-1-thierry.reding@gmail.com>
 <20220923123557.866972-6-thierry.reding@gmail.com>
 <b541eb50-fd9d-1105-4ae1-640ec7df1c68@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Nwrt3c0txmHLc4Qy"
Content-Disposition: inline
In-Reply-To: <b541eb50-fd9d-1105-4ae1-640ec7df1c68@arm.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Nwrt3c0txmHLc4Qy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 07, 2022 at 02:48:19PM +0100, Robin Murphy wrote:
> On 2022-09-23 13:35, Thierry Reding wrote:
> > From: Navneet Kumar <navneetk@nvidia.com>
> >=20
> > Allow creating identity and DMA API compatible IOMMU domains. When
> > creating a DMA API compatible domain, make sure to also create the
> > required cookie.
>=20
> Nit: this description is now confusingly outdated.
>=20
> > Signed-off-by: Navneet Kumar <navneetk@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v5:
> > - remove DMA cookie initialization that's now no longer needed
> >=20
> >   drivers/iommu/tegra-smmu.c | 38 +++++++++++++++++++++-----------------
> >   1 file changed, 21 insertions(+), 17 deletions(-)
> >=20
> > diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
> > index 57b4f2b37447..7ad993330634 100644
> > --- a/drivers/iommu/tegra-smmu.c
> > +++ b/drivers/iommu/tegra-smmu.c
> > @@ -20,6 +20,8 @@
> >   #include <soc/tegra/ahb.h>
> >   #include <soc/tegra/mc.h>
> > +#include "dma-iommu.h"
> > +
> >   struct tegra_smmu_group {
> >   	struct list_head list;
> >   	struct tegra_smmu *smmu;
> > @@ -277,7 +279,9 @@ static struct iommu_domain *tegra_smmu_domain_alloc=
(unsigned type)
> >   {
> >   	struct tegra_smmu_as *as;
> > -	if (type !=3D IOMMU_DOMAIN_UNMANAGED)
> > +	if (type !=3D IOMMU_DOMAIN_UNMANAGED &&
> > +	    type !=3D IOMMU_DOMAIN_DMA &&
> > +	    type !=3D IOMMU_DOMAIN_IDENTITY)
>=20
> Since there's apparently no actual handling of IOMMU_DOMAIN_IDENTITY being
> added anywhere, AFAICS it's still going to set up an address space for
> translation with nothing mapped in its pagetable, which is pretty much the
> opposite of what's required :/

Yeah, I think we can safely skip identity domains. I don't think I've
ever seen them get used on Tegra.

>=20
> >   		return NULL;
> >   	as =3D kzalloc(sizeof(*as), GFP_KERNEL);
> > @@ -287,25 +291,16 @@ static struct iommu_domain *tegra_smmu_domain_all=
oc(unsigned type)
> >   	as->attr =3D SMMU_PD_READABLE | SMMU_PD_WRITABLE | SMMU_PD_NONSECURE;
> >   	as->pd =3D alloc_page(GFP_KERNEL | __GFP_DMA | __GFP_ZERO);
> > -	if (!as->pd) {
> > -		kfree(as);
> > -		return NULL;
> > -	}
> > +	if (!as->pd)
> > +		goto free_as;
> >   	as->count =3D kcalloc(SMMU_NUM_PDE, sizeof(u32), GFP_KERNEL);
> > -	if (!as->count) {
> > -		__free_page(as->pd);
> > -		kfree(as);
> > -		return NULL;
> > -	}
> > +	if (!as->count)
> > +		goto free_pd_range;
> >   	as->pts =3D kcalloc(SMMU_NUM_PDE, sizeof(*as->pts), GFP_KERNEL);
> > -	if (!as->pts) {
> > -		kfree(as->count);
> > -		__free_page(as->pd);
> > -		kfree(as);
> > -		return NULL;
> > -	}
> > +	if (!as->pts)
> > +		goto free_pts;
>=20
> Nit: all this part is now just unrelated refactoring.

Okay, I'll see if I can pull this into a separate patch. Or perhaps just
drop it.

Frankly, at this point it's unlikely that all of this will ever be
deployed on Tegra210 (and earlier) that used this SMMU, so I've included
this particular patch here primarily because Tegra210 was originally
meant to be the primary target. This patch is now close to 4 years
old...

Thierry

>=20
> Thanks,
> Robin.
>=20
> >   	spin_lock_init(&as->lock);
> > @@ -315,6 +310,15 @@ static struct iommu_domain *tegra_smmu_domain_allo=
c(unsigned type)
> >   	as->domain.geometry.force_aperture =3D true;
> >   	return &as->domain;
> > +
> > +free_pts:
> > +	kfree(as->pts);
> > +free_pd_range:
> > +	__free_page(as->pd);
> > +free_as:
> > +	kfree(as);
> > +
> > +	return NULL;
> >   }
> >   static void tegra_smmu_domain_free(struct iommu_domain *domain)
> > @@ -1012,7 +1016,7 @@ static const struct iommu_ops tegra_smmu_ops =3D {
> >   	.probe_device =3D tegra_smmu_probe_device,
> >   	.release_device =3D tegra_smmu_release_device,
> >   	.device_group =3D tegra_smmu_device_group,
> > -	.get_resv_regions =3D of_iommu_get_resv_regions,
> > +	.get_resv_regions =3D iommu_dma_get_resv_regions,
> >   	.of_xlate =3D tegra_smmu_of_xlate,
> >   	.pgsize_bitmap =3D SZ_4K,
> >   	.default_domain_ops =3D &(const struct iommu_domain_ops) {

--Nwrt3c0txmHLc4Qy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNASIIACgkQ3SOs138+
s6E2Ug/9G0BR+PMsaLH0eMNOFjha/8/B/KqvEyV3HhJOrfa8rE/vkzuog6gxKOtT
icaCvh/sQIazWgsqSFgg3IraIXK1/9fXnj2k5YbnZoUw+/9y1be8dWjVcx2JKNri
8NF+Np7ocHbZC//c70O8K5P2WHPk85mEgJ0mJ6cGPV3QKqRDmxHGd/PZjtF1qVDw
59SDquTSjQhYtfjKuKjKXemiOeop6JGm/YH1PD5dG5h/Ac/ZnJS3OEkThFdf2XXN
LD4TaqWsvBuoc/D8i2gOvsW+mjxbTMKEuSFcljhRNkjhsd5MQHL0qHjY1Say3tq4
7h+TeY8/zwxpJPtCkkhgg/OHkDD6xAG0ux5lK/rBtKtM8X8LyB0ZAVXfvUQUc3aP
L3+KIGEMvjmIzrWLzEnvPTTs2SsVGBeSnzdLCnE2Nqp3G6G937uhCeaAFrybtxZ5
PC2d6e9J7mxjMrE+tL3eBOKcvJcNNp+okShaXqaOPhplKMhXK474JFGYkhJA2DFn
kbNfW+Kmlf6wzo+OQUF6/6RqnBurdAC+ivK6S4ojiwIHWIrQ1d30b7gn28psKr/x
KlpIUBnOCVMeuLEu4HPDRPr7whqEM/tqOd4RAxIaa6OCanHRqZFraXbpK3Pm1PNR
k1fBL7w0/hgi5XptnsIKn745ATNHBkDPsGL8mqEQBbxdtq7AjLc=
=HD2A
-----END PGP SIGNATURE-----

--Nwrt3c0txmHLc4Qy--
