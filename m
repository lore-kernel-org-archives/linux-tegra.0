From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2] gpio: Add Tegra186 support
Date: Mon, 3 Apr 2017 07:28:09 +0200
Message-ID: <20170403052809.GA4203@ulmo.ba.sec>
References: <20170310162629.31455-1-thierry.reding@gmail.com>
 <CACRpkdZpev7op=4e7DwYfnRpNBPN6U_EXd6G3PqM-XQudLHqow@mail.gmail.com>
 <20170331145437.GA16964@ulmo.ba.sec>
 <CACRpkdZBp1Q=J9QgwegcfqxmnDSjzYnJQg1t2UpbRkemo9aCWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdZBp1Q=J9QgwegcfqxmnDSjzYnJQg1t2UpbRkemo9aCWg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Suresh Mangipudi <smangipudi@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 01, 2017 at 07:46:24PM +0200, Linus Walleij wrote:
> On Fri, Mar 31, 2017 at 4:54 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Fri, Mar 31, 2017 at 03:59:40PM +0200, Linus Walleij wrote:
>=20
> > If I call this multiple times with different parent_irq parameters, then
> > only the last one will be stored in gpiochip->irq_chained_parent. Later
> > on, this is used to disconnect the chained handler and data upon GPIO
> > chip removal, which means that handler and data for all but the last one
> > end up dangling.
>=20
> People are using this code already for chained handlers with several
> parents.
>=20
> I guess it works so nicely because gpiochips are often just added
> and seldom removed.
>=20
> Overall that means this is a bug and should be fixed, not that new
> drivers should avoid using this approach, or that we should discourage
> new drivers to use this API.
>=20
> >>       /* Set the parent IRQ for all affected IRQs */
> >>       for (offset =3D 0; offset < gpiochip->ngpio; offset++) {
> >>               if (!gpiochip_irqchip_irq_valid(gpiochip, offset))
> >>                       continue;
> >>               irq_set_parent(irq_find_mapping(gpiochip->irqdomain, off=
set),
> >>                              parent_irq);
> >>       }
> >> }
> >
> > Similarly here, we'd be setting the parent IRQ of all associated GPIOs
> > to the first, second... last parent IRQ. This is completely unnecessary
> > work and it's also setting the wrong parent. Note that we don't actually
> > care about that in the driver right now, but it's still wrong.
>=20
> Is that a way of saying there are bugs in the gpiolib?
>=20
> I know there are, maintainers working on core code are always
> lacking. I wrote this code and I admit I make mistakes, please help
> me fix them instead of trying to make this into a reason not to
> use this code.

Fair enough. I'll see if I can turn this into something that I can use
for this particular driver. I suspect it'll be a bit cumbersome because
of the parent/child relationship, but I have a couple of ideas that I'd
like to try out.

> >> Why are you keeping the irqs around after requesting?
> >> Use devm_*
> >
> > First I prefer to keep resource request and driver initialization
> > separate because it makes error recovery more robust. So this is used to
> > first store the results from platform_get_irq() and later on to iterate
> > over when installing the chained handlers.
>=20
> OK no big deal. But it could be in a local variable rather than
> in the driver state container, right?

Well, I also need the same array of interrupts to remove the handlers
again, so I don't think local would be enough. But...

>=20
> > Also, devm_* doesn't exist for irq_set_chained_handler_and_data(). So I
> > need to keep these around in order to properly uninstall the handlers
> > again on removal.
>=20
> OK is this something that should be fixed in the irqchip code?

=2E.. with this in place it wouldn't be necessary. Cross-subsystem series
are unlikely to make it for v4.12 at this point, so here go my hopes to
get this merged sometime soon...

Thierry

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAljh3WcACgkQ3SOs138+
s6EkDA//UevCf84t9XefdBVWtR0GS9zBZh/fLMZSyzYMG7zWxRLCm0GWdcc76VU2
g0Am1Sl7+xgAijfBACuaT+GkDLb9g/P4zY2qR7XkcgJwDDpAVXgNeV3vlXUt2Vs5
iXOvdU0BZw1rGthcRVzzvN1jKamdPF7l6W7r9bN6oIyuf0ixFUwroMH06fVgdi8Q
OjZj0gp0xP03dS+56bOSsdnO7MjPzORt5p5cyDrj2fweQbWbi4ocCGZkNWpMEw45
35zM7o5876AMqRy1M4/4l9QpQ65+p4DbKtHRpVOggyTaD/DSA0VSkn8TfgYhJXHb
NnhqAcKReAmNfmWhhy6iS39XmLXzM08ExJPjG1Fmalbcl5wBbN6kHhs3KlbTqYPr
P8hZw0m/CpHYP5npsnKheIWzZ9dekaTuTdSKMEXEoF7g+QHSak/4MPL3vFgc3j6h
eI3C4JUz4YG+GkdKyrPXrj9NnejQIVRiFU+xkFaIp8fG6SWKjQWE6IOnO0ADR5NA
R7zTSxzO/wPsJsDuOlVevFuQHX09z5vpQTUlvDphK4oRMTuhCDhJ8yC25dlu1oUo
2TAb/kcawZSymk//WtCrLegX5SarS0U36Hg35QTfk/hptLhbfZ68gDaWY1qX7Mxo
bumq30Kw9BjwefBCciv4kUY3PMmAdAiPTDbJGRIsGsfTU0mD+MY=
=iOfC
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--
