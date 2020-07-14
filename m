From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND PATCH] ARM: tegra: Enable CPUFREQ userspace governor
Date: Tue, 14 Jul 2020 10:32:04 +0200
Message-ID: <20200714083204.GA141356@ulmo>
References: <857e47b0-e226-72b7-3855-f668c49c0739@gmail.com>
 <20200713144134.24444-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200713144134.24444-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2020 at 03:41:34PM +0100, Jon Hunter wrote:
> Enable the CPUFREQ userspace governor in the tegra_defconfig so that
> we can test CPUFREQ with the userspace governor with this configuration
> on 32-bit Tegra devices.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/configs/tegra_defconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thierry

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl8NbX8ACgkQ3SOs138+
s6HISg/+JuiFw9nGbsOP/irKv8Vx0dMGLWMDijFAkC0sXWgaR5PUdV4FWNwteZ7X
ufigQ6FZaWrjvR+o3AnrJ8GmKvJHogiD2vPKyMrODti3d3wbl66AzLhsY0LLvCb9
+tqYZ4/Pvc2B9Sx6IvseaxUyAyAUwcBdZbEkeRW0UDS6fKaTsSEWKOxohWujgvEA
zFvCFn/drOtx24D+bD87bNVlEdo9tvBr+U7X6CIsx2AI+a8cV486Ts43u4oZx0OM
NzLO/UohuyDq946ad7kglhvQ4wBdJWTzxwYRQzjo86bR+v/2qeR+87C3ZVNNB3Eu
EJ/Xg4ZCxIgZYdhOWC9jD4v3uDFRU6mmEDiehTk88Qu4oDB/gbhw+FL2SX+zfmo1
y8hq6qI1qf9L9HBs21nm3d6JM4iiyGgNxNXpWKWmTEqOTM0vE+BgO2W+Uqcu9AFf
k118RdGjNG19vuZO9LgZ+MG3zDPCLH6qAbP1Xmsv/mDWab+4Pb0uUEqjbHa3VeqA
od+MBm/GRZWyOxmJCnqPdQ7h5Avbr/aB5pvlFF2p85dyAmaYQoon5wkDm+1x7mnr
gcUex+EFaIdEHgFZor08R3J1ENf9awUYYcc5E0/aKE/kqyEJ5EUlxGCaCg5Yv+m9
wZnK8uxgqlr44S6GUzqgKuH8eJYdFWCO792kdULuoS6vRk+TfAw=
=nczi
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
