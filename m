From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 00/16] gpio: Tight IRQ chip integration and banked
 infrastructure
Date: Tue, 10 Oct 2017 13:27:19 +0200
Message-ID: <20171010112719.GC24484@ulmo>
References: <20170928095628.21966-1-thierry.reding@gmail.com>
 <44cf41e3-834e-ddb3-4c9e-8ab00e0866cb@ti.com>
 <20171006110749.GB22706@ulmo>
 <2c1abc4e-828e-8cd6-cce7-73050f5322fb@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="GPJrCs/72TxItFYR"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2c1abc4e-828e-8cd6-cce7-73050f5322fb-l0cyMroinI0@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--GPJrCs/72TxItFYR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 09, 2017 at 04:56:57PM -0500, Grygorii Strashko wrote:
>=20
>=20
> On 10/06/2017 06:07 AM, Thierry Reding wrote:
> > On Thu, Sep 28, 2017 at 09:22:17AM -0500, Grygorii Strashko wrote:
> >>
> >>
> >> On 09/28/2017 04:56 AM, Thierry Reding wrote:
> >>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>>
> >>> Hi Linus,
> >>>
> >>> here's the latest series of patches that implement the tighter IRQ ch=
ip
> >>> integration as well as the banked GPIO infrastructure that we had
> >>> discussed a couple of weeks/months back.
> >>>
> >>> The first couple of patches are mostly preparatory work in order to
> >>> consolidate all IRQ chip related fields in a new structure and create
> >>> the base functionality for adding IRQ chips.
> >>>
> >>> After that, I've added the Tegra186 GPIO support patch that makes use=
 of
> >>> the new tight integration.
> >>>
> >>> To round things off the new banked GPIO infrastructure is added (along
> >>> with some more preparatory work), followed by the conversion of the t=
wo
> >>> Tegra GPIO drivers to the new infrastructure.
> >>
> >> Hm. So you've ignored my comments [1].
> >>
> >> Sry, but I do not agree with this series.
> >> - no prof that it can be re-used by other drivers than tegra
> >>   (at least I do not see reasons to re-use it for any TI drivers)
> >=20
> > I had done some research based on Linus' feedback from an earlier series
> > and identified the following potential candidates[0] that could move to
> > this new infrastructure:
> >=20
>=20
> below based on code check:
>=20
> > 	- gpio-intel-mid.c
>=20
> one irq per all gpios in controller
>=20
> > 	- gpio-merrifield.c
>=20
> one irq per all gpios in controller
>=20
> > 	- gpio-pca953x.c
> one irq per all gpios in controller
>=20
> > 	- gpio-stmpe.c
> one irq per all gpios in controller
> > 	- gpio-tc3589x.c
> one irq per all gpios in controller
> > 	- gpio-ws16c48.c
>=20
> one irq per all gpios in controller

I explained in another subthread how we could cater for this particular
use-case.

> > Note that this is based on code inspection rather than DT inspection,
> > because that's fundamentally flawed. If you look at this from a DT
> > perspective you're going to be tempted to change the DT bindings, but
> > you can't do that because of backwards compatiblity. This new framework
> > also doesn't address the issues at that level, but rather tries to be
> > some common code that is otherwise duplicated in one way or another in
> > various drivers and therefore hard to maintain. This is what Linus had
> > originally requested, and that's what the series does.
>=20
> I've looked at this again, and again. I've looked on drivers listed above.
> Sry, I do not see how this change can improve/simplify above drivers :(
> May be it will clean up my doubts, if it will be possible to convert more
> drivers?

I'm reluctant to spend more work on this and get Tegra186 GPIO support
delayed indefinitely until every other driver has been converted. The
Tegra186 GPIO driver is now more than a year old and I've got a few
dozen patches that depend on GPIO functionality that we currently can't
merge because this unification work has been going on for more than 6
months. This has been a very frustrating experience overall.

I think this series is in good enough shape for now. It improves the
situation in general. I also don't see anything in here that couldn't be
further improved should the need arise.

If this really isn't useful at all, can we please at least get patches
1-11 merged? T hey are independent of the banked infrastructure work in
the last couple of patches.

> >> - no split
> >=20
> > What does this mean? The series is nicely split into separate patches,
> > so each one individually is easy to review. I've also gone through quite
> > some trouble to make sure everything builds fine after each patch, so
> > it's possible to apply individual bits of the series. For example we
> > could opt to apply everything up to the banked GPIO support if that's
> > still contentious.
>=20
> i've commented it in [1]. copy paste here
>=20
> >>
> So, can it be split? I think, patches which reorganize gpio irqchip speci=
fic fields placement=20
> and move them in gpio_irq_chip can be considered separately if they will =
not introduce
> functional changes. Also, omap changes can be considered separately.
> (Pay attention that new fields introduced in patch 1).=20
> >>
>=20
> This will reduce size of your series and concentrate review attention on =
actual functional changes.
>=20
>=20
> [1] https://lkml.org/lkml/2017/9/15/442

I could of course split the series into multiple parts, but then it
becomes difficult to represent dependencies. The changes you mention are
already split into separate commits and I even made sure that they keep
bisectibility. I've sent them together primarily to keep them in the
order that they need to be applied in to simplify things.

I don't see how splitting up the series any further is going to simplify
review. If you want to only review the banked infrastructure change, can
you not just focus on that patch and ignore the first ten since they are
not actually functional changes?

>=20
> >=20
> >> - all GPIO IRQs mapped statically
> >=20
> > This series predates your work on the dynamic IRQ mapping, so I hadn't
> > picked up those changes. This should be easily solved by the attached
> > patch, though.
> >=20
> >> - irq->map[offset + j] =3D irq->parents[parent]; holds IRQs for all pi=
ns
> >>    which is waste of memory
> >=20
> > It's the only way to generically do this. Also I don't think this wastes
> > that much memory. We have one unsigned int per pin, which even for very
> > large GPIO controllers is unlikely to exceed one 4 KiB page.
>=20
> for system with <128M of memory even 4k is a win.

I suspect that such systems won't have GPIOs where this infrastructure
would be used, or where the number of GPIOs would be problematic.

Also, this is supposed to be generic infrastructure and that usually
comes at some price. I don't know how to do this without the mapping,
but I'm certainly open to suggestions.

> >> - DT binding changes not documented and no DT examples
> >=20
> > That's because this is completely orthogonal to DT bindings. We can't
> > make any changes to the bindings because of ABI stability.
> >=20
> >> - below is ugly ;)
> >> +	bank =3D (spec[0] >> gc->of_gpio_bank_mask) & gc->of_gpio_bank_shift;
> >> +	pin =3D (spec[0] >> gc->of_gpio_pin_mask) & gc->of_gpio_pin_shift;
> >=20
> > If by ugly you mean wrong, then yes, it's actually the wrong way around.
> > It should be:
> >=20
> > 	bank =3D (spec[0] >> gc->of_gpio_bank_shift) & gc->of_gpio_bank_mask;
> > 	line =3D (spec[0] >> gc->of_gpio_line_shift) & gc->of_gpio_line_mask;
>=20
> =20
> Wrong yep. And No. What I do not like is encoding bank & line in the same=
 field.

