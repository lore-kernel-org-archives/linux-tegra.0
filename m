Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2F21E1C22
	for <linux-tegra@vger.kernel.org>; Thu, 16 Oct 2025 15:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760627787; cv=none; b=CcSeRLDxCN365h2DKNMCqtGDnL9NwKYxLgdonG6xhzvnwP9Wi/WKopDHN9YWOwcKGpLAL6WRZd8GarFGPTnY35vhILw+TxlwwqVLo/nBM/g51BzZA/zWt3voEYBH7KS3Cb2sASdQm+DTl8jy9qH1479ehWZhbSn/fRSMHCvvfxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760627787; c=relaxed/simple;
	bh=wcfBHmd6UI5Ee2LDKTIUZ3jBqohaEOc9j2+snQ6rucI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uH88CilxkBgIl2+FRTDuLceJ9YC43ql4BHa6/k8zvHYiIHImQ5kkWjZojQXurSY7qv17RbXngHT27tHmWtQeSFOACEjNbpSbx+ApSu53qzt8wW7tncpqYfR9xOGGydpZGsFdqkcZ6FHSLv3fSc276lfB3m+tkOYR6s3YMtC8ALw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ll4RLxDA; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ll4RLxDA"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6399328ff1fso1578886a12.0
        for <linux-tegra@vger.kernel.org>; Thu, 16 Oct 2025 08:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760627784; x=1761232584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+GMHzyWxIQdB2FcnGDsVo98f9mvKfQ0tZi6sM1VRpVw=;
        b=ll4RLxDAj0FVXCLpmb0Hy92wpkTF+tM1aJ4Hph33IeRmerp1ZGixggCCVv1QYgMbmi
         M/O4cBLWnNfZ91OhZzTHwaBP25UPrLsewfV6wE5Qc/OsRf6sKs7BqxNu1JYpSFrF4FMP
         mdGbLp02Q1svctTmrUsS5qyfrRPVmfNf4bgjlm8yH3EWWILdj6LqCkzMfxUtwcuYGycA
         fDSB7rSPCWvlxb7Q0ClsbBuK5AAAJtz9fDUKQ8tfkcjLOK94xQI916au5lMGWiFbJzuK
         zFFny+iT9Eb4UI6VBbJ/pBCt+S450nk9b0/PbTPmDSDpxb9Dcclq0Hfy+Jqje0cL7ZSO
         KlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760627784; x=1761232584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+GMHzyWxIQdB2FcnGDsVo98f9mvKfQ0tZi6sM1VRpVw=;
        b=mfY2VqHJABw0OiARGXSheBR7C5SHDfOgJbUsOA6BNmgmi3qnfGVC8vairh1slMHha7
         u70jqA7Heju/228LocdmWV5WSkcQbSk7sFcpzj0aZYWiM5FFVmmn9f62Wiq3DbdRk57y
         wZ44uO9clZUtVkvkIHMqrv1dKQ/MRHzMltvZY5U9v3e5ka3LuVoiAaL4flngp2+Uok6V
         g9IdugCAE1yBLMH73k7sIFdGlBzME26I9YrR7IqfEHm37yeO/b1/2EULkRjRZh/aHSma
         jQZrzsbCp8d7daf1NHVYi9peNoTxe4YoZwU0MVg1pD6/YZhmsyusqk9a3kWXW5OuzSd+
         UsXg==
X-Forwarded-Encrypted: i=1; AJvYcCUafoO3PsbawDddRoGzBzSQxOllzS2n3R3KRmpGP9OcQa4+r4ENaqXluosqTBIWIFezPCQlEa7v6Nl11A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoWSPShfWksJMNCBupurK5PFZJMZuO1LfGFnbEZOtzOPSMGeKU
	l2ehN2+Ov5DrrQ7rJGFD0T8FtQBEAbtewJY+o+wahJqmLcUT2LaPnPWR
