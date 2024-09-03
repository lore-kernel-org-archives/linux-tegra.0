Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8173E1A42BB
	for <linux-tegra@vger.kernel.org>; Tue,  3 Sep 2024 11:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725364708; cv=none; b=KI/gxdLdhnUUeoUeEaDGGMJ4UUn/pTR5AEo7bKZCiSvEWL3OHNuPRQvOPzlwwmoovhPbnKDSRxRP3lb8lgOQUyCaFf/pC0NxGt4AkB6Javxq3i5wbDu0p+OUU8FHTGUv0QX1qgxdt4nLPmZ3ATrALKYc/FNfSTAsoINtW5wB/sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725364708; c=relaxed/simple;
	bh=+F2q0iCYGTSgg/GyflD2FP0+S4lrycssxqJKU5o+TTc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXCh0eZHZ7FMphK/dtUbfP1do+nIkylBdujSqjk35udC1XuVahWLpp8lxy1f8uuDu4yQMsOVSINwm4EpqtAQx6TS91nxOVqH/1nNLtsh+TT2QnBZpVanyCOZTZAhkhIYwZ+LWt9roAd8JZA3naBT6LNrm629GqA0mr9DVMmwkE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lWD1Mswt; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWD1Mswt"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42bb4f8a4bfso28295245e9.1
        for <linux-tegra@vger.kernel.org>; Tue, 03 Sep 2024 04:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725364705; x=1725969505; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=E/ikXDun6/kV0dBrypUTxAftwyQ7HrFKU2RTsfBg4qY=;
        b=lWD1Mswtc0iabpGWs2FppjsZaxaxiq2BLJZezGPUmLJpRVZfybr/S0sfFDHaoXU9qZ
         evg8ssVmjw5mjBOrTvglta3z6/1aOK/u9cdii3tLhOfv7aF4O0ng0UkJdDSWT5FuscZj
         LhY+fZjyuyK3PDDnn0Y1UdVzUpY3le6dNcHjXgMSSVVhH0sdVL9n/6OrelCqhRmrWEvt
         +Yks8djz3jimqBkqSWg4AZp5NEYib+nMEeLI3HGlMlwvj3AjJW/85Nqs5zvy4j3tHKIG
         nBNovwRaxzp2xyH7y11qrXbcpPl1v+nynG62e2eUb5+bhuYPxoaXeeRarDtuiGUneVMR
         uqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725364705; x=1725969505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E/ikXDun6/kV0dBrypUTxAftwyQ7HrFKU2RTsfBg4qY=;
        b=dltGIl3GAglpJrgP80w9510ZwHVPwjutBntv3ggW3tC3xuOK0yvcjNWQeZL9b3hH6M
         LJcX0lNILIAci2+TgXrD51YhHV/dp5f63jkKgL7H1O1If83tO8rZXql6HDFKsHqwXYOr
         QnPlFFwD0zc5bklqst6Fyx7KxJ/WdWZhAmvWGP/YujvdJi/Pr/+f7zc72ANIL1+ccoSr
         /cKXKYYwq9yAB2gbc0T4yrnr7Vb9W8yGFhuJKgWsbWM3eZ+hnDtNEU/dYLxpMsLPNCzE
         fVcl11FbyqyTeEa2Nvmt4KTuWhR05aERn67F1VI9n5iqJ0RGc3j1Y7ci7XopJhhPtTTx
         vAXg==
X-Forwarded-Encrypted: i=1; AJvYcCVZtSjxfnaBve1dUSXP3f4rHI9ehBwb5O1GZSD9hW1iGSmBeF9oQve2RE4Fk8fMgDomFxgYSIGcvT3m8g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWm8hX69czGb8Iw1t5gyFbHybYthNsAjCg2wdE0GUFcNFYaobC
	3Lo5r9DsdvCImxrUtIpiRilnshK0PEml+h3n8YLBwb7SVjaaQ7bm
X-Google-Smtp-Source: AGHT+IE8NoCbJoNsfast/3oP+6wh3R4mL261axzF/IM/dsLTQiLlydbRjKC4G/ccesA+EZ6MSXTy3w==
X-Received: by 2002:a05:600c:4e92:b0:426:63bc:f031 with SMTP id 5b1f17b1804b1-42bbb5402a4mr76343345e9.1.1725364704117;
        Tue, 03 Sep 2024 04:58:24 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374cf7e2dbfsm4107627f8f.37.2024.09.03.04.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 04:58:23 -0700 (PDT)
Date: Tue, 3 Sep 2024 13:58:22 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, 
	kernel test robot <dan.carpenter@linaro.org>, Thierry Reding <treding@nvidia.com>, 
	Daniel Vetter <daniel.vetter@ffwll.ch>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: fix potential uninitialized variable use
Message-ID: <dejyfvxyi6fibvld3rdlxf2m4xws7shxvhhkokp6y2jk2djltz@reoqqwov4jg4>
References: <20240902161317.2437148-1-jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kgblfn5izdqlwhm4"
Content-Disposition: inline
In-Reply-To: <20240902161317.2437148-1-jani.nikula@intel.com>


--kgblfn5izdqlwhm4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 02, 2024 at 07:13:17PM GMT, Jani Nikula wrote:
> It's likely either output->drm_edid or output->ddc is non-NULL, but
> avoid the uninitialized variable usage anyway.
>=20
> Reported-by: kernel test robot <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/r/ZtXLyXxew7z6H2bD@stanley.mountain
> Fixes: 98365ca74cbf ("drm/tegra: convert to struct drm_edid")
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/tegra/output.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Do you want to apply this or should I? In the former case:

Acked-by: Thierry Reding <treding@nvidia.com>

--kgblfn5izdqlwhm4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbW+d4ACgkQ3SOs138+
s6FNGQ/+IHH/FthuDhCd5cNxYrmVXEpQi7CqHoeE7/QTMmkYNrPJfGr4C3beq2JS
2eDsoWBci59dsJ5yY+x71WQv4kkO+tcRufUI2KKfupkSOiDkArAINwGlM1AVEcWR
XpBRfwOskVGuBEAtjYPqX8t/hj73JbnywozhneII4f9qNnmNrZecwswfKk1Aywp/
+X9yr3KrVqKN6N52uLpU2RmJQAgyT9bxEjkhl6gb0bIKmaxAf8TUDdedPQmarOjL
nberLfERuGF46qfOAssxqBJlg9sL4LmuxUarGNTwTOqctPjG7znQzQBEGFykeae9
omCrDafN2A6CulXS2445jtsfQlnwBrdlIrfgVKverc9fCQ8LHVC658mJDMeQ2XtW
Dgik0OpguM6/6V95CZBkphgnjyUCq+ZpvgeGSzM9Lb4uUjeIyEK6sq7gNGkSrz44
xwcz//d53l5Y6OgGQUfuQS2tl64rq0BFFkL5FgpX8fWLW2oQK7iq4kiuI+Zg+rBQ
nuIVSw2XC358T6xsaEq3NqJg2i9hvY5w3grQb7Ky8pfCIOzUGEFT0ksfinLLZnun
qjtug6lZ/GUFL9+dFs7j3NA1hDHhW6nB5OhtULGj34moFkWhPx2VFHkR7UaxhEuN
RrJyGd8cpnBxUlk6Y/88sgerpNolO/39mgaclZDM5f3QC6HdY10=
=apaP
-----END PGP SIGNATURE-----

--kgblfn5izdqlwhm4--