This is not about liking or disliking the encoding. The encoding is
already defined in the bindings for Tegra and Tegra186, so this isn't up
for discussion.

> It creates some not clear DT standard bindings requirements as for me, co=
mparing to the
> current well known GPIO bindings=20
>  gpios =3D <&[controller] [line number in controller] [flags]>;
> line number in controller ::=3D [0..max lines]

Yes, that's because this is specifically for banked controllers. It
seems to me like most other bindings for banked controllers simply use a
linear mapping, in which case the simple example above would work.

Tegra seems somewhat of an exception because the DT bindings use the
(bank, line) pair encoding to reflect the names given to the lines in
technical reference manuals. I like this because it makes the DTS files
very easy to read and relate to schematics.

> Actually, as per gpio.txt:
> "Note that gpio-specifier length is controller dependent.  In the
> above example, &gpio1 uses 2 cells to specify a gpio, while &gpio2
> only uses one.",=20
> so, if this going to be part of gpiolib it should be
>  described in bindings/gpio/gpio.txt (or some other documents), as
>  above note will not be exactly correct and new "banked" gpio controllers
> will be expected to use thin new binding.

Yeah, that makes sense. I'll work on a patch that updates the binding
documentation to include this particular encoding. Again, this is not
intended to replace existing bindings because they may not be
compatible. However, bindings for new banked controllers may be able
to reuse this if it suits their needs.

Also, note that the rest of the banked infrastructure can be used
independently of the ->xlate() callback. Drivers are free to use the
of_gpio_simple_xlate() with the rest of the banked infrastructure to
simplify the driver code.

Thierry

--GPJrCs/72TxItFYR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlncrpQACgkQ3SOs138+
s6FYlg//fG7tPe0+nk7fuq0P6HAea9UaUSKTAZuj/hbMzY/BR9zW3HMMIqB1spT3
dl+LiuMDLtB1APPbsn2fPOK9QBNYgILW/amUG//bIMTquKjZPxNmFQGgDF49Asak
+mmq/8UG6nRRy3M3zB6V6lfCUHcukqE5y9keO9+wGIZDQPyLHDSJPo+Sl20LDJJD
5qDAjBj6iLe35XNyNg93a/YVp8T7bS44dpwB1XnhbLW6BYOo81NR0kJXCfmratzi
dFZ6tTSinKX5Vd72GEyzMf+1e9hcBQ+1fxtPF2pZTwvmj6GrmtnprfBXtuJ3znx4
67+nL6SD86AxDJ7X2HPo1YMiPZfqPSywANRONonLy+Tb2P2KCD7W8nMARnj+0YY7
eu1WrJvwXwR/LZbx5UdQK4FVzdCNO0FerI1GCyODegeA/lvBUhbd6hhc8FzE2rd7
OMVXA6Oe//yv8gLhebNN77Oy6DcwkzYJl89enMmqAEVPxdMiPcgeuhgoSG63EfFw
iLRQDP570HKT0Nm4K5Qn3VBoPcDTTJRHqOGr5oBUiLg0FMkVU+Nu2CKNM6kvGkZ2
m5608sndPQXMexBPFRKQVXfYgcRiUl6r1U/tVksK3O48I0Y7y8+fAYlzXeauhqY3
ENdp0BWPmD6kXIzuWh/9njU76sYqyfXAfHrGK1XIqCxmZUs4zMk=
=5Rut
-----END PGP SIGNATURE-----

--GPJrCs/72TxItFYR--
