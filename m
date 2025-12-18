Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65210312821
	for <linux-tegra@vger.kernel.org>; Thu, 18 Dec 2025 12:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766059248; cv=none; b=Vglkpoz2PAzz/1DigIMt0KvFGowYfPNY5Tw7XwNwL9HMngKLsLsZROm05jUX6rCg0V5i0l5N5TZj/6ueFBa+nRuB1aICS8j3Nh38Al1NFe8FIMmoEOyELmDyGph4ksDAeCwTmG7QspPaX1x+sgaou8pWA2Uee3Gh3KgiE1FpVTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766059248; c=relaxed/simple;
	bh=mUEp/B5G3RS+Gy2qoIOov6C4swK+1+u6ataDU59bCZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gIuuw0cF1THmFA71+c/xO9QCVwY0GsDkxNW6s7WKavBwgWUztT+sbibKjBcdpRPrZ+HNZzOvT9mGJfNeKqXK2WfMZodIHN2dk1Eh8hcTGW7bIS5FjsYHYAq7ipUDQ4sGb3TK7wDrM9k1pjMkDSaIQiiCPwc12iwx/gugPmoreOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eap71J94; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eap71J94"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-430ff148844so687858f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 18 Dec 2025 04:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766059245; x=1766664045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qo8UWl7Nb4OmN2ce/tkCHVKwnG2c1ZxIa3VYc8DeX0o=;
        b=eap71J94/KaWkEAbCXZDcSLBG7R7gxEsloMPqZtY+tsdWlEqX8Jxj3bMQcSXitfi+z
         uX4Rwrn30EmWL0ER2Rw8nLKYuG0MQZEjvRloVqajDaiVGpRJWZcpWzZgA1Gx0t1PN46w
         +PNvgKGJ4ov0/5CsCY9IXnqsZ+/PcHYejlnn5/O09Hu2KEuB42FgazZnwG9LSnE8O7ev
         I+YOvlf1Rb9ZDEGeWx3kfYrKk9atOJTy/KatpLEj1NvsXyvrJq7tOVH4+YmCYOhVCj2q
         39c0E8VQjoT/EfpiCL15nf2DZYIMdUQieZrOAfdUVSP57o+lJKFNkwir59GjS+donzKM
         E1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766059245; x=1766664045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qo8UWl7Nb4OmN2ce/tkCHVKwnG2c1ZxIa3VYc8DeX0o=;
        b=vKpWoLxOaJdxpQASl0IhbO/hS+AWbTGiBwdr7vUlC1SaWRP28jcuJsc4ou0vtabRc8
         WNqOFWgl35j4qo6NlI8naQcXMwws3d0bCk9d03P/TvzrQytCMMEpBaf0H6G+hFl4aNbv
         M0RQkpdFmq5CQyDggYtIB+ljbCoZ1T0NYfUmtGuFDcbgWEtbToGg5u9Sh+zv5QgjGfcj
         lTsxYZ7xsed0l9HYVhDThxJUCtEHkVjRJJprIzlInRQ0ulAV5hOeWXcn9De86MidZ8E7
         8P76v+u0Uj0UjJ2CSO5pfyaO6zqKMAHgUHLtNHYBE7UZ1ZgqnkuM9cVA6x+DAnrUJiH2
         6Prw==
X-Forwarded-Encrypted: i=1; AJvYcCXYpnxl2u0e+O5OUDPdQ5gTj2g1MiWumj7lOHKBNJHwAV3AEfw6hvdZvgJurBnM0t1l4+l/gDoErylCmA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDVyMmCwX7ZvP5DI1ZQxMPU0hyfe1UsvNtj84KtMjG25fxDn7b
	accKV18rj0ILomIWpsRumA+nm68qhDdvS3MaY/9UXno2JGZ6ZpD4UCRj3iFRGg==
X-Gm-Gg: AY/fxX5ZPLxqFHAqiIDut1+BwcM0IfafBZuhJs5zSfYuVWmueFFfiB3UWCpg653Xph4
	RI399kLny6mcVgnTAjfQoTSyDCR7Xe3RLaaxSuqL+hbsHo8URG9mnSPsJb9URXmEaqJNN04Ipqg
	KbBXQ04xdjuVAU9sqAIuvWEgXJSCFUGbR7agahk5K4H2GveROCy1mLnqjBKpkwgbgi2k39ulovy
	54fxohPT84rr1fYKew8sBjaeWTQXeQs/Ql1n6quMAf6OKuJ1RCxTev/gyWcmJEzDorDSgCUzEwQ
	/JraLdLMxT0C6Kf4O4T4G7Xry5Ldd57/36T3G4KMmTLT0MFMSq+7zp+1z9jlUFtVsk7x9l1uPKU
	xbS0BJbat/zPEYhobGqglmci8JOUr/VJBn1IotOIXq0FJH+Q7iTTxiv6M3BfK43APeHh7y+SK6b
	AE8DV5sVtxrInRtHixbRoBv70TmY1cp1iW02X3KOcRSD/RSLMvbu8baS2mWKHbV7GEzHriPYCvP
	g==
