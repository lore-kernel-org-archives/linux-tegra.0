From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] soc/tegra: Fix bad of_node_put() in powergate init
Date: Mon, 31 Jul 2017 12:13:57 +0200
Message-ID: <20170731101357.GB26667@ulmo>
References: <20170728235843.25298-1-tuomas.tynkkynen@iki.fi>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="DKU6Jbt7q3WqK7+M"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170728235843.25298-1-tuomas.tynkkynen-X3B1VOXEql0@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tuomas Tynkkynen <tuomas.tynkkynen-X3B1VOXEql0@public.gmane.org>
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--DKU6Jbt7q3WqK7+M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 29, 2017 at 02:58:43AM +0300, Tuomas Tynkkynen wrote:
> The for_each_child_of_node macro itself maintains the correct reference
> count of the nodes so the explicit of_node_put() call causes a warning:
>=20
> [    0.098960] OF: ERROR: Bad of_node_put() on /pmc@7000e400/powergates/x=
usba
> [    0.098981] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.11.3 #1-NixOS
> [    0.098996] Hardware name: NVIDIA Jetson TX1 Developer Kit (DT)
> [    0.099011] Call trace:
> [    0.099034] [<ffff00000808a048>] dump_backtrace+0x0/0x2a0
> [    0.099051] [<ffff00000808a30c>] show_stack+0x24/0x30
> [    0.099069] [<ffff0000084a6494>] dump_stack+0x9c/0xc0
> [    0.099090] [<ffff000008992214>] of_node_release+0xa4/0xa8
> [    0.099107] [<ffff0000084a9270>] kobject_put+0x90/0x1f8
> [    0.099124] [<ffff0000089914ac>] of_node_put+0x24/0x30
> [    0.099140] [<ffff00000898cec4>] __of_get_next_child+0x4c/0x70
> [    0.099155] [<ffff00000898cf28>] of_get_next_child+0x40/0x68
> [    0.099173] [<ffff0000090a099c>] tegra_pmc_early_init+0x4e8/0x5ac
> [    0.099189] [<ffff00000808399c>] do_one_initcall+0x5c/0x168
> [    0.099206] [<ffff000009050c98>] kernel_init_freeable+0xd4/0x240
> [    0.099224] [<ffff000008b2d658>] kernel_init+0x18/0x108
> [    0.099238] [<ffff0000080836c0>] ret_from_fork+0x10/0x50
>=20
> (It's not very apparent from the OF documentation that of_node_put() is
> not needed; the macro itself has no docstring and of_get_next_child()
> used in the implementation begins with "Returns a node pointer with
> refcount incremented" but then only at the very end of the docstring
> the crucial part "Decrements the refcount of prev" is mentioned.)

Yeah, this kind of mistake has been going around for a while. There's
even a semantic patch that fixes this kind of error (see
(scripts/coccinelle/iterators/device_node_continue.cocci). I wonder if
adding kerneldoc to for_each_child_of_node() may help avoid this kind of
mistake in the future.

> Fixes: a38045121bf42 ("soc/tegra: pmc: Add generic PM domain support")
> Signed-off-by: Tuomas Tynkkynen <tuomas.tynkkynen-X3B1VOXEql0@public.gmane.org>
> ---
> Compile tested only (backtrace received via a distro bug report).
> ---
>  drivers/soc/tegra/pmc.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Applied, thanks.

Thierry

--DKU6Jbt7q3WqK7+M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAll/AuIACgkQ3SOs138+
s6HSdA/+LDDs3gjti56JK++H99o75AmrgdwiIbirzNfJE/J9qjtG2b/wUYObnp9v
IlFruwmBtswSqhfG2yGtXo32oX0KUiLzc+g27vT5BdTR5OR3zldivsP5WgYgnd0o
KNVwOHCz9cfQ13yOQpA4dr5H0pBwLdGVVKQfhkcGMfkneVfaNbS/nGKpcm98BHdk
0fNKXHbBE2Rmrxj7zNtKCtc14IQ77FHzN8rpJp98tTJq0ZdaOO5W3KZ1tBKWUN7T
PkCDrYJhOmOV61OcrGVtQuFtE+UKaiK41Qo3THVD8fVObEuQ9VxDVmFitxuQuu7p
m/S1f6tYxojOFlii4gyccxC7HggGbwhOAZj96mJQzw1HW5XaNxRU97MFe7gY33+b
hFlxYNXFY5Yg+fjcIvY/ZkjjeAa35XmNQLn3ZVXfUgqflYHALSHOzqE2yDz+MGsA
HvRN9BbKrahwaz6o1eLHhUNv6qGPyEOV8EqC8yJoL+KERpVHwkB4IE3GAAV3wqmI
YBicSA/Q9SuAI5Wy2rvm9w/QxKTNDnyaH7v++YU4NRrNqcEOOESnAR7CBx0MFXwL
UQCplqCbsabnVIFIXVjOUKlMbqRXkNASWj9MD8M1IbgjGaMXy9807npaZRTPR6nM
h43x48Wb2aSTZ3772vvoMzAxop4oGEKy42UUqjGWpuQfM2Rz7F0=
=IShp
-----END PGP SIGNATURE-----

--DKU6Jbt7q3WqK7+M--
