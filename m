From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 1/2] pinctrl: tegra: add suspend-resume support
Date: Tue, 23 Apr 2013 20:43:32 +0200
Message-ID: <20130423184332.GA31374@avionic-0098.mockup.avionic-design.de>
References: <1366740542-26127-1-git-send-email-bbasu@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fdj2RfSjLxBAspz7"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1366740542-26127-1-git-send-email-bbasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bibek Basu <bbasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--fdj2RfSjLxBAspz7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> diff --git a/drivers/pinctrl/pinctrl-tegra.c b/drivers/pinctrl/pinctrl-te=
gra.c
[...]
> @@ -41,6 +42,8 @@ struct tegra_pmx {
> =20
>  	int nbanks;
>  	void __iomem **regs;
> +	int *regs_size;

Perhaps this should be unsigned int *. The values stored in this array
will never be negative, right?

>  int tegra_pinctrl_probe(struct platform_device *pdev,
>  			const struct tegra_pinctrl_soc_data *soc_data)
>  {
> -	struct tegra_pmx *pmx;
>  	struct resource *res;
> -	int i;
> +	struct tegra_pmx *pmx;
> +	int i, pg_data_size =3D 0;

There's a needless move of the pmx variable declaration here.

> @@ -735,6 +769,21 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
>  		return -ENODEV;
>  	}
> =20
> +if (IS_ENABLED(CONFIG_PM_SLEEP))
> +	pmx->regs_size =3D devm_kzalloc(&pdev->dev,
> +				pmx->nbanks * sizeof(*(pmx->regs_size)),
> +				GFP_KERNEL);
> +	if (!pmx->regs_size) {
> +		dev_err(&pdev->dev, "Can't alloc regs pointer\n");
> +		return -ENODEV;
> +	}
> +
> +	pmx->pg_data =3D devm_kzalloc(&pdev->dev, pg_data_size, GFP_KERNEL);
> +	if (!pmx->pg_data) {
> +		dev_err(&pdev->dev, "Can't alloc pingroup data pointer\n");
> +		return -ENODEV;
> +	}

I don't think this works the way you expect it to. The line

	if (IS_ENABLED(CONFIG_PM_SLEEP))

is a standard conditional and therefore needs to be properly indented
and use { and } to delimit the block.

> @@ -756,6 +805,9 @@ int tegra_pinctrl_probe(struct platform_device *pdev,
>  			dev_err(&pdev->dev, "Couldn't ioremap regs %d\n", i);
>  			return -ENODEV;
>  		}
> +
> +if (IS_ENABLED(CONFIG_PM_SLEEP))
> +		pmx->regs_size[i] =3D resource_size(res);

In this case it will actually work as expected, but the if () should be
properly indented.

Thierry

--fdj2RfSjLxBAspz7
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRdtZUAAoJEN0jrNd/PrOh3XUQAJAZ96+yRwyasLSm4dK6qnAm
wP4hkmbs7BkzYfboasFIUKj5f71biLzHMR4JRv6b59rxLho0ADxoXA4koyK1OS5B
GoIn+5a8o5qIiP0rSSNnr0c7dZqrZ5FIlV7vwr8F6jI7HZlxSS2uENQubb21Z9tb
0OC40Q0DOFg70M/H0kCocY9VLFeM4xGhCBR1CqeBp4WHZ34221OhN/H8p5EV8v39
xhZZ6IU7ihPTwFvx9U1JxWqwRDBH56EFdxqDUEiL/JPGp6Kxlr4u2eAmHYkii6eH
g8gNdSMyBuHJ+FG3nEQFOiIcGM+sW6cO8r0DywN0Mm6boN/MU/R+O1ErTQQQYwNG
qlKK21nYvLzR/H3R5pTBHsXqzexMCcZFmIkJ300bi1s0A18aCdlOpfKC8EM3gcUF
BvMPQOF/0kiRqMvzjTWBpMPC6SozB79Fa/vu2vofO3wL9SUbX//0ag7b8OVsjhgq
iaBdD+OzAWMaXOli71OG/sKwC2ukyj9crvIRTKjHZMFrBhCfDx0KJgvtBHLmnzWW
sWGcNyx8O4GQq4Q3jWbjxyYnwHWd087uc2nzb38BJPhs+yXs7VmdsT3renkmG/eo
iLtCGKn0L48xpcJN66jm5udkLj371KL+achAc3jWJBYmpwZSXNKBO09ykZqiH9tx
B1I4OAAsxF254HM5HiiG
=iUHp
-----END PGP SIGNATURE-----

--fdj2RfSjLxBAspz7--
