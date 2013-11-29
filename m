From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 08/31] pci: tegra: use reset framework
Date: Fri, 29 Nov 2013 14:33:46 +0100
Message-ID: <20131129133345.GV22771@ulmo.nvidia.com>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org>
 <1384548866-13141-9-git-send-email-swarren@wwwdotorg.org>
 <20131129132957.GU22771@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Avw2VvEbzfULB0h1"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131129132957.GU22771-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Avw2VvEbzfULB0h1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 29, 2013 at 02:29:58PM +0100, Thierry Reding wrote:
> On Fri, Nov 15, 2013 at 01:54:03PM -0700, Stephen Warren wrote:
> [...]
> > diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
> > index 0afbbbc55c81..174a5bc2d993 100644
> > --- a/drivers/pci/host/pci-tegra.c
> > +++ b/drivers/pci/host/pci-tegra.c
> > @@ -39,6 +39,7 @@
> >  #include <linux/of_platform.h>
> >  #include <linux/pci.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/reset.h>
>=20
> Can't you also remove the linux/clk/tegra.h include now that none of the
> functions it declares are used anymore?
>=20
> Otherwise looks good to me:
>=20
> Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

And I guess also:

Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--Avw2VvEbzfULB0h1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSmJe5AAoJEN0jrNd/PrOh/WkP/i7ObJ3TKzZhCcvkhu0q1gI7
99G6Ovlp8CqlI5nwhzifA4O1d2YUOKmQwCvJpotsoGdSOld69Erq1J4uuh8caik+
Zz84QNTZInE+VeJFbAm66tv+4qKzB9B1v7qYnSG1WsUDpq9Q7vJayWhg/c5pl4i9
2S0cXryOhYLgE58eQYmNE/eVXRZatyXHSAXfuG12IUq77ZCmpjMYMRCEPlHRQq1f
ZcpLEuQyIfKXZvFXIzLEyhZl01x8OUMWr6cn/cPjTIm9nTu3s7wIu8ddkPIkqlUN
xlOuRfADIJBLybjIsuVpkHrF1eQDxW8JoCX81xwDVQy50XoTlxIF1la05blu5XE2
6Ai0zywMRpe/isX/KuIFIfNQmu/5cK43Gmz4pXcLUiTM52pJeEJm6UbISncKluj9
CGsnhnOyJ95WF8MK/SwmLCazvSqiyQnTF7A7uznQsmDj7ElOK0DsrPRwSigPvkrW
zyMO2hiCt3iRYMm8W+KtU/aBq/qmqemQCcXIw+sTbbi5VtgRDD1Ipc18sCjtYmM0
x/9/J+dwu7AuRkH0gVu89jbLT5q2r7deM5TWi5DAIE343GtNoaZ20EZaUAI3RsA2
VnSBVjpW0B8Psr68C+ROJY/f2toZA2NGiBq8ZNJCulaF2Une0GiCeAgq9FdluCGA
+m6EZupwxX8qYqKqpxQZ
=zdtS
-----END PGP SIGNATURE-----

--Avw2VvEbzfULB0h1--
