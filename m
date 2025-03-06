Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2993525C6E6;
	Thu,  6 Mar 2025 17:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741283651; cv=none; b=KSmAfXfSrvJzT7nppZU2UkUGGM8RXWUuXTCNBeQzsh4EflSKf30+V3DTRu7sC8VK/2hm9mTAfpx6LuZkaw4IKeGryaweg60y0AbNu7joXnrUsc4m/9x8bcSpAo8ZbLPwZ4laGvmwN6VZ9fjwzRJ1niBk/B+ES+yaOmqy6p5pvNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741283651; c=relaxed/simple;
	bh=QE+LjaL2ZyYUoUH2d1IXBLbqS3fGrTB93p+UI1vbjt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tuaCYz8ojKvsRUPebQFYZBlnr5LlKAJ9VnanEbEX5c+tra6PMgnHaT5N6e1yyTKh0dj12KJ7n/K7IJOknD4exHvaw3/aPOUHYLqUVNd3HOq71lAn4lIio0uyCGgqccaoe5otUHclFYb3S5qbqLjE9sSvfdwzGAB2CoCteWIcKpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alCf/78u; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alCf/78u"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-390edaee0cfso745649f8f.2;
        Thu, 06 Mar 2025 09:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741283648; x=1741888448; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E3tn1nC4FIEWcFvHKdbKDxUQM2tvo3bFJqFt7q3komc=;
        b=alCf/78uPJtr3RkpDX1ioq7bf6g+DFZoZ/OSVZ6iNSnOtbU6VjMHCvsZh+1/+mULel
         /oatFM0jEdx1qjY4IrxK25ZoROgvCVyFaJl3r4V6sC14zZGuhOtnjhVrbbDqF3mJgemV
         z7YYpg4PNB/g9Wg9lZH8wR50haTGw+tiUoulHOHV97LJctGnKEPX3tcvfwyPqLCdN3/n
         VgUTMcWpAnmng2/S5qJooFz11dobdRdTI+AV5T16cU7ptmjgzJQhtbpUsBB6HMqpszZZ
         uw0HOC0iAhRrTAHPgTBsrt77aTQBmrKLstkoiIWtH3yB+cEFg4BBGRlXEeJrzxRuF2lq
         Ucew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741283648; x=1741888448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E3tn1nC4FIEWcFvHKdbKDxUQM2tvo3bFJqFt7q3komc=;
        b=vk6ZxiwBiatZj6jCpvkgbJ3HiPCq7tpj/MYfxKa38MtqNvMGRrcsVMyraG8hgf0Tsk
         8r16E+SarDZQ9JiutW/gjV2CYWY0WZfxbLDZL2Ayby4hQWdEB0fBPxV7UsLtqtfYiKk7
         g3eart7pS2vnaQ+kVbArMWQiSjqEAd4AuhP/pBygE+YUEuIgNzu4/2JpiNwV3rWoq82Z
         nkjNWBT5kskmYZbfQ+qrAqFsKiyey6YWMX+N0aDVnYyQr6IyGHFjVMeprLuRMmubJ18h
         Rvg4NbFonDrbWjndTop/jge6r7GuFqYMfjsk4Uh1pWfLuDcfM75Y9Hhbm3s5seNkbdqB
         JkIA==
X-Forwarded-Encrypted: i=1; AJvYcCUamvJld4aE2ZvEdOVYtv0O7M9UaZEz9cZ6zfN32YBq3uli+j/oyoCnF0Wy4nfaRaEl0UiQyxiohT+mYekl@vger.kernel.org, AJvYcCVi77z1WdM84/USqw1Y7DMlyPrdrsEhDbDUT0bzwxsbn4W1YxPGZtde7cX/2Zx4ikOZzuWl4fS5YxqP@vger.kernel.org, AJvYcCWfZXAQWIr1iQUHD1/7b1hP00EH8x2xshuh4X5d1NoPo2KFGUui/R55e9X+Rn4bJzyLGkMiYMDSmaHx6bU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4YU2I6+I8zbs3AvgMDI2QQpPcQdqmh/HAuM3QE1DPiakGCUHa
	WIXc6jNMHQWfiQUb8tcv+IJ4VqTB0Q4Ikq8O3NTf+NKsQhCzVQ0k
