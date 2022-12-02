Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F300C47088
	for <linux-tegra@archiver.kernel.org>; Fri,  2 Dec 2022 14:41:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232588AbiLBOlN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 2 Dec 2022 09:41:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiLBOlM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 2 Dec 2022 09:41:12 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1CF28C68E;
        Fri,  2 Dec 2022 06:41:11 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id gu23so11984712ejb.10;
        Fri, 02 Dec 2022 06:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Jbtz62/9w40k58squVqf0TUtGGR07w4EKpHh1neaUA=;
        b=SkPI4+E7HzmpxvUDO2DFOGKkpYSeZgapleOF0O/xJzrEKz6MqQ8W7eVz24F1Ux55Gq
         xlhDIAgaPXAF1DmCuH/C+e5tzBVomX6LlpXaXmJjy3ElAKGmeKZQ8XyYOTQju6lQAL9k
         g2HvGf0M8OTJRJxRV4RRuISTlTtt7S394ixjr2IVcZMJZsaKIdzocEa7NX8ktZ6vwP22
         4ZQzqbDp2HPy/PRjQBdsmbFMFEYO9VdhhtLwQZXAPUkgKRoePcDg7osUElj4aIggNF0f
         jXZ5cd1w/b2VbBKegMZ27irSLmpLz+8wtXDnxcwyxhlIKqNb4zC4YJP6ncvL9EAfuPfj
         6KEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Jbtz62/9w40k58squVqf0TUtGGR07w4EKpHh1neaUA=;
        b=n++2cOfeY7RwG9540mq0HlShCEN3P5sMPdwRueck6iPs6fe0mEb72Izw3R5IJEvPpE
         ZWydGTV4Lld6nLNN/RDkcgaWifzU2pC26wfoW6vbTMRcGA7iWQDBZ5Dxb4ZVtBYFx4qc
         Pu4HWYQ8ynbPvSXtCIBu31OTdHs4R7AMd1mtnnN+8nPS1tdeEQjXQyF8lfHXqDXRlvxO
         kRAoQ39uOHw7pii7MH/Wj9OqdgfQ0XcoZKxz0mw9xTnBLMo7s37emPHPocSFHLlcmkva
         e7WYseobxpji9rkh6+vI0L/V24OEQM/wlLQLjmgcwtzGAdBNt2+NwGxVy+V8Cli3LyS5
         yPQw==
X-Gm-Message-State: ANoB5plDix1xYxk0EDZfT6Rl106AZpzQ+b+DHvfX5nC1J45Z5U/WMkRK
        uWsCR831pwQwE3g28o1vviA=
X-Google-Smtp-Source: AA0mqf478x0IXjmvjD+LZiZAVDXar6/lwtMdxvIe25MTdk9Ts9wA7t4y42BVaCiQLnqEcnGU2N4BNg==
X-Received: by 2002:a17:906:6887:b0:7c0:a728:6aeb with SMTP id n7-20020a170906688700b007c0a7286aebmr9268938ejr.438.1669992070028;
        Fri, 02 Dec 2022 06:41:10 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id w24-20020a1709064a1800b007b47748d22fsm3058036eju.220.2022.12.02.06.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 06:41:09 -0800 (PST)
