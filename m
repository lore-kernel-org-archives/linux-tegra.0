Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6FF19D065;
	Thu, 18 Jun 2026 06:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781765564; cv=none; b=bPBIb7e+/3AwP0J1O7sfex78aSvphhu5E8cQ5pwwla0OLOwoNqxs7lIFB5uFKu4ZamA1dT14jlgg9Aw1FmYwTf+XccUFUPVqkWP6LBgFpeE1eaCcji2ciO82PN/ZrGbx9VBin6IH/xJql5Q/6PhLmcdRL3c+dvM5pnZtfaPwp1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781765564; c=relaxed/simple;
	bh=dulbe39ZlX0nZuPRQuNqykVgjNgct4pUYR6VqyXcnN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkeYwzXKqRnCr1KPNpluqjWXmLdKzQpCvGIxJpPuajcSGXNOD8AeuVIToqqQKtHve2Iz79LjeCrCaZztOtIOw7xapyp4Br+snm0l5Ikvx0SxFcB5lVPHUgupcp2inon0kYMgGpZ0VRQLC+muKUzfawf8rNZsZpzi5/W9N2SrP4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IjBYHkhX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IjBYHkhX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E51341F000E9;
	Thu, 18 Jun 2026 06:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781765563;
	bh=wPQAZTGMjJDD8OGjHuPC2oUHLj4eq/xesViaAz2X9SQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IjBYHkhXvRrDUfEFVhzvAXRNYtmDiTaih5W2+l3QC9WixFqKW3S++s762AxxpZqQF
	 u6z6WHWgNMCRrfNfCTHifbReE94FuilxxhPkL5j6r87T08Vfgq66ebcb4rLA/HBBWK
	 Z95w08fxc1HFGgQFI7r4wymQS2D7dTkq1t0NImOzhShP5rsMlGROOXiPpPNWEQkKWp
	 ojLjuawIja6ixVhvZ7B3e4MQNI+yzxI3j9SoFc6uKyqG2APBUjVi/q1ijHEEimIcNw
	 pxIzy1gNhsiYOheF+/JlcCliMlW1YZYKOanNNeiwjqKI4AwLBS7TbJNtYiDaJq/741
	 H+8pMDvMdtvZw==
Date: Thu, 18 Jun 2026 08:52:40 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	jianhao.xu@seu.edu.cn
Subject: Re: Question: GPIO direction callbacks calling pinctrl in atomic
 paths
Message-ID: <ajOUGyBCBwmAHpbE@orome>
References: <20260618030609.958831-1-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="76gqvsuxv5xqgfxy"
Content-Disposition: inline
In-Reply-To: <20260618030609.958831-1-runyu.xiao@seu.edu.cn>


--76gqvsuxv5xqgfxy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Question: GPIO direction callbacks calling pinctrl in atomic
 paths
MIME-Version: 1.0

On Thu, Jun 18, 2026 at 11:06:09AM +0800, Runyu Xiao wrote:
> Hi,
>=20
> While auditing GPIO direction callbacks, our static analysis tool flagged
> several drivers whose direction_input/direction_output paths call into
> the pinctrl core even though the GPIO chip is registered as non-sleeping.
> We then manually reviewed the findings against the current tree.
>=20
> The class of path we looked at is:
>=20
>   gpiod_direction_output_raw_commit()
>     -> <driver>_gpio_direction_output()
>        -> pinctrl_gpio_direction_output()
>        -> pinctrl_get_device_gpio_range()
>        -> mutex_lock(&pctldev->mutex)
>=20
> That can be reached from shared GPIO users while a per-line spinlock is
> still held.  A minimal Lockdep reproducer preserving this direction path
> reports:
>=20
>   BUG: sleeping function called from invalid context
>   #0: ... (&global_shared_desc.spinlock) ...
>   pinctrl_get_device_gpio_range
>   <driver>_gpio_direction_output
>   [ BUG: Invalid wait context ]
>=20
> My first draft for this class was to mark the affected gpio_chip as
> can_sleep, but that looks like the wrong contract.  gpio_chip::can_sleep
> describes whether get()/set() may sleep, while the problematic operation
> here is not MMIO value access but an extra pinctrl direction round-trip.
> Rockchip history seems to support that concern: after the controller was
> marked sleeping, a follow-up change stopped calling pinctrl for
> set_direction because whole-chip can_sleep caused atomic get/set
> warnings.
>=20
> For PXA and Tegra, I am considering a small series that removes the
> pinctrl_gpio_direction_input/output() calls from the GPIO direction
> callbacks and leaves direction programming on the drivers' existing MMIO
> paths.
>=20
> For PXA, the driver already updates GPDR directly in
> pxa_gpio_direction_input/output().  The proposed change would drop the
> additional pinctrl direction call on variants where pxa_gpio_has_pinctrl()
> currently returns true.
>=20
> For Tegra, the GPIO driver already programs the GPIO controller direction
> registers directly.  The Tegra pinmux ops appear to provide GPIO
> request/free handling, but no gpio_set_direction hook, so the
> pinctrl_gpio_direction_input/output() call seems to enter the pinctrl core
> without adding a Tegra-specific direction operation.  The proposed change
> would keep pinctrl involvement in request/free but not in GPIO direction.

I looked into this, and yes, we don't provide gpio_set_direction
callbacks for the Tegra pinctrl driver, so what you're proposing looks
fine.

However, I'm on the fence about this because I think conceptually it is
correct to call into the pinctrl subsystem to set the direction. The
GPIO driver should be oblivious to the fact that it isn't strictly
necessary.

Thierry

--76gqvsuxv5xqgfxy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmozlbgACgkQ3SOs138+
s6EpxxAAgB/s8O5wDTVax61SHGH9+PmtoN9p2Tly3hpJHS7MDjVTE5XCq+LLNbXj
lTBt/TDj8AVed9u8FMlnMx7YGXk4k1FE+JU4tms5w/JvjnvBXsgwX+PGcZSpuaAl
p3UzA8B/pltQPyaW4CncZ2BPogj87WPS2i0itgDkGBQMz/y/y8dg1yZh/j/htl9h
ERfwGteCOIko8QUxfFWS3Xn/NakCH9cQxJHQOdudOY6wn8YW3l+jbVssIFc52H6B
GX7ED64Ot8VzztfoIsrvzFWCdtbOcW4vdD1xGihQkYOo/YDpTqY5N1L/qSwDQrc6
XcO/bbMfUVRD7SNNhAmwRpkASywNZKuWzTgdF5iJI6yGoEsovhaGia9e3oqms9rO
GUQx7tnDnnAM3ap6w51M+WaQO6M5brT7TIewNE1RBzJpmiffgdTPThg2t8ys92SG
xjKmUI7aptcbn6sybcITHUvQ/DTfd3izkw+xmvmOXCwXfnj1ggJhJ3Y5LlaZ22Yi
g0VOxQAvXY2DBLUMWl+AqXXSmyDL/P6DpHiCkcq5jkvN1YfiTav+Ho53pMG4kFbY
DRZG/wLy7ech+UTK8CrA1TaOK1Nn3bAlNauSH54iXGJ28GKI4WMvqLG90za26HI5
3VGlWFVlj/rpZ6ZIYw3CNft3rIyRcWVgtZNr3JdNE3BTnJQJeiI=
=+cNP
-----END PGP SIGNATURE-----

--76gqvsuxv5xqgfxy--
