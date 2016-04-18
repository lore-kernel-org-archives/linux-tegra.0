From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v10 2/9] dt-bindings: pinctrl: Deprecate Tegra XUSB pad
 controller binding
Date: Mon, 18 Apr 2016 13:12:00 +0200
Message-ID: <20160418111200.GA17716@ulmo.ba.sec>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
 <1457108379-20794-2-git-send-email-thierry.reding@gmail.com>
 <CACRpkda_YvQQesSUiZB0cpotZWyyd+5nUqzz3HjnY9fCanWJwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkda_YvQQesSUiZB0cpotZWyyd+5nUqzz3HjnY9fCanWJwQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 15, 2016 at 10:01:25AM +0100, Linus Walleij wrote:
> On Fri, Mar 4, 2016 at 5:19 PM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
>=20
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > This is an old version of the binding that isn't flexible enough to
> > describe all aspects of the XUSB pad controller. Specifically with the
> > addition of XUSB support (for SuperSpeed USB) the existing binding is
> > no longer suitable.
> >
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> That's unfortunate, not to say unelegant. I want to know Stephen's
> opinion on these patches (probably they are in another mail)
> before merging.
>=20
> Will the new binding also work with SuperDuperSpeed USB and
> SuperSuperMegaUltraOrtonSpeed USB I wonder... or will we
> change the bindings again?

Linus, Stephen's gave his Acked-by on this patch (provided it gets
merged into patch 1/9, which I've done locally), would you be willing to
give your Acked-by so that this change can go in via the PHY tree where
the new bindings are introduced?

Thanks,
Thierry

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXFMD+AAoJEN0jrNd/PrOhUFAP/RUJ76DnmLXdk4YMFD6R+pwf
ophM8Ra2/DXZ8AMugecHRW1i72UbaymTlY7ADUmTKNiwUHw7sPhf/PZ7vKM3FuCv
/IdodBRzXLicmp1vkRk/e5Qg1MXSYjTo3eEoraHOk7u1IDsxAcQq5Gs+c2jrWqcb
MBTCcoFarPlR2L4kEk/wOyPXGJCs+/T7Q8OMi0f0lxa5/qirtpUncd9Cx+ubS59p
Ja6hU8bNdiQBPOM8UQP8G2hN3gAgy4vkWYUZeBuXJOislUYpEMdAuTr3LyBXBos2
wEbCFvcy3cK8R94I60gsf6Miq4TAAVYEC7bjXgdeI3jK6SrWiS+5ya3azJL7lKO1
sCuFjrycduAI2VbF4gtcx7qy+wCjr3Ty+cBMzDl4+iUnRTiAUQsf1PjOK7cLF7yx
jMcDQcepXVYtltnmQ+jawFLzoDTBGgKyGJbBVeqkbEZTITvUZYbjFRLbycZjk1Ol
vjSj40+bWOIR1ze+GJiQ6fYK7hU4hmQGy4AjihEkVv7XCaPGNs8tZ1sfDkFlMOx3
ELHYcHszqkdtNOBpXZvqCDtGXUZnfMXA9d/CES9KCd8l/szIPDzEc4DU78iF26jb
oS6AiKP83CSAzRtwqzIyFQCpoQbGYvApt+FCyFyO5DKs7YeDo6T0Zz4iASPXsp46
Rb9IocR0WEA3rJf8eooh
=ZojY
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
