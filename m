Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0539FC433B4
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Apr 2021 13:26:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDAEC610E6
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Apr 2021 13:26:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231664AbhDHN0R (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Apr 2021 09:26:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231655AbhDHN0O (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Apr 2021 09:26:14 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 406C9C061762;
        Thu,  8 Apr 2021 06:26:01 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id r12so3041971ejr.5;
        Thu, 08 Apr 2021 06:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=fWNbvaLef6259fRiVwT8gP9uDYrSeaWV/GmX7+mRaYk=;
        b=chgOTL62v+0C7rWcqD5pJN1jRyYzvFOuDOAldJufUdJu7ZV25rNPTAy94OjfZmRY3N
         y5cT8c1IB9RPbBF8KPIpknvij3S10h9Eqntq1NGonmRc6hPR1TaqTqfAvj36VTTcNJ09
         +8kyKxbUKAai1Liipscx9BKsPAkH8lGreZR8aYET35oobKTVOAh/53H4qvLAKJFmMDWL
         sH17birHxXwhQkrjPk8BMAMktZW1A9U2lxyDxpjFZPzq3kVEeBJxscOV5wq+4P0E4zb/
         BDKSzkrh6my85rZNYgdFvJYwQAfPdkYf4lh26uRDGwPiQdKLGV/iXi8t2Zih5OfUOjZi
         /YXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=fWNbvaLef6259fRiVwT8gP9uDYrSeaWV/GmX7+mRaYk=;
        b=FGxm/UPgmiaVke0KW2xqcwo69N4II89w18SrfsGVWA/QChAoRnkHpRj+225Xfm9ik2
         4FBe4ZBz/S3lrh7jDYIvoekOZHbw9MWGwbpD1CMQC+lZz0KaFV/EFJj8555pY9yePKEe
         DahnEiFVND0Xy7P0HALSBrwoeOkb+DKfUYnbs8S22fW6ycEDxw1HczQojKjASEwdH+Xp
         Lyf9esWZRZsgrIR7OaV8EzPPw0ahcOV73Nb+3hcGk5eeJiteurnw577sok3fYNIGZApI
         KdSAwEfxa0fq7kUeFjwFD+iGON5GYLgaZvDHrsG3WUFAAosMiF2C6DTc1rCzuCnSTCTj
         m8IQ==
X-Gm-Message-State: AOAM531ic66gCCC4g31l3EF2GBdpsyHgSYNBfG2JggaXchfgxW0vl5sv
        zsXsplNo4jWrZiSWJ8dc6Vk=
X-Google-Smtp-Source: ABdhPJw9BESp1aZIkxjyZ1Hj8Wn+YQnpayJdATQPKrEwEx2YlgmlgYzkBb2MlRuUVTjwIjBqcmzXnw==
X-Received: by 2002:a17:906:1d0e:: with SMTP id n14mr10523496ejh.97.1617888359967;
        Thu, 08 Apr 2021 06:25:59 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id d8sm9939596edy.83.2021.04.08.06.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 06:25:58 -0700 (PDT)
Date:   Thu, 8 Apr 2021 15:26:33 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>, Joerg Roedel <joro@8bytes.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Will Deacon <will@kernel.org>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] iommu/tegra-smmu: Defer attachment of display
 clients
Message-ID: <YG8EiUXkgPTZsfIY@orome.fritz.box>
References: <20210328233256.20494-1-digetx@gmail.com>
 <20210408094241.GA31714@Asurada-Nvidia>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rPdv4N4OEIEY1wvJ"
Content-Disposition: inline
In-Reply-To: <20210408094241.GA31714@Asurada-Nvidia>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--rPdv4N4OEIEY1wvJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2021 at 02:42:42AM -0700, Nicolin Chen wrote:
> On Mon, Mar 29, 2021 at 02:32:55AM +0300, Dmitry Osipenko wrote:
> > All consumer-grade Android and Chromebook devices show a splash screen
> > on boot and then display is left enabled when kernel is booted. This
> > behaviour is unacceptable in a case of implicit IOMMU domains to which
> > devices are attached during kernel boot since devices, like display
> > controller, may perform DMA at that time. We can work around this probl=
em
> > by deferring the enable of SMMU translation for a specific devices,
> > like a display controller, until the first IOMMU mapping is created,
> > which works good enough in practice because by that time h/w is already
> > stopped.
> >=20
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>=20
> For both patches:
> Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
> Tested-by: Nicolin Chen <nicoleotsuka@gmail.com>
>=20
> The WAR looks good to me. Perhaps Thierry would give some input.
>=20
> Another topic:
> I think this may help work around the mc-errors, which we have
> been facing on Tegra210 also when we enable IOMMU_DOMAIN_DMA.
> (attached a test patch rebasing on these two)

Ugh... that's exactly what I was afraid of. Now everybody is going to
think that we can just work around this issue with driver-specific SMMU
hacks...

> However, GPU would also report errors using DMA domain:
>=20
>  nouveau 57000000.gpu: acr: firmware unavailable
>  nouveau 57000000.gpu: pmu: firmware unavailable
>  nouveau 57000000.gpu: gr: firmware unavailable
>  tegra-mc 70019000.memory-controller: gpusrd: read @0x00000000fffbe200: S=
ecurity violation (TrustZone violation)
>  nouveau 57000000.gpu: DRM: failed to create kernel channel, -22
>  tegra-mc 70019000.memory-controller: gpusrd: read @0x00000000fffad000: S=
ecurity violation (TrustZone violation)
>  nouveau 57000000.gpu: fifo: SCHED_ERROR 20 []
>  nouveau 57000000.gpu: fifo: SCHED_ERROR 20 []
>=20
> Looking at the address, seems that GPU allocated memory in 32-bit
> physical address space behind SMMU, so a violation happened after
> turning on DMA domain I guess...=20

The problem with GPU is... extra complicated. You're getting these
faults because you're enabling the IOMMU-backed DMA API, which then
causes the Nouveau driver allocate buffers using the DMA API instead of
explicitly allocating pages and then mapping them using the IOMMU API.
However, there are additional patches needed to teach Nouveau about how
to deal with SMMU and those haven't been merged yet. I've got prototypes
of this, but before the whole framebuffer carveout passing work makes
progress there's little sense in moving individual pieces forward.

One more not to try and cut corners. We know what the right solution is,
even if it takes a lot of work. I'm willing to ack this patch, or some
version of it, but only as a way of working around things we have no
realistic chance of fixing properly anymore. I still think it would be
best if we could derive identity mappings from command-line arguments on
these platforms because I think most of them will actually set that, and
then the solution becomes at least uniform at the SMMU level.

For Tegra210 I've already laid out a path to a solution that's going to
be generic and extend to Tegra186 and later as well.

Thierry

--rPdv4N4OEIEY1wvJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBvBIYACgkQ3SOs138+
s6Hezg//VHpLpwMZYFB+XfNT7BMio9KNR0anBI58Ageu8ki5TpyavNg6gIHSeYtX
27YnoTVXPfpbqB28IWKNwUpy0mQFR8qPHAoG2i558GyS66EpB0sQxbESCe5Kr9sT
qYiTWuHS64u4tSBV/snQzmC4C3QWmt7R+wkEPScIYrSfzZpcK0tlcDxRC47b29Iv
tY0dVJXGkuHpRKaSzCjA0TwUdnwbBd1QVHUVkXzjl8wBBG6IKcLfvdbUAfEZZqbT
hhcZJ+vTmJMILLg6qjwoIkM2SGDwQchXhNSnA9BST8xl5husFIewNVXjX5w4qzp+
7tUzTIUVzwP2lKou2viUhKtgv1d/4vK7m5sTqrLGbEXgDb7LxUvgO/qzYWB77Keh
qI+Zv1ePd/RVXHuuOMM6vcLvXBFN5heXtW5CvFr+uwPbdVfz6/0QTxSAYF1pew+m
3I7u5VYgQSKdZ7uekRTppUh3d/0YZspTjpjfQtCYbdE8jnyp3dDPMVJqsZ88m7Op
kWdZ6CFCcoKY7K+lhtrs1i/p3FJqlRMc+3bjfRyYsTxJu3UThMDa6mrTDwojtBq4
jlSfMKJrbwBT+ARJQQNikRm6g9aAI/Y6SlaF1GmnhCDZm9IPo3f8zr3UcgPCAHCO
eASsZZUacPziyminANJTo8m8A0k4BtaL9esNfHOG+0WyYhI9e1E=
=d+bf
-----END PGP SIGNATURE-----

--rPdv4N4OEIEY1wvJ--
