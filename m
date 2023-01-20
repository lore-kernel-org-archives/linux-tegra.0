Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC308C05027
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Jan 2023 17:44:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbjATRot (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Jan 2023 12:44:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230246AbjATRoq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Jan 2023 12:44:46 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D1C0270E;
        Fri, 20 Jan 2023 09:44:45 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id vw16so15773178ejc.12;
        Fri, 20 Jan 2023 09:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vzb4x08rONaBPBHIhhbhW5ohbXZ5cJXrWYA/At79tyw=;
        b=LPd/gTfKunhmGKiURJuHX9NJhqp3/bnZ4ltlgKjqY9O95iNKqEkuXkieP47CAgwIVk
         4DxWAXrpQdNVJqH+WXu5MDsXaUu60Vt7tv0aLaqRP7cb2J/c1OZbUgBJcfqjO8fhTuTB
         X3jPnXDipwTwUuNNJw0odTM68Whsnxs8v3vcZvFfwf8tsHIdwjkUnD1UVIKRmkt9A8Zx
         iD1QHuPmKpnBs07BE45ddNQGG0tcUOShz7FkKl7Ljk69lnkoC37xj6/l1hAjGNS2np8l
         pOd2FDamgXTCzaXibeCyhd9yS+dQv3Q1k/5bDseDWQRjOvOo3tmOhenlYzqUcNv6DG74
         RTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vzb4x08rONaBPBHIhhbhW5ohbXZ5cJXrWYA/At79tyw=;
        b=525IctQLM/cicaAm/nON4nYVH9zd9wbvDkVvw2IJzvbQ+ZQc9eytl9UnHBAA56+wBB
         GJKQXUuW7FyxlkUCViJ/WqQsCI8hTwZSKzILjEPv7LLSEyIa49SsJ9aT5P3eCxCO5obj
         5kne90S6TCL4Pm77JdlKwY5iHWvNVTH2et6E0Ql1SOAUz2lDy1Mn/zEeWBmXjTpvICDX
         zfiOz3REnjkGAT4wp6I6mMbEMrCvnPw7waFu4BTS1o8dn5XWxNBoSIWVX7D5zUKtlxXn
         IMQiad7W4WjDR1yv0OXN1cvRsWx4DqJrcwk4xI5Rp23NMV4xJ4yYWLxQi6HdvoDqwYuk
         jmIg==
X-Gm-Message-State: AFqh2kqRZfhkqDy7TJVNkgYFc8b9vI9VQn6CiBRhnnMf+RRtGvLkpgrE
        zfPZwmruhWbUY4diFs/6XE0=
X-Google-Smtp-Source: AMrXdXvzA9GOPZrGKAIM9iXmf52TVAZdwrrFDq0+5sdCJlH+MjWz7qmxZfsTuYvnZavJe6vZgDmCGw==
X-Received: by 2002:a17:907:a586:b0:86a:316:d107 with SMTP id vs6-20020a170907a58600b0086a0316d107mr18250916ejc.72.1674236683436;
        Fri, 20 Jan 2023 09:44:43 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id sa37-20020a1709076d2500b00870ebda9479sm7340014ejc.100.2023.01.20.09.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 09:44:43 -0800 (PST)
Date:   Fri, 20 Jan 2023 18:44:41 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Ashish Mhetre <amhetre@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH v12 0/4] iommu: Support mappings/reservations in
 reserved-memory regions
Message-ID: <Y8rTCeEvYG/Cx75S@orome>
References: <20221117185424.2359687-1-thierry.reding@gmail.com>
 <Y8rRDyFxx5KQSwD3@orome>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YcfcTRnmgAM6V3Ln"
