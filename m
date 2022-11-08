Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97879C433FE
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Nov 2022 14:33:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234276AbiKHOdn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Nov 2022 09:33:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234341AbiKHOdU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Nov 2022 09:33:20 -0500
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9DF021AC;
        Tue,  8 Nov 2022 06:33:15 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id h9so21328737wrt.0;
        Tue, 08 Nov 2022 06:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S9Dt2BOKAc3+oQGAFlOt/P8C9AN1In+LLkCOyLdR9Cs=;
        b=kSFAG05TYa+PUIYn5bCvMnCN1XpdI3zUzVpC/tBnZgSPhVgYcdLtq3CanojS6DjC3D
         BdMEk6Iki+rBt8bMchPmSPED0t1XOw7DCsl3AkjW2/g97hhkyAyXvj90zU0ypvLL7oxH
         WsQj3GJWPXWoefGgCLytA/cTbr6QG+HTXf2l+zP86tzcLhuVL3Dpu2KcCXUmgzhPRtIY
         3q2hYpUFIBhgTgVBSFs0pntWAk2l1IpNbZB4q7kUnydDENewwyBoJ3ZxkD7BOEOqhL/f
         FkIrwRbFb5Daq4dDf9+d/XjOJwvdAvLuXSa8JF8rzNM6OfaJ+exueF7uWdAi/BDloMFV
         hqIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9Dt2BOKAc3+oQGAFlOt/P8C9AN1In+LLkCOyLdR9Cs=;
        b=8N7n6KKgvqEmNVH4CaH2Urn1zACAFXu1uPYVJVvdPramqT8687K6tCQfbslmIU+pIA
         47XW9W4lH4dcV5kMPEM+Giagf/r3cmX6cWS85jHuhYjXCFfxYEJw1j2NgqLRpOyEl2ni
         mVR4bMfyXHDSA46ug1bGmZHk76qedA0ryKAYA7OAGBIJmfoK68zUVnw0c0A2PT7xznKv
         q5dkOh3IpwsGKFX6IAF+6kMzTkvVNjDXHa0Gf2gXgEfJxVrSDfJmQUvh4JKL/0bbXEKg
         f6CLR51/ax/5QNuVuR/PLJYzOH+xo95/4fXIzAyLhMktlxsGaGrbqL25m5o37C6+r5+8
         6eyg==
X-Gm-Message-State: ACrzQf0GhD2vYcpxQUCm6tcSsLE7Pe+tLDANP7FvySW2eVSzyfC4pb3y
        0gbdRbiv67kOp1UhMzBcaDA=
X-Google-Smtp-Source: AMsMyM4pVarTAWhRJ9mcTYzwUxePX1hJetsp9oZMFZ4ONLaWDj+Up3toOfP1y3D+1odIS3Cbp62jZA==
X-Received: by 2002:a5d:58d8:0:b0:236:90a2:4334 with SMTP id o24-20020a5d58d8000000b0023690a24334mr35966376wrf.298.1667917994313;
        Tue, 08 Nov 2022 06:33:14 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id w12-20020a05600c474c00b003b435c41103sm7551897wmo.0.2022.11.08.06.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Nov 2022 06:33:13 -0800 (PST)
Date:   Tue, 8 Nov 2022 15:33:11 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
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
Message-ID: <Y2popxNd2uIdXmlf@orome>
References: <20221103133900.1473855-1-thierry.reding@gmail.com>
 <20221103133900.1473855-3-thierry.reding@gmail.com>
 <20221107193035.GA1394942-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XQhP36MbZqgHuQxm"
