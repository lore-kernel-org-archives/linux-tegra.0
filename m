From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 1/5] ARM: tegra: WARN if flowctrl is not supported
Date: Mon, 20 Mar 2017 15:10:23 +0100
Message-ID: <20170320141023.GB28203@ulmo.ba.sec>
References: <1489584715-23138-1-git-send-email-jonathanh@nvidia.com>
 <1489584715-23138-2-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8019420590336256617=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1489584715-23138-2-git-send-email-jonathanh@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


--===============8019420590336256617==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+pHx0qQiF2pBVqBT"
Content-Disposition: inline


--+pHx0qQiF2pBVqBT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 15, 2017 at 01:31:51PM +0000, Jon Hunter wrote:
> If we fail to map the IO space for the Tegra flowctrl module in
> tegra_flowctrl_init(), then if any of the public APIs for the Tegra
> flowctrl driver are called we still still attempt to access the
> hardware. Fix this by only accessing the hardware if the
> 'tegra_flowctrl_base' address has not been setup correctly and warn
> if we attempt to access the hardware when it has not.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm/mach-tegra/flowctrl.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/arch/arm/mach-tegra/flowctrl.c b/arch/arm/mach-tegra/flowctr=
l.c
> index 475e783992fd..40b15e39f849 100644
> --- a/arch/arm/mach-tegra/flowctrl.c
> +++ b/arch/arm/mach-tegra/flowctrl.c
> @@ -47,6 +47,9 @@ static void __iomem *tegra_flowctrl_base;
> =20
>  static void flowctrl_update(u8 offset, u32 value)
>  {
> +	if (WARN_ONCE(!tegra_flowctrl_base, "Tegra flowctrl not supported!"))

Technically I think this string needs a terminating "\n" because it is
eventually passed to printk(), even though the WARN_ONCE() will probably
format the output correctly even without it.

Also, "not supported" isn't a very accurate description. This has to do
with the flow controller not having been initialized yet.

Thierry

--+pHx0qQiF2pBVqBT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljP4s8ACgkQ3SOs138+
s6E44Q//eVR9dqES/AIgJ2hxx0sraRlxZy/2Me9XUGNejR6pczAaFeN2vx8g78hG
XrHlhXVc5eYeKV9l1LLLfXxk27BDNnndntw8nLf9D2XFkk/oH10Y7KX26C5st+NX
yV3z/O34huaY3+PvNiKq6WdzUVcEx2SSbH0cGHdTwO7zdFkuuws5RMslbLQT1AMT
PJFJPdbCF1YfS2baGcusWGLD90rXEJpjt57mFJ/qPMarES1EONpUEYAw1bN+7MQ5
nqzp/u9eqAQdl8vSXl661c9WFrtnKbF//pldjOMRjFlqloXCf9Z7hcTvg6gwRe0m
0MwrTVrJDJvsfcXecM2yQHdtRF7tcJDkKnyRC2hcrSjlHV3WeB+DjVJZFl1MsXrm
9Fbzd+BZ9KW+AN45TMGQC+0viXE1/NFcW/20TSuCmptg1+COSP/4RtsBya1nseAu
5Z9lYExreYiSOGp3YC1+O2vkQox3tOl4f4DXfvOF2YYBb1BBFcCyQUZT5LXeB1PJ
FIbBOzIjT8gecUuI10Z9pGaitUbOu1s16cvfqw1/txLscuSeR6LyfweJmRCPrIHS
R92gCLW2+2IKcKwwLcd1FYf/Xkwdyab/YfxWgKP+st23o0VhyJfYKYDtEShpc6IH
/0WUy0vP8rSfqMCj+ycPGYqHXAugXPlFraavJriOOSpAyiXTxRs=
=Udlf
-----END PGP SIGNATURE-----

--+pHx0qQiF2pBVqBT--


--===============8019420590336256617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8019420590336256617==--
