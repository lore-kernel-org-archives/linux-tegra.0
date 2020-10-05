Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8512DC4363A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 09:51:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43C4120639
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 09:51:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ulY7zWOi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgJEJvg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 05:51:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgJEJvg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 05:51:36 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F1A1C0613CE;
        Mon,  5 Oct 2020 02:51:36 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id b12so8564008edz.11;
        Mon, 05 Oct 2020 02:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xVMDpuwSWx9cJIlM4tDMXRAB/KMvl7kDIIAKzdiSpb0=;
        b=ulY7zWOimlyfZyK6YnQOs4cmOYoADYddLaILjK5pufzyA382zlw9rdNAX+N/Pd7H1X
         sfKQuvCMKDvRdReB3myjSx/7m9OcGYZKTJM8qbB5kWKcKsvbV3Q/OIdaUgUBVf6GPgrH
         QZewG+v46kGHkOvRzctMTv1Qq0i3KqOo1dgLJql//ClV7OI06UJSBYqYaVbLzdumeRAo
         luod2TT0oee/DTHpVwf6bKcUZpR7UtCKceoXtkZXSaB4fmtTsP8VpJSpqeC4kVSltyja
         ANR9ooc77082cj4prqPq6KKkZWMYmWCiukGuaPOnevPY3oaAj/z547w6uBiobxnMq52c
         Km+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xVMDpuwSWx9cJIlM4tDMXRAB/KMvl7kDIIAKzdiSpb0=;
        b=WSMNL3IOKcFPKzsNhseaSiBaD/xj97gK4S+72K1dgn3DzBJNa6JSQesJeleey8VN9K
         Glb/entdZju66YP8VQURkfoFxBnDl1FHYlulbyjR+zsBkLAxTJ+xxpwUznP5t1mFqQ4n
         A7m9sgCkUDp3mFk0MOGSSphv75UOi93ZXwurDgqWJkLIxClxmM0PXjELh4H5ZCz36fHV
         4KqxnKshsDCcH6Ba8x/yypRrIvfiOB32mx3e9vZSv3pgxq4MkpLVAHCFFBQuVEe422zB
         m1dimwq3N49r3OjjR/oyaw44u7XjCEOtjuQCwF9lyToL5MO/WEqqZqWiUIsSbY3Gj4CF
         U9DA==
X-Gm-Message-State: AOAM533wh9zAeMpfm+WfUslrB5zieyYbye80HZCNPrXBjFcB0Pa1Ixra
        qUo0enUQy0OYGdNMTknOrFU=
X-Google-Smtp-Source: ABdhPJzBrcM6KDwh5g5wHr/FHftugh84YRErwAwekwNfMW9hAWTj3dDVrLQQ44bVLCxmS+IBaZaP3Q==
X-Received: by 2002:a05:6402:b68:: with SMTP id cb8mr16580359edb.350.1601891494997;
        Mon, 05 Oct 2020 02:51:34 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id k18sm7758003ejk.42.2020.10.05.02.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 02:51:33 -0700 (PDT)
Date:   Mon, 5 Oct 2020 11:51:32 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] iommu/tegra-smmu: Rework tegra_smmu_probe_device()
Message-ID: <20201005095132.GH425362@ulmo>
References: <20201002060807.32138-1-nicoleotsuka@gmail.com>
 <20201002060807.32138-3-nicoleotsuka@gmail.com>
 <b1a195cf-0127-0531-f6d1-835367511f57@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="a8sldprk+5E/pDEv"
Content-Disposition: inline
In-Reply-To: <b1a195cf-0127-0531-f6d1-835367511f57@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--a8sldprk+5E/pDEv
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2020 at 05:22:41PM +0300, Dmitry Osipenko wrote:
> 02.10.2020 09:08, Nicolin Chen =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >  static int tegra_smmu_of_xlate(struct device *dev,
> >  			       struct of_phandle_args *args)
> >  {
> > +	struct platform_device *iommu_pdev =3D of_find_device_by_node(args->n=
p);
> > +	struct tegra_mc *mc =3D platform_get_drvdata(iommu_pdev);
> >  	u32 id =3D args->args[0];
> > =20
> > +	of_node_put(args->np);
> > +
> > +	if (!mc || !mc->smmu)
> > +		return -EPROBE_DEFER;
>=20
> platform_get_drvdata(NULL) will crash.
>=20
> > +	dev_iommu_priv_set(dev, mc->smmu);
>=20
> I think put_device(mc->dev) is missed here, doesn't it?

Yeah, I think we'd need that here, otherwise we'd be leaking a
reference. Worse, even, mc->dev is the same device that owns the SMMU,
so we're basically incrementing our own reference here and never
releasing it. We also need that put_device(mc->dev) in the error case
above because we already hold the reference there.

Thierry

--a8sldprk+5E/pDEv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl967KQACgkQ3SOs138+
s6EZ4w//XClEGoJOj1S9ALPjYnZ7yQN7pBPfwPv2qNVwYwkSXvNIRhLa4AfazRm5
DCJCelfgkYONrrtuxyUSzatdpBNFuRFVKDUy3cBuZd/yXaDg83AXc3LWR99jKcNZ
LWuszo33+o7JSwz2rlGBfOWG/pEIZ3ffkENDhsIFbuff0dyIpHcB6t4Bk9Oucaag
cbQhJkfVYZXBbuz0qolfVkoxzbsYJ+HkWyYR6C2iFa46W4ed/uPAWj8y12nAJhMk
rEazHONfPq5T2kup+r5rLMJgt+jCZ7ofsuR+PK7g5S6FIxyF4S3QTFmRvh7uFBSs
JsmPElXPTcPFhM70fLvN/HkZjsGyJiLGfRHfcvuibqozGdTGY58ImpNFBrINRUGR
AwralPobbGBG+ER7MctmIENYcAODTJLAldodbOcrx7wGWESwsdBg2Vp2Uzn9iI8X
IGqtswrhSCZR2dJv6cykZwj6zFrpFWAuKAXZTGSO8qIxIV7QX1Y+CYm0nDg3iwek
KEJJAtwuhgNQ/g15SBn9Sq8JqUPZ+0e5TCoO/YyyOalvisC2nWb3IJYsXy+24sz2
lBpXygBpxuv+wQNRmU3cEWlwOgekaSuWXMoHGV0/i70llsuX5UWrO+rXVAReM9k6
4NUFGUgNQGBNygabucLpAatMEcFal1rF72zXio8eFig0ooLWimA=
=ny5U
-----END PGP SIGNATURE-----

--a8sldprk+5E/pDEv--
