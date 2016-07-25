From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 6/6] bus: Add support for Tegra NOR controller
Date: Mon, 25 Jul 2016 15:41:38 +0200
Message-ID: <20160725134138.GL21170@ulmo.ba.sec>
References: <1468935397-11926-1-git-send-email-mirza.krak@gmail.com>
 <1468935397-11926-7-git-send-email-mirza.krak@gmail.com>
 <20160725111443.GB21170@ulmo.ba.sec>
 <CALw8SCU5s8BAg6B8dT=QokY-D-CcokmMEkYqz1GJWHkX-XWpRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UUBKWyapWpFAak7q"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CALw8SCU5s8BAg6B8dT=QokY-D-CcokmMEkYqz1GJWHkX-XWpRQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--UUBKWyapWpFAak7q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 25, 2016 at 02:17:11PM +0200, Mirza Krak wrote:
> 2016-07-25 13:14 GMT+02:00 Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> > On Tue, Jul 19, 2016 at 03:36:37PM +0200, Mirza Krak wrote:
[...]
> >> +
> >> +     if (of_get_child_count(of_node))
> >> +             ret =3D of_platform_populate(of_node,
> >> +                                of_default_bus_match_table,
> >> +                                NULL, &pdev->dev);
> >
> > Why the extra check? of_platform_populate() is almost a no-op if there
> > aren't any children anyway. What it will do is set the OF_POPULATED_BUS
> > flag, but I think we want that irrespective of whether or not there are
> > any children.
> >
> > Was there any problem with calling it unconditionally that made you opt
> > for the extra check?
>=20
> I have not tested calling it unconditionally. Used another driver as
> reference and they had that condition (drivers/bus/imx-weim.c), that
> driver does not mention why the condition is there. But will test
> removing the condition and see what happens.

If that works fine for Tegra, it might be a good idea to get rid of the
call in the imx-weim.c driver, too.

> >> +static struct platform_driver nor_driver =3D {
> >> +     .driver =3D {
> >> +             .name           =3D "tegra-nor",
> >> +             .of_match_table =3D nor_id_table,
> >> +     },
> >> +};
> >> +module_platform_driver_probe(nor_driver, nor_probe);
> >> +
> >> +MODULE_AUTHOR("Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org");
> >> +MODULE_DESCRIPTION("NVIDIA Tegra NOR Bus Driver");
> >> +MODULE_LICENSE("GPL");
> >
> > You're header comment says GPL version 2, which means that the
> > MODULE_LICENSE needs to be "GPL v2". "GPL" means "version 2 or later".
>=20
> Ok, I do not really mind it being GPL version 2 or later so will
> change the header comment instead if that is ok.

I think "GPL v2" is traditionally more common in kernel code, but as the
author the decision is obviously yours.

Thierry

--UUBKWyapWpFAak7q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXlhcSAAoJEN0jrNd/PrOhxrkQAKIfNnJW/ScRBGHbRXFNx76t
jew18H44Px4L2AEbbWXwHFvflQ3TQ3n5M0wL7hu30lvbVh3oKMg80476HMnveUP2
rV9rWmMRIAWL7yBGdDGWE/b8g9NvT7oteLxPcHq0+uWhq0W7nnfdNNeoeJ/MHClA
XK0cN9/aBXn7ozo1nYXCcq7cxxPzYUmAvLMbwgawcX7YaY131QGNP+7w13sti3P+
H7Tro+MJLzwReJNG9q047oBCTrITXvx8Kt91ujQKjI+u0ZmxKjmIaVaNIch0olHu
9VgtorPZwOjPhAfS6K1zTlHHTUok0QPCd7rNhkXp/qi2aPB9Kksdk0LAVRS0lXln
vsLe25Fdn+y8jxTLrwzFNcKD3gWzUwxFOVVffoRWN+OywoPpY2zqCBQflGDqfC7u
2YUgyw7XVzCuVfJRqIT7jMdM3Cr0nrWW1OnSj29DPgAZRxKeMmiDN1GA2b6CZfPS
SngKBNgEUPoXo8sc8lTp/ytwXIys7smgf3yyO/D0hXyUCiRa0h6mLhqzNF5lbZvo
Gqo6MHqayGaZt0x67FlssSEWic+nGup55QPEyEFTZ9C3N7tOdV+w+yTPiRehWr/Z
MsbvT94eMiBnc+Qxc3gtqGPOC8/Wdbsgu+ZE79GW7UXWjls8bYMuOfD69WuvuoFk
0podG/7XHyb2nBwLheW1
=yf9T
-----END PGP SIGNATURE-----

--UUBKWyapWpFAak7q--
