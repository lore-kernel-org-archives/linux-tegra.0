From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: tegra: Add AHB driver
Date: Mon, 23 Apr 2012 15:06:46 +0300
Message-ID: <20120423120645.GY26302@arwen.pp.htv.fi>
References: <1335181043-15348-1-git-send-email-hdoyu@nvidia.com>
Reply-To: balbi-l0cyMroinI0@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1RfOVxRbNnn9f8MI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1335181043-15348-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--1RfOVxRbNnn9f8MI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 23, 2012 at 02:37:21PM +0300, Hiroshi DOYU wrote:
> +static inline unsigned long gizmo_readl(unsigned long offset)
> +{
> +	return readl(IO_TO_VIRT(TEGRA_AHB_GIZMO_BASE + offset));
> +}
> +
> +static inline void gizmo_writel(unsigned long value, unsigned long offse=
t)
> +{
> +	writel(value, IO_TO_VIRT(TEGRA_AHB_GIZMO_BASE + offset));
> +}

why don't you ioremap() your address and use it as a void __iomem * ?

--=20
balbi

--1RfOVxRbNnn9f8MI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPlUXVAAoJEIaOsuA1yqREsJQP/RPUP2NsTxL39fKtxe1pocAp
yzyuR/JS2ZrKze6I3K+W7gPPqdgIu6NHedKG/DEaBHOcs8v7k6vguTkoull2K3m1
uRthfO3Pu0xq213imgvPCNXnejDoymseWL+j7hGEsVi3LroL6/xGBUk0FS77anks
k+etiU/Ch9RLBwauEjwja87ICPiSl1lHptPGx5MQ/5s0U4J6euEhADf5WCOORJrR
Q8xEc9//KoSbx7AY9hN724IBS/yf7QXpCZHvf/FK/HB4mQoAlT0d7wRdAIkr0lCf
4bBBYZcKO/sUQO0OmKa8PzBq1OzwPKg0nhcBVCPsV0vF85LUN0UWHxxP3Ny9HlMC
wP4DtB1nnK+PMs9rgeCHvjSQXfQb032Rx13gp2kSbVmxcVeOLUomX87WaXd/ysQ4
3J/wfKRbUT422ftxvtGtBr/6F2aXJ8omUpA8XWHk0MA0ozki8HhlONbmHFPbD32K
znGnk0rCcWmoaZ5ljaq+1Lnkf7/HAQi8vhoVFTyYpcMV8K0WAFM0cY8T3Dn6HdxE
CRtssLP/hJpUBfFEfNyeBWzdKyQz2d7Ss8uUsABVtWZkWGu6Hc9e89JzlvWj0KNs
0UDBczNvCcLDLm71KCown3F3q3qNDZ6pWsBmIrqMP5Jt/JubjErJq0MPAZZCHdHF
/NbYO23CivMqStvwDC0a
=GtWW
-----END PGP SIGNATURE-----

--1RfOVxRbNnn9f8MI--
