Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EEC1F819C;
	Thu, 24 Oct 2024 16:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729787877; cv=none; b=SaFaxiDYRtfIRS8dR9NcGQye3ocq7yLkMeKxCSyvv2mqI162JBMtjWaHUKjQKW/IiwAIUv/l59IdxTmSDAY5GXUKl7ciW2zEw/kj1orABV87IV32Bhjfoy2GD1ZnHxA4qwR6WAkWOs3hgurksFPTRpqPxIkTsxemGj4ycCOyDdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729787877; c=relaxed/simple;
	bh=tMRIJwGOIyXkvbyO3axtHNxHibwKtTL78XtazOrNFq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pcdhu25kualeH9+rf2BO0Wn8kFLyXZqNYQHVPJNJcTteT7QXFcZfqo8DM6nRz0t6eS/Brojp6/nAWva7upt2FVYuXGLW7pQIKlj4tJwRv5jAJvAJ6Z4ltY7cdzQtt/423UQ2uPvBBZoWdR2fr/n4SOpy6CXngeaRoa0/EmExdV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GYawLDYW; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GYawLDYW"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d8901cb98so1494396f8f.0;
        Thu, 24 Oct 2024 09:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729787873; x=1730392673; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jBq0IYyIrXW2U/4VyMu6CdxVNH0pTKvNmUvJUMNOHoY=;
        b=GYawLDYWaao9k40yGE+ZonWpJggcT5b2k/qimFVY6CV+9R6K1AtZvXSLC7HCL2MDE9
         xOZXxIUhS3nrKY7hGXhiDpkgGuZleBqcF6Aj3AuYGz26uWQ+O/GAcxiukEqm36EEfLJ1
         7l4H5rD3yTmWNY2gTJA8JBX8XBQ39szeo9udLOckmqqMxNmU0FbO/EwOAJuroVg4ASXl
         Dopgkb85PTlQ0YoDEJs4aecsqCiZPPeBDTvoU3MIe+99JoHmOlNr486M2KHZHUMUoMds
         Aq/ZA5sXxxDiXApg49FK3i24k6su2JCRRZLEyc/z+4UclDFGah8GvTdZRPwpCNgxDYBd
         CBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729787873; x=1730392673;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBq0IYyIrXW2U/4VyMu6CdxVNH0pTKvNmUvJUMNOHoY=;
        b=GNkOEWYJmJQtl44ghHeBa3aScLRcNXVS1609H9YewVSKf3aZ1dU0kf8sUWgvw2JQ7W
         /AMsTPGr+Xo97+pDWkBp/Xp+VoNwtiU34fGW1Cl6DbygCrUCDOcAIY65kobA3CJKmlkq
         SVUF7UA5kyZe5M7z4cTVlX5Z7+SFVJmzIFrhQKKwQiKoirMehDwBj3wTxTzVZe4tyS21
         MKJAW1YLuXXrDsXMen43ZNCPFXzaGoRH2JRsMdnRJBW2/PO1bxS5WEVPU4rfl2hlqz2G
         GrGVOsnLrwHzSG09MJlhweY4oIhA//WM85js/xQMsOmKGGfGBq9I77m9O0v2N8rfmQiG
         5e/g==
X-Forwarded-Encrypted: i=1; AJvYcCVQKu6yLxEwJq4bZAcT81G3PqgPQYjeTbX/h8Xcw2GBdHW3oczKF5ZtgDF+no/+CtTWs5da6H7pG3BW0Ug=@vger.kernel.org, AJvYcCVo+u7GehPGPKx4oGBL7VLEXWfhNQBqMu+XWNNu2VcF+rLmFSidssddupCdhPcJx5tgWHJTGG8SxzqIuaA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFkgL3B6rjAqjW8N34631XfI3Qw/K2gtzeDaFuE4Vy8AdovvXT
	ME9PxIttjWne1T83mWlOO95hbW1+kTSAjGqhKzcwdFq39qSYikZZ
X-Google-Smtp-Source: AGHT+IGYZ1yNYDej+Ev6P6dtLpilmsmlUTQVNHRe83XK77pvf/ozsjMozGVR5OTLz78nGOnhWLUJZQ==
X-Received: by 2002:adf:ec42:0:b0:37c:ffdd:6d5a with SMTP id ffacd0b85a97d-3803ab6710amr2287942f8f.6.1729787871814;
        Thu, 24 Oct 2024 09:37:51 -0700 (PDT)
