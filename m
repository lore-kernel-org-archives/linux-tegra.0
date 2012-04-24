From: Felipe Balbi <balbi@ti.com>
Subject: Re: [PATCH v2 2/3] ARM: tegra: Add SMMU enabler in AHB
Date: Tue, 24 Apr 2012 15:32:52 +0300
Message-ID: <20120424123248.GG8444@arwen.pp.htv.fi>
References: <1335269116-9578-1-git-send-email-hdoyu@nvidia.com>
 <1335269116-9578-2-git-send-email-hdoyu@nvidia.com>
Reply-To: balbi@ti.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J3rqiH0DIeiRD2zz"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1335269116-9578-2-git-send-email-hdoyu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hiroshi DOYU <hdoyu@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Felipe Balbi <balbi@ti.com>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@wwwdotorg.org>, Russell King <linux@arm.linux.org.uk>, Tony Lindgren <tony@atomide.com>, H Hartley Sweeten <hsweeten@visionengravers.com>, Jamie Iles <jamie@jamieiles.com>, Rob Herring <rob.herring@calxeda.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--J3rqiH0DIeiRD2zz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Apr 24, 2012 at 03:05:15PM +0300, Hiroshi DOYU wrote:
> @@ -95,6 +98,21 @@ static inline void gizmo_writel(unsigned long value, u=
nsigned long offset)
>  	writel(value, tegra_ahb->regs + offset);
>  }
> =20
> +#ifdef CONFIG_ARCH_TEGRA_3x_SOC
> +
> +void tegra_ahb_enable_smmu(void)
> +{
> +	unsigned long val;
> +
> +	val =3D gizmo_readl(AHB_ARBITRATION_XBAR_CTRL);
> +	val |=3D AHB_ARBITRATION_XBAR_CTRL_SMMU_INIT_DONE_DONE <<
> +		AHB_ARBITRATION_XBAR_CTRL_SMMU_INIT_DONE_SHIFT;
> +	gizmo_writel(val, AHB_ARBITRATION_XBAR_CTRL);
> +}
> +EXPORT_SYMBOL(tegra_ahb_enable_smmu);

ok, so this is the only place where you need that global pointer. Who
would call this ? Can you do runtime detection of the SoC and enable
SMMU based on that ?

I mean, will this function always be called for TEGRA 3 SoCs or is there
another condition to that ?

--=20
balbi

--J3rqiH0DIeiRD2zz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJPlp1wAAoJEIaOsuA1yqREm7QP/2hqstAY6K8zz6WsdgQkB9/r
HIAUlH7WKJ7LVHGC1fAIBa1A4okL3fS9bebTCGp9cfertmUM3KGY/7MV4mJM+vKP
YdoebyEz+ENXYHgt9KSNOErPuKKCJaU58/g8Zz0Q0iHCtsz8/zUvWSSCBZepIADL
MLz7pgpxAwsOVJmV7OpmGHFb9SBRpLSj1rrckH5N1PtLpbH3phw4uqNbPSQH2Sw1
SNL40zAXpENHx1EPmjk08giZ2G5AsMVyRfJCZBYI4XS8/bBoIlvK76/Xvj/u2E3a
ft/KS45ZYxMr4KbfhVygnqBc+bNOBkm7a12u9siCznjHg9FpxA8bZLkC2Lo7dmxw
gcRD6XdqqFdmBZ8fRNWvXdHQAH3eyMjpxfmG+kc2HzZZUynxCm9VnOZj9/n/u5TF
9Dwt76P84EVjwAt7UFaAEAoarFPbNwQZ1AXEKd1CYRQtHzesg1HrcEsGdyfA5HjV
vZBjCxfOXLBG1QYwxvadoSMAiaV3erTDyNVQLuYXmmzUgRZ0Qe7pK8A/Wvqq+610
Bt9IoSbV4/DC2yFgoTiXRlbHSON1ENnaAimObEx0OwTqp+EolnT0cBsEJWaREe5K
a/QfcHNhVutN5vXdZRn9hZtxmsvvRArVCeUlkT6pKfuxCLvttPHrzhYk1ADzdWrI
wKDq2Ib/7OumQP9YwjsC
=8Pes
-----END PGP SIGNATURE-----

--J3rqiH0DIeiRD2zz--
