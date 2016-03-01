From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] dma: tegra: don't open code
 of_device_get_match_data()
Date: Tue, 1 Mar 2016 15:26:28 +0100
Message-ID: <20160301142628.GA26201@ulmo>
References: <1456838680-3220-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456838680-3220-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 01, 2016 at 06:54:40PM +0530, Laxman Dewangan wrote:
> Use of_device_get_match_data() for getting matched data
> instead of implementing this locally.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/dma/tegra20-apb-dma.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJW1aaQAAoJEN0jrNd/PrOhQnsP/08PMVPUH0fT3am56TEi5MYx
vd2Ft1+MszmASDonTmtzrKDzw4puFnTfLs/e6gdbNBO/3yu9/Bo6qZaVD6xT6q8L
zCHg5Z3Uuyx8fmvV4NlF+Qxbcge22EwbBQ2R0x/zSiFE/qKWf1Sx0Kty6PqWK1bL
kHna/+0A51fU4O9NAgrhY7q/O3IczmbbMuIg4X36J2O/He3juoNpIzJPkX83ZE09
14wwI3oAu51T7iBRRFyo2ld/FomPsR1eoFRh6Wv7+ytTO4U6ORX4WZDWu8/i72+I
iHncH0NS9S4AQsOfkLmubk69PCQeVC3cBhiI9MKbh5PKkZ49tVdYn+uzaqqDEd5r
0+ObpnHeMFx/humNXguFhF/HvOSHT150piKGmzqObwyI8BPUa+ozA1vukkWa4fQO
Q89gvHTtnyCklZfToF029lXjtPfSYEsNIx8/gx0FPeinESVQceNIs3xQGAFFJVpx
3XzJKTImZhti8CfD3udjG8UYrOiIqry/2TVBUugLNaPwG55E8UdE7h9YC6FuHTRw
2LKLuh78IJ7FGryjtDiYSN+ATYLTTcJrJ7ZGue8olyPxX8lDYqZ5a+/kbuTX/Whn
b4APqpyYExgQz42+p6CNW6QJS1bfEjU0u3H3nobBKGFwgvv3NbFDV/bncbypvBzS
kI7bIO7Hm3EiMd2OnNN9
=KYBm
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
