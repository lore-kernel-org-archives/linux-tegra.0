Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874B822126C;
	Thu,  8 May 2025 21:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746740030; cv=none; b=PQN+MN8isXIqIrIJsYsrftLJsLgFJbUsHkWfnyH0clu3OFPO4J4t9H+O5KPb2ldOGAPxOufVyXTdTW4OY21nf5qppLJyzJX+itZkAPFWzgS6KwNzaN2pKZX0t8JniLN8P/vJ4RIJPL7FypcK4NeFJ+X60elHWk2VQtwfui9YWSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746740030; c=relaxed/simple;
	bh=Gt643+XOpj3YUSLm+T9MTBAY+4CT7TNy7FH4Rv9wbNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nns3IAT3+EryD7k1MmVGkomzp+iYww9Iq4RoTrUTbpsyOksyTVDGnY8FkVv4edSUyH7SIWwzKP2Y8FvCSrtQDhAUF6W2wk4ieA386ail8Um1wUPqk6fc2rMlKINW+SyVQ9Oq7Hu/YuL16mBvaQUkZEI0WPnFDXv42oTrWqT2G9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XHhThTBv; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XHhThTBv"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a1d8c09674so375377f8f.1;
        Thu, 08 May 2025 14:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746740027; x=1747344827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ekzs1X0X/D60ZifoKK/5HXD3yGLQFiQxyn4NnumYgtE=;
        b=XHhThTBv56R/DEkEf2xsFulV6QvZ/IcvUS0Hf4dl2gAFDsDcwcZefhIQ+lq2gkTyjr
         0EysCz6/AOQ8XPtQLArzSIZHCLkj0XmPw9FQo2nTT6Y8cvxYUjJTlRh5DF54LL2bK7Mx
         eYHSElj6DB5biMPdZLCUm9iUyh0p0mRNtk817tl+3BqWKkHGHLA+iSQMpKjQDWb1nE4H
         yFZBCfuxHtUB/Bj+GmGIAbABAP1Ut8hAcyW/Uolv2gOPf0mfQ+p+g7J+2E0MqAJ6U3hj
         0HjD/Q5LuQr2aOg1CJot0CR6AWwHxFn16cBJUDE+n7WU/mNZpmTl1GVBbDE2nZxdtnMX
         Vygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746740027; x=1747344827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekzs1X0X/D60ZifoKK/5HXD3yGLQFiQxyn4NnumYgtE=;
        b=WaYFXfNnOBNzbdBbnJs/F/L/JTGyPGgbL+s1REpUMs9hq/2MDIgzBoMBGaAx93BDfl
         l/7qmPf0snUtkLsoFS8TCjQgKc97YTErSdptZiWuqg7uBFhhSzfEMXnTNfTwpmy2+Xxz
         hzQx00mGVweXmCelYmmBlSyF4nl00nL1c/EKTq62DfDGRYWbbujtKVIxEo0H7lZ8tFlT
         y+6rtLztg6Gqd1Z+FdV3yV9WVmUiu4qOnvU0xoUNuOsdD6LbRQ1AkO8xsGfz4fsyeslD
         nCIj15WGdccpzTB8G9ZXCFoQd7yDrLWg9QV0Hjawg6c4laZi3MRo34KXG21s2anziOrW
         N6qQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3uaszVt8PThteFVOBanelNYFrsN/H0vBqojitTJphMwAbDzion52pmfL9H+tuEVAHQMdzzOoqkOE7@vger.kernel.org, AJvYcCUcjUSzn7R/vvdbPLJWF2cjl+rNOIcMD9QXJr1unBSlZOoCVkdwnfQZZEuGX4elBO16XlV7EsI7S6KzmD7r@vger.kernel.org, AJvYcCXf3BI6m8cAm8kh7Gn6Z758At8tUbkUZ26UNAXyj8EHLtLldh0rfUP9tOtnvfHtZ86laJtsf1HnFFcFMg8=@vger.kernel.org, AJvYcCXrIJzibA8axMAJG4Uk07ZI1c4F9WFFyLHtbLVhpHvPDoCC2KIXdv63SZ7wDfGIs1kR+sCuh5PvvROKTEtGy9u4@vger.kernel.org
X-Gm-Message-State: AOJu0Yzo9wjFAwoq4kV0or+IYBBxxHuFjmrcLWo5k6UVuyUnLggEB+fV
	sFQFYnNrd57cbvBPtIym36Vx6I685BruCten4dw8/ZamGCTBCe8t
