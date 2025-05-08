Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4FC21018F;
	Thu,  8 May 2025 07:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746690804; cv=none; b=j56kMQ3jkj+mMLjSxSU1lMyYFKYkpnwEir1CxAeSJUhTUzkhKCn6nlI+l+ze7jCffF43IgkQOngASkUi38z84/1kC8ljTo/93/G5I0ukA5WZ/bAGzFoyCb89BI+DkNYypvqxVqwmklhZ/hpXljL6Esl9dYaSl/5PLvuFN6cBGcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746690804; c=relaxed/simple;
	bh=f2bnkkj/n2cyfpzr0hTegNi5pWsQKVQM0GZRdvtFFEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f9Tw1YgPlABqVcwyjPpWnKXaDj0wb89lvP+++JrwyHRmtRA6d97e7sEOQLjScsxEiIJ9z7KhiXt68GtBe7gQlbRY2w6Q1p9ECfEaRjHYXPMphh2lbQoO6wnBok8+8+1uuWJrvTPxlQP7rI0FaEU5xit4xbPGa6Qz3LukcB5nk+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M7ARREVR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M7ARREVR"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso2859035e9.3;
        Thu, 08 May 2025 00:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746690800; x=1747295600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjCNEO6c43Jy15stRDpxryP+REb893ZkVxfJRigOY9o=;
        b=M7ARREVRKCYNHU4oil7jq1bo3o7TIteoAoUjQEGCM+cf+kHhJ0PT/pqgw72WO6ixUW
         2OShMWUwQLFwPdVpDLn+8RPMXU5/TFXQ/UYKjVaA6EpmzvDn7V1L5x/c+v8v0h2XP8bt
         a+x/h7Y6lpHXkGHoTpav/kC5JxE7OHTsRcJjKkSxDjjQEphrPRXjYxcdfxPleaQkoBVl
         MH9gMc7rLiEosmkJbpvbJMhz4QxqofFjlLtxDNhKKOoJFW0kRobvy1+yuqk6LB7MHT6W
         DfFCtLqNBT1I2lUrLPEJ8et34eDBWlgv4wHMTqB0yyS2B7AZmlb27sp1v9LahuIWhFk8
         MlWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746690800; x=1747295600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjCNEO6c43Jy15stRDpxryP+REb893ZkVxfJRigOY9o=;
        b=ElLjrfbMXOsmdPsA/bnE1IfBMlVrKkkKSu8ETkxoYUNzgHIHaj3EuDuXiFvrvHnkxn
         ftYzvXgtQa/Ttzer5goVvkPzSR9UfbduPYWqbVtzAWw5iOczCtr1+/61p8jq/wHkLmPQ
         LkUuu4xE4Ov30nIBqAH4+i17mxHuVjVP4iAIPHlgf54vT35z3XZLxavvOwKYq0QsArJR
         i+9ZpacWhzkuEZIPTCH3pQOFpjV1/K+PAX0P9PNPmEyiZ/O0h6L8mZrq+MyUcOUu7Wkw
         inCfnOTO4fynXKu0lhpo+g0IrBMU22LIC+KIQn/4iOvv0mHmyKiJLwWi7/hjikyD9l7D
         i/hg==
X-Forwarded-Encrypted: i=1; AJvYcCXMdP0h7BOWfvHw3FDzBIXGH5KLEU1Sj7ltHNKJSd2/ZoqJaXXLbkA58r4FD7FD7qua0XFlkIEYqSGjj8g=@vger.kernel.org, AJvYcCXP+GSrDG5CQaf09Nu4LMN5XEdTQASklxcweruG9Id4OR7zsrYrNhxoD52yr0tPvTLWT/uVoCzfPAEW@vger.kernel.org
X-Gm-Message-State: AOJu0YzCET+qOvRWM4dcqUOJg81f1Kp5R7bS7h2rtNnWWvnDNS9Mv8VA
	w9BNJ0eeXOBTElWfo3V4Y2p/ZzqNbwrXVQCFV87up3CEvde6D4foXK+d8A==
X-Gm-Gg: ASbGncvkM5TRfmSmFk6t8aO2o2BvbZIacwnKqw7DMwCa75TxuKZDSPcFZu0op+EAZ10
	G8lnfE0Zq9EtRDAiWLQ/lUe2KkR6mP76Lyt1bQaNylasMxiJM1BvSFEutGexXCLXUSdM2LhPbDs
	6d7D8QrRlcMdegpFnmXat80aNgb4S3IkDkkZhEvupR8YaSLIn7gNvcxwotnVZh5TAYKd5k/RDlb
	W/kuuEU9bC6LqkuM8ZZ3CpjyG4+zX7HLDNem6kS3rA35zpnaCtfPGcKxz4epqcAMaktsBbKX8+c
	gd4zLrEu8SfUXTKJFHKJZ5UPxMgNAvPwbq2j0PWyg0nuHRCqejUy7L0BKm9DKCQdg34DLrTr+z8
	3/8BqCPdtIJOQDZ8LF7Svbll9wuQ=
