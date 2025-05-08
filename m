Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB202E40E;
	Thu,  8 May 2025 07:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746690376; cv=none; b=WZ8z90TiDcOWxE3PpVKSnGwzHkh8meVNt4kL5nYClH2iqkg9IB+7SnTT83AK6krlOyHpvECVYkCpNJaX+THhXn1x5v/ZVUZL14lwvO2UxsaCQooB2aRLWrR22UZ6iFxlW8hXZ5dScqW4uTeJxndOKLxL4BAwfBCRB5jYJawWV18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746690376; c=relaxed/simple;
	bh=G58/RTefxPD1XpbFbLmLTja1RexedYYTZNUR0UAOkos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FYnt9LDDQm8pxl9U09pHOCjHkydVi2FusdP6ng4OMUUzRJVsa4HaUJIxaIM61Sk/mbCQ3vauPCQhxzZE4mWP767DpB0m7biwuhmE8/Ps0sHh3hZ3G3gkUXZF5rgZHzcXL9m+q7s/euBzrdExAf4D6F1tMV0JMfpX0IqijM+smoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AuA4NHLN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AuA4NHLN"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-441ab63a415so6877005e9.3;
        Thu, 08 May 2025 00:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746690372; x=1747295172; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HcGj8gNNSMQUWiWl/+PK8QIb2S0v9+n3c03DjBprxJU=;
        b=AuA4NHLNHipMUtHgw+ul7I17asY+rQthhRANvCrwdcjhGrkeGHBJ1PvuOCrNLr8jqd
         fxnSz7Ka3Xyyl6N8AuAu5/m9VUFlZccmsrOCrl8sWRXA/WVLbLXuOBecRlXKMlMEL6f5
         qPQ8sLY15bdkuhzaw4MQ1zZc4bxD+t2EQ3mByCx8n1tnRxtsBaBLOy0O0jiBttbmPT4a
         R3A42UZSANuy64xbbXJvS9BCnjVlFMfMWhnNqRFey8xPQsIaQcSNq1xSpci01futxlLo
         9hUJr/FB1eJqQlVfY+ChusQirbgD2UUVRKBZxekTm8RdkwB8byY5R4pGhSx1OEqdACJw
         +wZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746690372; x=1747295172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcGj8gNNSMQUWiWl/+PK8QIb2S0v9+n3c03DjBprxJU=;
        b=HlEEDaCP23kb7HeGIlakYg/h6QPd55NYSM1oNPryVxlD7rvrRD3EoXJktBXDtzN9SQ
         xk1Tpd+alwq2IZr+Qh9B6rBVzrShtpLdtsfbMECENUIPMPGNL788/p5Js1JWNCiPNdIf
         nzxSzb4pMfp9KN9n4zpfYMJ/czH3tyDHzff7rz7eCbBCPSLMO25fu9KigOGLZJUsUBlH
         7iGBa0dU2ZQtoMHQs9LoVV8hZGufxEOOQm/hC4QwsU7ClARvpbAgVnoAhwyq8HZI9CRn
         NzAMK/nmRO3c5ThClHKh7cHl31mvYPaLTpS3irQhJE7zu1vJfSrEnYKshQDmWCtoIOb+
         iz9Q==
X-Forwarded-Encrypted: i=1; AJvYcCW6odyFBVT/RS38Iod6bDL/xaVl+Q505pRSWgxLliikW/f5MI0uXNcRqiG0sOW+S243YmUyAXlmH8UqPaI=@vger.kernel.org, AJvYcCXtWXbfrSswknflloSU9VYCYWlWOL9z2ZQbeo+jKM0lNEQvdtDsy7hFfFpCpGkmFgIDQLUf8zrwOucL@vger.kernel.org
X-Gm-Message-State: AOJu0YxRU31+zcO/lgZBL0eSiJIpFH6xiqvxSudgah/jGwC1a24EmqZW
	qS/1/fkvBYu5OEAcMvE10jXEfZEDyGoC7QsHKym1OtSm/gZ6DCHv
X-Gm-Gg: ASbGnctOXQ3ulTMoLtTiK4cBPM0IhjwK0yoBnhl9LIxkNe9flLk8U+imFJcl7DlowdQ
	VeXaWLF77Dt9n/Jgs22lMS2yan4stajAoTKB2nnirjvzPG+PkUNI5XKy6v0nkQUPDBAbpIbeb5J
	PLnzS7Vs3HvxKK1gtrohiSWEFsHMNic01OR9UMH6F3gtUwjUsIt46o45LMAX2qXZvsinVxDaoUI
	BVABuXQK8+75pj2P8inGKT6NKN+09CuYdZMFyMMc3Kdbmmaqk8/lWk5gpHTCsCzZbd6G4zeJFbc
	2/LfQ7/8NS/RE88lq0kC8RMZ4CI/aOOH8Xus35lCdVPk2f5dLDBowr0FLM0fnrBWn6Oa+SUU/qW
	cZjIGVNvyX9eYphJ3YRsAbXWBlNxpIBm8ceTxxA==
