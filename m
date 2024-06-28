Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FF11C2325;
	Fri, 28 Jun 2024 15:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719587511; cv=none; b=OwmgqS2HMdMGN/VVSbWUslb9dowsqd4sfnjyxfCZVBKDYJsl19dhMGrrxUCXTIlznWNxPRdMMylGJ8h/ShwCWKEGP0B4hpXnSibK4L4wfY5nmH+myVKs0dBGoZn5dQuK/02lbkSYbBV4Fa/3wFcRi8oYZCXOfLeYanw9dQBOaG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719587511; c=relaxed/simple;
	bh=rQEfzzO0+5DLw75IH4g52W9FtnhmN3EFRLppSXhgdjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXMW2zHNKgAyJsP+ybu8JVn9KsA1zUoTZdqlnKi8re8uSSe7Q/64mrab0BGXLLdVu3/w+gFbkgHj9zJSufgZtpQ+7+c3k1faii3kMd4OSUAVOIofjdT2w9ktVyBS2AvsapHmImLuuvV2XOu3IUUbJg8fI2zxYqfdmatOw82YPHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=drzmKZ4z; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="drzmKZ4z"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-424acfff613so7472615e9.0;
        Fri, 28 Jun 2024 08:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719587508; x=1720192308; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G+CX/J/whOmL5e2jZfXh+sXtbh8Qe8rzOa/IDtcigV8=;
        b=drzmKZ4z2EJQMrL6cy4/1TWmTaNx1DHTpus4QGZutXs8TN72IMSYL098NO/1Ywsada
         J5y+hxl8lS1IsHRyKXQKQXk0X4I/gC6oMjyuG4dXLzq90EqXZZ3gBzSlL5QX+S5X6ZBq
         MrdLZbFy1zPrfSPniDc3/H6b3QpoCwpSo6Rcc5AAEpaMuzBpIrmy6sDXc5PR2meW7kF9
         F0PFEziWj9vFPL+10RnPmhanQOf9RfpWWyy2d96GLcNwujkz9J60q89RhmQP5vfOy7v4
         wC9UDZgZnrdel36b8t6XZ1AGqSfLj5k/FoqkasvdqvNNZ4W14T4l4J2RMb3sDomwiJ50
         s7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719587508; x=1720192308;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+CX/J/whOmL5e2jZfXh+sXtbh8Qe8rzOa/IDtcigV8=;
        b=XEdBehkv/QOUD8lklOp3yk8+HKko8aJLRWv3IP6XTAms+oGtAjkwM3Pvpoyc4Kc7RK
         yEKfDz1yeY/ycGMSD7fSn0wtFRKoB/lYjl6M4q3kYoAPJ9tWBkJ2WEluOnuOLsJtAFAh
         KMi9t9k646guXN/M0wmhkKUprJwwbwWpskFJyyB5M79GffdwZvjY/L61auu3vh44JEwP
         dRCRKJaYpLnMC3Dxq2GDfygZ++e9F3Uathg4OvQEOpgCrAQ8SgdT5MoPsRU2eZEMwSR/
         w6xLEaa/QRm8WYdrM6V3xuWWoXyePCZDAwI9F85DRVC1rWjPZYjrrZDjiHtnAfIWvAc6
         G3Zg==
X-Forwarded-Encrypted: i=1; AJvYcCWDVPGtKnnjooTnt64/TE5gRtfc2f8jvZ+guFau7Uk0f+6Grp/h15k9uX4Lllj8gtNsFcxHN3FgzY2OktjpK2i7GreMG+g5nvQzcuT3DKsAa5qQdovWzPKhLrJKIi0YlEW27r3NFLdRjDs=
X-Gm-Message-State: AOJu0Yw9oB4aLCP/YbZzhHuxiPU7mZdhvxv9tGTw0Wqe3j7n3TFqsmJ9
	IN2LlzUjCP9cUsSCn7ccd30d3LZYEHc8VV41Je03R6rcAS62XNfQ
X-Google-Smtp-Source: AGHT+IG6bIw9CRMaqOGhIIwzIzPx7Q9OiiKWcCVtvqQxFvYGv/s6oRMr6XdnyfWpJ0WiG+9UQHaLMw==
X-Received: by 2002:a05:600c:3514:b0:421:e7ae:955b with SMTP id 5b1f17b1804b1-4248cc3415bmr141599475e9.21.1719587507970;
        Fri, 28 Jun 2024 08:11:47 -0700 (PDT)
Received: from orome (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b063569sm40258315e9.21.2024.06.28.08.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 08:11:47 -0700 (PDT)
Date: Fri, 28 Jun 2024 17:11:46 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] reset: tegra-bpmp: allow building under COMPILE_TEST
Message-ID: <d4omnd626yqxpovjkpgztl74lp67qjxiu2vvqps7guuuwxzlo5@mvdxrejii5g6>
References: <20240625-reset-compile-bpmp-v1-1-647e846303d8@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="up57rqki3tzs6oce"
Content-Disposition: inline
In-Reply-To: <20240625-reset-compile-bpmp-v1-1-647e846303d8@pengutronix.de>


--up57rqki3tzs6oce
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 02:51:41PM GMT, Philipp Zabel wrote:
> The Tegra BPMP reset driver can be compiled without TEGRA_BPMP being
> enabled. Allow it to be built under COMPILE_TEST.
>=20
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> ---
>  drivers/reset/Makefile      | 2 +-
>  drivers/reset/tegra/Kconfig | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--up57rqki3tzs6oce
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZ+0rIACgkQ3SOs138+
s6Gtog//ZyHa5W7H1aY18Em0Pbp7cA+BnZ38GYzURxkFSqte4liUJsrfbSY9gNym
GEz2CU/pKDhPLBrBOMqg2Qp6IDk0mtvZOx53Je/YFm+4Z1w7s2Cx+JOP798zNNmX
oi9XEhU/6WK9SpDj81j/sfSZU5d+wtWjDrIl3k0aAZ+NS1bOapniarBwN3eH3FJj
aJC9XEHNqISjcPxVwA7PJRNd7TxAL/mRlJBuPbZfkXY+mCxpar/Avx9C/j2Z9op8
u0QomH2h6xwl4uzc6ltetbPQBhnp1hflEt6PQGorOJ3vLQcvaJWsBKJiJWT9D7Kq
XHVIyzyCAl1y1Qu7Ovyjo66zkbqiam/K3jQfDSO3dVlfqtz385pKjxiNdXc5+oSB
kvRTjscwxwz3C1COpejC38r7HNjR7BqRZUng7KT6RwUEdsntbHtVCZqbDXqn5iet
o8xtj1oADJG0kMcRykqlTS7IQ80p3UVqk/EnmxF+V30ZURSqfZS9FATQQhNWfY5w
/LTVZTHg7lXy0Crh/cKASewhNdESBu0DbGf8zwNm+vsXCpLb3PJA5wTX7vBww8Lr
jTa1TgLT2tUAXTnRspkxkUsC3qvXR6SsA1BlJzjHcVa1aoZVu/drtpXx9rTPDa4B
v/ickMzOJVvEy95G41iXaHug4o5AAyfY+gGKXw7+1M4YuT5nkto=
=2US+
-----END PGP SIGNATURE-----

--up57rqki3tzs6oce--
