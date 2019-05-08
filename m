From: Mark Brown <broonie@kernel.org>
Subject: Re: [RFC PATCH v1 0/6] Introduce machine-specific regulators
 coupling API
Date: Wed, 8 May 2019 17:05:13 +0900
Message-ID: <20190508080513.GY14916@sirena.org.uk>
References: <20190414175939.12368-1-digetx@gmail.com>
 <46665d2d-aeda-4b63-1d0e-1599214e7bae@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="CpRwOJvrTIYkeTuO"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <46665d2d-aeda-4b63-1d0e-1599214e7bae@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--CpRwOJvrTIYkeTuO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 05, 2019 at 05:57:42PM +0300, Dmitry Osipenko wrote:

> after bootloader. Currently, in this patchset, we are not allowing CORE
> voltage to go lower than the level left after bootloader and once all
> the relevant drivers will get support for the voltage management, we
> should be able to unhold the lower CORE voltages around late_init().

That's going to break as soon as someone like a distro builds drivers as
modules, you can't rely on things getting done at any particular point
in initialization or indeed on any given set of drivers being available
in the particular kernel that the user chooses to run - if they decide
not to build drivers for devices that they don't use on their particular
system that should work.

Overall this feels like an abstraction failure and you've not really
said what the constraints you're trying to implement here are so it's
hard to tell if that's the case or not.

--CpRwOJvrTIYkeTuO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlzSjbgACgkQJNaLcl1U
h9BIygf/UDsx2Mvn6tUgdKjwd2FK4/61FyNOrCOHq8yIsQJaCv+pAISiYiBYbZJV
p1MMMbjsrGO+2p3hcXsGgK8/lGtKwMK2zHLlQW2ZOK3rShmBXfA5W1uyunwj78Tu
6d+RB51jWzFUKI9wuGkGlv8G4kP4duFpuyzd8ENLpO5toHD0CuE+twv/mS/WXMN2
4KR7WgYaCeztK1zWhBbhViu0H0hTSq49GRCeQLt67dQdchGU19N/rO27cm1iwbjk
LLGRIEhXyfn6GkZDl3YiTTrkYpfRm9eROQEzGm0oG5aMe/ZtZ4XFGxdiQWzqSfjl
AXWIb8nqZkseDVV4WfRJIdJveYS0+A==
=cGV4
-----END PGP SIGNATURE-----

--CpRwOJvrTIYkeTuO--
