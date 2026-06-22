Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978C6233943;
	Mon, 22 Jun 2026 07:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782111875; cv=none; b=Z6G/BbexL2SfTC314T1y2seT7Iohff+d4OD2LrOUHBQexDePKG03Jvy3XXzmS7p8rGenX4tAHwP3GRdKPRU5/1H0oYaLajgfIGUiHkBlKlcc7T5RXs5gCCXrND1kJlC7vgq3b7xtyhucdMRl17L0OHZR6yeAEpE7MJ5mum3a/1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782111875; c=relaxed/simple;
	bh=UbNJnuerGh4q4ToICsX6i8zHBmu3xsL+j9gQjxEtDMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=csu70utSuFpsQI9NpFBz6M6Kv8G0Zyjiv7RgTclNO1AMU0zKKEylc6QTxbUUWi2B4M6H6cmNynAj0EkI/Glarhth5HAWEg2A8MaPM0x7Pm5OuK+Za5F4rsuDcf/hrTgcXoOtyGU2SKDki02VXuXwZse/9Zc0fxIsHI7cKdIs4Jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DSss/aNh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DSss/aNh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA5431F000E9;
	Mon, 22 Jun 2026 07:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782111870;
	bh=g1rMvR4BAP4ZPKWW1EX/tGbwsFUPenAODMV4ZpZFRvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DSss/aNht+s2XWhsEZ5YgQxL8ghMwK/5ZNyEsszOSCDLFILtFD+cFK4oHdEo8KUW7
	 +OEy4XLURW8VCQ2UIL2Y1agAMScgh6dJYCpARkmYBdL0o4VZm8iFMq6/Lgvpa45nKF
	 /QA3BmPTskyBxzrm9ZjODJIPlQYGkv/mXgwkKibYgGbVZ2rhpWTblcYn1mkJtivrhd
	 WZkJsbM74NSQbjxIOjg+TBD2Cztq8NQHKjLOuaMSCcGTD2LUFanRXuuEjCJThbRZ8T
	 mx+oAmutMURACU/vOIl2+gY69UqgzkCWnu5MYQq4obw30ZSWlcLVhTVbJ//cMjN6sO
	 qejWoxeqVxMqg==
Date: Mon, 22 Jun 2026 09:04:27 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Runyu Xiao <runyu.xiao@seu.edu.cn>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn
Subject: Re: Question: GPIO direction callbacks calling pinctrl in atomic
 paths
Message-ID: <ajjdGVcCNAbIQIfj@orome>
References: <20260618030609.958831-1-runyu.xiao@seu.edu.cn>
 <CAD++jLkL+WV+WYCy7YsQ6n8ZQH27gLHQKf+-CYiV3GU=dbgcUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4vdl7e4mygnoznd4"
Content-Disposition: inline
In-Reply-To: <CAD++jLkL+WV+WYCy7YsQ6n8ZQH27gLHQKf+-CYiV3GU=dbgcUQ@mail.gmail.com>


--4vdl7e4mygnoznd4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Question: GPIO direction callbacks calling pinctrl in atomic
 paths
MIME-Version: 1.0

On Thu, Jun 18, 2026 at 03:25:49PM +0200, Linus Walleij wrote:
> Hi Runyu,
>=20
> thanks for your report!
>=20
> On Thu, Jun 18, 2026 at 5:11=E2=80=AFAM Runyu Xiao <runyu.xiao@seu.edu.cn=
> wrote:
>=20
> > The class of path we looked at is:
> >
> >   gpiod_direction_output_raw_commit()
> >     -> <driver>_gpio_direction_output()
> >        -> pinctrl_gpio_direction_output()
> >        -> pinctrl_get_device_gpio_range()
> >        -> mutex_lock(&pctldev->mutex)
>=20
> Again that is mutex_lock(&pinctrldev_list_mutex); is it not?
>=20
> If we go with my suggestion in the previous report to just
> replace this mutex with a spinlock, I think this issue will
> also be solved.
>=20
> Am I right?

I'm not sure it's that simple to convert this to a spinlock. One one
hand this lock is taken around calls to mutex_lock(&pctldev->mutex), so
those could sleep and a spinlock would be wrong.

There's one other case where in addition to the nested pctldev->mutex,
we call some of the generic cleanup functions under the lock. Luckily it
looks like all of those should be safe to call under a spinlock since
they don't sleep themselves from what I can tell.

Maybe the locking order of pinctrldev_list_mutex vs. pctldev->mutex can
be changed to avoid that first issue?

Thierry

--4vdl7e4mygnoznd4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmo43nsACgkQ3SOs138+
s6HjGRAAqOMR6Odf/JInwD9zY7rwG4f40bJFhhvW0qbKUBkDq42m6Y5gF07N4DvE
nu7if/rtWnStTE46m79PdLANcH6oNqFTT2qIZilXkJGKCFNWqgWvJNEjmfO0C8/u
vl0ZwpFRsFaREY2Vx/9bqgozFj5rcOqrQpEK1OKcHDqar0ITZDYiINKATKFt1kdz
tqr40iGBSPp0rzK8hThPisJohlRDJgo1ycZAWsVW6/4tR8at/R1xyJUuR2eF9QQx
oP3kLONEJSA0VGnYPmVf7BDR5419Uarukel1u2Q4O0ohgxH5HmelOBfXJ7j45zQP
V64XamEb+pLGOFzpmtpOlExTrivcu3Rl/DIe9OV+J6BLry5aejZgA2CZhK5r6diL
ntDSJEVBsravrmBYJc9DFr1DCPpXNNrotKtNnA8qbAlXD8igvfPtfCbkiR2leaFr
YVayau8zmNoC+DJO9oGLef0dz9jfNtOROelD/9Y6Kl5pwadfMSN/z51JlHOnJ4bg
UmD0h2NbmOuG1zNs0DYXhPosaiho9/druRh/5vQ8d6BWQaAQPvXTkyh8uRQtECz8
HBz27inJA4hftc2wOqQHZOkLwpEm0hZA7G2d8SBO4oBQKvng43/Mt1xQ54G2PNeJ
6WbS+/CRpxj1CehPU8DCSvP9IkszRhE2WhVAQRp+Dyvl2Ca8J3o=
=LA6r
-----END PGP SIGNATURE-----

--4vdl7e4mygnoznd4--
