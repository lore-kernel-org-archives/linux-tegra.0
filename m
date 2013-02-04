From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCHv5,RESEND 7/8] ARM: tegra: Add board data and 2D clocks
Date: Mon, 4 Feb 2013 12:26:22 +0100
Message-ID: <20130204112622.GC595@avionic-0098.mockup.avionic-design.de>
References: <1358250244-9678-1-git-send-email-tbergstrom@nvidia.com>
 <1358250244-9678-8-git-send-email-tbergstrom@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QRj9sO5tAVLaXnSD"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1358250244-9678-8-git-send-email-tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--QRj9sO5tAVLaXnSD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 15, 2013 at 01:44:03PM +0200, Terje Bergstrom wrote:
> Add a driver alias gr2d for Tegra 2D device, and assign a duplicate
> of 2D clock to that driver alias.
>=20
> Signed-off-by: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm/mach-tegra/board-dt-tegra20.c    |    1 +
>  arch/arm/mach-tegra/board-dt-tegra30.c    |    1 +
>  arch/arm/mach-tegra/tegra20_clocks_data.c |    2 +-
>  arch/arm/mach-tegra/tegra30_clocks_data.c |    1 +
>  4 files changed, 4 insertions(+), 1 deletion(-)

With Prashant's clock rework patches now merged this patch can be
dropped.

Thierry

--QRj9sO5tAVLaXnSD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRD5reAAoJEN0jrNd/PrOhQTsP/1SHqWbU5vGVye/MiuqGVFAf
AG/oTf8vLi6wn/+qa8tsM/ADvEfyi5E2/xH4xeMCVMQnw4C6zebAiI2gQdrajVIp
g5OciSWhWyFT9vXsQtky3XLMVm66C2amOVfwuSidIVrs/9phLcGy9MwLQu1b92xq
Khokhc3O/Ddd1vU1x31vbfklwG/9HHRPxgEY1h+XpK6WJAUPH1fGx7vxbGJyWhb4
+UZlEUk8gF5YwrBwvbtw1f3Kqo0z9JdvMoXh34tiptTJ91ihZq6ajOjBLheK6oxj
kJXiXuZpOnkORLZBiAk2wADJr3mKSGC2lD6o2exgPnNMPc0XW0gMn/PcFSwcJZPZ
XJrZbh93Vx7eyzH7xe+ECOHWOl5SA0+v3ED5Yf0UtYZp/DbEqx3MSoRr1V7U+I0Y
wefSfh10+GdgSUQJ3hhcO37LNaG9N74XOGHXsF7IoOXWyVGKHdOwJ6UXpkXDqVHv
SrdffLSMU+bA9J0CxziVQbDnfkGwC5mZH5jlLQM5FEingei3pctA67eaHrmneYil
n28uRy3C8ZnZePgPItG9gNiikfU6qsufi56Q/wYWnhfUaxuDJHrEB/ZEXx00lEfa
dRPSrf95QV1vy6oaVfDe/GQqXCa1S4zpg6pFGuqszT8xLBrfDGFjNopVhF+EcM7m
MhfqFPg6nPfnN3rUoHQi
=bOV1
-----END PGP SIGNATURE-----

--QRj9sO5tAVLaXnSD--
