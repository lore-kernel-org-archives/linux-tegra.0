From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 00/16] gpio: Tight IRQ chip integration and banked
 infrastructure
Date: Fri, 15 Sep 2017 08:09:57 -0700
Message-ID: <20170914185233.GA6410@aiwendil>
References: <20170901185736.28051-1-thierry.reding@gmail.com>
 <CACRpkdaRsG-9YU2ufb+FxGOO38+x=AAfVUqxH5s56NH2iLw7oA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdaRsG-9YU2ufb+FxGOO38+x=AAfVUqxH5s56NH2iLw7oA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ext Tony Lindgren <tony@atomide.com>
List-Id: linux-tegra@vger.kernel.org


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2017 at 03:54:56PM +0200, Linus Walleij wrote:
> On Fri, Sep 1, 2017 at 8:57 PM, Thierry Reding <thierry.reding@gmail.com>=
 wrote:
>=20
> > here's the latest series of patches that implement the tighter IRQ chip
> > integration as well as the banked GPIO infrastructure that we had
> > discussed a couple of weeks/months back.
>=20
> Yes it has become really tasty now, don't you think :)
>=20
> I really like the series.
>=20
> Banks are handled in the core, exactly as I wanted.
>=20
> I will likely go in and change some things I don't like, like switching
> num_pins in the bank to num_lines. I have preferred that terminology
> to avoid confusion with pin control. So GPIO chips have lines, not pins.
> But it's so minor that I can fix it up if you don't want to.

I rebased this on today's linux-next and noticed that there was a small
conflict. I can rebase and work in the changes that you requested.

I'm travelling this week and next, so it may take until after -rc2 that
I can send out a new version that's properly build-tested.

> We also need to go in and patch Documentation/gpio/driver.txt
> to represent the current best practice. But that can be later,
> separate patch.
>=20
> > The first couple of patches are mostly preparatory work in order to
> > consolidate all IRQ chip related fields in a new structure and create
> > the base functionality for adding IRQ chips.
> >
> > After that, I've added the Tegra186 GPIO support patch that makes use of
> > the new tight integration.
> >
> > To round things off the new banked GPIO infrastructure is added (along
> > with some more preparatory work), followed by the conversion of the two
> > Tegra GPIO drivers to the new infrastructure.
>=20
> I have put all on a branch for pushing to the test builders to begin with.
>=20
> Then I plan to make one branch with all infrastructure patches
> (patches 1-10, 12-14) and pull that into devel, then apply patch
> 11 and 15-16 directly on devel.
>=20
> That way other subsystems (pinctrl ...) can pull in the infrastructure
> for people adding new gpiochips this cycle.

Sounds good.

> > Any thoughts on this? I'd like to target 4.15 with this,
>=20
> Me, too.
>=20
> > unless you'd be
> > willing to take this into 4.14, which I doubt at this point. The absence
> > of a GPIO driver has been hampering Tegra186 support upstream for a
> > while now, so it'd be good to make progress on this.
>=20
> Sorry about that. Let's move ahead with this now, it is neat and
> clean.
>=20
> What I want (as maintainer) is a bit of fingerpointing at the drivers
> that need to be converted to use the new banking infrastructure
> so they don't stay with their old crappy design pattern. OMAP is
> a clear candidate right? (Added Tony to CC...)

OMAP should be able to use this infrastructure, but it may not want to
because the semantics would change slightly. Currently OMAP registers a
GPIO chip for each bank, whereas this infrastructure exposes multiple
banks via a single chip.

There might be some userspace that relies on the existence of multiple
chips, but Tony can probably knows that better than I.

> Who else?

gpio-intel-mid.c and gpio-merrifield.c look like they could use this new
infrastructure. So do gpio-pca953x.c, gpio-stmpe.c and gpio-tc3589x.c.

gpio-ws16c48.c is another one that uses a similar pattern.

Thierry

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlm77UEACgkQ3SOs138+
s6FogQ//cO8Xz3D4OFTI4S31hMisiPbo0QBFSfYuN1a6m74WKmyo/5mQuCmYIPbX
rnSBRjVswm369mq0MHhQ3sljjdl4rYUCuqJj/77T4Hxs9CshFL98GzDzzvYzu/4J
Q80Ui225YEUHgucrDCnLNhcamlgS4dX5Vgx1Boi/W1RzE3oZKA6X5Jslj3r4NuCv
Lu/2KppAcz291GgRJcTsF7eJJzQgNSAlLNml93N5t6dScHwF4XmXMBG+HQJs7p/x
FE4u+n4Xf0PAyWERoQevvkKc5CJHysX38VqxNyBEMmeG1hWBtyqM/n16Cf4yEvSD
QEkBlczL2uI7nCToUDs43xN9BWaTmSeJ1/nJLijeam/7e6K/wrRN2BNJDxLUlmDV
6HJQ7md3CmH3DrVVP+N/eGppK623laLHrwTm8cz9AjhIPW6mVPrQ/VNlFOQ+vwWp
3ASKFc1jcmIvE5G9gu/Dw2TorDxpHmwKNQW1B65eG/1YbiK/Wn8wT7ZTGBUv8VBD
uakMIMxHRJoSfxu+obW7r/XVuGoazBsWDUh75ceMN/DM9/5S1WD2cBkTzJ/74huH
gp7J/m9oMj8ISFEz8p2tltYQc8Mipie2U2azP+vtWYN1cg7RMyP2Z/7A1Z89JK9g
TL6FB+DwntOfAL0hAOKvTfYY4cjbY3P3OJAi1T0AnMgaQdMYDp0=
=OHVc
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