Content-Disposition: inline
In-Reply-To: <20221107193035.GA1394942-robh@kernel.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--XQhP36MbZqgHuQxm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 07, 2022 at 01:30:35PM -0600, Rob Herring wrote:
> On Thu, Nov 03, 2022 at 02:38:57PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > DMA parent devices can define separate DMA busses via the "dma-ranges"
> > and "#address-cells" and "#size-cells" properties. If the DMA bus has
> > different cell counts than its parent, this can cause the translation
> > of DMA address to fails (e.g. truncation from 2 to 1 address cells).
>=20
> My assumption in this case was that the parent cell sizes should be=20
> increased to 2 cells. That tends to be what people want to do anyways=20
> (64-bit everywhere on 64-bit CPUs).
>=20
> > Avoid this by stopping to search for DMA parents when a parent without
> > a "dma-ranges" property is encountered. Also, since it is the DMA parent
> > that defines the DMA bus, use the bus' cell counts instead of its parent
> > cell counts.
>=20
> We treat no 'dma-ranges' as equivalent to 'dma-ranges;'. IIRC, the spec=
=20
> even says that because I hit that case.
>=20
> Is this going to work for 'dma-device' with something like this?:
>=20
>   bus@0 {
>     dma-ranges =3D <...>;
>     child-bus@... {
>       dma-device@... {
>       };
>     };
>   };
>=20
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> > Changes in v10:
> > - new patch to avoid address truncation when traversing a bus hierarchy
> >   with mismatching #address-cells properties
> >=20
> > Example from Tegra194 (redacted for clarity):
> >=20
> > 	reserved-memory {
> > 		#address-cells =3D <2>;
> > 		#size-cells =3D <2>;
> > 		ranges;
> >=20
> > 		framebuffer@0,0 {
> > 			compatible =3D "framebuffer";
> > 			reg =3D <0x2 0x57320000 0x0 0x00800000>;
> > 			iommu-addresses =3D <&dc0 0x2 0x57320000 0x0 0x00800000>;
> > 		};
> > 	};
> >=20
> > 	bus@0 {
> > 		/* truncation happens here */
> > 		#address-cells =3D <1>;
> > 		#size-cells =3D <1>;
> > 		ranges =3D <0x0 0x0 0x0 0x40000000>;
> >=20
> > 		mc: memory-controller@2c00000 {
> > 			#address-cells =3D <2>;
> > 			#size-cells =3D <2>;
>=20
> I think this is wrong. The parent should have more or equal number of=20
> cells.

I was half suspecting that. The reason why I hesitated is that I recall
having the opposite discussion a while ago when we were adding bus@0 to
64-bit Tegra devices. We had at some point (probably around Tegra114 or
Tegra124, 32-bit ARM chips that support LPAE) started to set #address-
cells =3D <2> precisely because the CPU could address more than 32-bit
addresses. We then did the same thing transitioning to 64-bit ARM. When
we then started discussing bus@0, someone (might have been you) had
argued that all these peripherals could be addressed with a single cell
so there'd be no need for #address-cells =3D <2>, so then we went with
that.

Reverting back to #address-cells =3D <2> is now going to cause quite a bit
of churn, but I guess if it's the right thing, so be it.

Another possible alternative would be to move the memory-controller node
=66rom the bus@0 to the top-level. Not sure if that's any better.

Thierry

--XQhP36MbZqgHuQxm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNqaKUACgkQ3SOs138+
s6HZSBAAvBeOQyuRlcZ0RmbGOjMoxgzqF3sYSXCBI3JqFs53jUcdo9g32jbHxjz4
RY+JTBgzaNUDHUbeG1zVI82D1GHrtWYClx+ZBJ3mzKYifZaaaTbdva2LxDgzlhUw
IYtSqwwuINxt1BLKCX6efJGmSNex390ePZFCYzQ1XRxVPKCdrm4p7ov0h2wNlCdJ
hkA6Lc/hxEhSwN/MixHN194uFrtFkYHBhEgkRnHaMejiDqhiMScuDBBgCd97w0vR
Smg2vFAsYxWWi792JmIl2eSAeMRHSMw4/oQw24NkU12iwkVpQbTq4aIqh67tQyXy
en57kI7NCTc1fyqvDDj2G2OROrQeaKDOiGdAbtERgHkMHPTcKtWA0egJJ7sCu8xU
SVyy/txkOfCel/sUn4MLOu5juVO63i+IXhDxJx6qWfsfyIswTn1JL8qAM2yHyLdI
LdvyTie5eKgSQiqsnaga1qld6HLZAtUQ7D7Z15RAiVplQ5IHs6vmHKiPp5PTRIGl
YTPydbPtoIrlaW42/ZjfQnYRuq3r/LI0+cuGFgiKyMPPkjzDBV+m4sjvumaJt+wb
fhMB0tbtsAPuCVxrIngSXSs0iUrkido7craqcCYvMFSKQ8c9HDgbHyf46uFJ4vJJ
/JatA1u9kp2SP7lkLG0Wdm/lxxlz5tJPffKCSgyarToKMnA83ag=
=pIsq
-----END PGP SIGNATURE-----

--XQhP36MbZqgHuQxm--