X-Gm-Gg: ASbGncvg/moD0wJsG2Kg8x3h+1Lrpqdbs0zjt69DUBbpYeNeep/v0uR85FkJlmmBNU9
	Yo3e70hdJRwjhITiuR3ojxTbGP4qNN1ScHj4mMUI5VYEPtBR47Ujr8Dr8u1G64Wla107bDaI5S7
	WQK1/Ji5H1IyUDP61LYvU/BJkx5HpJmELqViBzNJHNUl9u2IRA46mEDNEDRXlLK2WqJA+kdJGvZ
	+Mot94qovI9ak6xdjtupiAzNSjZujOL5byZns+qnyhdXkKmPv2GtQ895KTWWQBeiFt0NWJb3diS
	7YXEQdABhcRg66lbEVdMHoj+CgHcSXVNioJUeAGzjkQHP9mM0wOshvNLkbeYxR9nstZPAFG3KIe
	OhtT3VTeuPjCMFHEkVQ3wElFUh/mn/lw=
X-Google-Smtp-Source: AGHT+IF8JOhotUrzkkAhhUVap8uNQR5LdOejIE5iz1HzD0XBwpr1ACZBG7lQnXoUPEqY9UlVKDHjZA==
X-Received: by 2002:a5d:5f45:0:b0:391:329b:893e with SMTP id ffacd0b85a97d-39132d06be9mr56725f8f.5.1741283646837;
        Thu, 06 Mar 2025 09:54:06 -0800 (PST)
Received: from orome (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bdd8b0425sm26788095e9.3.2025.03.06.09.54.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:54:05 -0800 (PST)
Date: Thu, 6 Mar 2025 18:54:03 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/6] ARM: tegra114: add HDA node
Message-ID: <kzwr2feo6i653nniemd6omjmdpo5ukqdfcmc5gjik2cyopvoyx@7ua6a3tb7sz4>
References: <20250226105615.61087-1-clamor95@gmail.com>
 <20250226105615.61087-5-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="adrlf4fwc7byfa5p"
Content-Disposition: inline
In-Reply-To: <20250226105615.61087-5-clamor95@gmail.com>


--adrlf4fwc7byfa5p
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 4/6] ARM: tegra114: add HDA node
MIME-Version: 1.0

On Wed, Feb 26, 2025 at 12:56:13PM +0200, Svyatoslav Ryhel wrote:
> Add HDA device binding.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  arch/arm/boot/dts/nvidia/tegra114.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

The nvidia,tegra114-hda compatible string doesn't exist in the bindings
yet, but I've applied this for now and added a patch to the Tegra tree
that adds the compatible string.

Thierry

--adrlf4fwc7byfa5p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmfJ4TsACgkQ3SOs138+
s6EJ3BAAlMkfh43c2FIlRw7ZM70aUadsuK7Sgbk4J9AYZYBeHskaQ9gbKcmm7YVd
PAa1xIxmmJUtg5dyZMHUi31wFIZ8Hgk5Rn0MGY4tkMLPA3X+FU1nmVI4h+c+OGnx
FHc1CInS32PNsDBXjkpkl7sBbhKwyagOlwEUgAGM1ko32avKjFQwfHcNvelF+o69
CxamH7Ja+WTuXBeidQWQbOOwJxDqb9dDrCDc2NpvlK8A/afS2dXX0k9bYLAxS/5s
U3T+yS225l8YNAB80AWEA94MtrpYc8FEWaha93MarX5MGKvBANvy7PRhUuZBp8b2
yNoQlIpZxPFqzWab0n25vOVhJBKpCxCQCszvuOZ3o0pnwnA+f+4ngEEqi90P+M0R
Gjd/IIjw3QscPUPeVhnM1p7PPF5qzLQZMldHgfkefkiorRPTV/rUQVU70IczgL1U
g8fRHdft8pbEc+37wZgmpZ+HyFWnuykOmI7AEe2YbYozS9uOwGDbo11DEmkJLsaP
8/qRgK5D+3yACqrNMeRFjm1uJRPQ/pvL55fVCSwml9BPayn9zEv41pSeomlS0OZt
PankenQIrOjtUEl7Dbgy+M3AQq7dN9w4yywdnYo3BbshdBPI0ZNdJNqRTIQjgcE+
PU2kPjbRveUfQ2PgXu/AiAXs8KYDFczyUxlX46IE69s0SZgG8yw=
=88q4
-----END PGP SIGNATURE-----

--adrlf4fwc7byfa5p--
