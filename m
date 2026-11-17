Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919235;
	b=mKCsO47mTk8nEEXvVNZuDK6hINxLu52NDc6mcypX2K4zhq2YNoHEV6FDHlldNaAXGsHu
	 cILEfYqDZsF6fL7wi7zZwj+TT0DAX6QN527FO1kHL7INttZmd96D6N5gne0ILt8xDqhVs
	 nlM1JRIb3C30OVeFjSUjOUvMDpI9IHzrDrLy3HiUOxLQ56/mtvzMIclDiDXan1/gsoHVF
	 WqHrFBkE0sMR592xvqSXcB/hiI9cTlsqc0JCGdtgKKkLtJ2WdjAdOkF7waKUKev6miXTS
	 sJSsDvSeuWSkcN4XarvTOP1Hc3XKkFFh/oENQi7YMDAiDhTvCLcDFQ4XQbELt5YNamA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919235;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=PpZGP+PvnlnE+Ru0bvBoaiq99U2o1zAEk1IJID0atSs=;
	b=S/gD0cJKAo+ObYbexEgNng3Naj0QenvVye4Lgkbxe3YPQPYbYuYaD1BxQKURnKWrHssg
	 7WRYHONvrz3Xv7YsKyiZsvVzWAK2sDaAN2NLwmx+QT5RCZ83xt3LWAZqOVwY/0pPj7hcx
	 CtFtO3qCBuYuoLYA4TwVTrgNV4gRnAr/ceQbhbU9HRaPWIrn7ZPKmdP4sCTrxeXqUumG8
	 QbCMpBLFqdzvTrEN7rQseyawgle0D91+fkgZWR1Qj+pwzwuQnHZkbkkWBvNWTwflQScNW
	 zdwR1CJ41NN5lmGEhRWpAUElzkmsZlSGSDHBtpzDvejqoA6CyCCr4/p1No4+gcE4xyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kiNDRQHs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C69606A323;
	Tue, 17 Nov 2026 12:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kiNDRQHs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53CFA1F0034C;
	Tue, 17 Nov 2026 12:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794919234;
	bh=PpZGP+PvnlnE+Ru0bvBoaiq99U2o1zAEk1IJID0atSs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kiNDRQHs2N82WZA4WJqrgAs5Syi1bAJxsxR++ZWl/fOOMauVcvy5bIGSPAbkLg//t
	 47htGszwuCHckq72O+Jau+C6bWRi2r92L0uzQbQ4oQECauSFY6bwgDuog70J5pkeIt
	 YR5HLTH6ZXIUBRIWuk8h65TUW/eC59jE+oxpowOgayoNcjYSB2eQnBuAEpuxaWVucH
	 +mQFrucdbvencXYvD+EOkLDpeuCHwP7N+Nb0oGfkwx/CiG45vttsBxC6uvE1dO8Rf6
	 EEvZXmpv5mXffCkCr7ejVMXcM9xiK7O2EWs8KX8NFlTKr20z4tuITlSs8HKxIjBMUG
	 mEMxngTerw/cA==
Date: Tue, 17 Nov 2026 13:40:32 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jordan Viknar <jordanviknar@gmail.com>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: usb: Move Tegra-specific Chipidea
 USB properties into a dedicated schema
Message-ID: <avxHzF-uiOAhwXIW@orome>
References: <20261004165204.205660-1-clamor95@gmail.com>
 <20261004165204.205660-2-clamor95@gmail.com>
 <20261026222928.GA15139-robh@kernel.org>
 <CAPVz0n2rkWikz1CZhkKiZnX5P+NdDH0RfJi69AyVTEV7qw_VXg@mail.gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="46d2lau2pfpmds64"
Content-Disposition: inline
In-Reply-To: <CAPVz0n2rkWikz1CZhkKiZnX5P+NdDH0RfJi69AyVTEV7qw_VXg@mail.gmail.com>


--46d2lau2pfpmds64
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/2] dt-bindings: usb: Move Tegra-specific Chipidea
 USB properties into a dedicated schema
MIME-Version: 1.0

On Tue, Oct 27, 2026 at 10:51:52AM +0200, Svyatoslav Ryhel wrote:
> =D0=B2=D1=82, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 00=
:29 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Sun, Oct 04, 2026 at 07:52:03PM +0300, Svyatoslav Ryhel wrote:
> > > Move all Tegra-specific Chipidea devices and their properties into a
> > > dedicated schema file, by analogy with i.MX.
> >
> > I don't really see the point given it is only 2 deprecated properties.
> > Maybe those can be removed? Depends if they are deprecated and still
> > used or deprecated and removed from .dts files years ago.
> >
>=20
> The ci-hdrc-usb2.yaml schema contains properties that are not
> applicable to Tegra, and conversely, Tegra-specific properties are not
> applicable to qcom, nxp, nuvoton, etc.
>=20
> The 'nvidia,needs-double-reset' property is required for Tegra20 and
> Tegra30, and it is still actively in use, as you can see here [1]. Its
> marked deprecated state appears to be incorrect, as it should simply
> be restricted to Tegra20 and Tegra30.

For what it's worth, I looked into this a little bit to find out why
this is only needed on USB1, whereas USB2 and USB3 don't seem to be
affected. Turns out that USB1 is a different controller than USB2 and
USB3 and it has this errata. In retrospect it would've been more correct
to assign a different compatible string for it and derive the quirks
=66rom that, but given the ABI stability it's probably not worth
correcting it at this point.

Thierry

--46d2lau2pfpmds64
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmr8Sz0ACgkQ3SOs138+
s6H2JxAAqetcrbKWLmI72r57SUOoEE1aRxGYZ3oG0t7oJ3lG2vYEuRqDddePjWG2
VWJ441BBY4at5Ib0utYLB5zK+3yVJecPCxv1FwxBf8hyGMzlAgeWQkUXze0OkcSF
c6Z+wVO3arETFnincediCilM8XsvNcMM/T/vDO7dFb6qigOG5qnsOAFQeNLRBA1p
aygcSyTnR5CEzwly48u97Xlqjizur1QSYUxyNzPCenote01yFb9/yhw8QKK7IRIu
jLVF+lKN9HqkAOLTzLiZ6SgC14cUwgG3abyVAmbbXu6KaMRNagEy29UYcFr47vhI
ffIN5ZcM5SHmM2jIT0CZU6JF5GopNoByUYVWwYZvBM9Mq3qbYcDPmCwOSmSuVhed
NyEdaGIGBIjw6LKzHZhfc/kjwNCJNkHWFEBHrtsf2A5aKbeogDVHGThSZx8/1/Yy
1Dz6LF18AyzdyZdwyw2tDgEBGhHBEdcO9X+lhTmybZeqtzqZ8T+BnYui8UdvaUVN
UaYdFyDn72Scni7Ybtv/2wIqeLmYTu1Nez6ypznJf/8h6VX+CDvEtvRhpqGPMx42
CSjmuWJ+0/aJ5LRT2k1ndGbjWiLodnfFHBUdgGhFclyb1xqrMec70IXBOZy/Y0xZ
DyL4KhBQrL0AK+hHLEpasWdWNU+boFRwyTOvC4zRG9a9s/Cyz18=
=TFe/
-----END PGP SIGNATURE-----

--46d2lau2pfpmds64--