X-Google-Smtp-Source: AGHT+IEkK6XgFL1w7UDh06L0Z3MP75/mJB+jf599RZcC5KOle0Xkg/Tk+xGPkJOdI/Jkn+XogKb5+w==
X-Received: by 2002:a05:600c:608f:b0:43c:f44c:72b7 with SMTP id 5b1f17b1804b1-442d02ed5abmr20082695e9.14.1746690800158;
        Thu, 08 May 2025 00:53:20 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7b83sm26816445e9.33.2025.05.08.00.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 00:53:19 -0700 (PDT)
Date: Thu, 8 May 2025 09:53:17 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/8] dt-bindings: Add Tegra264 clock and reset definitions
Message-ID: <3gpirue4rr5hpgynzzadzlr6i2fvdhaugcutyqyfoeix2zf3fu@xpbdadb5nynu>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
 <20250507143802.1230919-5-thierry.reding@gmail.com>
 <1ec7ed24-a4fe-450b-8f99-34aae6ed2c4d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zuyd7grcpkx6nwpm"
Content-Disposition: inline
In-Reply-To: <1ec7ed24-a4fe-450b-8f99-34aae6ed2c4d@kernel.org>


--zuyd7grcpkx6nwpm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/8] dt-bindings: Add Tegra264 clock and reset definitions
MIME-Version: 1.0

On Thu, May 08, 2025 at 09:40:02AM +0200, Krzysztof Kozlowski wrote:
> On 07/05/2025 16:37, Thierry Reding wrote:
> > @@ -0,0 +1,9 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/* Copyright (c) 2022-2023, NVIDIA CORPORATION. All rights reserved. */
> > +
> > +#ifndef DT_BINDINGS_CLOCK_TEGRA264_CLOCK_H
> > +#define DT_BINDINGS_CLOCK_TEGRA264_CLOCK_H
> > +
> > +#define TEGRA264_CLK_CLK_S			2U
>=20
> Abstract IDs start from 0 or 1, not 2. Also drop "U".

These are not abstract IDs, they are defined by the BPMP ABI. We cannot
change them, otherwise it'll completely break.

For similar reasons I'd like to keep the "U". These definitions are for
the most part directly imported from the BPMP ABI headers, though we do
try to be selective about what we add, to avoid adding hundreds of new
lines in one go, and several safety-checking tools run on these headers
that happen to require the "U" suffix to make sure these have a defined
type.

> > +
> > +#endif /* DT_BINDINGS_CLOCK_TEGRA264_CLOCK_H */
> > diff --git a/include/dt-bindings/reset/tegra264-reset.h b/include/dt-bi=
ndings/reset/tegra264-reset.h
> > new file mode 100644
> > index 000000000000..31d89dcf62fa
> > --- /dev/null
> > +++ b/include/dt-bindings/reset/tegra264-reset.h
> > @@ -0,0 +1,7 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/* Copyright (c) 2022-2023, NVIDIA CORPORATION. All rights reserved. */
> > +
> > +#ifndef DT_BINDINGS_RESET_TEGRA264_RESET_H
> > +#define DT_BINDINGS_RESET_TEGRA264_RESET_H
> > +
> This is empty, drop.

We have three people currently working on additional drivers for this
SoC and they all need to add to these two files. Adding the empty file
here makes it a bit easier to coordinate things, making the resulting
conflicts trivial to resolve.

I know this looks out of place, but I promise this will soon gain
content and won't stay empty forever. =3D)

Thierry

--zuyd7grcpkx6nwpm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgcYu0ACgkQ3SOs138+
s6GlvA//TzkpS/Nemjcf+t1Lue6ZKkM63tyULSWi2sNg+LkhfmxFLykgv2SvNo/r
pydd39bVODAD2U6bSDRj6JPADOrbiVJgt4s193nCOzANQeGHjHdgOlJYqApa7Qq4
NufMJOCrqkKDTiRlkVDZ9jqfa5TFgL3aeo8WbUDy9gbGXbrmU+4S+Sh1Mz8HfeTR
FyRqKNjwRdkk6S+yIMrKAOduaIUFua9i3Ysjid6rl9yHBWejINPduthxWo/F9Fgm
fviIn2w7Vb6sVtxon2EAOvtRaG8bEcqJMiwl5XNOqai52rBUectR/D4GxFUrOr5C
2C5XUKmRCz3w+wSamsWQHPZWYhdsbxP5wpMr09DIiQFcAPgqLjKFWYkMtQbuMqZM
k3LaTIGnYJgsbVo9rqJDERhMU242F4f0ci0Yr49bbx5walyoeJ5XMWdqyDpbSu4X
GGTNEjdD0hsYXtt8FXx/vbLPNRHYmnWzqj+slH7mhjE10L4ArOZSWUGiN4PZ9+8K
k2pscGa1pQ08wyXQPvboitMrV73BY+jdbFB2EU0bhV6S4ByiwHL624hj/0bcchRb
5K3kiWfeCOriN9+mGtotvPQuuWVeM9UNhLEOotlx63rt76Z0NGUwo6pMICXTSyUK
sWz982natgliIbnbLvzF1ujgFy7i17dA4L3sCcr5CvaF1g9vk4Q=
=9v4v
-----END PGP SIGNATURE-----

--zuyd7grcpkx6nwpm--
