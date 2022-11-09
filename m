Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E463C433FE
	for <linux-tegra@archiver.kernel.org>; Wed,  9 Nov 2022 14:27:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231238AbiKIO1Q (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 9 Nov 2022 09:27:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231443AbiKIO0k (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 9 Nov 2022 09:26:40 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A2942E9DD;
        Wed,  9 Nov 2022 06:25:22 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id h9so26067628wrt.0;
        Wed, 09 Nov 2022 06:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=inJ9kpO5aVpoQfdPx6WJGeQHjasVn/qUmKCu+lJ0PAM=;
        b=GiHtZNe028AhOl3kA6R3t/WgYpDdVzjK/JruxF9RPT1md6J7Vq6eJpRFtuoal1VY9M
         SLz/UQ9A674HOXhyKm509xySk+nQErIh57lNH11gis0QzCzxpvDNPCq1ljLId/53+CAC
         8Ym7d5ZAtpzwpFMmgqfnU9H28owYwmhjOEbzr8tRzLEqem35DG7IVj2ADYvu8Ke2B6Ik
         sSxP0lyt2y8lREJ0kLdVa2ihyo8toDRTZZW40nHoGdS8pOnHepqNJxLT3RV1RzldYqb+
         X+cWZQLOYhBF/Ypjsbddkz3rVjyftlc4ZFj6hl8WzheKiQCfgm/Jl8rHPihu22PK7F0E
         rV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=inJ9kpO5aVpoQfdPx6WJGeQHjasVn/qUmKCu+lJ0PAM=;
        b=FfqaoWv3dj5q8ynK9jK+O1eepsDTU9KSCf/C2b+V2mXE1n+wI/l0LforV8tAML0cUO
         7TgkNi7/wi8NnR1oUoJu7GGLVJFIj1dg2jk5ENgweynXxCV+bPLGnh/Ux35jnguAG9HO
         2x3RbHOH8qyKGhifz6LGx7l5ovnpR/yJdm3q2yMNQZ6+OUQK7Nq4CkQRz7N5M7gcQUZp
         4Sh4k3m+nYVUOWzjt801e6xzK2tGvHFuJHxzlp59oNaS2yBCkcMEsx1u0z232NSbFHXb
         JXJp+TYkP0pn9U1gyrPhkHWioyj5Dm2Mv+WTneYHHPU6THvs8KbUgTUOse30WXziBdbM
         0LiQ==
X-Gm-Message-State: ACrzQf1LjeEh826zfzEr6B5SoohY5W0BurOdlc0/ybfmI7Cot9nh329P
        /ZEnZPLZVuNSYAmL/MCs/3I=
X-Google-Smtp-Source: AMsMyM5/C39K7zIfNARGwgjtXklTl9NZrYRfWK/N3v0Fchy/Wkvs0JLJd4OUNMjoBpwO5Zu83RPWOg==
X-Received: by 2002:a05:6000:408b:b0:238:238:513d with SMTP id da11-20020a056000408b00b002380238513dmr23705686wrb.536.1668003920482;
        Wed, 09 Nov 2022 06:25:20 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id z3-20020adff1c3000000b00236e834f050sm12936189wro.35.2022.11.09.06.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 06:25:19 -0800 (PST)
Date:   Wed, 9 Nov 2022 15:25:17 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Lucas Stach <l.stach@pengutronix.de>
Cc:     Rob Herring <robh@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Ashish Mhetre <amhetre@nvidia.com>,
        Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Janne Grunau <j@jannau.net>, Sameer Pujar <spujar@nvidia.com>,
        devicetree@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-tegra@vger.kernel.org, asahi@lists.linux.dev
Subject: Re: [PATCH v10 2/5] of: Stop DMA translation at last DMA parent
Message-ID: <Y2u4TdwwL+o+sqhE@orome>
References: <20221103133900.1473855-1-thierry.reding@gmail.com>
 <20221103133900.1473855-3-thierry.reding@gmail.com>
 <20221107193035.GA1394942-robh@kernel.org>
 <Y2popxNd2uIdXmlf@orome>
 <CAL_JsqJ6XS7UZiEdjb2pyq_LmOLWBGcWHKsntTgjVFRi=4JMXw@mail.gmail.com>
 <c8bcec17571a896610f225498655025ffc4b092a.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6pZZkBGyKsqUI+DW"
Content-Disposition: inline
In-Reply-To: <c8bcec17571a896610f225498655025ffc4b092a.camel@pengutronix.de>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--6pZZkBGyKsqUI+DW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 09, 2022 at 11:07:02AM +0100, Lucas Stach wrote:
> Am Dienstag, dem 08.11.2022 um 10:25 -0600 schrieb Rob Herring:
> > On Tue, Nov 8, 2022 at 8:33 AM Thierry Reding <thierry.reding@gmail.com=
> wrote:
> > >=20
> > > On Mon, Nov 07, 2022 at 01:30:35PM -0600, Rob Herring wrote:
> > > > On Thu, Nov 03, 2022 at 02:38:57PM +0100, Thierry Reding wrote:
> > > > > From: Thierry Reding <treding@nvidia.com>
> > > > >=20
> > > > > DMA parent devices can define separate DMA busses via the "dma-ra=
nges"
> > > > > and "#address-cells" and "#size-cells" properties. If the DMA bus=
 has
> > > > > different cell counts than its parent, this can cause the transla=
tion
> > > > > of DMA address to fails (e.g. truncation from 2 to 1 address cell=
s).
> > > >=20
> > > > My assumption in this case was that the parent cell sizes should be
> > > > increased to 2 cells. That tends to be what people want to do anywa=
ys
> > > > (64-bit everywhere on 64-bit CPUs).
> > > >=20
> > > > > Avoid this by stopping to search for DMA parents when a parent wi=
thout
> > > > > a "dma-ranges" property is encountered. Also, since it is the DMA=
 parent
> > > > > that defines the DMA bus, use the bus' cell counts instead of its=
 parent
> > > > > cell counts.
> > > >=20
> > > > We treat no 'dma-ranges' as equivalent to 'dma-ranges;'. IIRC, the =
spec
> > > > even says that because I hit that case.
> > > >=20
> > > > Is this going to work for 'dma-device' with something like this?:
> > > >=20
> > > >   bus@0 {
> > > >     dma-ranges =3D <...>;
> > > >     child-bus@... {
> > > >       dma-device@... {
> > > >       };
> > > >     };
> > > >   };
> > > >=20
> > > > >=20
> > > > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > > > ---
> > > > > Changes in v10:
> > > > > - new patch to avoid address truncation when traversing a bus hie=
rarchy
> > > > >   with mismatching #address-cells properties
> > > > >=20
> > > > > Example from Tegra194 (redacted for clarity):
> > > > >=20
> > > > >     reserved-memory {
> > > > >             #address-cells =3D <2>;
> > > > >             #size-cells =3D <2>;
> > > > >             ranges;
> > > > >=20
> > > > >             framebuffer@0,0 {
> > > > >                     compatible =3D "framebuffer";
> > > > >                     reg =3D <0x2 0x57320000 0x0 0x00800000>;
> > > > >                     iommu-addresses =3D <&dc0 0x2 0x57320000 0x0 =
0x00800000>;
> > > > >             };
> > > > >     };
> > > > >=20
> > > > >     bus@0 {
> > > > >             /* truncation happens here */
> > > > >             #address-cells =3D <1>;
> > > > >             #size-cells =3D <1>;
> > > > >             ranges =3D <0x0 0x0 0x0 0x40000000>;
> > > > >=20
> > > > >             mc: memory-controller@2c00000 {
> > > > >                     #address-cells =3D <2>;
> > > > >                     #size-cells =3D <2>;
> > > >=20
> > > > I think this is wrong. The parent should have more or equal number =
of
> > > > cells.
> > >=20
> > > I was half suspecting that. The reason why I hesitated is that I reca=
ll
> > > having the opposite discussion a while ago when we were adding bus@0 =
to
> > > 64-bit Tegra devices. We had at some point (probably around Tegra114 =
or
> > > Tegra124, 32-bit ARM chips that support LPAE) started to set #address-
> > > cells =3D <2> precisely because the CPU could address more than 32-bit
> > > addresses. We then did the same thing transitioning to 64-bit ARM. Wh=
en
> > > we then started discussing bus@0, someone (might have been you) had
> > > argued that all these peripherals could be addressed with a single ce=
ll
> > > so there'd be no need for #address-cells =3D <2>, so then we went with
> > > that.
> >=20
> > I may have not thinking about the DMA side of things.
> >=20
> > > Reverting back to #address-cells =3D <2> is now going to cause quite =
a bit
> > > of churn, but I guess if it's the right thing, so be it.
> > >=20
> > > Another possible alternative would be to move the memory-controller n=
ode
> > > from the bus@0 to the top-level. Not sure if that's any better.
> >=20
> > I stumbled upon 'ibm,#dma-address-cells' and 'ibm,#dma-size-cells'
> > while reviewing this. Those seem to be for the same purpose AFAICT. We
> > could consider adding those (w/o 'ibm') to handle this situation.
>=20
> I would appreciate this. We have the same situation on some of the NXP
> i.MX8 SoCs right now: all the MMIO is addressable with 32bit, so all
> the busses have a single address and size cell right now, but we would
> need to extend the address-cells to 64bit just to properly describe the
> DMA addressing capabilities of the devices.

Alright, I'll see if I can come up with some code to deal with this.

Thierry

--6pZZkBGyKsqUI+DW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNruEsACgkQ3SOs138+
s6FSLg/8DPLKVp9Se36bVlxeWZHHKC7fX6fjWMji1JXJVTYZAaDqZeDhDT5RCGRS
8/N1Yjg5ZCDV8c8kCvxS/sTq+wLT6l93secD17EwdG2AxaO2N84OW7zRP8Yw3QjJ
b04qqpkXQuvBLP8bag5YAD6Iti7kGx6zTZ3IOpSJegasua8F/KnBGwmGfGv5chiv
DLAYTWt6tWM5H97WMKEVhEjJpAL3yMO5ylJUpQadbu/oVQO+7iLR3cxo6IrmuOiI
cbj9aUOhDnMYZQGJ2GaVZSigCf4gYs0oNUWRA9iQCA1a/1e4gXQQ7hed9tB14Bdh
t/2moFuySC+dWfDtjHo8DFW2vXt7ba+HEkolgYP1fBjI2zZy1TDDwdDYip+3i9V4
fQgeqlrioJH/sV90RXv6SvqKQAY9tyf1FRyeSoj6Z/ep+twz3JKEy5eTvPUgbtM9
Y8CtmzRrYFg9phGFiPiGmfvBXy0SGWdoZmoldaWMSkWEnBfZttn8UfiZEHh3uxBu
ZxI78aGf6BEfFWoxw/oK+9P70ysizFct14xyFrlayMHTxxW81Ek2Pc3eEFUmOfoy
4ClNedrsYJMsgDZfNt/hNiXgkiADfjyl/2apSFSCR2MkZTPxaJUmQV+5146M3j0B
YoNhr/uVplP75/h9m2zrNZv2ITVARwqCOiaNWI9w0Me2BdLkSWA=
=IIig
-----END PGP SIGNATURE-----

--6pZZkBGyKsqUI+DW--
