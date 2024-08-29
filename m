Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2850F1B252F;
	Thu, 29 Aug 2024 15:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724945278; cv=none; b=FZ0yJWQj/B/PUfqJffOzjcTttLEuXqaczRA4BgIfhsi7hMEFKIn58htsGok8eMVWssT5M0T6SxizrcfzDT1pRbiJy5IhGe2fH5Q9UtP80tuZS1Aa43OKWgkkoay3n16Pwwu1A+GgO53YnzlpvBTODOAL9lngWMAWQIzouXzOFxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724945278; c=relaxed/simple;
	bh=rEHcCrksPK4zKuna47RL6KHvDgrL7S+K+JPsxR4F8NY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YIO4LzOBxDDnt92aw+8tvzY0iJTQxuKa18faPoSJmm+AAyNrL+nDeblTSCgAWUzkNQhngEI7G6k2bARZMT6i4GiUnjHTWhoTMnq4XU543WSy+aUidtnBb/9udYtAjdzbNs8e3QgyksLhyJv8pAzN71N0/SUFKZRW4znFyaUYexw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXSVpX5I; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXSVpX5I"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-371ba7e46easo566728f8f.0;
        Thu, 29 Aug 2024 08:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724945275; x=1725550075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yw07to4eXEKZD8HOhtMMTh+5t396wUm62mYRHx0re1s=;
        b=kXSVpX5IC1Hi6XjLNLmqjkGDU+/0fF7A1USW9oDe//Q0Xqp7poLumUlMcoLkBa17Lu
         RtOXCAmPfUlOBSMwebmwTxd7ddw2HGovQgf+7aMJFagGiNAXjqj9ezcLgZe9D9aNVnBJ
         xEWp7Fw9D95VUedPFkT9dnWTW78hucW25XD0smpQkud+vWXvo6vWxgGMFmxJNouNIJ8O
         kkF4B/TYuznH4S0CkWZ7FMeg7o9SqgkFTuuIg3Cuw5pmNIhZRUvvC+HzCzqBkcPPZnko
         15qyM/zJMi7KvMavIr9NM2kK5Pcn7v9GTjfUc+CiwWXPTI+Ce4Y4C8qaQggewCDvK0eW
         +ZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724945275; x=1725550075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yw07to4eXEKZD8HOhtMMTh+5t396wUm62mYRHx0re1s=;
        b=OVBgXZTBM8/Cm4Y7g8cbf8yFYdSAD6MSSVVXhoIlm29WnB6Vg0sFRIDa41xN7aBMxd
         FI6OTb8Guf5Kl7vX/DrqbH5HmNeD3Dhl0RY0hnmr9VWAVoSLulS31jq+ryxKaZ2GgWex
         nXZUROJT5ujs0fcb20a0EexTUJt8bB40yX9fAQCx2Ul9d7D13RaqQiuECsOtSeqOCmF1
         mlPjrAbsaz+PXf87OYphAZyhfI4Gk/N6uV494fKVJzbVjEGv0NCipD7xmi+fO+Y8LwBv
         slHaCPLIkEC+WJSmRTiZEpjAYoxZ17Woc7c0iwMsHuL2qfWnPGCKiGmlZhQgA9F3R7qy
         Tcxw==
X-Forwarded-Encrypted: i=1; AJvYcCUgP5/oHDTDY0DPPHAIHDYy+U/loboXVQqWoZnt3O/a4S36haVJUr7lTkCfOvswrCMulPNFTHld5F8A@vger.kernel.org, AJvYcCUq3NTBbo3osZvrOvZaRRN/5PW1zcA1KLc+of6UNNPGtFDMMPFxo+eDbke/V4GpwAIEOccv7VF5cPBc0TX6@vger.kernel.org, AJvYcCVp44RJHGTyYwCR2f6OsOXMMJCP3de+OUTWFiQ4mhgcnLf7wzyUEkAIjRen4SXTyrj25OAK+wqEzktNK3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJJK3Lh22Up6ky8zxwOrj3YIorT6TRqVnKOBVVZTx0UXKG7mkg
	Nhxv/VpwnDrOpxtTngQFwa/0FHPaOP0J733/Rj+RRc57XzPgDXs9
