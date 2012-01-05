From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 5/6] gpio: tegra: Dynamically allocate IRQ base, and
 support DT
Date: Thu, 5 Jan 2012 08:23:06 +0100
Message-ID: <20120105072306.GA3980@avionic-0098.mockup.avionic-design.de>
References: <1325702378-20863-1-git-send-email-swarren@nvidia.com>
 <1325702378-20863-5-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="n8g4imXOkfNTN/H1"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1325702378-20863-5-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--n8g4imXOkfNTN/H1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> @@ -343,6 +344,16 @@ static int __devinit tegra_gpio_probe(struct platfor=
m_device *pdev)
>  	int i;
>  	int j;
> =20
> +	irq_domain.irq_base =3D irq_alloc_descs(-1, 0, TEGRA_NR_GPIOS, 0);
> +	if (irq_domain.irq_base < 0) {
> +		dev_err(&pdev->dev, "Couldn't allocate IRQ numbers\n");
> +		return -ENODEV;
> +	}
> +	irq_domain.nr_irq =3D TEGRA_NR_GPIOS;
> +	irq_domain.ops =3D &irq_domain_simple_ops;
> +	irq_domain.of_node =3D pdev->dev.of_node;
> +	irq_domain_add(&irq_domain);

I was wondering: except for setting the nr_irq field this is pretty much wh=
at
irq_domain_add_simple() does. While I get that you need access to the domain
later on and cannot use the helper, I'm still wondering why the nr_irq field
is not initialized by irq_domain_add_simple().

I have a driver for a GPIO/IRQ expander that does exactly the same and was
always wondering why the irq_data.hwirq field isn't properly setup, and
irq_domain.nr_irq being 0 seems to be exactly the reason. So am I supposed =
to
not use irq_domain_add_simple() in this case or should we rather update the
helper to take a nr_irq parameter that can be used to initialize the nr_irq
field?

Thierry

P.S.: sorry for hijacking

--n8g4imXOkfNTN/H1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk8FT9oACgkQZ+BJyKLjJp+f7gCgpfvZAC/ERlLDht/P6iXt0bzG
dtIAn0Nx7gbLeaODJfRRjLUtGLKuT9NG
=Lwq4
-----END PGP SIGNATURE-----

--n8g4imXOkfNTN/H1--
