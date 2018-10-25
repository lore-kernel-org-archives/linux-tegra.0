From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1] soc/tegra: pmc: Drop locking from
 tegra_powergate_is_powered()
Date: Thu, 25 Oct 2018 16:22:04 +0200
Message-ID: <20181025142204.GC21521@ulmo>
References: <20181021183614.454-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="RIYY1s2vRbPFwWeW"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20181021183614.454-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--RIYY1s2vRbPFwWeW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 21, 2018 at 09:36:14PM +0300, Dmitry Osipenko wrote:
> This fixes splats like the one below if CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> and machine (Tegra30) booted with SMP=3Dn or all secondary CPU's are put
> offline. Locking isn't needed because it protects atomic operation.
>=20
> # echo 0 | tee /sys/devices/system/cpu/cpu[1-3]/online
>=20
> BUG: sleeping function called from invalid context at kernel/locking/mute=
x.c:254
> in_atomic(): 1, irqs_disabled(): 128, pid: 0, name: swapper/0
> CPU: 0 PID: 0 Comm: swapper/0 Tainted: G         C        4.18.0-next-201=
80821-00180-gc3ebb6544e44-dirty #823
> Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
> [<c01134f4>] (unwind_backtrace) from [<c010db2c>] (show_stack+0x20/0x24)
> [<c010db2c>] (show_stack) from [<c0bd0f3c>] (dump_stack+0x94/0xa8)
> [<c0bd0f3c>] (dump_stack) from [<c0151df8>] (___might_sleep+0x13c/0x174)
> [<c0151df8>] (___might_sleep) from [<c0151ea0>] (__might_sleep+0x70/0xa8)
> [<c0151ea0>] (__might_sleep) from [<c0bec2b8>] (mutex_lock+0x2c/0x70)
> [<c0bec2b8>] (mutex_lock) from [<c0589844>] (tegra_powergate_is_powered+0=
x44/0xa8)
> [<c0589844>] (tegra_powergate_is_powered) from [<c0581a60>] (tegra30_cpu_=
rail_off_ready+0x30/0x74)
> [<c0581a60>] (tegra30_cpu_rail_off_ready) from [<c0122244>] (tegra30_idle=
_lp2+0xa0/0x108)
> [<c0122244>] (tegra30_idle_lp2) from [<c0853438>] (cpuidle_enter_state+0x=
140/0x540)
> [<c0853438>] (cpuidle_enter_state) from [<c08538a4>] (cpuidle_enter+0x40/=
0x4c)
> [<c08538a4>] (cpuidle_enter) from [<c01595e0>] (call_cpuidle+0x30/0x48)
> [<c01595e0>] (call_cpuidle) from [<c01599f8>] (do_idle+0x238/0x28c)
> [<c01599f8>] (do_idle) from [<c0159d28>] (cpu_startup_entry+0x28/0x2c)
> [<c0159d28>] (cpu_startup_entry) from [<c0be76c8>] (rest_init+0xd8/0xdc)
> [<c0be76c8>] (rest_init) from [<c1200f50>] (start_kernel+0x41c/0x430)
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/soc/tegra/pmc.c | 2 --
>  1 file changed, 2 deletions(-)

Applied to for-4.21/soc, thanks.

Thierry

--RIYY1s2vRbPFwWeW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlvR0YwACgkQ3SOs138+
s6HvdxAAwH2jMQXr+gO5iAE+91oNZuJDEj80IO96BcrdHX5Q79Noe8rtRvoBBzJM
tdMQfpsIP6BYxTYL4914Jxs2ComlkUDR2uww571Zk6XSrkJ5PqAkC6ZKp7HHCjwM
JVdvgEpyj5ZkLfryTscnZOWHPkS0VUzO5kSgIV4/pisbUvRKLaJaOWXQwXNfTBqn
PyM5x4PyWyHl1BkSXCbGt1uRtMzgP6lKgZWKHs3lIJ2Cz96ATEO6SnC2ednS4B9T
hi0amZnYZzbhO3FWjXriyID6JWKFRHx7CjKXszWeII4jcOrQVnHPb505V4agzCe8
2/+EZmaqq4HPIWEfnYaaNKJDUHLbG/2wFCRO92SZYb4QlidUY3VMZ8nOr0IpY6E2
+COrYt/vIlhsYEpjs2HfNDZ1Kf2aAG4vFmhNuxmZ9kxNFVTDEMytkdhgYe+IdwR8
7l7pY6HaxKK9Gwgc1qjuFrTlhnr97XS/omPQpKhFu2KSnoZFwrk2cAJS6e7dhPvV
cJLeOX4KINMHAB4YwD7MUgF8+K6qDnUW6UeEZZ+Kh/DMX0tiP14Ei59goQKiCRUl
N/GvxalY9llCNK+MyoC2xcc5T391dJF17JJ7+qfryZrqMp+kUfwnhYOofeOeJ5kA
QJ7leXiP+paX5NtbGH2g+tdrik+KgmuoE1Edc+Dp9gFbqzaNwcQ=
=q2/Z
-----END PGP SIGNATURE-----

--RIYY1s2vRbPFwWeW--