X-Google-Smtp-Source: AGHT+IFcl7nunAt6M7i70ObiC4pL46x8FG3FLkfqKTXOy0/JlSrM/nqJVzGHMedlJBUQqrlMwbEqwA==
X-Received: by 2002:a05:6000:1a47:b0:367:95e6:158a with SMTP id ffacd0b85a97d-3749b58e42bmr1828448f8f.63.1724945274756;
        Thu, 29 Aug 2024 08:27:54 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba641db90sm54631535e9.38.2024.08.29.08.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 08:27:54 -0700 (PDT)
Date: Thu, 29 Aug 2024 17:27:52 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 05/11] ARM: nvidia: tf701t: add Bluetooth node
Message-ID: <iyoa64mxxi47azcvv6fuljsyjlhv3ltf5gajc4yts3uryye2na@mbhnyt2es7xt>
References: <20240806123906.161218-1-clamor95@gmail.com>
 <20240806123906.161218-6-clamor95@gmail.com>
 <9dda725f-71f6-4f64-87a7-f7151fa1690c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3rum6blmlkk6aglf"
Content-Disposition: inline
In-Reply-To: <9dda725f-71f6-4f64-87a7-f7151fa1690c@linaro.org>


--3rum6blmlkk6aglf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 06, 2024 at 03:33:58PM GMT, Krzysztof Kozlowski wrote:
> On 06/08/2024 14:39, Svyatoslav Ryhel wrote:
> > Add serial node along with bluetooth node to ASUS TF701T device-tree.
> >=20
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 28 ++++++++++++++++++-
> >  1 file changed, 27 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/a=
rm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> > index fe1772250a85..00c3325878b9 100644
> > --- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> > +++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
> > @@ -1111,7 +1111,33 @@ serial@70006040 {
> >  	};
> > =20
> >  	serial@70006200 {
> > -		/* Bluetooth */
> > +		compatible =3D "nvidia,tegra114-hsuart", "nvidia,tegra30-hsuart";
>=20
> Why do you override compatible? Boards do not come with different SoCs,
> do they?

Just to clarify this: it's not being overridden because the SoC is
different but because for Bluetooth we need to enable the high-speed
UART mode of these devices, as opposed to the standard UART mode used
for regular serial ports.

Thierry

--3rum6blmlkk6aglf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbQk3gACgkQ3SOs138+
s6FuPQ//c/8ii3SnqqB380okkfXtCNYL+zu5HZ1I+KoymGdDHx4VSJiiP1CIf0j6
XeSttYEv7qvpb8fkZMKXq+1hC0l7T+FcQ2NbXRlb/0UDlBWDg4Bw6+6g6FIBW3Nm
ODFeUk0CajTNqAzQWl7HpYyPpncur2+HZiCpvG5fyA89NVJMawoIweKp266T4NA8
YnRdRDMsFhfCX/lWW/RA8t5SL4OKEF3ZZt5EcerdNeAWh5Ik/pvIhDe7r0Bn+0ea
e6FISn495+IWfh4D5bbb7HyVDjayDqT0AYOajqaGfFDVVy504oZoooyIYS5rJ1Qi
ou9SAbvKFMHoOLS0JEKfRBU2G4FzmcSDyS5XQzVKtZEfUAxouWRP/ePEQAz5UFNK
YaXOtdRayXPzqNc5wMTLV0Tjlamy6dzn7M2bgRQL3tJStsAQ5vODYsakVhiVB5on
eggAdqvt0ATxHJJGSqdKsJV1FShqIybT2sY0GGi0T1ybq6SudymSOMauYHECHJ8l
NBhgLsAA+Ied3M8EYa8Rp7AGHaNG1G2YCLu5Yi+uIZ9zkVfK2wSmhrs5hGQlq1SR
og6hM72OC82XWjY8R47KiDdEWdV2XLJhEYfWsBzH1O9w6IbutlNVfJu3fQNvSVzr
6bMTfNPqeNvxPPdiLS3scn+WTuVfnSLX7RUeQSxMAjPiEiKyvIM=
=M//d
-----END PGP SIGNATURE-----

--3rum6blmlkk6aglf--