X-Gm-Gg: ASbGnctfWT+qImoe1E4TCGEM1keENTL2TbMY06UOTkXsGhJXX4RQEyCGvtecVgl7GPk
	hgzXhgyWCmzLsdoGG5QHUz1As756wBrSNJlSkNvXbh3BucmzZHVLVFi5DXeQXhYM7LsIj2LZRX6
	7Ct/91sBGBZ1b6d6KxbQY+gwv2NweovWvvsRtrSsEZBOrhavfaKEPJH3OAT4Q/CwkGf6mSTNj+k
	Grk5aErQdpfMrxU/HvOrBaasu2RkUXi6XvgpTSbz+aGJzQu4fKnW3BQHRDWJQY5ET/Vp6zwN+p7
	tn0/8vPKDuoU+yVoqmOwZDTeGw0IvCPjyasjSKcPKyqjRVJioIQHqSkNF/Q053skVI2EfbKb5dE
	+lTGg7p0wTqUCFWXbdsBZQGyXov0=
X-Google-Smtp-Source: AGHT+IH7PO9f1D8ovSb4BPWRTI5JVj76Pxngzc30voAwyey70hCqkwppA9RC4pCB/2HY7GPE6zzeCg==
X-Received: by 2002:a05:6000:2902:b0:3a0:b4f1:8a63 with SMTP id ffacd0b85a97d-3a1f6427506mr716221f8f.11.1746740026731;
        Thu, 08 May 2025 14:33:46 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c7a5sm1095814f8f.98.2025.05.08.14.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 14:33:45 -0700 (PDT)
Date: Thu, 8 May 2025 23:33:43 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Enable ramoops on Tegra210 and newer
Message-ID: <nkiug3lhqe46vl2zyb5apyqytjeqv2vhoolqj6y5u3kjqpahel@qsdveuomrk4g>
References: <20250406-tegra-pstore-v1-1-bf5b57f12293@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="taubdhxeu2mngrhx"
Content-Disposition: inline
In-Reply-To: <20250406-tegra-pstore-v1-1-bf5b57f12293@gmail.com>


--taubdhxeu2mngrhx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: tegra: Enable ramoops on Tegra210 and newer
MIME-Version: 1.0

On Sun, Apr 06, 2025 at 04:12:43PM -0500, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> This allows using pstore on all such platforms. There are some
> differences per arch:
>=20
> * Tegra132: Flounder does not appear to enumerate pstore and I do not
>   have access to norrin, thus Tegra132 is left out of this commit.
> * Tegra210: Does not support ramoops carveouts in the bootloader, instead
>   relying on a dowstream driver to allocate the carveout, hence this
>   hardcodes a location matching what the downstream driver picks.
> * Tegra186 and Tegra194 on cboot: Bootloader fills in the address and
>   size in a node specifically named /reserved-memory/ramoops_carveout,
>   thus these cannot be renamed.
> * Tegra194 and Tegra234 on edk2: Bootloader looks up the node based on
>   compatible, however the dt still does not know the address, so keeping
>   the node name consistent on Tegra186 and newer.

In order for this to be compatible with the standard bindings, all that
edk2 would need to do is add the unit-address, correct? I think that's
something we could probably get done since we do this for framebuffer
carveouts already.

Thierry

--taubdhxeu2mngrhx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgdIzcACgkQ3SOs138+
s6FlVQ/8CeRKDXGRZlaBeE31HRP9B8ML+KHgGbP4eFu+2wmNgVUD6nuYuHOtTdGm
psmw7dverFLWdWf3GsdWooyEP3OYNJvvJSAvwVywhvP8d3L3TG5ngjX2vvOsO3Mp
10zdG2Mjrsg3igswPlhPjZ5Gq0tkzrH0fShEaoFePrTA/PfJtyRM9wUgIufKy9qa
aCP3J220urbohrPgg7DGh12rXSajn9GkPfuTrMVE2njNGrEU56HhTCgYFCTSuZd4
qyf7hK7EgLZ17b7/Y7PgQL1rVcTJrJfsz30/jCJQgGQ4kxlD5O742Z9mNvPsZUDJ
UWvaaKKk3cYsFX1YpTpqSGT3OOw9MoGftMEc/hdFSED3iGWlkFyt3tUvOUvK88Jp
OXCYKUdRKpu96FI2QdYCwFepJjksyAz4jHjGs1hbWPOoSv4cXK93m47G5YMvHHK9
87QW5D9TFoJWlWZ89FdszITcprIxRwfgqIeyFuTS9MeP3OXIV0SyRpRYMOx7DQC4
wxaFmbhKWQXBEIr3Ko9dDlprK/xrqw3wilCrKfuUGqjrU8LbbTE4OKSq8/NFMXUQ
UIlU0RV2H3PSUMraYxbPuafu7OqaREl3uCNe/ctvmFFJcPWhstE/baEaT9KnOC7W
+3xg3srCGeuli60Df7jUAOJDj7xspLIxnCiqF3BeiANO65or3e8=
=da1W
-----END PGP SIGNATURE-----

--taubdhxeu2mngrhx--
