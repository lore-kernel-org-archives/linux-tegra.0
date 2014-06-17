From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 1/4] of: Add NVIDIA Tegra XUSB pad controller binding
Date: Tue, 17 Jun 2014 14:09:44 +0200
Message-ID: <20140617120943.GD18816@ulmo>
References: <1402930623-28886-1-git-send-email-thierry.reding@gmail.com>
 <539F6318.5010306@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eqp4TxRxnD4KrmFZ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <539F6318.5010306-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--eqp4TxRxnD4KrmFZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2014 at 03:35:20PM -0600, Stephen Warren wrote:
> On 06/16/2014 08:57 AM, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > This patch adds the device tree binding documentation for the XUSB pad
> > controller found on NVIDIA Tegra SoCs. It exposes both pinmuxing and PHY
> > capabilities.
>=20
> This looks fine to me, with one issue below:
>=20
> > diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-=
xusb-padctl.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124=
-xusb-padctl.txt
>=20
> > +Required properties:
> > +--------------------
>=20
> > +- #address-cells: Should be 0.
> > +- #size-cells: Should be 0.
>=20
> I don't think those properties are needed. If they are, a value of 0 for
> both doesn't seem useful. I assume those two lines should just be
> deleted, and also from the example below.
>=20
> Assuming I take this through the Tegra tree, If this is the only issue,
> I can delete those lines when applying.

I've just sent a v4 including these changes along with a fix for the bug
that Mikko pointed out.

Thierry

--eqp4TxRxnD4KrmFZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJToDAHAAoJEN0jrNd/PrOh028P/A2+b6W3R7yfM47ZdQzv4DtX
r0xk+LP73Fu3nrMP6v0YeF8J0HU4fWEtN9WHH+zACP95+XpB+ljazQuUTxyo7Ydn
Fos+Ntan6WTaZeYUlYw9P7G/ABJbXSI+cffsWnWkNHwfS/5/jUDwygWuXY32G+/V
fldGDMkH41RZ7RDfOezDIRDl3mfiGQMSqyI1G4fRK1swA5PEGS5OkVf7VfYzAsdA
UaMNHueEin2ENKvqBZUJPOcPNpzllmn0PzimzaMeVxnrwnZE7ZeP+KcMFq2WTFil
92gTcrqcuM3n/dXu1ZBIrCQh7KAtsMZokEm9pgf32+Y3XQ1QMdA12uEqe64qZU+U
tryjh1kn4o51yXT8t3FoW6NbzC7xn0TaEHxA2VJyCC493tEoaMpqgzs/whuA0+xp
+SPXVN8nPnX7dcpKY6pQm1tJh60kuo0kISrxMv+D5NXDTy+vhRRGuFeVElIoRdy8
+r64faave+S3/zu3EZMpehD6+TRjOvrfDPQMKJ0FDGkjg9y4oR9QOpsiKIySkA99
kQ3tXyF6RpWgqF2TFSxH2Rh4yaqE37oykbKU0LBbJSWNuy4hTdHTS02H2LmU6lu6
PBFG/F8ftF1VasEE4NnXb9S5aBC8FV7VvSxs6q4NQcQMHuxiirSujhzHu5jxdZu5
8q8bx2IdEtXWcW+SrvW0
=QkAV
-----END PGP SIGNATURE-----

--eqp4TxRxnD4KrmFZ--
