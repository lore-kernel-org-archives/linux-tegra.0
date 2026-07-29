Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C9544781C
	for <linux-tegra@vger.kernel.org>; Wed, 29 Jul 2026 12:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785327020; cv=pass; b=gIv2CiywcdQVXIRUA+ilJ1e94CW8CX3j2hxK2Lfp0MMNt2/i6Td9i6ffwgyDvYLoyU+q4vD/6Doc8EDJcL1paFqVklxg/Kcn1UPLqr2AffWMPPlBDngGMTdX/hqMeqy8Ll3GSBMwj9JdLPetq1HxzKJVoVzAAbTF6yxY8EjDjoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785327020; c=relaxed/simple;
	bh=XUGcCmIhNgHPxGmy+I7u5lQ5TeoD2906Q7Yn3cntuVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VOKeAVCaY2qPQuXjUTINK6o7xTx2VNPzziVRPnTurXHr3m1NLv1LiPVZMdXEQzW3AZTK/YSvPBRA//+E950P8zHRWC3PkJTvgHOGP+HRjk4BUrmgovXWH5rWCQDqLZcJZbY3xNOKv5PfrsgDjG6bha9cfS4ipxSgsuCHt9sYDPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMwh0tpJ; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMwh0tpJ"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ceae1ed204so11155585ad.0
        for <linux-tegra@vger.kernel.org>; Wed, 29 Jul 2026 05:10:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785327018; cv=none;
        d=google.com; s=arc-20260327;
        b=czHmnGQYq+EvA+LFM6LlZ9uyioZgf41jrVIUz/pPhKTDJ0pr6ZSy10f0QZeJ0eYSik
         Wlog8fyujhLHGKzOdNSTFQtHsQLEQRXNfL/fLflBJRG8pbxYXOO2Dq80MnU8WEMSHkP3
         dZs+IFfNUkv8JJfpUGgh44DjInR84TOGisxBdfsWLEMjVb2gGN5wXs6O8mEbGuLAR1do
         vSJwD7fClG3+nV7AdXnI4uA/7Pk/LTxk0yxayaOcP37+QdQBwK6psSUZVvmBz5GkTSou
         NgR3gxjSL77gCS77thyqvrqlnM+oCN0BcrTrMBRtmkc2D5DuG6gsv+n9RzBLjJO5vSSI
         PsrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P1fFeqBdTSvS5DElnkKPCOeQbS6PZaEvevS5BkPtZxk=;
        fh=UCPDtwtt+li6/i0k1q7dEZOZvT6RSOsZl+Z0WHFsD0c=;
        b=Ld2iV1P+sv5U9nWbJukb7lHzYEnnRwuPJsq5ac8SxOyNCzkLWRFHmOUZdvw+nhaTXz
         TgNJFwO8VTScw1WaRKC9zG6I3RIGT3cqmlpjIgFjyU2Onl5jlrtGHCl98iiIQPpCu2ZC
         A5ycT7oKgFmAkJxzyc2JrjWzSTiwk4C+DijlAh8UXBBkOAmEFtPFyg0D2gu/HAt0+vdr
         CJ/QYduscVeLdCDGNKbgsylgnbfxqKNDSxvf1xJ0NCQVqrBAOuBVT4wYw0H5N1zDRMyR
         s2dXnYVyZk75aJRDCoyyWkeiikJlUiWFJljMwmViH1CMV+ilK/O++ulZ2ZBBhjk5tefg
         aX0w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785327018; x=1785931818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P1fFeqBdTSvS5DElnkKPCOeQbS6PZaEvevS5BkPtZxk=;
        b=aMwh0tpJa3U/0aoxIuNXIoGVjNkcuvdDjAux7VBymPqmLh2GNGhjlnKy6NbbfxTICR
         DCooYcoOrMik7M0HTTpfNYRY2SfbjLf77cF2mtqIQOhYZwM+Z+2PqXQYILkiXacMqjRT
         9Pv7hkqmqTZwp21Q/1yvCo7fnPvTql1LmmrK9hkJvA+yfVJa7NTJyrIIReL6H1GpymRX
         DYphkxT0f64xbZZg6TXbrJuPYzW+CntwcIkzu9OZRFCDsM4BT7n0fxqE4fvlfXpw7ez+
         m/Ohg/boCtn+Zd4J9aTkWQ6c7nY0WRMz3GYyQvXL5U+qr2R5tSQ6bF8bEt0E5o3S+umf
         oV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327018; x=1785931818;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1fFeqBdTSvS5DElnkKPCOeQbS6PZaEvevS5BkPtZxk=;
        b=lJX0pdfCcDNlitthM0O08nG4hxSuVWCzNpHGP211lBkaC92ORbID0k44aTatmt5i8G
         VbCBEFTLZ6SerU5iiHu8Ss4L77V0AYVqQcFLg+nAbG/1UcrQudorhki+/9VIud5Kf/uX
         Obrmt15aFHzYmCHqQYK1YJWOdiMmf/nIpvA834VTl+foyu3TBtLNPQaRx6BANiCgDfWp
         WMTbmI4H/b8SHxOysz5t70RNouSs56Jf+LgK1KE3fYAjO/MssDzdbmIB3ZZEAmBrg83o
         hfViCJ1pBjWRYwDndHH9Hf3AOVnxq8+/kcM7a/XJ4H0cmmweKYSgHKxgC81hKvmIhqpd
         CCtg==
