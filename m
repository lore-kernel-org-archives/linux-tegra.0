Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71442C433FE
	for <linux-tegra@archiver.kernel.org>; Thu, 20 Oct 2022 13:45:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229739AbiJTNpJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 20 Oct 2022 09:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbiJTNpG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 20 Oct 2022 09:45:06 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ABF87B59E
        for <linux-tegra@vger.kernel.org>; Thu, 20 Oct 2022 06:45:05 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id fy4so47467696ejc.5
        for <linux-tegra@vger.kernel.org>; Thu, 20 Oct 2022 06:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yf9YGyE8L4r3rR8vF8nxDmhRHcCQaxI8Vu64K8vPEO0=;
        b=CE3ywWqHsGpEZiLkUQzr+qrMmT+//U/AZ4tJbQ27xrEov3CnXXSXR8ODUq844pVKTG
         R3wjUqmBCc8CIFegNsWo3jXQVDnPzNnGdx1Hf17zg8aH72It8Fli6GuBsnm51zvJuQp/
         hev0SBZGjsnu2PPibPfFwHWPHwAYFsG0ZkUYAZQ6cVSb6BZgakRvD6k+O6ib/kCmLWi3
         88Ihs8YK9VIRE54U6oMCfbM9SeEWLE3J+FqOiTif6AFgh208tjLywbPOx3uoNFZSF7w9
         s8zBb4wIGlo1wnun2AM7/rg2XLaGw0zkYbIWCL6ktXiz0AptGGdY9U1XabBnJC+RAI7G
         gmLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yf9YGyE8L4r3rR8vF8nxDmhRHcCQaxI8Vu64K8vPEO0=;
        b=NQfiwyMqVfMxsENtGEF0bRxPpaJ8TNB/IcZezRnvAsQRuJaY12UXrQcPYu0Fb97H8I
         wNaCr8QofwGLClHu7pXWqA4izR+ac77GcamfEByONMPNs0UQ7eS5Dlb+uffOKUpEbs6T
         vmWoK5FZrbR5vFIGCSdzYKkq1rEa9ujPcalWRSSxuWezJjtN6Y3JEuAsYWY/CcVRNT6f
         EP6aNEREE/JMyzIT7hjjfbaNVWAFLpeNLHB2d85neEkhSUGCFgLqgbbsogwieOoM1vG2
         LJcMStK8LkrfqeX2Qv0H/IHoSwN65UWNXbq38d6Tafu2NFfMVqxpcunvyqd4V3QUXiw9
         FxCQ==
X-Gm-Message-State: ACrzQf17Vp8DtfnRq4d3yQJGpGFSEf6yQId0HcTHSSXY1lOGHqivJ+0e
        luO+UphSa46kpwnM1EhQZrM=
X-Google-Smtp-Source: AMsMyM6VYio+yGh/VSy42bMj1712e3B+0t+UBJeA3btx45dtQj/QWTEDIefEWfC6U9keziMy8E/J4g==
X-Received: by 2002:a17:907:743:b0:740:ef93:2ffc with SMTP id xc3-20020a170907074300b00740ef932ffcmr11314178ejb.514.1666273503905;
        Thu, 20 Oct 2022 06:45:03 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id et11-20020a056402378b00b0045c47b2a800sm11940936edb.67.2022.10.20.06.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 06:45:02 -0700 (PDT)
Date:   Thu, 20 Oct 2022 15:45:01 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, iommu@lists.linux.dev,
        Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] gpu: host1x: Avoid trying to use GART on Tegra20
Message-ID: <Y1FQ3TRRs8NHDuAs@orome>
References: <ee0278cae0443d4ff407d6db38f4d9b33d477e8f.1666200021.git.robin.murphy@arm.com>
 <9b79d517-f242-6619-5f13-eee65f01c57a@nvidia.com>
 <493de78c-fce5-231b-20d3-6c5c6f53d51e@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ubLx+7fqK52n2gY3"
