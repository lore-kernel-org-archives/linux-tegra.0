Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB98023C8DE;
	Fri,  7 Feb 2025 16:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738946155; cv=none; b=EfjW8BQJ0UZbey/IlPr/gmn63UhN9Yvjf8Jjl+dnOg+WRouYB2vNxYuE8/G1J4uNsG3CVVLddsnC1AatD2jMz+kH7jlIpsxW+pc1wWYMyBCEyIoV+HZJodMrSgrP/YJ5Igv+EPGzNNNNgSehVSWeu35Zj9qY7ESBlPGI8kJm7cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738946155; c=relaxed/simple;
	bh=//nZQwkdU1+y2l4cBsQ5JgSv8QnejMAqZKzsgUynbRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7azXut5Ky7HKxcpI89SLnhfg53ILvAY5e9m7p2A+tU9Hw7Os8QX6fsv6V2X32/+pCNZvKCLnHxWaUYjSyUUHviN7ovbmv73sFkXpYray0baSGn7L9+ky3nQK0A2sfoS0ui8X+b0y6BHRIGspW+T6EULu+E1M4PtttQgp8GKlTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HA/VfIY5; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HA/VfIY5"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38dc73cc5acso765277f8f.0;
        Fri, 07 Feb 2025 08:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738946152; x=1739550952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Wrw0i7lsnio0oCK+ZvPDr+K1av57Z8LyXPGKLV3ic1g=;
        b=HA/VfIY59oRHjT/8Ww6o4tjOXtPV2JeBmgIsQaX8XUBqhO/Rj4HzMsLwO3swD/Edju
         kRnJtTRagzlb42EnQ24VSA6LukNHQaIIX/5gfHmlwWR4mVk3dViFoV+UTmtZLIOcWrDc
         qAl/UwjDJjRGfDQl+qjcC4nn1nrt8dkJHD1a0YTw3EuayibM/JvDpvKWdgLbkpfEL0v9
         ATk5Vig90qCJNFoYbfK8WtvFUc/yQSX8IS8pKtqzvWhzRmxi2Yhd7W2xOjHQdZTtyhpA
         gbAxk6UU9ibGWi7p4RYLaHEt0v3jn5g5LNj+FCGMefVwruteqK71qgUAKyy0naxMvCWB
         FTxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738946152; x=1739550952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wrw0i7lsnio0oCK+ZvPDr+K1av57Z8LyXPGKLV3ic1g=;
        b=bdfmW5m/9Tc8TRQjjfxObHvtLdtkFuTIt8BfyZPyyKTGtz9aVYvj60R0x+RAKv9hij
         ZTfY6PUMsnKdFVEYngwCJ6hhaB/QaP5lNsykq4ozR2+F4tod65iARMkISVhjzlIg0XmL
         n6sykYCdowAbLehj23yxgGM2x5EjM/v9RtkwB1wVrTgUVl2cYxTpqQot0NdiM+/DrRhg
         4kGH6+0BpN1jqBPOnYefaqkT+rpJUpANaSt6CItTjec4aT38qHWTIOkuy3X670GEUlKs
         3pLUSUsV883i8Bn0P49BZ5KwIxkfrwtYW20anL5UDJmtSheMWHsIHhP+5Te0lauDfC7h
         beiQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCC0Ld6Y1q+YfIIaO/S0sguLK2YlJutxvtXSZUHcMpdZV5+BDa2+5CmSYFVLwgRVcfJaX3QaMLDW1d@vger.kernel.org, AJvYcCWm6BgndxBbhPtBGf4TlFZZ2fF9S2if4zI7kwaVHzajz1/H2CA5cw5INnFNPSeZboxFFef1V/f+dqeAVuI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCU3fVKBsWkGbSot9CwjDGIZQBmjL3MZy1ruVHfYCFJPcPdkaO
	I5DYUOgVshNv0bOIGfjpGqDC6+BgDt5AZwjj+UJKqQT6kDMbUnHkH8wGYg==
X-Gm-Gg: ASbGncuNNOuco3u2k0mC4RjUmDj82OMMDby9/G3uLzN8OpXPWvKxcSTPvE9VncFK7ru
	VKIDQVDreYVZ0187Eh7uK/3Rn8Qs4ohMfSbX490aX28SSgHln9yty7ZeRK9bZTZLLwwR7IbGF0m
	/rhltOomNrDYXuiExUCtRSztcNnTMcDN+rP6zexSzFLFvsxi+biQ4Ay3l4gL6h2ALGQltvcgzGE
	PRslEyF0Z6tj+UcnGIQ0ezAIvdLVd3DTjTrwtbCjt522bvpM4bLEpTM7D2ZsT8MT/P/5yq3h+y0
	4oZy562FQSqvFk3DnmbMUbwzbgPiER+vV3QYD11y9PwVI0w6WFdtcuHqzn2Ph4BKtp0IC0KmQAV
	wyg==
