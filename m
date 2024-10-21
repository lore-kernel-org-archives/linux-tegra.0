Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26EB1D1E7A;
	Mon, 21 Oct 2024 12:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729515013; cv=none; b=nsE1dQjy4ZLjDHfNPHVPJESgXLXpnUz5KqR5TnhzFC9IDsLWs3IXfK9OGbKzoPkuYRxuoZkAuzSdUrrHV+YfDZR9sFwLS2wkYqMTWI/jvUgKpsxYnz8y3unFdL36FgkI7ze5l5uXlYy/Y+Grk8xjRFOo62i+KXClE4QQNuwg7d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729515013; c=relaxed/simple;
	bh=7+WybbgX8eJAkMNsicvpmq9LMNsc3BufzyLQqCYGQLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LEFuHF6nB1RSHzfcZRvrqqJTkaFKSKS6+4PlN3AAgX3hby0RYiV0xU4G3knMJwxvzb56apJ/Dt4A/oySD8jRx+ZAK2WFrnnLwKoW5ZAFphHNINVupwW4G0iBbDb3mY4eKKBgytnDHjTITVI0g2uE4u2BzKEaa1V2K5rqIwO+BFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lGuDbay+; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lGuDbay+"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d70df0b1aso3561958f8f.3;
        Mon, 21 Oct 2024 05:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729515010; x=1730119810; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ny2EzjP6BQ8EDbZh2xO7tlOnTQLXpJSSlQMga51ck5s=;
        b=lGuDbay+whuVUKmH8wbpHzvRithE+WvmRUZjAurpiQJ6ufdIO99S8/Ahu5t7UHySqU
         2l1MVNa8rEd3ikVF6t7pEPbUj7Tm6Ha3wBR5AKhas+DPojwgRr5wJ/cqHRPotJyo9GMv
         EhgkAolZVjW0vwoa1s0VdF51JPHwCYNPTlb0L6IBIWJchMcYC6Led2QRq4+TdX+ZmEW+
         ZUtvvlxIE+getl+zCYLRAg7S3J7QbT7rRUdNa8ZNqDBB2JRP/N34u2Er9uW9aN2NOvFP
         H0FjiQ8lWa8L0jkOIg0+59CLvx8ZjkdEEBH4Jyl3RUNiu+Bf+J6J5QW+xXBrb4nfJwgz
         j3Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729515010; x=1730119810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ny2EzjP6BQ8EDbZh2xO7tlOnTQLXpJSSlQMga51ck5s=;
        b=XvDcCOCBo6ZpUax76JFNuhMulMbj9X+5xOaRMKMOtN9KbV0L7ITAzZlSSkcxqjQpnv
         k3Ml+1serqbRqfMAE+Ke21S7R5M2mZhivGaLvZv2j1bK3v8AbJJLVgdl+RHzuVjEspUm
         A27QT2587UB2gpx+wkRW/lH/htb1srBI/n3urn8mFNRUUp0TojMB12ZvXdPLaZGAZMzJ
         MA8XkzBm4R6X1gtpE+T9Xi6mdi4Wa5lqod4tjVTFm7DqPLagBDUUGJxtW9N24aBq1eui
         3HJNA5CTSI6xGkK+KgdRDYgj+url/r5UFI/MdkI4tY34oBx3NBhGZ1T/nx/tdgDjTybz
         ZfCw==
X-Forwarded-Encrypted: i=1; AJvYcCUuOjPs+vJTsQPCHXRd7jpLb2rNW1UQlZ+cc0KQdMKHpToJzXxEoVXE6rGQKyx+k41CbWpaYBfTlwbaBSw=@vger.kernel.org, AJvYcCVriMOu3VcBU9napwY8M0BHfs6+VQAgAb8SOvRwJhC8eA2coSIYVEDjxiGB1EjSX2s0Sy6VgZ+euwOWJN0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZ9jRqadIiwNZp0c6YUGTx+rGmiwjx2zaFJHDWVms+VRdrSSv/
	a8ZaFlORlJgU0SvI1RtrQz6GyhZqEOI3Jl5Hfr8JUkCnu2qI7Oh1
