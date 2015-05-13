From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] irqchip: tegra: fix wrong data being passed as the
 irqdomain chip data
Date: Wed, 13 May 2015 11:35:12 +0200
Message-ID: <20150513093510.GA31316@ulmo.nvidia.com>
References: <1431202014-3136-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sdtB3X0nJg68CQEu"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1431202014-3136-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--sdtB3X0nJg68CQEu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 09, 2015 at 10:06:54PM +0200, Lucas Stach wrote:
> The irq chip functions use the irq chipdata directly as the base register
> address of the controller, so this should be passed in instead of a point=
er
> to the array address holding the base address.
>=20
> This fixes Tegra20 CPUidle as now the un-/masking of IRQs at the LIC level
> works again, but more importantly it fixes the resulting memory corruptio=
n.
>=20
> Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
> ---
> This is an important fix and should go into 4.1.
> ---
>  drivers/irqchip/irq-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

This does indeed fix a boot regression on Tegra20. Unfortunately this is
not exposed on any platform that uses PCIe because PCIe needs to disable
the CPUidle LP2 state as a workaround for a hardware bug. However, I was
able to reproduce the regression on TrimSlice by disabling PCIe, hence
keeping CPUidle LP2 activated. I reproduced with v4.1-rc3 and applying
this patch on top restores functionality.

Thanks for tracking this down Lucas.

I just noticed that Thomas already applied this while I was testing it,
but here goes anyway:

Tested-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--sdtB3X0nJg68CQEu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVUxrLAAoJEN0jrNd/PrOhubMP/jlIidBct5nWq6KXvHw1QcH9
WUDuOMlFn/BJiq/R5uL2n9p8Q2B9mWJwBhisDvGCe9xmwl1xUmu5ukekcaHyfrQ0
yEr6elQL05WZc4+3+OIyMOef8fpSLwCbc88IaEXQHoql56go7F7OJtpTPVXQX/bw
Lxi5EPjaD91cLzE9tj2mgdp3euLBTX3u4j0yBcOLw1gOKTKe51haFN+i3Uii8yhW
uyEJela/4gkdLOEYdoK+nyp+Dg6QmRPuuG5EDF/3kSi7zxu/0D2e9dNrlAqnXDEQ
EXlrbXIXA2B1j0XsTn9JTVviXGF5M+K8z4RhZby5hjlyrR3EWavP9GquChRNLciw
N6wYoFFNx4bxjTnbCmBYi3D6/9lO7z/4BzzFI3duJ6CR2Y6bKxnjKZWmClPpB2sx
oKgmb2FmYmLC7f9CPmjNGVtC1kIilBeRT1gqFpX5E9upgs4S6c6zPZuySU7df158
B32uU/v50vBB+Jb5b1I1EKYsHAMO+Rx6Ukt11QLjEKMb+NWdfsUrntJHqurS/jyo
ciCFkD1GIYvJXjiwLNVyPIi73eap0aVAiB1DICnDW1tnEt4NJSC3UkQO6uuCYTuo
z/nHVie47SMtQVsIORFVz7IWhZ7mrVfm6yR3eioe6775ftLMevVxuVNgumRpsfXF
58T4ObzHjEW4FWtYeuC1
=8ZHo
-----END PGP SIGNATURE-----

--sdtB3X0nJg68CQEu--
