From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] irqchip/tegra: fix fix sparse warnings on __iomem
Date: Fri, 10 Jun 2016 17:49:27 +0200
Message-ID: <20160610154927.GR27142@ulmo.ba.sec>
References: <1465302292-4840-1-git-send-email-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="magLDk5D4XGaUXcd"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1465302292-4840-1-git-send-email-ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--magLDk5D4XGaUXcd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 07, 2016 at 01:24:52PM +0100, Ben Dooks wrote:
> Fix the following warnings from sparse due to casting to/from __iomem
> annotated variables:
>=20
> drivers/irqchip/irq-tegra.c:93:31: warning: incorrect type in initializer=
 (different address spaces)
> drivers/irqchip/irq-tegra.c:93:31:    expected void [noderef] <asn:2>*base
> drivers/irqchip/irq-tegra.c:93:31:    got void *chip_data
> drivers/irqchip/irq-tegra.c:93:31: warning: incorrect type in initializer=
 (different address spaces)
> drivers/irqchip/irq-tegra.c:93:31:    expected void [noderef] <asn:2>*base
> drivers/irqchip/irq-tegra.c:93:31:    got void *chip_data
> drivers/irqchip/irq-tegra.c:93:31: warning: incorrect type in initializer=
 (different address spaces)
> drivers/irqchip/irq-tegra.c:93:31:    expected void [noderef] <asn:2>*base
> drivers/irqchip/irq-tegra.c:93:31:    got void *chip_data
> drivers/irqchip/irq-tegra.c:93:31: warning: incorrect type in initializer=
 (different address spaces)
> drivers/irqchip/irq-tegra.c:93:31:    expected void [noderef] <asn:2>*base
> drivers/irqchip/irq-tegra.c:93:31:    got void *chip_data
> drivers/irqchip/irq-tegra.c:269:57: warning: incorrect type in argument 5=
 (different address spaces)
> drivers/irqchip/irq-tegra.c:269:57:    expected void *chip_data
> drivers/irqchip/irq-tegra.c:269:57:    got void [noderef] <asn:2>*<noiden=
t>
>=20
> Signed-off-by: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
> ---
> Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
> Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
> Cc: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
> Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> ---
>  drivers/irqchip/irq-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--magLDk5D4XGaUXcd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXWuGEAAoJEN0jrNd/PrOh6kcP/R0lCf+s1pkmAzhYBtlq4pMi
Og8crTaHmtMSX7BjRfr44SHEEY6bW/abMAKEBxFLgDunPvzjLwSKGC9LLKVziwHs
+hqZJ+Vrys5OeqSCJ5mgIjuPcBihnP+8KC2rlK3gdkUQKH6zIP+nhFr29mOi5w0J
UAC8lnE6G1nELtTIjYPlgGvrsj5EQwB8M8rCDIwc5bCco2w+UtluOp4Lh5Zk0C+9
8UCDAJnVPIFXCzREIDmfLhkmBsOS8mKRs1BJ1CoL5JuFeYuOAPNlhAmChU9qUG1c
yBQynH7YFuGTBo3BT0neA3bE9PvFwIlgUPtDjnEi0sZwK7mmxku/uzycUF9VDLqC
s/I+9Zbb6HrxJ+ZnUS40gZnj+wWMu6mLY0S7M6FBHMPjK5OWEIqvTiigvuXRB8He
CnRckKCmd4iboVKoJziO+kOhfbzxouqsSnGBCbDf4ZZj2YvENLuoq8y5cLP+DNTP
wQ9bY79of/ih3gXN2FfNCfq5r8aPQnBRkt5oIVo1Nge03lQzqd4Q4Uv+mCAE0dKr
CSn43nKtTgVarJqzOq7TqSiZLkYcVllbClYsjDD5A9WdBjEtBAL0XjWUnyR5hcbn
WJzOsRFzctd2qkkFRbgUc3emt8pNI2MvVTBmyP87G8CI1jlXjc/8qx+UgkvN2kPY
Ow6p6v+oVCS21AE195CH
=3K1v
-----END PGP SIGNATURE-----

--magLDk5D4XGaUXcd--
