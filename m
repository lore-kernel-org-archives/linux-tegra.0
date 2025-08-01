Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE061F4181;
	Fri,  1 Aug 2025 09:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754041284; cv=none; b=fITNYnWJYajCyBX/Wh77hFkGoNIqLTZ/C5oAqrPPXMkl98WSQc2pRG9tsMBeCcdT4E0UiabVkDonNj6n7S/w2WP0G7pQeg+5VDjCz11rD1NQXRvQ3YXBdpOIE81dKj9RYyUslRB56z2VSmLgei8jKLJtkcdljJ5pqsC782xWXg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754041284; c=relaxed/simple;
	bh=1XRQTmBVY/C8lvd630rQY+Pi7ol9kgViSh8ZUn9QFV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IyJd3Nwi24JQ0XDVf6FkXp2lfJ7Yjg9SvxAZgqGDeLWxMmWSf3w1j0tumMo5I4rHIG1HhFTJpqn0CJICILP9Zmkg+5tZIgs24VTGc0wV34DA4g6vuR71tTmisBS6NCYRJuBV+0bEaC1E65evVRQI93AXzI5qAond0Lf79Gv8c6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LD0hKx7U; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LD0hKx7U"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-458aee6e86aso2614385e9.3;
        Fri, 01 Aug 2025 02:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754041279; x=1754646079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ZxZ7CnxaolLUHvjE5pPI+1OJP0c0lW+5ryeS5aMQz4=;
        b=LD0hKx7UjyvScGNX4+dpxyw/TsobB8j/Nkt/T+Yf1YJuRMOoN2UFEE63Pvwfqj6Bfk
         WONwMS9PQ69WpgGUfi3v3HPMYerm0RH886w7+Xp3QQXke+kU+Sj9sxcZyBRVLXd1VN09
         dnuMth28f4/KDs0WlExEHKrj4R/kFmpmtOo8FCt/IlidthsLUdPA0zKPrviETH/UiE7f
         rusBmDn6+5AfyeEW3g6MTTcIImL1i4VS7/O8PeJjIJsl1qLP9sLVsemQUdo4LFE6ibT5
         NAEZDHRnT6mPZmCbZDFQeiVUmptLHYdfXzRk7+EzVfy4K6scHMwUI2he7fDUKU0btHWU
         H/rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754041279; x=1754646079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZxZ7CnxaolLUHvjE5pPI+1OJP0c0lW+5ryeS5aMQz4=;
        b=hSY/xttDKQ+JVZcL77yXgkHxlYn081QpRy3fY63N0dA7IMbBZtUgwFlktmCp627l36
         Q32AF5gVbeg4Lk4c9fp17NzWUrivL4eB/D9RvwOZpTvD+d1vf4YPLD0tLn3KeH4VLYEE
         S565rfAlv4JDZxqnNfnewooFk5o196co4n9WXV+aNTCRQ8R2PxwGQ4BgBdP1ilOSndA/
         6EllP0aPi1yxVkDA/+jOjSWA/OXHnfkg6S2yPW/MwoltkuNJbGH+BBE8qYLdbc5otBTU
         WCnzK2ap3nHrPnm4NJ/LdWgzDIyQL/zyVAtM3V161BxnWqaVpzM1B1DKL/tuUInJaR9d
         LtBA==
X-Forwarded-Encrypted: i=1; AJvYcCVepLRearmu0pps5TNqu2FV2cFIShvtkr5dFwNd41ntqo1p8YuBOcAyEI3kqziqL2SYQ84F8LA/JtvwWkDz@vger.kernel.org, AJvYcCVuRKF45axIs2nBUji7xIPuLJkF+i5h2h+QBEHE1fBWYSztAat4Ob/aIU2fAfKiAgHygmf+PfE6NK5QnGg=@vger.kernel.org, AJvYcCXb0uoXKI4lxOvboCTwhVVJhkvvKNGtc6F9p+JLgqz+tZf6ufcIebrsRaWb3N4AXCNrMO/LFkuUbIwi@vger.kernel.org
X-Gm-Message-State: AOJu0YxK6WB7nVoeays0Ncx5OXqNq2HO/UFWAuLepn+32ZVKPDHsszR/
	CEEtSj03DhFHKFPxai+eFbJC98OJkPtc63A4lVBjoYXP62/hqx1ihTQL
X-Gm-Gg: ASbGncudASgZcpPriUi5FmITjrDTWlnaPiC6z3cp55YgWnaCWblyxgCKFoxCu3xRz0m
	08X5/3ZA/Fx0UrU+Mq4+NakDwmbwe2tF5PXpZPqAKm7/BalSg/SWeJitGzF5L/ESeBBHVfIWtNv
	G2UJHKKJ4pnoogvETJAyvRBhK5B+VIJpjNlHYCLXp0npnsnZ1ghRxrowb6y3Y5A6QMJ/a4iS0mt
	9b5U5KNUm8hbI9+9MFSG/ccfnTxl/Fmaart1+jjC7jSBLeK8LUX0tM4TlZB6B+DG2nG96xxGGBZ
	8xMrWf4nlZHOPF07bNzupqG1d7L1WLE9TZnh1Dj8JOwEDdXIbpD2SKETyQIIqW51+LumzHx9ZZ7
	2Lm/rF3Cc3hGniduL42uVh3AyySMxlH9nShvraAmlOFOULGTAsLQMZFKaMAvsEPIaLyfjf3mjQh
	EBZucX70rr