Date:   Fri, 2 Dec 2022 15:41:07 +0100
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
Message-ID: <Y4oOg5nSBPBieArv@orome>
References: <20221117185424.2359687-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="YDYlJthlp2phvpXx"
Content-Disposition: inline
In-Reply-To: <20221117185424.2359687-1-thierry.reding@gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--YDYlJthlp2phvpXx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 17, 2022 at 07:54:20PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Hi,
>=20
> This version is a minor update to the previous v11, which can be found
> here:
>=20
>   https://lore.kernel.org/all/20221111161806.630527-1-thierry.reding@gmai=
l.com/
>=20
> The only change here is that the #dma-{address,size}-cells is dropped.
> It turns out to be much simpler to just update #{address,size}-cells to
> what they should be rather than add extra complexity for the DMA work-
> around. There's a minor update to the DT binding so that it can now
> properly validate cases where we have both reg and iommu-addresses
> properties.
>=20
> An example is included in the DT bindings, but here is an extract of
> what I've used to test this:
>=20
>         reserved-memory {
>                 #address-cells =3D <2>;
>                 #size-cells =3D <2>;
>                 ranges;
>=20
>                 /*
>                  * Creates an identity mapping for the framebuffer that
>                  * the firmware has setup to scan out a bootsplash from.
>                  */
>                 fb: framebuffer@92cb2000 {
>                         reg =3D <0x0 0x92cb2000 0x0 0x00800000>;
>                         iommu-addresses =3D <&dc0 0x0 0x92cb2000 0x0 0x00=
800000>;
>                 };
>=20
>                 /*
>                  * Creates a reservation in the IOVA space to prevent
>                  * any buffers from being mapped to that region. Note
>                  * that on Tegra the range is actually quite different
>                  * from this, but it would conflict with the display
>                  * driver that I tested this against, so this is just
>                  * a dummy region for testing.
>                  */
>                 adsp: reservation-adsp {
>                         iommu-addresses =3D <&dc0 0x0 0x90000000 0x0 0x00=
010000>;
>                 };
>         };
>=20
>         host1x@50000000 {
>                 dc@54200000 {
>                         memory-region =3D <&fb>, <&adsp>;
>                 };
>         };
>=20
> This is abbreviated a little to focus on the essentials. Note also that
> the ADSP reservation is not actually used on this device and the driver
> for this doesn't exist yet, but I wanted to include this variant for
> testing, because we'll want to use these bindings for the reservation
> use-case as well at some point.
>=20
> I've also been able to make use of this binding and the IOMMU code in
> conjunction with the simple-framebuffer driver to hand over a display
> configuration set up by UEFI to the Linux kernel.
>=20
> Janne has confirmed[0] this to be suitable for indirect mappings as
> well, though these patches don't implement that feature yet. Potential
> extensions to this have been discussed but are not yet included at this
> time to not further complicate things.
>=20
> Thierry
>=20
> [0]: https://lore.kernel.org/all/20220909144504.GA4024@jannau.net/
>=20
> Thierry Reding (4):
>   of: Introduce of_translate_dma_region()
>   dt-bindings: reserved-memory: Document iommu-addresses
>   iommu: Implement of_iommu_get_resv_regions()
>   iommu: dma: Use of_iommu_get_resv_regions()
>=20
>  .../reserved-memory/reserved-memory.yaml      | 89 +++++++++++++++++-
>  drivers/iommu/dma-iommu.c                     |  3 +
>  drivers/iommu/of_iommu.c                      | 94 +++++++++++++++++++
>  drivers/of/address.c                          | 41 ++++++++
>  include/linux/of_address.h                    |  2 +
>  include/linux/of_iommu.h                      |  8 ++
>  6 files changed, 233 insertions(+), 4 deletions(-)

Joerg, Rob,

Is there anything left to do on the series? It'd be great to get some
feedback from Robin on patch 3 since he had some concerns about how the
reservation type was getting determined. All those should now be
addressed and I think overall this is ready to go.

Rob, you've given a Reviewed-by on all the DT-related parts, does that
mean you're okay with this going through Joerg's tree?

Joerg, other than a Reviewed-by from Robin on patch 3, anything else
you'd like to see before you pick this up?

Thierry

--YDYlJthlp2phvpXx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmOKDoMACgkQ3SOs138+
s6ERoQ//WAHKrd3sSos3I9hlsUtTTI3H4NJgyMFVh2KDK5KTBlsWC3fAH/Ia16IM
AAK+Dqfrlmw2scOfHOGdzg7JYjXS0Q5v1h/iiWn3shfJ5XH+gQN6fFZksVG8B9jD
GiWUkUDvRj+VP+aQ/M6DsLVi5c2BhnzS6j6SaIiMPcDKxXhxl3QWqj6kODOKFcad
qsO1xgIPst1BNEy53mN+Dq+v3zqt3IgCv7g7Zuy/DxN/yZ4YQBjR/EmxN6pmwapc
EyT2Xev9vuHXgbW/VLV/QusvFqfiXQzxZ242tNeySXy7v+Mm1ULEQ1uS7fd7oZu6
AtByxT+d5EczShhwsRzLcigJ2h9n2vBhPpq3uiJy8rssTo7ax7o7ptsilbcblFm4
4eJ/9ATI2X23Zslhi6vtf5Z06wjSUgUhMJ+Sb9JQc17qptxc3+/5AZhftrPM2I1g
TuPf5BWn+68y8LmQSneoPJXWOKe7Dkys3/zjNYdxXRrRFeVm9Zgxb1yqr272E/LE
jIxVBI+pGHRLm1KxjpaSSXiy2OneYxUyLAHyHMEGJFWv6gVi3LHGVuSNtONxTxF4
BQkIsI/yZnVeysiuSD7SvfB/I3Mt61IACbJHl8prkQAdKCucnMgjMfQfFbsQOnmC
XgdeGKnIKwDseEA9uZWPMiUKtR2fXRiaT9DVKYZ+W1Gk3a+sW/U=
=JpMc
-----END PGP SIGNATURE-----

--YDYlJthlp2phvpXx--