X-Google-Smtp-Source: AGHT+IE5M6ZuZzi1ubk7F7STia1y5L8LT6foat09zhyW64XZ39JP9w6RdvA+9FLun2Nwu/VBkpIYQw==
X-Received: by 2002:a5d:5f96:0:b0:430:fca5:7353 with SMTP id ffacd0b85a97d-432447a3dc1mr2689635f8f.8.1766059244348;
        Thu, 18 Dec 2025 04:00:44 -0800 (PST)
Received: from orome (p200300e41f07e000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f07:e000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43244934c29sm4674641f8f.2.2025.12.18.04.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 04:00:43 -0800 (PST)
Date: Thu, 18 Dec 2025 13:00:41 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH] Revert "arm64: tegra: Add interconnect properties for
 Tegra210"
Message-ID: <aUPsDeFmxAJ09Tk7@orome>
References: <20251217104744.184153-1-jonathanh@nvidia.com>
 <CALHNRZ8syS6F9W1ovw2Y-jkspQafCnLy0ynocn0sMLurShHnbA@mail.gmail.com>
 <CALHNRZ_vkw6Ns=PMa+x0SY64+Ov0FeA5tMKJr+-tY9_OasKUog@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tp7y7od5f2vxm4kw"
Content-Disposition: inline
In-Reply-To: <CALHNRZ_vkw6Ns=PMa+x0SY64+Ov0FeA5tMKJr+-tY9_OasKUog@mail.gmail.com>


--tp7y7od5f2vxm4kw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Revert "arm64: tegra: Add interconnect properties for
 Tegra210"
MIME-Version: 1.0