Content-Disposition: inline
In-Reply-To: <Y8rRDyFxx5KQSwD3@orome>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--YcfcTRnmgAM6V3Ln
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 20, 2023 at 06:36:15PM +0100, Thierry Reding wrote:
> On Thu, Nov 17, 2022 at 07:54:20PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Hi,
> >=20
> > This version is a minor update to the previous v11, which can be found
> > here:
> >=20
> >   https://lore.kernel.org/all/20221111161806.630527-1-thierry.reding@gm=
ail.com/
> >=20
> > The only change here is that the #dma-{address,size}-cells is dropped.
> > It turns out to be much simpler to just update #{address,size}-cells to
> > what they should be rather than add extra complexity for the DMA work-
> > around. There's a minor update to the DT binding so that it can now
> > properly validate cases where we have both reg and iommu-addresses
> > properties.
> >=20
> > An example is included in the DT bindings, but here is an extract of
> > what I've used to test this:
> >=20
> >         reserved-memory {
> >                 #address-cells =3D <2>;
> >                 #size-cells =3D <2>;
> >                 ranges;
> >=20
> >                 /*
> >                  * Creates an identity mapping for the framebuffer that
> >                  * the firmware has setup to scan out a bootsplash from.
> >                  */
> >                 fb: framebuffer@92cb2000 {
> >                         reg =3D <0x0 0x92cb2000 0x0 0x00800000>;
> >                         iommu-addresses =3D <&dc0 0x0 0x92cb2000 0x0 0x=
00800000>;
> >                 };
> >=20
> >                 /*
> >                  * Creates a reservation in the IOVA space to prevent
> >                  * any buffers from being mapped to that region. Note
> >                  * that on Tegra the range is actually quite different
> >                  * from this, but it would conflict with the display
> >                  * driver that I tested this against, so this is just
> >                  * a dummy region for testing.
> >                  */
> >                 adsp: reservation-adsp {
> >                         iommu-addresses =3D <&dc0 0x0 0x90000000 0x0 0x=
00010000>;
> >                 };
> >         };
> >=20
> >         host1x@50000000 {
> >                 dc@54200000 {
> >                         memory-region =3D <&fb>, <&adsp>;
> >                 };
> >         };
> >=20
> > This is abbreviated a little to focus on the essentials. Note also that
> > the ADSP reservation is not actually used on this device and the driver
> > for this doesn't exist yet, but I wanted to include this variant for
> > testing, because we'll want to use these bindings for the reservation
> > use-case as well at some point.
> >=20
> > I've also been able to make use of this binding and the IOMMU code in
> > conjunction with the simple-framebuffer driver to hand over a display
> > configuration set up by UEFI to the Linux kernel.
> >=20
> > Janne has confirmed[0] this to be suitable for indirect mappings as
> > well, though these patches don't implement that feature yet. Potential
> > extensions to this have been discussed but are not yet included at this
> > time to not further complicate things.
> >=20
> > Thierry
> >=20
> > [0]: https://lore.kernel.org/all/20220909144504.GA4024@jannau.net/
> >=20
> > Thierry Reding (4):
> >   of: Introduce of_translate_dma_region()
> >   dt-bindings: reserved-memory: Document iommu-addresses
> >   iommu: Implement of_iommu_get_resv_regions()
> >   iommu: dma: Use of_iommu_get_resv_regions()
>=20
> Hi Joerg,
>=20
> I think this has all the Acked-by's and Reviewed-by's that it needs. Can
> you pick this up? I'd really like to see this go into v6.3.
>=20
> If there's anything that you'd like to see addressed, please let me
> know.

Joerg,

I just noticed that this no longer applies on v6.2-rc4, so I just sent
out a v13 which is really only a rebase with the tags from v12 applied,
no further changes.

Again, let me know if there's anything else you think this needs before
it can be picked up.

Thanks,
Thierry

--YcfcTRnmgAM6V3Ln
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmPK0wkACgkQ3SOs138+
s6F6WxAAnUP8cHSS7eoxrCpbXmpTBFaE8xdvwJ1mMKCVoUk1FTggU5ErCU1ON1Q/
eEYAARrKx3ii9oVummkwsCINQGzA4QwiVSA9mUn8apTI/HtUS2Pt+q46MvzCdVqS
mCphLLuR/wgp+brHA0NPPYMqXpvWMO/tcR09ZXsqOEYtezBsi7en/Ff6TLz9Ftd7
RsoBacAdAR9sulS2/BZTCS4y25cgqqz0PUG0urKKdES+MkOR/ZW3a2SMJ0P1uLm6
DZzlQpTHWXPVKGXWGiy+Rb/XpzOkT0CYYYpjJAAY8pPRjRDC/H0K8qbfEGJ0v060
K66j1oQpCJLS2yMR7qqVfN/K6mJfs4oNn6WH6X0QFENFPqjsxlYjwcshSsMuqcMt
s1JtjhI671BYiD4BgB27jUJ6DchorC69/PoidhZxNOvxKEgyczVPuoFywntPXgcf
GXaPJOgnXi+3vT9959uQYeTv0Kt1/HBiopjXV/F7nYU6KXpsXn5Q2bQ1LPFJm7UM
6FACXb/uSVZst3NJ++bCFFUfcksWXs/9jbjILCwhHf7hm2CzXPk+qVZRqpEzcAX2
SNb7BNUvzNPP300XVm3iEIFpKmwtAgG8NXUWyVnM7s9yQp4gVdIh7iEd54ldG0Ok
JVzM4aWSpZxKWLSFSmAZCvh7cfYQPyrofQYgzaZPQOD/BDiNbAA=
=D6IK
-----END PGP SIGNATURE-----

--YcfcTRnmgAM6V3Ln--
