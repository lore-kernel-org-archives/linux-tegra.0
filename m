Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317BE2E8B6C
	for <linux-tegra@vger.kernel.org>; Fri, 12 Sep 2025 10:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757672905; cv=none; b=HBvpjp7QHzY/CnGsKThGIaWuSiQa5CDRbG4us3EV8Y5vxd0IafLIHdBKhighg1dlMya7CTzBsvgrp2tm9kBh3568BdDhzbESj8Wl5dzI2os34kz6hxFhboDgE04bLkj4b24LVD0x7FfPZXyvqLXSZ+e2dkgMY28OpIdf/gAzXd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757672905; c=relaxed/simple;
	bh=EBD8IpI6A0wAsbVRfB4i9rlCjO4G0tJXxd7ni7KvAx0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Erg1J0e9ED4bpyOMrslDfjW8RxLbE+41EZPSalw82gpLXtAmmAGmzeCn/bXZgw83hykROpkBNWeNJMcDqLxNnFkdRs9C+EgHoGvp2xYegr7C1lEzwLu69k0km4BDGpBUaS6uAEQq0svcba9UeBY+YFSc7XnNZyNa3ZM4mmjY6TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i31HVHOG; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i31HVHOG"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45dfb8e986aso18056875e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 12 Sep 2025 03:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757672902; x=1758277702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JA1IUMCbOH/Rs2R4k6eNlR5l2tk1K0Ele5rCkcSibNU=;
        b=i31HVHOG+qiCsjTxKfAtyKpyk1qeBGSRqDqMwmYqFDBa8ciMMR0or+gMPviXHF81pt
         ZHSNk4CZM9J53PwdbJ1c7TkYTSCl/eQyt2CllOb8KMpWAB8KNy1eOWsrMOETj9x0ZcxH
         3V6DtG1+EWUc7eKbJoEJqFNXbUUYWlDkaLI0MkNCfeKFX6wlMue8W6clzBjPLaJWBQOo
         8cswCJm9MNqfMWP4i4C+FH488NOuBWyj9tiNa4k+SI3T/+JoYYsvIK+7IePor6FFkyqr
         wU4cJUJUBlOYHevTy8p9HsL6QLu8OWvwnEhX5Y0N8gl6vM6/jtuzdNLO7EInFZxkNZge
         opow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757672902; x=1758277702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JA1IUMCbOH/Rs2R4k6eNlR5l2tk1K0Ele5rCkcSibNU=;
        b=iwNNzFbCvM5OAAvHN3WnbLKA9Y8/irs0XR2fc09LfNWLZFmiUUB/7s/RkYS8ko5jUj
         fCD9htPqQ4CpA4gTKrGdv0Zh4qVl8XXy0NlNURhrccOyFiAImyqWuz5i+K2x2n6moS2F
         ZUjmYAi5BkQCRNdxk0YA2g9qxKxlxWOiP/wjYABYQG3IITdRWfkWp9Dwr4YseP9bzXKn
         CcYneK+gr2uOWpzMGEVuEVGGa6r4Fi5XpBr6ijPS1mtBQtcco6yXXFDSWOQOLCTaz8Ea
         ywx9hZoJFTiwV+QSyXHaUK12DgEehTfBDoWqcr0AsQLSlOKoy3e0sJTK3axS/ysKW+cp
         qvDw==
X-Forwarded-Encrypted: i=1; AJvYcCXAwFyR7LAZlLfoqjWf4KGgy2Ms+psijo1EqkTtuFn8gwWbE8fvb8U/vMqtTuyF93ISBtLge0OnScTLPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgWwnsYkWl36aa92oiLTkD4AqQLDmQNwH+P3HX2tRzSNsgZod2
	6fr6CrAlFmjVM/K64Ri9PGLVctCXwwsKePC4x93Qh/B1MKdVUyeqzbmaZ/o95w==
X-Gm-Gg: ASbGncvx3JPNqTneGFDBHAu8Q5AjrdLGoRfzt6EEMW7l/RwJFqU63S/SMFzKOOEby0s
	qQRphxuMz2GprW3CqBwhBGsjmqTRTeytMNNwxfeFSTcnZ8m9sX/ny+4uWJ7NHiHuIdxCi5Lawdw
	3EKfbyK9h1fvxK5+lmRwig4l2zMNT+CEuDOSGWQ/iv73QmV4vGHeGA0huzaVPXkoieqX+9Bk8Xu
	L2k+STQnQsTg0D1mWaZBgfVoCFbpk5tkBy/pG6kA1Ps8jMaRc8NBPK1vlWpc4nca23+1LSQMrjO
	chRrn4CmsdZJyrXRvEOayhdx3sMeJBUzGufdN0CC8JMgQFyjVrbwa6elucPgk68TF3F3k1E6z8j
	9b/at7GTdUgOP3SYCLnOtFIVloZbFJPBXb9gVl/TwaLl4wQUeEO2BABqCaI776Bp+LVajLo5tl1
	oWcsh0d+jS/PEg37+NyTk=