Content-Disposition: inline
In-Reply-To: <493de78c-fce5-231b-20d3-6c5c6f53d51e@arm.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ubLx+7fqK52n2gY3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2022 at 01:42:28PM +0100, Robin Murphy wrote:
> On 2022-10-20 13:25, Jon Hunter wrote:
> > Hi Robin,
> >=20
> > On 19/10/2022 18:23, Robin Murphy wrote:
> > > Since commit c7e3ca515e78 ("iommu/tegra: gart: Do not register with
> > > bus") quite some time ago, the GART driver has effectively disabled
> > > itself to avoid issues with the GPU driver expecting it to work in wa=
ys
> > > that it doesn't. As of commit 57365a04c921 ("iommu: Move bus setup to
> > > IOMMU device registration") that bodge no longer works, but really the
> > > GPU driver should be responsible for its own behaviour anyway. Make t=
he
> > > workaround explicit.
> > >=20
> > > Reported-by: Jon Hunter <jonathanh@nvidia.com>
> > > Suggested-by: Dmitry Osipenko <digetx@gmail.com>
> > > Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> > > ---
> > > =C2=A0 drivers/gpu/host1x/dev.c | 4 ++++
> > > =C2=A0 1 file changed, 4 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
> > > index a13fd9441edc..1cae8eea92cf 100644
> > > --- a/drivers/gpu/host1x/dev.c
> > > +++ b/drivers/gpu/host1x/dev.c
> > > @@ -352,6 +352,10 @@ static struct iommu_domain
> > > *host1x_iommu_attach(struct host1x *host)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!host1x_wants_iommu(host) || domai=
n)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return domain;
> > > +=C2=A0=C2=A0=C2=A0 /* Our IOMMU usage policy doesn't currently play =
well with GART */
> > > +=C2=A0=C2=A0=C2=A0 if (of_machine_is_compatible("nvidia,tegra20"))
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return NULL;
> > > +
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 host->group =3D iommu_group_get(host->=
dev);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (host->group) {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct iommu_d=
omain_geometry *geometry;
> >=20
> >=20
> > Thanks for sending. I gave this a quick test, but I still see ...
> >=20
> > [=C2=A0=C2=A0=C2=A0 2.901739] tegra-gr2d 54140000.gr2d: failed to attac=
h to domain: -19
> > [=C2=A0=C2=A0=C2=A0 2.908373] drm drm: failed to initialize 54140000.gr=
2d: -19
>=20
> Urgh, of course it's the same-but-different logic in host1x_drm_probe() t=
hat
> matters for that one. Am I allowed to mention how much these drivers drive
> me to despair?

Yeah, the whole situation around these drivers has been difficult over
the years. In fact there's a current regression in certain corner cases
because some the IOMMU internals keep changing.

I'm not sure if anybody else (or why nobody else) is seeing similar
issues. Perhaps we're the only users left where direct IOMMU API is
used. Or used in a problematic way, which is primarily due to a need to
share IOMMU domains on certain older devices where they are very scarce.

Frankly, this whole mess has been going on for so long that I no longer
remember why we never switched to using the DMA API exclusively. It may
be because we don't support those DMA domains on 32-bit ARM (or on pre-
Tegra186, more generally), which in turn is due to the lack of early
direct mapping support. The iommu-addresses series is meant to fix that
on newer chips. On older chips we likely won't be able to do anything on
that front anymore, but there may be a way to hack something up in the
tegra-smmu driver to avoid faults...

Thierry

--ubLx+7fqK52n2gY3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNRUNoACgkQ3SOs138+
s6HcJRAAhl0hECwdoaYjwk6vhAmOG7TJpuGnUzftpvhDmgwgOv8df1lLwDiOSLQ5
OOYU3uU0/t/V2PiEk2wQXziXSCkOhv7r02Psh70PExAEGWcdkvzWRSbGEzc/q6BG
hPsoZuif2S4dzeokcHtRyLT9oOOtjETTSVY0YN+ZXe5zfwg1URZkMkA7UUYSDqJc
SnrRRlKp5UZa++A+AA+UwxpYfScQ7NnHIveiclqoGO2AMd0eh7eSBdIl0rNdWAOr
bWOCNPpfo2eTENTAw1L1CghQQrwcNhpiPY91wf27uYuFmpZJUHQFKSy02NJjyzpq
uekkSlS+KxmM/mSuG8+qT0LCGnAqDWOg2zSVr2o5CaFZFM2A4R63nvL3tIU3EupO
lQWvrwbIWFG2tlUuBw8Xmopur0qRg4FeOrcNOoxs+kUa5dQEQFTaXqCvolDvHthx
0wVc2cBoTWBKaUnuTeD+4exgwNysQY910mJJLDpV2DUcvvS470lrQY3mets+a9GD
Kg2eH1IfUp9ie/+tqLf8XK3ChcnPB/C7divkO+pfgutdZw7XsAayVytXbX5WXkqR
FTUkQURcCYIeKQBF0OFIJgXFcjUpUxyny/tTlWNL8DTrEa+DMl6a7O/BRRSS9ASE
hU1+Kccs+YhCFNGNXnQLwlYZTshPECKmS4bKimDEaOmeKjPVdkM=
=cj9z
-----END PGP SIGNATURE-----

--ubLx+7fqK52n2gY3--