Received: from orome (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a4ac2esm11716954f8f.44.2024.10.24.09.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 09:37:51 -0700 (PDT)
Date: Thu, 24 Oct 2024 18:37:49 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] firmware: tegra: bpmp: Revert "firmware: tegra: bpmp:
 Use scoped device node handling to simplify error paths"
Message-ID: <o4l6z722yzz3hjskeloqfpzypjl5h46ahweziz2k3cwdnw5oeq@pvylkxm35gwt>
References: <20241001204025.5632-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kzk7dcb643gprhsk"
Content-Disposition: inline
In-Reply-To: <20241001204025.5632-1-krzysztof.kozlowski@linaro.org>


--kzk7dcb643gprhsk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] firmware: tegra: bpmp: Revert "firmware: tegra: bpmp:
 Use scoped device node handling to simplify error paths"
MIME-Version: 1.0

On Tue, Oct 01, 2024 at 10:40:25PM +0200, Krzysztof Kozlowski wrote:
> This reverts commit 8812b8689ee6 ("firmware: tegra: bpmp: Use scoped
> device node handling to simplify error paths") because it was silently
> modified by committer during commit process, by moving declaration of
> 'struct device_node *np' above the initializer/constructor.  Such code
> was not intention of the author, is not conforming to cleanup.h code
> style and decreases the code readability.
>=20
> I did not write such code and I did not agree to put my name with such
> commit.
>=20
> Original patch:
> https://lore.kernel.org/all/20240816135722.105945-2-krzysztof.kozlowski@l=
inaro.org/
>=20
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>=20
> ---
>=20
> It's very strange to see own patches silently modified without any
> explanation in Signed-off-by area.
> ---
>  drivers/firmware/tegra/bpmp.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)

Sorry this got burried. I will sometimes do cosmetic cleanups like this
instead of having submitters go through an extra round of review. I
suppose I could've mentioned it specifically, but I thought this was
minor enough that it didn't matter.

The reason why I changed it was because the original didn't conform to
any discernible kind of coding style and I thought it was difficult to
read. I also did go through the cleanup.h documentation to check that
doing it this way was fine. I am aware of the LIFO behavior of these
helpers, but since there's exactly one occurrence of these it's
perfectly fine to do so in this case.

Anyway, I'll revert this as you requested.

Thierry

--kzk7dcb643gprhsk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmcad90ACgkQ3SOs138+
s6HBDg/9GfDUbDFhYo12GH5dta6FuYjtVFuu51mF4yi9iUgmWIvdWyZhGWLxMLa/
PBx+Itx2ka0Ks+WuUxfeHUu5DNDgRaAlIXXI0eIYiPrt8T4dMbzQ/4PFM8RK/LbE
hYBXr3Hf8LnY8Y2ouF5bW5ReQtvYFMmCvWbGXXFzLr8+thKxvH/lAbyBdeDtftpY
tvYPOpClcSU6WXymiggBy/3B4S1eMQqLSLJl4q93Yw7I5WT/3rNbQgk8dRONombT
Uc5vHnyZ56i7QIbUWbb+1Q4wg+s1hkXLu8Hn5fhkgfRoNvbQJYfOlH1nv/PZlKxM
9BcsrygjQ6uu2FFVzugV9r5GLFPxQguq7FKIpAX5ZIEQD4+nNapZ7AWgSphfnFj1
BspiW+UnkHH2mMNz67HT8b1afeO8Mkwrt+H706mEgb4GG5Edi5weNK4lBIr4Uqhp
B1imObhSDqKw1LaRG7xQD543tHzB2MBlA6xUDUkvMCmyONuULX+OOd3T5V52Z4uY
bqj9ixJFJMLEETCxL6mki9FcEk12MWaBif/I04qg3UdOZvg0qYtdQDdnH37zNNJY
r/ZIxP7PUpvMDFOBuKCzs2YxYPSoe+/tnX/yk38CvXG7Ul9VS+lJDHZim/41fs5A
NHHoF7GbDdNSZ61Lk+4Ny1h3Xavpi75ABzOA4QA6/p4bPfoAFYs=
=Xpqy
-----END PGP SIGNATURE-----

--kzk7dcb643gprhsk--
