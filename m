From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] regulator: core: Unset supplies when regulators are
 unregistered
Date: Fri, 6 Jan 2017 18:29:53 +0000
Message-ID: <20170106182953.ayvailx5sxtiyzwe@sirena.org.uk>
References: <1483703678-19575-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vi6o6m3k62rmrhni"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1483703678-19575-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--vi6o6m3k62rmrhni
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 06, 2017 at 11:54:38AM +0000, Jon Hunter wrote:

> There is a case where a child regulator is registered before its supply
> and when the supply is registered successfully, the supply for the child
> is then set. Although, this in itself is not a problem, a problem arises
> when the supply is then unregistered again, due to the parent device
> being probed deferred, after successfully registering the supply. This
> leaves the regulator with an invalid reference to supply and can
> eventually result in a kernel panic.

Why is a parent device doing this?  This doesn't seem like safe or
helpful behaviour and with probe deferral we'd generally expect the
device to acquire resources before it starts making use of them.

> Addtionally, even in the normal case when a regulator is unregistered,
> by unloading a driver, if the regulator happens to be a supply for
> another regulator it is not removed.

We can't completely stop people doing this but we do make fairly strong
efforts to stop people pulling in use devices.

> Fix this by scanning all the registered regulators when a regulator is
> removed and remove it as a supply to any other regulator. There is a
> possibility that a child regulator is in use when the supply is removed
> and so WARN if this happens.

This seems like storing up trouble for the future, we'll end up with
live child devices with parents that weren't around or being refcounted
through some of the lifetime of the device which will doubtless come
back and bite us later.

> Note that the debugfs node for the regulator supply must be freed before
> the debugfs node for the regulator_dev and so ensure the regulator_dev
> debugfs node is freed after the any supplies have been removed.

Please don't mix different changes into one commit, as covered in
SubmittingPatches please send one patch per change.  This makes things
easier to=20

--vi6o6m3k62rmrhni
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlhv4iAACgkQJNaLcl1U
h9C4Sgf8DdWbpxUCnAfHmW1T6S5JsFoDTZz9vdN3nYt/vVg+WVpbGxMm+9YJ8kWG
4o8yp4P0EajhcTiVLc4pc1jDTDBtctE9Qij+eZiZs5Uw3PcG/MDYAV8OQhgmH22p
uWomSswNSG9KaH9uG4JrdflbkmIDQQ2Eav5SlssW9hrEyTMdp53rWKaR4l69lwMv
ZtmmVYJF1V2WBdgmyNTsohS495hJlHVhKWH2mzBT7QjXFQwkywk13tu4IImYA1s2
JKynSUB3WVuHGgQf2C75oXm6Y+3WkF6DuxEUgF7NiQv5Nv2sC3jl/MK81XAaOqBQ
IF+ObRI/lSUBAFncWn0PYzTlYA0q2Q==
=msvB
-----END PGP SIGNATURE-----

--vi6o6m3k62rmrhni--
