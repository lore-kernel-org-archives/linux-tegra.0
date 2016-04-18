From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v10 2/9] dt-bindings: pinctrl: Deprecate Tegra XUSB pad
 controller binding
Date: Mon, 18 Apr 2016 13:36:00 +0200
Message-ID: <20160418113600.GB17716@ulmo.ba.sec>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com>
 <1457108379-20794-2-git-send-email-thierry.reding@gmail.com>
 <CACRpkda_YvQQesSUiZB0cpotZWyyd+5nUqzz3HjnY9fCanWJwQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bCsyhTFzCvuiizWE"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkda_YvQQesSUiZB0cpotZWyyd+5nUqzz3HjnY9fCanWJwQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--bCsyhTFzCvuiizWE
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

To answer this question: yes, I think that it will be flexible enough to
support future generations of this IP, provided that the design doesn't
change in a fundamental way.

The change from the pinctrl-based bindings to this new one is that each
lane provided by the XUSB pad controller is exposed as a separate PHY
object and hence allows fine-grained control over when which lane is
powered up. It also allows each lane to be easily configured because it
has its own device tree node.

Thierry

--bCsyhTFzCvuiizWE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXFMaeAAoJEN0jrNd/PrOhZzsP/jlE9YhXhA912yn8HMiSiIvx
NVz5bU6sclULKJOFy4AwGMyM61hMUyfou6Ja2tGpGkqVbTb1i9+n1NhFFZZATVrF
f+ifuIGZSEeSh8Kir9yZulOAdHtz77nj6YM/BQ6gk+geVxJ9xT0hfpw56KtCCSh/
m4mxThqxgpc4e8Tko7NI8eYr01cJL5G0q89FHzYmtaGqN/32FzKXKKU922uMPRr4
trs76aWXLSJwxILbVR6Pr5m11+lLFz2v8vvS530A6WDNQEJspindhwglI0T909Fv
QmamdvIhtxQq5Gh+0dFaul1oXn8XuW/QtxmiDlbysQoQDtch6GyB2Q6sIFQlmcWl
ZBULd98do+1wcFfCrIamWpQvyeeUBihCQzA0eT2U6Wh+aIjwBgm8Nkea13+ixHaB
dOU5EY21RX3VnSOXvy+tDN9KFxeV4H0LZLRijEqphYl20Awfx1ROpOzqcYfNoRVw
Q8Ih/izvfTyFUqk8k4VhbXtTLUJTKzbUKP8DrfpSa4jBHK2l3mmW2IA3MUQJ+v6G
+jqfZP10slgX/UsMzc1TFtmMhuDTsNr5c3hTNGdDvZHnm1c1aNNV0a1HNZtKhVK/
ktp6J6MSYgrflNkj3mVj2xQQmV18cC61JL9K3mo0S75BaRf/8kJqb0cq7e7QftMA
+UkE2RsInjlI9H91WzOM
=iZtc
-----END PGP SIGNATURE-----

--bCsyhTFzCvuiizWE--