X-Google-Smtp-Source: AGHT+IFdyeJe84Wyi4RMrSVkwqucIXatp7L18urG3uLyyl5lLKVHxvrvvTbBMleanppBjUD7/EDlxQ==
X-Received: by 2002:a5d:5902:0:b0:3a0:b4f1:8bd0 with SMTP id ffacd0b85a97d-3a0b4f18d16mr4855536f8f.56.1746690372370;
        Thu, 08 May 2025 00:46:12 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae3b57sm19779911f8f.36.2025.05.08.00.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 00:46:11 -0700 (PDT)
Date: Thu, 8 May 2025 09:46:09 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/8] dt-bindings: Add Tegra264 clock and reset definitions
Message-ID: <rz64mnhdb5vu42tcerlobmulkyxvpqgeeer43t57thwzxnrcou@6xcpuiiru66b>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
 <20250507143802.1230919-5-thierry.reding@gmail.com>
 <8a26a37a-26ce-41ef-96e4-10ee09ebe704@kernel.org>
 <12d0eac8-545a-4595-a1df-1dc52728ef54@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5vaok7jgys4nt5wy"
Content-Disposition: inline
In-Reply-To: <12d0eac8-545a-4595-a1df-1dc52728ef54@kernel.org>


--5vaok7jgys4nt5wy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/8] dt-bindings: Add Tegra264 clock and reset definitions
MIME-Version: 1.0

On Thu, May 08, 2025 at 09:40:38AM +0200, Krzysztof Kozlowski wrote:
> On 08/05/2025 09:39, Krzysztof Kozlowski wrote:
> > On 07/05/2025 16:37, Thierry Reding wrote:
> >> From: Thierry Reding <treding@nvidia.com>
> >>
> >> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >=20
> > Missing commit msg
> >=20
> >> ---
> >>  include/dt-bindings/clock/tegra264-clock.h | 9 +++++++++
> >>  include/dt-bindings/reset/tegra264-reset.h | 7 +++++++
> >>  2 files changed, 16 insertions(+)
> >>  create mode 100644 include/dt-bindings/clock/tegra264-clock.h
> >>  create mode 100644 include/dt-bindings/reset/tegra264-reset.h
> >=20
> >=20
> > Filename equal to the compatible. That's the standard convention for all
> > the headers since some years.
>=20
> Huh, I cannot find the binding in this patchset. Where is the actual
> binding added?

The bindings for this are in

  Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml

There's no 1:1 mapping to a compatible for this because BPMP is many
things. It's a clock provider, a reset provider, a power domain
provider. These definitions reflect the IDs assigned by the BPMP ABI
and we've used this structure ever since this was introduced back in
2016.

I don't think changing the convention for this is a net advantage.

Thierry

--5vaok7jgys4nt5wy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgcYUEACgkQ3SOs138+
s6HvTQ//ZQLVjZ7S3522hBbALgUTR6I1RG0mLLqvMt7kOfD4yY1bDY3xu+aUgPKB
sx+YS69VUkz85gnidIk4gJNPYpp/fURfcU4w/1aOsEp+oAhdehrWCjr1MF68aIyS
xhkHGKa/qvgbPGp2IO0WLu+w850bjxHB7/XOmq/k4NiEDv+PWTTFsj5of9TqvfKY
1yEjmsFZKlWZm5/lHUuCNpY4MSOl9sGJ+x76sP3bGtanAkQLMKSdQSDc2fck3/ob
Txjs/5ZFfhdaGIHjHkbEByKFQ0Wp+2tCWJJJ+KvRCoeM11OGbID3BtNL8eHqj7P8
hOnpkJBKErl9zb7ShNg+Ek39T2zB5+xVvZZsbLM2EFVcuuwa0/8azgOYL+luZqR5
poMKQ1dnU4UPuwM6/R5iWc0/TpGgxWW4k48U98rSkt1lH3mlHbAurksY6af6+ybM
p5NZBKct7B9a+7uun8MYHRwvbAN95ecAP5tp0sQeqAx/0dnAfR+7xErMWLJJD9wd
myS9uZsm9wYhPLlgxr0ED2gBIuZ97Vv14gsDsE0glp4W838odiFOR+V6NsHsOOOM
++caibn32AVf5WjKCuc1aGNC7wT0Ln02YHDvcGQ4EJr/aMvZxC2ogUN3B7/z32r8
hjq5nP3ZI/RHGP13bBSEr75Etf/PrCgxQ4dycTyXMAfhZ/H/vqE=
=/6JI
-----END PGP SIGNATURE-----

--5vaok7jgys4nt5wy--