X-Google-Smtp-Source: AGHT+IFyn011teCsSvE3ZGbf0kF2dTpezCFR7S6ix7/knAhDMX/+ZIivlUKg3quzahiuC0GBURlFng==
X-Received: by 2002:a05:6000:1889:b0:38b:f4e6:21aa with SMTP id ffacd0b85a97d-38dc99095a5mr2662438f8f.5.1738946151634;
        Fri, 07 Feb 2025 08:35:51 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc5e6f027sm3237597f8f.4.2025.02.07.08.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:35:49 -0800 (PST)
Date: Fri, 7 Feb 2025 17:35:47 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Ivy Huang <yijuh@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Brad Griffis <bgriffis@nvidia.com>, Haotien Hsu <haotienh@nvidia.com>, Henry Lin <henryl@nvidia.com>, 
	Wayne Chang <waynec@nvidia.com>
Subject: Re: [PATCH] arm64: tegra: Enable Tegra234 USB remote wakeup
Message-ID: <rg4lej6k2gs37htskpormtfozswladcqnb6wgo5ft3ttdib6xz@fl7n37fte7fm>
References: <20250206222731.3691073-1-yijuh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qnz6ckqqz6xykkz2"
Content-Disposition: inline
In-Reply-To: <20250206222731.3691073-1-yijuh@nvidia.com>


--qnz6ckqqz6xykkz2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: tegra: Enable Tegra234 USB remote wakeup
MIME-Version: 1.0

On Thu, Feb 06, 2025 at 10:27:31PM +0000, Ivy Huang wrote:
> From: Haotien Hsu <haotienh@nvidia.com>
>=20
> Populate the USB wake-up interrupts for Tegra234 to enable
> the USB device to wake the system up from low power modes.
>=20
> Signed-off-by: Henry Lin <henryl@nvidia.com>
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Haotien Hsu <haotienh@nvidia.com>
> Signed-off-by: Ivy Huang <yijuh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra234.dtsi
> index 2601b43b2d8c..bbd5f7c2bf03 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -3254,8 +3254,22 @@
>  			      <0x0 0x03650000 0x0 0x10000>;
>  			reg-names =3D "hcd", "fpci", "bar2";
> =20
> -			interrupts =3D <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
> -				     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupts-extended =3D <&gic GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&gic GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pmc 76 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pmc 77 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pmc 78 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pmc 79 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pmc 80 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pmc 81 IRQ_TYPE_LEVEL_HIGH>,
> +					      <&pmc 82 IRQ_TYPE_LEVEL_HIGH>;
> +			/*
> +			 * wake0, wake1, wake2 are for USB3.0 ports
> +			 * wake3, wake4, wake5, wake6 are for USB2.0 ports
> +			 */
> +			interrupt-names =3D "xhci", "mbox",
> +				  "wake0", "wake1", "wake2", "wake3",
> +				  "wake4", "wake5", "wake6";

This needs a bindings update because both of these properties aren't
currently allowed. Also, do we need additional handling in the driver to
make the wake events work, or does this work automatically?

At the very least I think we would also need a patch to add the
corresponding wake events to the PMC driver, otherwise these are
probably not going to do anything.

Thierry

--qnz6ckqqz6xykkz2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmemNmAACgkQ3SOs138+
s6FLSQ/+IOvhTOrfOmFHTUnK8+wgOO2J4qq8fTm1zPVe12gEdodz1NGLxrQ9W9ru
p4eb05rQ8yDitNnyf7/A4B8PNxO5y0Qim3rVi2qd4zb1CK1O0ObTP94fgzpekVp+
86EMqHgLspXcxfgaGXTuf1aCIcnxYgXkNLDoHMhc/woAWBwzuVlAa3w+/9nZpBji
Y6TgvFNX4eRhn5pTdCVJ3gPHUQ6mZnWyUSt9S5WJef/gu0L1fhnSinsBN+h+AaZu
tPpM8LXp27a1GRtYw51T/Smx6bDEwKNkq1tB8LYhL5CrY7bUIjpguGayicaXJjK7
/kG6Hp21iA7EjR3Ik+A6EyKF/U+YeqHWIWhvAOgMTVI5Yl86wScJw7kEa+WxUO/e
qNkhcsKbPBkCGtyQ926wzWa78Ugvp0aammyukBnVIrXpEY+Z1rueOASuv8+74YeJ
CRnhiy3Tjr7pZ9gVkc8koTeYTBRUq7kAje2pXmKZDTwSz51ZRlc4DiPoyo3PN4np
2rD2fuV9ZRnux3MluhNld4FJCn4/pIS9D+kNLhdf4DSkzTR2VxLlMM887iUQXPlx
Tv8G93MvlKdQvjRZbt75Btsb7cHVVbOkaM57Vpu19+md89Ul4Zvc++UdMYYLqr4i
nEtXMfvTZAq/JhVh/rtE4bVrZ7KP3KjMtbM6ALKaDcSXcPmc2T0=
=O1WI
-----END PGP SIGNATURE-----

--qnz6ckqqz6xykkz2--