X-Google-Smtp-Source: AGHT+IEAd4G54DP9Gc8AV0E85ByBWJ8OgZpAqArfj+Z35pEgsQmtE6MKuAwRT3EfahSpc4WUOuY+eA==
X-Received: by 2002:adf:f8c7:0:b0:37c:d57d:71cd with SMTP id ffacd0b85a97d-37ebd3a30dcmr6732276f8f.52.1729515009956;
        Mon, 21 Oct 2024 05:50:09 -0700 (PDT)
Received: from orome (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a485dcsm4273254f8f.34.2024.10.21.05.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 05:50:09 -0700 (PDT)
Date: Mon, 21 Oct 2024 14:50:07 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dipendra Khadka <kdipendra88@gmail.com>
Cc: jckuo@nvidia.com, vkoul@kernel.org, kishon@kernel.org, 
	jonathanh@nvidia.com, nkristam@nvidia.com, linux-phy@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: tegra: xusb: Add error pointer check in xusb.c
Message-ID: <v4ng6ctnwymoorzbaqo3xsbqtd6ocg73iau56m7ineykbpxsi6@hgv4y66d36or>
References: <20240930191101.13184-1-kdipendra88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nyexhj7aoiso3top"
Content-Disposition: inline
In-Reply-To: <20240930191101.13184-1-kdipendra88@gmail.com>


--nyexhj7aoiso3top
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] phy: tegra: xusb: Add error pointer check in xusb.c
MIME-Version: 1.0

On Mon, Sep 30, 2024 at 07:11:00PM +0000, Dipendra Khadka wrote:
> Add error pointer check after tegra_xusb_find_lane().
>=20
> Fixes: e8f7d2f409a1 ("phy: tegra: xusb: Add usb-phy support")
> Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
> ---
>  drivers/phy/tegra/xusb.c | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--nyexhj7aoiso3top
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmcWTf8ACgkQ3SOs138+
s6Fxeg/8CQxyMg/0RjT7XVFwK6GWeQolN/rpQBX76LH9QVf2dd9MH6tLXjcmRhbO
dKW6TvkSnAG42z8q4Z8jrnPG3IhcR9ElV/Qddh2N8BfH5i/OZ0p9VQOHDYMxvV0n
SCybULwwRHm/l6smmCAold+hHaKrb8J3YbHqZUVw0weRoKgvRH63DYsBt2GJExz+
lzjHv55Lva0sqMemJNMDZ76bYsTHXlhQynMspfopAfbG9O6i/SCxti81Qde+tm/N
9M7qynuPRyoj5CI9DV9JZaR3DUAlBjCKl2A2kD/ZxoTiQ6bTlR+4zge3cDWpq9VR
0z+3cYo1XWJ+MmU7iA/AmAPxw1+gA5rRUSHbEFokBKhK64F1bYbr1PKqjtKq/i2D
htU+/yyUE4EBBYg5LhNfYV9S58egs1pPHiDr48D4yqWwRT+n2g5u3cn4Rp5IBomI
0fp1ZWtnil/QMwdNLBAK1q0WNmvKl35YxmQ+Mcj68um7S31212iblIgntjDX/FJr
i1in1E+sNouSARS+znU4dQcs5m642gVlNA25xw+fR77NkZD6VdhT1jS7i9AQkjBT
MhVxNFqrsGW1+hRoU7VpUaJYk5pKUIkQqmRBSeCwqtbEzUonorZ6AZzIAUGPgZIe
mpJdZ93LLRgxDiDiVRg/FBzEVwXTlxxln2aFkD/abIWLUExfmeA=
=9qzA
-----END PGP SIGNATURE-----

--nyexhj7aoiso3top--
