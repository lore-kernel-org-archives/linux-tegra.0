From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 46/61] gpio: tegra: Use devm_gpiochip_add_data() for gpio
 registration
Date: Tue, 23 Feb 2016 17:30:47 +0100
Message-ID: <20160223163047.GB13755@ulmo.nvidia.com>
References: <1456150130-2668-1-git-send-email-ldewangan@nvidia.com>
 <1456150130-2668-47-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456150130-2668-47-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, michael.hennerich-OyLXuOCK7orQT0dZR+AlfA@public.gmane.org, corbet-T1hC0tSOHrs@public.gmane.org, albeu-GANU6spQydw@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, shc_work-JGs/UdohzUI@public.gmane.org, support.opensource-WBD+wuPFNBhBDgjK7y7TUQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org, a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2016 at 07:38:35PM +0530, Laxman Dewangan wrote:
> Use devm_gpiochip_add_data() for GPIO registration.
>=20
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpio/gpio-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
> index 9a1a7e2..790bb11 100644
> --- a/drivers/gpio/gpio-tegra.c
> +++ b/drivers/gpio/gpio-tegra.c
> @@ -545,7 +545,7 @@ static int tegra_gpio_probe(struct platform_device *p=
dev)
> =20
>  	tegra_gpio_chip.of_node =3D pdev->dev.of_node;
> =20
> -	ret =3D gpiochip_add_data(&tegra_gpio_chip, NULL);
> +	ret =3D devm_gpiochip_add_data(&pdev->dev, &tegra_gpio_chip, NULL);
>  	if (ret < 0) {
>  		irq_domain_remove(irq_domain);
>  		return ret;

It's slightly redundant to do this because the driver probe will never
fail after this point and the driver can't be unloaded, so there's no
way that the GPIO chip would ever be removed.

But in the interest of consistency I have no objections to doing this.
It might also happen that, eventually, we might turn this into a proper
driver, at which point this would come in useful.

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWzIk3AAoJEN0jrNd/PrOhyWUP/iyvoVwhhY14HI7SHPEyCqTd
9uz0vVjq6omMFwmNEbvvnbXk4SDSd28fZ89kdoXEiT/bO+NrohKf0N6obScvsp5z
NdGur+LyGERT8UMmvzy042p4pMdqCjJaTU4iI/tUIZuuF0PHcM5/AE+H5z0pnDKh
W3FAp2Ay4tbUOne7sY732f9G+gvHeHX4D/bd2lmcZKiWzRyJcwurbOJt2oaFGIM7
ZqDqD7dcqUU6rwgk8tBDWSLiuwjJECrjd0R9Pqms93VxIR1vfcfT0+9ga2LGgcJv
ajN0NsbAbY3O65BpdYLjvhYROdi8j8udbUQ+RqHDoJjhFiaeoUXz7uPMsxCMlvke
TPIdJZynGTXh35lN6Gv2uU4rOPJIetAaj5ZPByiS4X5KOgTV8PF3GzFrHPvl8NgQ
45HCFbudGnyy5z5VVVJq41/LVOnFI405R1cmWszRzyb0wewFCiwNg56kJ7XyiTQZ
g1403bQgFQY2YW54E/7A0FopLSbNqXa13o2lW3hY9JyhHwgGFDRh6SC3XzyFvAbz
f72/Z6NMTLcCX1qe/ZXlUoLSMjO3MJj5zkHsUw1vNFVd90+TVXIbCHkEemS3FHA+
x0MBEa6IS8B5S0OMjAKuLEwjuOtzxlRmGLAjjAAzLWZFtc0dbfAz2WN7y19JXnHm
niJ0GuzRRTpR34w9+OOH
=ZxZ+
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--
