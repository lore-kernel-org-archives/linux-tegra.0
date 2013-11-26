From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: tegra: don't hard-code DEBUG_LL baud rate
Date: Tue, 26 Nov 2013 12:08:49 +0100
Message-ID: <20131126110848.GE27752@ulmo.nvidia.com>
References: <1385419003-11348-1-git-send-email-swarren@wwwdotorg.org>
 <1385419003-11348-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fWddYNRDgTk9wQGZ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385419003-11348-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--fWddYNRDgTk9wQGZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 25, 2013 at 03:36:42PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Stop writing to the UART clock divider registers in the Tegra DEBUG_LL
> code. This allows the DEBUG_LL output to use whatever baud rate was set
> up by the bootloader. Some users are using higher rates than 115200.
>=20
> This removes the only usage of tegra_uart_config[3], so reduce the size
> allocated for that array.
>=20
> Finally, fix busyuart() so that it only waits for THRE and not TEMT. For
> some reason, TEMT doesn't get asserted (at least on Tegra30 Beaver) at
> 9600 baud, even though it does at 115200 baud. This sounds like a HW bug,
> but I haven't investigated. For reference, U-Boot's serial code has
> always only checked THRE, and not checked TEMT.
>=20
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Tested-by: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/include/debug/tegra.S | 30 +++---------------------------
>  arch/arm/mach-tegra/tegra.c    |  4 +---
>  2 files changed, 4 insertions(+), 30 deletions(-)

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--fWddYNRDgTk9wQGZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSlIFAAAoJEN0jrNd/PrOh4RwP/jlNDZmXLRGg5l5CrEYXT/qC
OprKo+1lwe8PzOgu5rL56legvXMndGj2YcYK0qLCJU95p7gDQeVqNc36dVEOgeiv
latqgkuhAN/f9qPaS7qkyb64RDQn6erG3J2wuycb/VaE8D/q2ASFYI/kGOyvTWsw
sp6NJ04bA5O2xCcJEiVnE/1GN09LcRB1nJmzBE2r33K8isy9O4aHVIFfSC+hmDAD
3gn33jzx88HE8oa6l78XY+e08V39C6K4uw1occBkRADfliyTot0kLAFx3+9qLA2V
hyzcGB2EVQn9R10fC5Y9EQlhxMeSLZZt0xSIOooGBv/dwKqE8utp7zxyP05hFYci
1IWO25P4EAmBBO2ou9m6MY4Onj47UiLodtGMEMKvF+4Kj3WxnjEoDT8cCdBV2qmu
zfQIBLIuy4ttb3MTDhC8YGe7w2Mz1qmElwaXVRymokY4jgnjOw3gP8KC9AXF+6j/
1Es6HZaIGQaA2Z+Dn0eiu87TCXZ5blqqmGPWu4oILK1FlAw/TBWBdviwPr8V03G0
dQwuCW5XdMzCnajcP/HLgs6KcYUN5VivLgH6aGtPTYBBgMCRoansSs2X0RYwSqzR
+byFOmjxeoEmP+lYhLAOGy8U0Hgus7/Vg5SLWj7o98I5QGfeSdqscvNQUYS9NiN0
zkNa0yQwgzVao1VqLC23
=GoMe
-----END PGP SIGNATURE-----

--fWddYNRDgTk9wQGZ--
