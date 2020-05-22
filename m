From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] firmware: tegra: Defer BPMP probe if shared memory not
 available
Date: Fri, 22 May 2020 14:58:52 +0200
Message-ID: <20200522125852.GJ2163848@ulmo>
References: <20200520151206.15253-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="cDtQGJ/EJIRf/Cpq"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200520151206.15253-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--cDtQGJ/EJIRf/Cpq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2020 at 04:12:06PM +0100, Jon Hunter wrote:
> Since commit 93d2e4322aa7 ("of: platform: Batch fwnode parsing when
> adding all top level devices") was added, the probing of the Tegra
> SRAM device has occurred later in the boot sequence, after the BPMP
> has been probed. The BPMP uses sections of the SRAM for shared memory
> and if the BPMP is probed before the SRAM then it fails to probe and
> never tries again. This is causing a boot failure on Tegra186 and
> Tegra194. Fix this by allowing the probe of the BPMP to be deferred if
> the SRAM is not available yet.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/firmware/tegra/bpmp-tegra186.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

Thierry

--cDtQGJ/EJIRf/Cpq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7HzIwACgkQ3SOs138+
s6F7aw//cbgdSkP2Ni/r+B9R5WWnEoShgUiaq0OGHzyiQPzG93CZFHUiWuO9ZSW6
qWRXMZkRGZzd2fCra33fVNPZdalCHJ/zPMlNfDC4PKhPO6KUixIv8P3/fDFodLtp
0hI6lZKkifiqkjIPUgDqHm6T19/cnJjalGkcoAAzu0GdL6/thkdn/SO0SARRaE8M
9LOsLIcoIhahOYatM/+SMRmJOqLA8NncSKHPQf6AZoGrLJC/QuvyZxKVs4wH5Vl9
OSR18XfNqy7CSZxioLsOYXqunVu8+NXRvmcdCm3Bi/xmDG5ra8ekdE1AESQvp0FC
X0+Guo2UcNKGg0ntbe9Rw5vQ1iJBpyHPE8t/2Ij0Y5K1RNjFy52dY9fc1nCb1ZDt
7hbOCqmu+bNjP/Px9IWiAtsS1DZMukbX4ywHWDlGaBm5flHb30XXeRuUuUkFn5ZO
dJPKbneJFqmV5xXpTTE76ltZfSBLk8MdWWW6/nSO9OEzODFCJv9I5UQLofI/L6xh
7yNT64Doq2tSx62Jp7ZjUxdmJ5+ric3oq3SHfiQig8UgNgFkbK3Vf4dMyE98XYq4
Vgk2kWjkeV3C81BGDJflVwMxiUNjEx1D6w5gXNoJYRfOwSL2D6xw0RUKrnxxV8yX
dLYx0Aeq0Ys+Y4Hn4klCsk+MuNQ+aEY+qeOGoVOcVe2/2Pn2NRU=
=Yo2G
-----END PGP SIGNATURE-----

--cDtQGJ/EJIRf/Cpq--