X-Forwarded-Encrypted: i=1; AHgh+RoODUqwNqPj+ZLyjm2BoCcVz/onjHDz55hYCDuvKqAx/romx/Y7vGzfkpbcgQMbJVCDq8IxKWlBTAvhcQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwI1deAJ1afh7ncReLQMsI/h1Gaaqa70/KgP8XQ5xIBJj4qh7kF
	sAinclu6gjEAx9alW4fAXILnqukvCGdYhVExSr82Uzh28PiCHWWalew/abPAx+EzCWWOGf/bkdB
	tZDkNWxABMcBt1PCCBINFp0qkzmagLrg=
X-Gm-Gg: AR+sD10ehz0uSZVAlxQs5sKONrSb+jjmxSPVo8iIaLnmVNp7xicIa7SlOxrQapg4nqc
	S+pPGBcUHCXJnwANzWTpOnW55Qw9IoiwQaMSMZHP4RAO2GvKeaLW+jesrARPGxsQcwXKfOOtRL5
	OdamjR53mPZfiyzX3cDPfMrVmBNCZ/2AZTwiAZasoOuHrT6Vy0UndlOwikrjLmGheUcwY7DtMK5
	lZ7OnP4QP1i2ZFj/4vcq+8PADt+YeFOPmeI+fmswB3UbexRuP5GjKkJO4j27dUYwrR8B5y1852Z
	iLz4ulLgkMbqlaRjFidPxd0CONZ380UYFy/crY7UiQwnx57HAZ97r/dc02QxTu9HXgWDRC6c6CE
	Rew==
X-Received: by 2002:a17:90b:2747:b0:37f:9ce1:735e with SMTP id
 98e67ed59e1d1-38f6a57fb65mr6732166a91.31.1785327018081; Wed, 29 Jul 2026
 05:10:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721101059.451699-1-clamor95@gmail.com> <20260721101059.451699-8-clamor95@gmail.com>
 <AHCWpU8lS5mcA3Do5U45Xw@nvidia.com> <CAPVz0n2AOJ_rcsCEhVQWUq1fXtd7kXkE9yScY1VwGyZefz50Uw@mail.gmail.com>
 <amnVVwVoZ7NnclWQ@orome>
In-Reply-To: <amnVVwVoZ7NnclWQ@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 29 Jul 2026 15:10:06 +0300
X-Gm-Features: AUfX_mzZGmZZSlJ542WOtleodu7fRHFeQqx0BLso3-8iZXD4OCqbnM_3YWVcmek
Message-ID: <CAPVz0n0T_U1UiN8FMe-efOmRJWRxcStn9qa4GAENv6ETotk_xA@mail.gmail.com>
Subject: Re: [PATCH v2 07/10] ARM: tegra: tf701t: Fix BCM43341 WiFi/BT chip configuration
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D1=80, 29 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 13:27 Thie=
rry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Jul 28, 2026 at 05:08:40PM +0300, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 28 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 15:13 =
Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Tuesday, July 21, 2026 7:10=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > > Drop reset GPIO from bluetooth part. Add lpo clock to both WiFi and
> > > > bluetooth nodes. Add 'brcm,bcm43340-fmac' as primary compatible and
> > > > 'brcm,bcm4329-fmac' remains as fallback.
> > > >
> > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > > ---
> > > >  arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 13 ++++++++---=
--
> > > >  1 file changed, 8 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/ar=
ch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> > > > index 3de5c84d5f009..b71a02b3fd86f 100644
> > > > --- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> > > > +++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> > > > @@ -1300,8 +1300,9 @@ bluetooth {
> > > >                       compatible =3D "brcm,bcm4334-bt";
> > > >                       max-speed =3D <4000000>;
> > > >
> > > > -                     clocks =3D <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
> > > > -                     clock-names =3D "txco";
> > > > +                     clocks =3D <&tegra_pmc TEGRA_PMC_CLK_BLINK>,
> > > > +                              <&palmas_clk32k>;
> > > > +                     clock-names =3D "txco", "lpo";
> > > >
> > > >                       interrupt-parent =3D <&gpio>;
> > > >                       interrupts =3D <TEGRA_GPIO(U, 6) IRQ_TYPE_EDG=
E_RISING>;
> > > > @@ -1309,7 +1310,6 @@ bluetooth {
> > > >
> > > >                       device-wakeup-gpios =3D <&gpio TEGRA_GPIO(EE,=
 1) GPIO_ACTIVE_HIGH>;
> > > >                       shutdown-gpios =3D <&gpio TEGRA_GPIO(Q, 7) GP=
IO_ACTIVE_HIGH>;
> > > > -                     reset-gpios =3D <&gpio TEGRA_GPIO(Q, 6) GPIO_=
ACTIVE_LOW>;
> > >
> > > I'd appreciate a note in the commit message on why this is dropped.
> > >
> >
> > It does not comply schema for "brcm,bcm4334-bt", further testing with
> > this reset gpio removed confirmed that it has nothing to do with
> > bluetooth and bluetooth works just fine without it.
>
> Maybe this should be a separate patch to make it obvious that this fixes
> a DTB validation issue. At the very least the commit message should say
> that this drop the reset GPIO because it's not part of the binding.
>

To be clear, I did not refuse to add note into commit message as Mikko
asked, I have just explained why this change was added.

I have included rese-gpio removal here since it logically can be
grouper with other manipulations with the bt/wifi chip binding. I
would like to avoid inflating patchset since it is already a big
series and tweaks to binding are small but significant. I will expand
commit descriptions for each change included but if you insist on
splitting this commit, I am perfectly fine with this too. Please let
me know.

> Thierry