X-Google-Smtp-Source: AGHT+IF4AEGaMMn/CUIZmhYMMaPgBH8SYmjhY2GIRnf93okgdn9S+OTIILcyErnNpIWu0CDXM/Slfg==
X-Received: by 2002:a05:6000:3109:b0:3e6:116a:8fe1 with SMTP id ffacd0b85a97d-3e765a16066mr2111938f8f.61.1757672902386;
        Fri, 12 Sep 2025 03:28:22 -0700 (PDT)
Received: from orome (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607d7b67sm6041450f8f.49.2025.09.12.03.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 03:28:21 -0700 (PDT)
Date: Fri, 12 Sep 2025 12:28:19 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Ion Agorria <ion@agorria.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] ARM: tegra: add device-tree for Xiaomi Mi Pad
 (A0101)
Message-ID: <cj5vagef2b6nga7vrfk5ulall3zbnlftekguqn4iydu6ow2zam@ucoqrk2e4pg7>
References: <20250909074958.92704-1-clamor95@gmail.com>
 <20250909074958.92704-3-clamor95@gmail.com>
 <2tmlhaymx73frvv3qv7qvaagzwvh3cepringiyvhsmqrdgfy5i@fvspt74y6nj7>
 <CAPVz0n0WjOaBrn=stpwjhT-fZ-K7_YQHDUnuKUccZaqLJGXJ-A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mahnu5no6cnokx6g"
Content-Disposition: inline
In-Reply-To: <CAPVz0n0WjOaBrn=stpwjhT-fZ-K7_YQHDUnuKUccZaqLJGXJ-A@mail.gmail.com>


--mahnu5no6cnokx6g
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 2/2] ARM: tegra: add device-tree for Xiaomi Mi Pad
 (A0101)
MIME-Version: 1.0

On Thu, Sep 11, 2025 at 07:20:51PM +0300, Svyatoslav Ryhel wrote:
> =D1=87=D1=82, 11 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 19:00 Th=
ierry Reding <thierry.reding@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Tue, Sep 09, 2025 at 10:49:58AM +0300, Svyatoslav Ryhel wrote:
> > [...]
> > > diff --git a/arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dts b/arc=
h/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dts
> > [...]
> > > +     host1x@50000000 {
> > > +             dsia: dsi@54300000 {
> > > +                     status =3D "okay";
> > > +
> > > +                     avdd-dsi-csi-supply =3D <&avdd_dsi_csi>;
> > > +                     nvidia,ganged-mode =3D <&dsib>;
> > > +
> > > +                     panel@0 {
> > > +                             compatible =3D "sharp,lq079l1sx01";
> > > +                             reg =3D <0>;
> >
> > Looks like there are no bindings for this panel and I don't see any
> > patches anywhere that add them. Am I looking in the wrong places?
> >
>=20
> It seems that there are no archive yet with panel patch, this is a
> schema part from patchwork
> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/2025090907=
3831.91881-2-clamor95@gmail.com/
>=20
> I would ask you to NOT pick the tree commit yet, I have a few
> improvements for it and would like to send v2. Meanwhile, bindings
> related with this tree should be approved.

Alright, I'll just merge patch 1 for now.

Thierry

--mahnu5no6cnokx6g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjD9cMACgkQ3SOs138+
s6HcYA//fFhnevw+HejFG5AQMygj1lfdsYEaYVqqZpwPo/PmuwghOBAx/0p/8Hpf
LwmLxnw+NL9pPsnMBxWEGLJ2GKKEaFhEhB/gxDc+yBHeFG9filV+Id7pWGqu9sgv
j2J8Rff/m+b66oCYTcgniAoA9H7iX/qINpegc4PZW6Igi/Tcv7A9Az7kVT4ewJqv
IB93bhzn7M1jVjeOvkNHwBcM3D9jv7Z58XWSt6hDGbvltAJmHw3YMZtIg+YeYo/a
Ga76QVmuZw8RpX7qIEUTDojFSEyV7sQSlQ1nli53OhQGQAaEzTh0JH+L/OLN0LUK
X/PjX2PbVkNMt2fPKiHGtclPyo7HVQ/WwLqrTXS41SkZ4hs2BcfV6C3zzjObxSvp
9EQIOojvp88cDO4+ZwhOkhD5FgPl4TYX40XPsQwS9tWfJk+42FQG+Sw9mVTUkdwa
uccs7o7NmSDhPwAfoab653BQ4b6540LIa48R+IKn5n49gvnlCG8NTsGLwyC6LeZZ
doROR9LbaTectrXEzhvCLzS1yxv9Zg6zUwGXndVFfGrmA/0aTuf++hcX6WqQJM4t
chCeOjVu/a4vQl4BCgoO+qUZxzthArITUq61buTMhv8n923TAvC/BkUrvad74ZqV
t4avlQTng2WtWgKMjisM2jjiWUD24eGRSArTSEKfTZ05Yb3R2eg=
=0NYn
-----END PGP SIGNATURE-----

--mahnu5no6cnokx6g--
