Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B4E1F4C9D;
	Thu,  8 May 2025 07:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746689516; cv=none; b=hZOFEW84AMpVKT0eXKnNO4/Q4aRS1HE1W7p4650AcZtUgT6MBHHXwpc5LbQd7Ly8k/QiBqROXI7iNnjOew017D0Wo1oz2L5yBFWrxFrNYeamB7SuOQH51/7bSYzE6DI/jG9xvUkYnaFzPDuNwevwVxxvlDb0ZjPgiW908uRkaqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746689516; c=relaxed/simple;
	bh=AgHutt4HjBaJU2TcQQpxJ89vhSA7SHhMm+HCmWKbMAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BI7t768Liu28mXpK2lfaESgOH0Wy6t0n1D6Itdwjh+PWdZaUvpvpQNErzc0rHWayz9hbKVEylphcyC9TNcOWlq4/52zM6CcTWwgpo9UzKw19DEGkyEugbJWMeeHqVwTO+Xf/DM4l3kFQezJSgA3ge+sVirVXJHcXqytlkNvVMQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L1cSEGmh; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L1cSEGmh"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a0b6aa08e5so959168f8f.1;
        Thu, 08 May 2025 00:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746689513; x=1747294313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aEjJzYsdHCDfg7DEYH2Vg3tOhB12CqNu2FmVJukJ7SE=;
        b=L1cSEGmhzpsKKLorpfX6rSJvpJaFQkVeN7qRNuXBzqa64UTSTNQ5Xnx0XnuWMwWdhK
         5Q/j05hJrc9wsSDG5xMPqvYhBDhfYHsY/n8jw8KtSz3wpK1cOoztTKXxsa1G0CizCHGY
         hJjKqd2Dd8pDaTnfJHzQ+ZaXZ/0a9BRnMY4GRrL2Pt53tNZmFe0TSBm5QHPYek+eW2Rh
         rnDPAba6uhiBaS5DNYvE/Dcas2i2jN6pCv84+ILH3Oh70qNaZ83Sh5vi6gZu6LYumP4e
         7RjPl1bhadFgZljXgPNzcfN44+pDjyxwjEZv6jt+pzw6JK+d5V18/u9ckV/Z9dIAbErE
         ZhWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746689513; x=1747294313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEjJzYsdHCDfg7DEYH2Vg3tOhB12CqNu2FmVJukJ7SE=;
        b=aENPfJizJ7rbFxOIGkMyp8j9p4QP8oVHxjH9KvmdP3gIeD8GYQRNsVGnw0U3JiDkIf
         mlhkRj/3tKCnzdHr60eN57jOp4yBrMF3cdpPiVYDSAQ+SIHI6//tj76wOldydbw2o2/M
         D7a/1ofAgZuA8MYq9mIZGGjbyicaALyqJAzu9WBhw1YmYdYYr+KBhhz5dCt3+01yI70U
         i8JvR40g9XRVILxxgnhDPXw9MLqr9ffTQuyLnUqbwBSWn7UzwtUYUK6SEYHPb7hHb0Xh
         3Ikk5aYNSH61f1gyjbgyr0rMaGAI1j3CnH8tpQThSDXy268t9p8oPZrEX7afkzrlTDv3
         rwDg==
X-Forwarded-Encrypted: i=1; AJvYcCWPU3eoXSiiYiCwLJh+NzjZvSn4uqyL61e7F3Y+Ilmi56By81EO8Not8ygXW0F/xMprwm666JdkfzXk@vger.kernel.org, AJvYcCXpRoT+TJCKsIMAqk0K9lZ4bNPbxEtBFVOP+kzX/RAMcBmX2WSAeV/QbxstgWP0cH/ZOppeDRSpxC0x+ig=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/f304FXMoRKJfOyjcT0v64OmRUjgCGEYpaDAnC3i0sxIj1qdR
	FiX0NQrvjnZO1tPVkj5ASAzdLsK9eiW4zzm2B44PhEmoGzGk2Rj++gEFxw==
X-Gm-Gg: ASbGncs+1KVzOrhAMzJ4jGvjYOyRwRebL9TP5AijUwBDmbH+ogPV8LaLNsZadBa1yTw
	En+3WPSNrMqbPUnnTih6StfkH7w4jD0On8qNKOgdL0agCNdL8Ouha0WvUv5jOp4yb6AYJlTJHeu
	b65wbxlW65uAGkHiBBS3rrNoVS6EoYPid8j1GnSgAo+vQmZxMA1HyEXAOIZwBSs3/ia0hD8AvFo
	kBX+dql0do4uhjCbj8xDsWRHv36w4ugatHTD615VzAUg135rfRHa9DqCpl0qz1i36987jmvvO9F
	BdVZNy6PUQxs43LDdEyTD7cPTWaIgjkStqFs0s3+Gg9sihXJRVQEnsdq59d5JINx2QTiU6eZDUG
	7NcmmGMGdihzjRsXnEsVrpZ5sRkM=
