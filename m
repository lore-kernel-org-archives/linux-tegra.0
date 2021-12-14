Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A4DBC433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 14 Dec 2021 12:27:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbhLNM1X (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 14 Dec 2021 07:27:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231744AbhLNM1W (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 14 Dec 2021 07:27:22 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 668EAC061574;
        Tue, 14 Dec 2021 04:27:22 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id y196so14100084wmc.3;
        Tue, 14 Dec 2021 04:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZIy3eMyBqeXqHP83n6OPJhM8LixWxcXpGTnFY4ZJyD8=;
        b=iMdqJz7LSK/upP5GtSbKnGHVAX+bLk97tk7EIuezdXjc+Cep4ebU0b6+UX6pFASmKG
         nfKfmrBZJ2V3W839/ID5wgmJg8NEfFucs7pJg4cqK+ndbnCo1gb/IQrIYBwVFLnRHRMe
         68x8OHSOuLUPEZzUOv1cKz+Fsx2/6AghG1pDw10/L6+7Nh2+yC9BxBbPvrQfq3dOGsfT
         VHFZnLloBCG6+ZRQILO5C3pMnpQ7AhqD3AgLdHqQ4X35tHE4GGOijEQU/kErWCQ40veH
         rORwJ51QDX1cadf0MLC7BWXP4yDC+8M4RLyF1MTYT/8diKArmZJVRbRwCeMnHfssQUDJ
         oBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZIy3eMyBqeXqHP83n6OPJhM8LixWxcXpGTnFY4ZJyD8=;
        b=xXV3hxR0YEFL5vU/CXb3ylgWD/ocyGFfz2uqIJaM0I582jVaR5mCyn9wR4NOJ7H5zW
         z5BX2HVKcc6uGw2bwR5ckJPu2zcC2+TiGGHt/xU1FlUV+S2kx+Q/WAmAjJ3OKhcm9meB
         8DK+q/0jf75phZJlRZJ5XktX9ZQZnHcaeghnHPJX4Jsh4Ce7Le+yvEpjepjH5FSmu/fr
         npXIAjarXNRvuZTwHNxTiaKY+T1S7o8SKfG9a7DKRn95plyykhcLexZHodK9lBfYxj0Z
         tUKdBvf8Z+0/Vgu/Yo1OqXw0LvqGdQ8XAKBYqgtREyZFI1IXQmZNz4G/PJsvIZdm/whN
         ytxA==
X-Gm-Message-State: AOAM533YEQPlLbgHzY8AyKCC/w1maZk2DQ+sF1jJPTUaEPnmAh3s+sD2
        EZ+SZHsYTVcW4EfzloWOC3bOYGmTA5z48w==
X-Google-Smtp-Source: ABdhPJzG44AWetJvuWAc1qo8jclLDLTAuga/ePse2KYQ9mF+KH4PjQ2cfBritEK0FrGXLu0huWfYEA==
X-Received: by 2002:a7b:c85a:: with SMTP id c26mr46813580wml.23.1639484840866;
        Tue, 14 Dec 2021 04:27:20 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id 10sm17590938wrb.75.2021.12.14.04.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 04:27:19 -0800 (PST)
Date:   Tue, 14 Dec 2021 13:27:16 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Rob Herring <robh@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-tegra@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Will Deacon <will@kernel.org>
Subject: Re: [PATCH 2/2] arm64: tegra: Describe Tegra234 CPU hierarchy
Message-ID: <YbiNpJP53FV2rksq@orome>
References: <20211112131904.3683428-1-thierry.reding@gmail.com>
 <20211112131904.3683428-2-thierry.reding@gmail.com>
 <YaVAxNiU2O7kWXoQ@robh.at.kernel.org>
 <8ea071d7-a8ff-813a-6268-7445dbbf0c1a@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AypUwBlYQnwhP8aV"
Content-Disposition: inline
In-Reply-To: <8ea071d7-a8ff-813a-6268-7445dbbf0c1a@arm.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--AypUwBlYQnwhP8aV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 29, 2021 at 10:53:37PM +0000, Robin Murphy wrote:
> On 2021-11-29 21:06, Rob Herring wrote:
> > On Fri, Nov 12, 2021 at 02:19:04PM +0100, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > >=20
> > > The NVIDIA Tegra234 SoC has 3 clusters of 4 Cortex-A78AE CPU cores ea=
ch,
> > > for a total of 12 CPUs. Each CPU has 64 KiB instruction and data cach=
es
> > > with each cluster having an additional 256 KiB unified L2 cache and a=
 2
> > > MiB L3 cache.
> > >=20
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > >   arch/arm64/boot/dts/nvidia/tegra234.dtsi | 365 ++++++++++++++++++++=
++-
> > >   1 file changed, 363 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/bo=
ot/dts/nvidia/tegra234.dtsi
> > > index 104e5fdd5f8a..db24f48edc9f 100644
> > > --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> > > +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> > > @@ -736,12 +736,373 @@ cpus {
> > >   		#address-cells =3D <1>;
> > >   		#size-cells =3D <0>;
> > > -		cpu@0 {
> > > +		cpu0_0: cpu@0 {
> > > +			compatible =3D "arm,cortex-a78";
> > >   			device_type =3D "cpu";
> > > -			reg =3D <0x000>;
> > > +			reg =3D <0x00000>;
> > >   			enable-method =3D "psci";
> > > +
> >=20
> > > +			i-cache-size =3D <65536>;
> > > +			i-cache-line-size =3D <64>;
> > > +			i-cache-sets =3D <256>;
> > > +			d-cache-size =3D <65536>;
> > > +			d-cache-line-size =3D <64>;
> > > +			d-cache-sets =3D <256>;
> >=20
> > Isn't all this discoverable?
>=20
> No. The required parameters for cache maintenance by set/way are
> discoverable from the CTR, and if you're particularly lucky they might ev=
en
> happen to reflect the underlying physical cache structures, but there's
> absolutely no guarantee of that, and there definitely exist cases where t=
hey
> don't.
>=20
> [...]
> > > +	pmu {
> > > +		compatible =3D "arm,armv8-pmuv3";
>=20
> Oh, I'd missed this - per the current state of things, we should really h=
ave
> a proper compatible for the PMU as well.

Good catch! I've changed this to arm,cortex-a78-pmu since that's what
Tegra234 has.

Thanks,
Thierry

--AypUwBlYQnwhP8aV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG4jZsACgkQ3SOs138+
s6HLJg//fPKVApYNnvABcRB8xyCdGn5UGt9LO273ZgF//H5j4I6iLJC1vvqoU7Pm
zFbI8+DLUuQwBFQEaG3KNA1H5Xwpx9lwzKed3lGqTYpISgEGSMSV8JuutvlBNLZH
U7nHwJ8Xft/QsyEKlKo/umUtUAdXjVt767wqVFN6u8e6cnU1RxYKvEFVvnxqpvK7
Yncu7nbh88IFNQufgNVEk1ipqkzkVGffBAuQ4foDtNLQKDD/guLBaXywMuH/AxwW
Fs1xj5hx/9vGodOZA2oTuXflO/1F+cCy34n55cF3g7I5AFCCSE5aJV52phwT5JIF
puU15yfo2ICVCeJ/MZa2s+CqeZx/OZ1jDar8Pr6gpXAxNmObzfByGOxMzRX5ZkWc
G2u8QPp/rizf6OqIam95HQYya6FX75vJ+wbq0zHAUBes/NJTA+uIoBklYHZpfsFw
ESnQYbfW1fZTA4U5hm172QJnU7NtbCo6uaW0dBfGwtRWRriLoGzzvmYj34sTYoBt
lERSPaIxXwoFu6RVxqAId2FS63pR5ECt++a3Y9ykCUVUFQAv9bbiuGy+/XK/674O
c7fWISvrRQLMB+CBb2Wbr+Z/0ou5viCevzoBpIAsd0gXHlxiRy6eDY7vQ6E9FFI0
B+ihmew9kJ6A+o2tiUYDXh0WCgYdnJ5HGBiabd3N6mh1N5Ni67s=
=RU7n
-----END PGP SIGNATURE-----

--AypUwBlYQnwhP8aV--
