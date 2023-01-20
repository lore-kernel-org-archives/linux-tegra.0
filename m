Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D74BC05027
	for <linux-tegra@archiver.kernel.org>; Fri, 20 Jan 2023 17:36:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229595AbjATRgU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 20 Jan 2023 12:36:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229518AbjATRgU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 20 Jan 2023 12:36:20 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 073B4358B;
        Fri, 20 Jan 2023 09:36:19 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id x36so7564369ede.13;
        Fri, 20 Jan 2023 09:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Hsg3R7cF7+KXUcvELUAw71wu/QRs/AoD8oGagePGrU=;
        b=FiFRNczG1zXTt5lXzhkrx2m2cQDmpDhc0J+5rlWsUErG7M5M2kj97QonC92zcUDsj4
         zbho20kj9u4gIESi3BXzJkcEgzPA1mmebkD3D3e01nZZ6YJQszqa4C5GdXB8aTojW2t2
         YOhBu5LTLvGjp7qJua5OpGqSUkLlcNJoXuSrHapZnvb6PbCHX4AiLWqBG+OT9uczAL69
         Q3a4gI/wluSnevKoyFEfVyuWEgc/37CTXKSvL3Xomri5QC+ALu7VAzlMBbuWr+Bbzuc0
         WA3Txco4pixBe8cLVriWCX/+wzhRmMwpQvn6fZQrkY2BDkXPiQsed2y9FKAGvqxt9wLA
         RJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Hsg3R7cF7+KXUcvELUAw71wu/QRs/AoD8oGagePGrU=;
        b=ZlQ09Xd23C6iW4N6D0M671fMAhTVX9t7AlrjuoVJc5eLL6YBGWtPAbKN8RUOLnfUr7
         yPBkSBXAHorNpopjFbFLa33fRW1zSZdOZQnZE0Npshnk6afAWjQKoA2rYQh6342WuMvn
         nGt/Kq0550BcUnGohZ+D9+QSdMRWkLmxb/E3SIAdC1wvvacluhkk0h96rc+WMLbeoipW
         Syyb7qejddw9bJ8JUom83naAH/tNxb2bLbd+5hhw8E/B0hb1AVwpnAkIiAuaE+bUefDw
         EKj8wUzRpTD8Wc25JGY1yH/V11lyVGjPdWNm6vcCm6uWmgCInbeeOL0xZXVJLOW8V7AT
         y07g==
X-Gm-Message-State: AFqh2krHDKoZRKlGP5rpJ0HMsfbqQv+stgGYb673vsCYFtteVKOjDyq1
        VHOiS4jWK2RoSkdnbgsVxgU=
X-Google-Smtp-Source: AMrXdXs+7JIXGlxA9jU7fzL3nVI7hW91H1kYyg81v/b5/PYAmef5Z3aGNM5nt63NKVtUY15Ph/T5pA==
X-Received: by 2002:a05:6402:27cf:b0:49e:24b4:5981 with SMTP id c15-20020a05640227cf00b0049e24b45981mr20701198ede.39.1674236177527;
        Fri, 20 Jan 2023 09:36:17 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a8-20020aa7d908000000b0049dfd6bdc25sm8483147edr.84.2023.01.20.09.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 09:36:17 -0800 (PST)
Date:   Fri, 20 Jan 2023 18:36:15 +0100
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
Message-ID: <Y8rRDyFxx5KQSwD3@orome>
References: <20221117185424.2359687-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="oBH+S5ZD2EBiE5Rg"
Content-Disposition: inline
In-Reply-To: <20221117185424.2359687-1-thierry.reding@gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--oBH+S5ZD2EBiE5Rg
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

Hi Joerg,

I think this has all the Acked-by's and Reviewed-by's that it needs. Can
you pick this up? I'd really like to see this go into v6.3.

If there's anything that you'd like to see addressed, please let me
know.

Thanks,
Thierry

--oBH+S5ZD2EBiE5Rg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmPK0Q8ACgkQ3SOs138+
s6GnPQ//XKZ8kJsU2ABDQ4Hc2ibE+dZfYdJpuWJ/NHFHt9cbf4/bDMYmGubWAIFs
FbHTJ4le89rhpERT/QrjqZLqpLfEsL+BaaW3J6k8zpCP5jdUc4vymu8KUtdQlYwT
n4ef3WCzmWaesM4wCWtwJC6XjXktuXid2j1asxO6TKxS55XIxlwtob+K4U3nhAfg
c4wQDXh6TeeIv6Hw6r4Lx8T2nr9CpDhqd6cJs7uLqn8kXZ9GEOhua3gPVznuEexy
UtYpX7AgWTmJbzAcChRQQHd0Hs3OCcV6JWPMNKcmGGotlBKy0vz6ECzh5z9t/Py1
K7Vq/FXSsyFtfZ1M+r4t7QkhQrReRHpALdjROnl3sCK2pM7krO5XBLWrloKFtZqj
ryfuO6FLK69lOEqlhjHRGhaKQvuws8Kf4wHCnZtWepQOdZijBBqjZ0NbJulPmldo
UDJCYzJSs8g0pQF5CqaQzj0gP/Md3TPRig+2GE3+m0rHA4lcRKQgt68GMFiPx6FI
P5gqyiDLdK+dpfcq7Ev3m527Bv5hgoBHgCBh+tYbZu5Br0SrHZNOz00LW1uBmYBj
00Ctzs9yMwNk2/daX6P8jxgYrdFTrIvmI7Fgns80lAsrClx7krfvwBBbZpljA8c9
8oRJdryRtwbmE5ch8Sh+b/Ze9GHMn2EgBRjPSaaX65/T6lZiXEc=
=qY7i
-----END PGP SIGNATURE-----

--oBH+S5ZD2EBiE5Rg--