X-Google-Smtp-Source: AGHT+IG1yR4rGhWUtkmkWIDRYUZ1wU83cR5nh3D7k/LMR2j9TYQMYoaizk99YqloQtl2YMEFecyY4g==
X-Received: by 2002:a5d:59a6:0:b0:3a0:b84d:816f with SMTP id ffacd0b85a97d-3a0b991fa38mr1910968f8f.14.1746689512640;
        Thu, 08 May 2025 00:31:52 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae3441sm18991273f8f.26.2025.05.08.00.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 00:31:51 -0700 (PDT)
Date: Thu, 8 May 2025 09:31:50 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 5/8] dt-bindings: memory: Add Tegra264 definitions
Message-ID: <apxlsl54wyigk7yovtrb2tadhhsad5ti7hdvueisjcdjzfk443@4q3fv6pjaac5>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
 <20250507143802.1230919-6-thierry.reding@gmail.com>
 <b6d4f40d-9ad2-48c7-a5a1-55b2ebc4e21d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e3xoqdmdt4ognzxn"
Content-Disposition: inline
In-Reply-To: <b6d4f40d-9ad2-48c7-a5a1-55b2ebc4e21d@kernel.org>


--e3xoqdmdt4ognzxn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/8] dt-bindings: memory: Add Tegra264 definitions
MIME-Version: 1.0

On Thu, May 08, 2025 at 07:48:22AM +0200, Krzysztof Kozlowski wrote:
> On 07/05/2025 16:37, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > This doesn't currently contain any stream ID or memory client ID
> > definitions, but they will be added in subsquent patches.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> <form letter>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument, so you will
> not CC people just because they made one commit years ago). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.
>=20
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
> </form letter>

get_maintainers.pl lists 13 people and 7 lists. That's *way* too many
recipients for something as trivial as this series, in my opinion, so I
tend to curate the list of recipients manually. I guess I went a bit
overboard and should've at least listed all DT maintainers explicitly.

> > ---
> >  include/dt-bindings/memory/tegra264-mc.h | 13 +++++++++++++
>=20
> Filename based on compatible.

The compatible string for this is nvidia,tegra264-mc, so I don't know
how much more you'd like me to make it based on that. Do you expect me
to add the nvidia, prefix? In that case it would be inconsistent with
all of the 8 other Tegra MC includes that we have in that directory.

Thierry

--e3xoqdmdt4ognzxn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgcXeYACgkQ3SOs138+
s6FnRhAAku1QkoTdXibdp5EpZgLKfuxNx35sXUWwmNNtesCln01v1iYHZOaLyb+K
iwKOk7FgCfezvEJme9J9h3EV/8vIC+yb6mloPJoxTdAhlg3cdNZsoEP6S4DMSsrW
075z/nHmiDElbmm/SvdI/rKzgLZpIR7AyLSdDPWCPJl37V4C1tjLsBbYvwh1D2Xg
z4uwCrJxXHgXiK+AS4BD2sHFxJBkbiCjBHAPj1l6aVAs+sEbhryPYHihLaZeDcMr
+5IcuQ5Uh7X+0U83bAPUoi+q0SwELcZA5ZMqnVSEAE/sCjc3Go5umZxXLXD3AevS
oRRy3bks+flYkWoXNB6+V+Ii2hnUml7OunJglKk0o9aGiUjhabyylYWUv5BnrO+v
/rLl9m7JdeTU5nywOP+du5ajzss+0LuQokF6ZJ4DcFob+vRrOYIsCUCzvpXvuwiN
NCf7iDwl1fqG3yHZOI4l1KuwZjsdYQwKaek2U7SxcxuRoerdHPggNJ0i40hBNy6L
oD8LRRTeblZ1XiIqkLEs4fiMNsANUHtTip11osb8OihjqhF/vHp7xi60vCwLjF2L
YjQP/NTFeJP+vo8y4R2shkRC34en9Bw6kzQMdHjWRsFHpwJafVVU9Afti16r98eo
5GnykrXF8WzThPYOT8e+VcJ7OXPwCHNbewJ2x1W3N3opQHbnUJc=
=FUct
-----END PGP SIGNATURE-----

--e3xoqdmdt4ognzxn--
