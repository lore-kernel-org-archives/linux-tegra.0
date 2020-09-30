Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA5CC4727C
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 16:10:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1AB5206F7
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 16:10:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GauHFVbi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728081AbgI3QKh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 12:10:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725385AbgI3QKh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 12:10:37 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FEEBC061755;
        Wed, 30 Sep 2020 09:10:37 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id i26so3607724ejb.12;
        Wed, 30 Sep 2020 09:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Gz8YbIcBLxDIo/9xfQsLMToZ+yZY22BQ/9LJJe3pu9A=;
        b=GauHFVbinz4XzRFmxPc5VJod/LYJfLbRDipc4McYlUB3hVnqVjURSXx6M6nlzYN/tk
         P4R3ExcmAE5zADSbavU6moHxKHs5Zs5nNEAlMCUSgsuueYepEwZjDnb0qfKezrv2xyLX
         fv7zVccFO3rZy3IcASGz3zg6dvDtPYJuUKzUMsO0H1d+Zmh6HP2vkPZqWWJezskG6EJu
         s0GdeeePVwdTChyw807eP2FqHWBwQQcdjsh1GRe2h6TMeMhC4JFyhfWXzbanGZtmPB12
         kQIWfBSCtqLGBVmwluh/Ac0MwR++/ousPynRcxoADcSBf0VXi0gXufw9QRh/FbxmoHXg
         8kDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Gz8YbIcBLxDIo/9xfQsLMToZ+yZY22BQ/9LJJe3pu9A=;
        b=D9l+M9ZLqFsPtS23MhFMrx2dZbLtGk7kKiZKX8KzUmcIibUFUMFaoQCeIzTc4a8oej
         rbe6fY2UPBvuqUGTk4ug1wnYXMr8AWPp0nkFUOCQsXxqmltRTWrmEeOexeZ7JcDy41I5
         iidhyd8yLxeUoiTMxo83RsvWTrTy0n3pvODzNwgcqxe4rABh05Yt2U2jYOcW3Xm48a9S
         KRZh1+XZ6yJZFP0V5m605nIQjmnswVyIbStYNQ3Cdqe0pKY/ZTBz1zMIgVvOobh5PZmy
         hLNxSGFZB9E513PaU+DxJCrs4YS/wokZHvZMm3nvkfZqS5JAtzA62zRPUs7r9RSyXvIU
         z4ow==
X-Gm-Message-State: AOAM532sVnpsigQ1E3eeP/N+z92amxBtKP9KVlZ/ZAP+tPYOdwGnzMrx
        BGXShb4eciioZ32hdzYd7sQ=
X-Google-Smtp-Source: ABdhPJxRJM6WzC9xtFLvQGjemfFPSb2It62oOg3Yc7abBDEludDbD97OPrqcFjC8ZWcZWxYiAPDzRA==
X-Received: by 2002:a17:906:f11:: with SMTP id z17mr3697701eji.88.1601482235786;
        Wed, 30 Sep 2020 09:10:35 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id l26sm1913672ejr.78.2020.09.30.09.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 09:10:34 -0700 (PDT)
Date:   Wed, 30 Sep 2020 18:10:33 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Nicolin Chen <nicoleotsuka@gmail.com>, joro@8bytes.org,
        krzk@kernel.org, vdumpa@nvidia.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] iommu/tegra-smmu: Rework .probe_device and
 .attach_dev
Message-ID: <20200930161033.GE3833404@ulmo>
References: <20200930084258.25493-1-nicoleotsuka@gmail.com>
 <20200930084258.25493-3-nicoleotsuka@gmail.com>
 <20200930153131.GB3833404@ulmo>
 <ece615ad-8d6b-96ae-d8b4-9667aef17281@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="brEuL7wsLY8+TuWz"
Content-Disposition: inline
In-Reply-To: <ece615ad-8d6b-96ae-d8b4-9667aef17281@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--brEuL7wsLY8+TuWz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2020 at 06:36:52PM +0300, Dmitry Osipenko wrote:
>  I'...
> >> +	struct tegra_mc *mc =3D devm_tegra_get_memory_controller(dev);
> >> +	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
> >=20
> > It looks to me like the only reason why you need this new global API is
> > because PCI devices may not have a device tree node with a phandle to
> > the IOMMU. However, SMMU support for PCI will only be enabled if the
> > root complex has an iommus property, right? In that case, can't we
> > simply do something like this:
> >=20
> > 	if (dev_is_pci(dev))
> > 		np =3D find_host_bridge(dev)->of_node;
> > 	else
> > 		np =3D dev->of_node;
> >=20
> > ? I'm not sure exactly what find_host_bridge() is called, but I'm pretty
> > sure that exists.
> >=20
> > Once we have that we can still iterate over the iommus property and do
> > not need to rely on this global variable.
>=20
> This sounds more complicated than the current variant.

I don't think so. It's actually very clear and explicit. And yes, this
might be a little more work (and honestly, this is what? a handful of
lines?) than accessing a global variable, but that's a fair price to pay
for proper encapsulation.

> Secondly, I'm already about to use the new tegra_get_memory_controller()
> API for all the T20/30/124/210 EMC and devfreq drivers.

Also, this really proves the point I was trying to make about how this
is going to proliferate...

Thierry

--brEuL7wsLY8+TuWz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl90rfkACgkQ3SOs138+
s6HL9A/+Ol+FddqakzBkR5ybYmsPeEUyPF5dwncQF++WGcerrvQx2DTXQYpIoGHl
LnUCBYK+np/rcAvNEScWYVUfMD3BslmIHjpAzhza004NLLtz0/m8EUBxfaRxA76i
GRZbr0SEXrIPWdEFwx6gSQMnZvG7+tGsQSybMi+vWWUCItxVYLar9XBg3PLhcZoP
5WURiPyas+HF4wuNzT2e100vACoLos2DexhIRnxGCF0tkDRsBFCEN++0XfWTrBGh
NxdIsX9O6/HYJEZ5ncbP5hUYJ+vnw0xs9EYKXyQsB1P0zxm5dmBsZEnsYm5FvB7o
qC6NK2Aje5ovdIDjJCwNb84c4B1/jW1Q6e7wFZuoO9i3cacbchucH96j5qPM+1Wy
J7gabVPsv/qZ3MDHA+9s1Bs899QWp5gs1NvLu509DcHCtEFfMexG0tnZUDeIB4Fb
wqDhGpfcil6pRL5Q5wvswnKJ+Zji9x/CwbgIu3V1R1ehHOPnOPyy9EjhqvJm7RKE
tvzHLAi4/LXgMBhe1dvO8RE7Ya9c9qGQm0QOi+r+jNWHIsEGI9By2u7kzHKOqBx0
PZctFqhKFVUmSftXv2xp5Gx2hsd+7YIKesZf74lswWCh3c2Sphrb274O3uPHR1qa
ean/rNOn65fNW95vSsOpT9NQ1aJWk0Du8xx7Jv7BZVRZp2KJxtw=
=n10A
-----END PGP SIGNATURE-----

--brEuL7wsLY8+TuWz--