X-Gm-Gg: ASbGncsUfC86RTFcTR/YGMzoB1V1ocVvX2TDaecEGrcBFiUf3mZYtcnhc94EwFo73Ra
	rAuy/94Y+f2I2v5O072U7PFx0iFnw30nsNopziLPzqXP8bafgwqOoNCnxrQW2UWW7InL0jrnRjq
	5tdwoSEcw5h7G7QOEZ/UgE20uppts08apb7W0u2Piwjgf5pijeH1+s+59GG641uCEkBAmTsXJMh
	2PQNJXdmNsUn4SjGn4keN6ALaHjOSZgaSnker7xvaHMtgV9JotuYIaj+NmI0SExMzxjJlkFo1tP
	42ghDbYSKpOfK8EQa79DXwrfTMeypqP1RiIGhcWNp3RLkzn/bREwIBf8YoVFibjPoS9v/ucqlkF
	lxEKZC365qW2dJ2W1Tkg19MBavHkFt9uEL1txjDtBNH2S2OhObX5gX2CE6SpcL0XyW4FumGGmDH
	qLGATXUoE3WSki8j5YUXkkJOj7ZAdoJfXhc43x7QEJy7Y68HsFCKXX8TWu24kijB059I+6zRatu
	w==
X-Google-Smtp-Source: AGHT+IEUnMRpJptAyqDQKCXnI29t4Gj4evz9uABzOpOdIG6VCD9oWY5iTASgKePBY093qoWb66U4sQ==
X-Received: by 2002:a17:907:2d06:b0:b40:cfe9:ed2c with SMTP id a640c23a62f3a-b64769cd245mr26276666b.64.1760627784283;
        Thu, 16 Oct 2025 08:16:24 -0700 (PDT)
Received: from orome (p200300e41f28f500f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:f500:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccccb51fesm532883366b.44.2025.10.16.08.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 08:16:23 -0700 (PDT)
Date: Thu, 16 Oct 2025 17:16:21 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: webgeek1234@gmail.com
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: tegra: Add Tegra186 pin controllers
Message-ID: <qkyzlnni5nqykck4org4vgxzju6v6iha6fulgguutxuhf7zozc@awyches7ozox>
References: <20250812-tegra186-pinctrl-v3-0-115714eeecb1@gmail.com>
 <20250812-tegra186-pinctrl-v3-3-115714eeecb1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xpwhjuenbephr6ly"
Content-Disposition: inline
In-Reply-To: <20250812-tegra186-pinctrl-v3-3-115714eeecb1@gmail.com>


--xpwhjuenbephr6ly
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 3/3] arm64: tegra: Add Tegra186 pin controllers
MIME-Version: 1.0

On Tue, Aug 12, 2025 at 04:24:42PM -0500, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> Add the device tree nodes for the MAIN and AON pin controllers found on
> the Tegra186 family of SoCs.
>=20
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi |  12 ++
>  drivers/pinctrl/tegra/pinctrl-tegra186.c | 207 +++++++++++++++++++++++++=
+++++-
>  2 files changed, 213 insertions(+), 6 deletions(-)

Applied, thanks.

Thierry

--xpwhjuenbephr6ly
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjxDEUACgkQ3SOs138+
s6E1FQ/9Emy2fSHqfWOx1mLl7fFhFiPgIbO/7b6K4ogiYAUJPPgObu9dQKwRZYcT
y3WxvaYz9orL2R8f9wssQTfeCjiNcxs/9KX63v4K0A8UTAZ6IFU+jwzcuswQ0ZHX
CLEl1zQnPnzbderf2Ay7rTbxUaOt+D9yDXjmpgm5zGOdGEPCibFaPC8RTbx+5Wy2
rqztgmgQ4lHhBuVKGfjrfaVttYLrwfv2cV4pvZiyD+o5ekRgQqUqn6vrKbv81edG
/RYqWHc1p/ylM/ff5oJKbSVEOIVHkdfFB6vREUZHcb5j8CFhXKojdp46dWRNzyKu
ZobImewQyLDYmny2ci3uCZRZHuohBOHofyND1oPBuzA7seFGAmH41hNWzQD6mbuK
8FU07VkQyz/S2vEOGb2yyeEnnzNLLSPmiJRXCO7Ld/voGIwAr5UpGdZKhcTn0MHG
Djt+P8cRy0x5FppjlIT/YqPlhWFKiovlRJ9SSlMtnVyPMz8P+c4wC77uMtQoGodW
3QkeqNwPVxDsN0pnUFb24DepLbCoOdRAknomjXbbTiRyzwyhCBoJ1y+C8fBNXzjM
Ndo0FiyUNf712YVBRTtj/Kd44VxC6z0G7kChlUxo1ja4WTI5IZQYxDxoZttn0Nss
07AJ9/Yu4hGCO60Ut6sY34UshXe//dGNnuaxvrMEbG3DwjD8uEo=
=+p2n
-----END PGP SIGNATURE-----

--xpwhjuenbephr6ly--
