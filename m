Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C8E518127;
	Tue, 13 Oct 2026 16:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908205; cv=none; b=dzejf7wPHQZlrc3MtNaZf6I+FU9oy/kV2kSLoIMp2kp+6dERBiP/8VzyirExmS158HnwyVx2+7aELQGXl3yfpcQidTf1tsI9QmKcBfbuyEE+qOBiLnc7MN0UdGTAf9W4LVDpljpsvgYuluyXdk0i/UvNfU7Jf7KnoejrQecC/Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908205; c=relaxed/simple;
	bh=qF4da8QJ2gSN8Es+QFMuqDlZutZcvU4LisdiboFkEeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DwkSfQvZ8Frrm7YF0uCpTM2XyX5tvCeRgge6rUdl4XWb54YFCySYz9LneJbRgRLwL8kk80uPF9kNRp8e/0j59nbssDeGTba4eRvZciPEMwF5rOFIUv2VSTwJhu4qgGx5T/N6J/Fcizg660tVtcDSJQwM7QVoMggZaG9GMUIDZUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a/54xN4j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a/54xN4j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E331F000FF;
	Tue, 13 Oct 2026 16:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791908204;
	bh=1i9DMKcX81xENBpQLvQoPm96RRF25NpHWeWqdoQKaBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a/54xN4jagNr9+SrzSqdQtIBLDdHjGeuSUKti5fmmf8eo4GeuvHEpIq20zUscfD6G
	 oBOYv+z71Ct8Tph5M7Va36865ZJDvkaeiDpnLtJxRXZEy3dnvJqb/5EisytS+WXkC/
	 qhUZN5f+A5QT3BJDQzvgc4bq/nEt1eYJa4cAXdEdTPfeh81CRISgarylk+EgzJoWZW
	 d9DAp/aEHRH5BdZeRxqGEUiAzufFUf/GO11mX9sQ7x9Q5Qe31MaeTdwc6yq7RnGWTC
	 QJSE78V0x/vNsmOOOtSGTAInkfPFR61Md3lAqtmnWklkvhS/cJzxk/8n1j+SgiYdqo
	 EbDNcSb/WE6uQ==
Date: Tue, 13 Oct 2026 18:16:41 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ion Agorria <ion@agorria.com>, Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 0/9] ARM: tegra: lg-x3: Add newly supported devices
 and fixes
Message-ID: <as5XpdpNm4cRGNcj@orome>
References: <20261004154456.145362-1-clamor95@gmail.com>
 <CAPVz0n1HOWAXMwfeCBV76Z+N+6mgynXW5GeMebnqYQubNDqpOw@mail.gmail.com>
 <CAPVz0n2SmOY3Cw2HpnpYd8eFXw7B=2mjP6LMhKCu5niN=KnOQg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yqks2mjgun77nul3"
Content-Disposition: inline
In-Reply-To: <CAPVz0n2SmOY3Cw2HpnpYd8eFXw7B=2mjP6LMhKCu5niN=KnOQg@mail.gmail.com>


--yqks2mjgun77nul3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/9] ARM: tegra: lg-x3: Add newly supported devices
 and fixes
MIME-Version: 1.0

On Mon, Oct 12, 2026 at 01:56:48PM +0300, Svyatoslav Ryhel wrote:
> =D0=BF=D0=BD, 12 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 13=
:55 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > =D0=BD=D0=B4, 4 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 1=
8:45 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > Add nodes for recently supported device (ALS, LED controllers, haptic=
s)
> > > along with minor tweaks and fixups.
> > >
> > > ---
> > > Changes in v2:
> > > - added USB configuration update commit
> > > - added p895 power LED trigger update commit
> > > ---
> > >
> > > Svyatoslav Ryhel (9):
> > >   ARM: tegra: lg-x3: Adjust WiFi node
> > >   ARM: tegra: lg-x3: Remove pinctrl-* properties duplication
> > >   ARM: tegra: lg-x3: Lower supported suspend mode
> > >   ARM: tegra: lg-x3: Add light sensor node
> > >   ARM: tegra: lg-x3: Add flash LEDs controller node
> > >   ARM: tegra: lg-x3: Add haptic engine node
> > >   ARM: tegra: lg-x3: Add backlight LED controller node
> > >   ARM: tegra: lg-x3: Update USB configuration
> > >   ARM: tegra: p895: Update power LED trigger
> > >
> > >  arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts |   5 +-
> > >  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts |   7 +-
> > >  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi  | 125 +++++++++++++++++=
+-
> > >  3 files changed, 127 insertions(+), 10 deletions(-)
> > >
> > > --
> > > 2.53.0
> > >
> >
> > Hello Thierry!
> > May you please pick this patch set if you are ok with it?
> > Thank you!
>=20
> Oh, you already did. Apologies!

I picked up version 1. This v2 came in too late. Pull requests go out
before -rc6, which in this case was v7.3-rc6, released on October 4.

Looks like only the last two patches were added in v2, with no other
changes to the other patches, so I can pick up the last two after the
merge window closes. If you don't hear from me after the first week
after v7.4-rc1, you may want to resend the last two patches again.

Thierry

--yqks2mjgun77nul3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrOWWkACgkQ3SOs138+
s6FYdg/+MN5bB8FUDaQ+MIVgPPqZYiTkBxRyGDxfyXQJLMlWl8M881yE64ALHtmE
P2YpyR70EUhBhsqjaahftoJVF14Gu0i3Vpd1rtl73CrwzyZaw6lSrrb7H6kn2J1x
tf/u1qejGzdoLrc4ShCyR9VBuO3ki71hWVBWHZgdI9YgM8tuiGszMuM8jfsvSCuB
zMwNSkS9BvHadkRYH5dgP31G1OStHnGvKScBBBnIIgeiNJkFdM+r1Edb0y33C4XK
o5Bt3M4G1RC+OPX2XubUBq8fp5lTwlKZIlXy9oQPudcU9ZyM1KBievLSBOBIdLDP
pTC+rFf70nRoPvG6JC2DIjHAIGmsGUtMy0yjzhbY39BrexTV6CjNaHSkHYK8Ir2l
wqsvrpWXMrW0lAyjCk5kYOv3b0tJ+4vfjv1KaTWnBcdDdWFvYpcRdPx674I9G8px
Zz/2QiPkPbiOKDptSYagmXp+lyY1Nk431gEjAYCCDBqnDA/YZipOhHd74fPvwTvF
lGXIo6u3xFp9G94X5yYWcV69H1m7RLsylYRVPwkGtb0HZn5LohFLlVdmt1uEiSMj
9yRaeF9X2RglzNITOBmajOpGR0NbLSgwwHRlXwIvlpthqHg3HKDn8YOH6s4db/JZ
tgTbFdO8WY4leXn4leoI4fdKWvY/c8UwlxwLeV2FdcCW202tZuY=
=XjX1
-----END PGP SIGNATURE-----

--yqks2mjgun77nul3--