On Wed, Dec 17, 2025 at 02:42:58PM -0600, Aaron Kling wrote:
> On Wed, Dec 17, 2025 at 12:20=E2=80=AFPM Aaron Kling <webgeek1234@gmail.c=
om> wrote:
> >
> > On Wed, Dec 17, 2025 at 4:48=E2=80=AFAM Jon Hunter <jonathanh@nvidia.co=
m> wrote:
> > >
> > > Commit 59a42707a094 ("arm64: tegra: Add interconnect properties for
> > > Tegra210") populated interconnect properties for Tegra210 and this is
> > > preventing the Tegra DRM driver from probing successfully. The follow=
ing
> > > error is observed on boot ...
> > >
> > >  drm drm: failed to initialize 54240000.dc: -517
> > >
> > > For now revert this change, until a fix is available.
> > >
> > > Fixes: 59a42707a094 ("arm64: tegra: Add interconnect properties for T=
egra210")
> > > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> > > ---
> > >  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 24 ----------------------=
--
> > >  1 file changed, 24 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/bo=
ot/dts/nvidia/tegra210.dtsi
> > > index 709da31d5785..137aa8375257 100644
> > > --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> > > +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> > > @@ -202,19 +202,6 @@ dc@54200000 {
> > >
> > >                         nvidia,outputs =3D <&dsia &dsib &sor0 &sor1>;
> > >                         nvidia,head =3D <0>;
> > > -
> > > -                       interconnects =3D <&mc TEGRA210_MC_DISPLAY0A =
&emc>,
> > > -                                       <&mc TEGRA210_MC_DISPLAY0B &e=
mc>,
> > > -                                       <&mc TEGRA210_MC_DISPLAY0C &e=
mc>,
> > > -                                       <&mc TEGRA210_MC_DISPLAYHC &e=
mc>,
> > > -                                       <&mc TEGRA210_MC_DISPLAYD &em=
c>,
> > > -                                       <&mc TEGRA210_MC_DISPLAYT &em=
c>;
> > > -                       interconnect-names =3D "wina",
> > > -                                            "winb",
> > > -                                            "winc",
> > > -                                            "cursor",
> > > -                                            "wind",
> > > -                                            "wint";
> > >                 };
> > >
> > >                 dc@54240000 {
> > > @@ -230,15 +217,6 @@ dc@54240000 {
> > >
> > >                         nvidia,outputs =3D <&dsia &dsib &sor0 &sor1>;
> > >                         nvidia,head =3D <1>;
> > > -
> > > -                       interconnects =3D <&mc TEGRA210_MC_DISPLAY0AB=
 &emc>,
> > > -                                       <&mc TEGRA210_MC_DISPLAY0BB &=
emc>,
> > > -                                       <&mc TEGRA210_MC_DISPLAY0CB &=
emc>,
> > > -                                       <&mc TEGRA210_MC_DISPLAYHCB &=
emc>;
> > > -                       interconnect-names =3D "wina",
> > > -                                            "winb",
> > > -                                            "winc",
> > > -                                            "cursor";
> > >                 };
> > >
> > >                 dsia: dsi@54300000 {
> > > @@ -1052,7 +1030,6 @@ mc: memory-controller@70019000 {
> > >
> > >                 #iommu-cells =3D <1>;
> > >                 #reset-cells =3D <1>;
> > > -               #interconnect-cells =3D <1>;
> > >         };
> > >
> > >         emc: external-memory-controller@7001b000 {
> > > @@ -1066,7 +1043,6 @@ emc: external-memory-controller@7001b000 {
> > >                 nvidia,memory-controller =3D <&mc>;
> > >                 operating-points-v2 =3D <&emc_icc_dvfs_opp_table>;
> > >
> > > -               #interconnect-cells =3D <0>;
> > >                 #cooling-cells =3D <2>;
> > >         };
> > >
> > > --
> > > 2.43.0
> > >
> >
> > A little bit of documentation on this, should someone read the list to
> > see what happened. The original report of the failure is here [0] and
> > only occurred when the tegra210-emc driver fails to probe. After this
> > report, the related code change [1] to tegra210-emc which registers
> > the driver to icc was silently dropped from -next, but these dt
> > changes remained. So now these interconnect routes do cause tegra-drm
> > to universally fail on tegra210.
> >
> > Aaron
> >
> > [0] https://lore.kernel.org/all/56aed0ec-b104-4612-8901-3f6f95e0afab@nv=
idia.com/
> > [1] https://lore.kernel.org/all/20251027-t210-actmon-p2-v6-1-1c4bd227d6=
76@gmail.com/
>=20
> There may be another option here. I'm beginning to think there will
> not be any way to set the icc routes for the dc's while the emc driver
> can fail to probe. The next best thing looks to be just dropping the
> interconnect nodes from the dc nodes and leaving the rest of the
> original commit in place. Then reland the tegra210-emc driver change.
> This should put the no-emc case back to where it was, while allowing
> actmon to do its scaling when emc is available. And I will move to the
> dc icc routes to downstream dt's, where I tightly control that emc is
> available.
>=20
> Does this sound reasonable? If so, I will go stage the changes and
> verify that it works as intended.

Let's go with the revert for now, since that clearly documents where
things go wrong and it can be easily reapplied once the root cause has
been resolved.

It's a bit unfortunate that we don't have a way of making these
interconnect properties optional. If EMC fails to probe for whatever
reason, I think the assumption should be that it doesn't do any dynamic
scaling of the EMC frequency and hence the entire ICC stuff isn't needed
and should just be no-ops.

On the other hand, other than the patches getting reverted, there's
really no good reason for the EMC driver to fail to provide them, hence
I think once that's been restored we can apply this again and then that
should be the end of it.

Thierry

--tp7y7od5f2vxm4kw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlD7OkACgkQ3SOs138+
s6HxMQ//Xx7wnIEgJAk2Fk23Tg5mlEcRapx+MxmvhRHR1wOeStLCpPuZiJRBmICd
J0KJJC5Fi4FFqQSaSh+03BGfQ96dg9M/rX7xO7ca5QDED2jR9hnrZosixfcN8y9r
Cqs/cX7PLBcp+owBevlS9Pq8MZUtEIbVHiS75qITisqstpLDhUeoNMZQbatnV22T
r72nXwgFxeuRYdwyWajcQ5wteyY+B9krvlsgreIDDRqRnee8olfqZhNJULlRHmpc
ItNGoiXPpXIIJkusYbxrWR1V8LZUIlSXu+OA7Wj3nEJFk8Je08zLsd0JkkBFKFXX
O37qb3UcSU0pnOJXfGNkkVwR8q8iBMeFkSPMONgVboLNtH/3t4d+YdNTVonhLmPg
C2g++XMSKhD6vnCsRRXnXs4maYbTFF8/wWE/T6DUfq/SdN72Jeuf6iK03SSWiLlP
uPCv3DmanAdBBrBLODzvNgx153yKpWj104J+zzV285QxdKiKRk2+pCM4g7z+OTa3
W8UQmk+MKWgMx8XwF56+Pg8MGdNKck7/HrcUSu4hDSmoNokHdhQkueQICnRt4Kpr
Gq3MGlkAV8ihkvPNY2zu5v/K/vZQXgHq5siBGtSk1J3zwitCLI6S/7gbzcDmypVQ
piHsiTBAVZ8HbHrYXi7F87dY86quNJ5gjLfAv8daIKAl4SLUXVY=
=Fiyk
-----END PGP SIGNATURE-----

--tp7y7od5f2vxm4kw--