X-Google-Smtp-Source: AGHT+IH8hpcjl7UFWSZGS2Va0A4Uh7FqNKkY6Wd6XewUEATvRMrndnXnTx+8lOJnsWwrCeG6sdUEpA==
X-Received: by 2002:a05:600c:1c8f:b0:458:a7b6:c683 with SMTP id 5b1f17b1804b1-458a7b6c904mr33871205e9.1.1754041279395;
        Fri, 01 Aug 2025 02:41:19 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953e9b1csm93456635e9.22.2025.08.01.02.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 02:41:18 -0700 (PDT)
Date: Fri, 1 Aug 2025 11:41:16 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Set usb micro-b port to otg mode on P3450
Message-ID: <iiooyryqjbfutvyycrk4wxgkhow42bnks7ndkkqy2zujv47bly@2f3sgagl6yte>
References: <20250526-p3450-otg-v1-1-acb80ca2dc63@gmail.com>
 <CALHNRZ-pE4EA=x-7LuJev60=aOwGt2eDf9mGVHWJ8SPGisBchg@mail.gmail.com>
 <CALHNRZ_W6gQknMr=eKEcB6-k5HBBkE6JfJ9LFntX9L+NTo5hUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="43nnu2n5b25ewkps"
Content-Disposition: inline
In-Reply-To: <CALHNRZ_W6gQknMr=eKEcB6-k5HBBkE6JfJ9LFntX9L+NTo5hUQ@mail.gmail.com>


--43nnu2n5b25ewkps
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: tegra: Set usb micro-b port to otg mode on P3450
MIME-Version: 1.0

On Thu, Jul 31, 2025 at 04:40:05PM -0500, Aaron Kling wrote:
> On Mon, Jun 30, 2025 at 2:35=E2=80=AFPM Aaron Kling <webgeek1234@gmail.co=
m> wrote:
> >
> > On Mon, May 26, 2025 at 8:22=E2=80=AFPM Aaron Kling via B4 Relay
> > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > >
> > > From: Aaron Kling <webgeek1234@gmail.com>
> > >
> > > The usb micro-b port on p3450 is capable of otg and doesn't need
> > > hardcoded to peripheral. No other supported tegra device is set up li=
ke
> > > this, so align for consistency.
> > >
> > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arc=
h/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> > > index 0ecdd7243b2eb1abba9adbe9a404b226c29b85ef..019484a271c396edc3020=
0e8592c713455a8e1a4 100644
> > > --- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> > > +++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> > > @@ -514,7 +514,7 @@ pcie-6 {
> > >                 ports {
> > >                         usb2-0 {
> > >                                 status =3D "okay";
> > > -                               mode =3D "peripheral";
> > > +                               mode =3D "otg";
> > >                                 usb-role-switch;
> > >
> > >                                 vbus-supply =3D <&vdd_5v0_usb>;
> > >
> > > ---
> > > base-commit: 405e6c37c89ef0df2bfc7a988820a3df22dacb1b
> > > change-id: 20250513-p3450-otg-b947f31843d8
> > >
> > > Best regards,
> > > --
> > > Aaron Kling <webgeek1234@gmail.com>
> >
> > Friendly reminder about this patch.
>=20
> Re-reminder about this patch.

Sorry for missing this earlier. We're in the middle of the merge window
now, so I can't apply this to a tree that feeds into linux-next, but I
will pick it up once the merge window closes.

Thanks,
Thierry

--43nnu2n5b25ewkps
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmiMi7wACgkQ3SOs138+
s6HWig//VmfQsEITzheWm2JTTGjtYvL4GQQCsDbtn00LFKYm6NuDD1z5KsKeAfB5
gtYiAKoTyHBQCAPA/CRFVVYjdwrTfGY0qISikZrzDpTSxpQRNb4o849Ge1NxHBPW
j0zy0+gqZWbnrYNV1WdOibnB0GhT5FliHdB4kioRO9CD4K6rT0EtOAI/XXkqGqPr
Cg+RqK4XlOX5giOyEehBiVGNATRG0oU/NX2+fMP0Hf2+NXXBkqF83s4odEu5saEV
FI6cnTwjDFxmhqlpKv+N3g5/4IssQfBOMztTd0z1/zq0ylZVLoUOUi44h/NsFP1w
erjDkrcNjFHjPCsH8A3th4plcwoDG2VOTworMw4lZ1F1WQgovbyA16DWf8y9ELQU
0aJp3DBV+k4sDS/pgejQKW+Qhz24mlrxzIzY7ZnA6fez4F5+vwYT63ehbZXDR7jA
vU3ALNkbfG5pj3QhiVyxLIA4alr4aqThOiwT9Ao9LdMc8Ct3KkIiKbIK0FQJ4JgE
BJuhZ+KhfcSnV1aAEB3xzc+H3esNTkDMDDrwcaVbVXCPqSxyNlhxM9P6BdqlvXrL
bJI8HVTfbrFtCbgmoibF0LbejPv6YBENQIfSKy4ZCVhfvuMr3mN6zL4jLueaJUip
6wITp/wf0SI0aSiApiOIkE1et8/PDiGUw5Pe8C9hC8qLHmUfsbM=
=F434
-----END PGP SIGNATURE-----

--43nnu2n5b25ewkps--
