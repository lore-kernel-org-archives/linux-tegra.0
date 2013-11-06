From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] regulator: core: set full constraints in
 regulator_init
Date: Wed, 6 Nov 2013 09:07:03 +0000
Message-ID: <20131106090703.GC11602@sirena.org.uk>
References: <1383722380-5845-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3siQDZowHQqNOShm"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1383722380-5845-1-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--3siQDZowHQqNOShm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 06, 2013 at 03:19:40PM +0800, Wei Ni wrote:
> When use DT to probe device, the probe routine may be erailier than
> regulator_init_complete(), so at that time the full_constraints isn't
> set yet, then the regulator_get() can't get the dummy regulator if the
> regulator is physically present and enabled.
> Set the full constraints in regulator_init() can fix this problem.

As discussed this really needs to be done as part of deciding to use
device tree to avoid a window where the issue still remains.

--3siQDZowHQqNOShm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSega0AAoJELSic+t+oim9U4kP/1fPAXvC3K3Tj80zk5QLRD/L
iJOQMir9Y67nrVQAPQ9dPsWbHYYOuNGVRlUvRV2FbUgKSF2mp6Q9CZhf586rCzhF
1Vy4YFRZjQFy55TsE2+i3rvTfi780/aNCIvU00QjVsnen+4pD7eFr5Gc0aUZK+2R
g9H7wxl78pJ8j6TjDXR+s2OQOR5aExOgl6xehECOw7WILqgGW54TdJgWC6JPrwd8
6HqmgsuYlFCpIA4hL3xUKSLBfNnm/DXJmO5RZPaCZkodUXKsd2TKJY90/R9i8VuG
3jiijGUvfSjZvAPWYy4NirzmZM6cd5wcfMFbXlGChm2fWbC9RJvrsf3DE/N76hvJ
B1Yt445t6r8FaXonxoU+ufAXsVFI+2suLISvnvdhQfcmDNv1ArgT/4VnzYnaeeI5
C5099wwCdGFuyinQMgvA1ZLFGQOIOyL0t5yMFjk4UdEzSlyx9M+syLjxFApgv0PG
EwHz60MZNTWMOFMsITBq7bQK7n3nS8/ySRs33mNUnCB4Extuv9vborZMJncaG/sF
G0oxD+XujvI4gVI7kcZnw5fabixgBCgwzO73HJaayq4tluesQVmHmvF3KgyQItxn
H6qBYfnZfuXCewfTmh05fL/hwSDwyY8zJ1PwrVhyjd8uKEvt8ceAmjO7ZSri/hjS
H8l0Zc7pQRPkAjUL+Rd5
=fAE7
-----END PGP SIGNATURE-----

--3siQDZowHQqNOShm--
