From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH] gpio: tegra186: Add support for T186 GPIO
Date: Thu, 24 Nov 2016 17:32:31 +0100
Message-ID: <20161124163231.GD26657@ulmo.ba.sec>
References: <1478083719-14836-1-git-send-email-smangipudi@nvidia.com>
 <0e3e89a8-a2f1-68c2-0586-58902fb91587@wwwdotorg.org>
 <20161122173042.GA3239@ulmo.ba.sec>
 <CACRpkdbfkv7Yt3cOah_BGcgnqVtxvzWOqm2+HH_rkrpnJt0nFA@mail.gmail.com>
 <20161123194036.GA25876@ulmo.ba.sec>
 <CACRpkdYEpenBbb9u=VPzu4eZOQutk4qP6h5T84=AKi73AJCQHw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wLAMOaPNJ0fu1fTG"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdYEpenBbb9u=VPzu4eZOQutk4qP6h5T84=AKi73AJCQHw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Suresh Mangipudi <smangipudi@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org


--wLAMOaPNJ0fu1fTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 24, 2016 at 04:08:08PM +0100, Linus Walleij wrote:
> On Wed, Nov 23, 2016 at 8:40 PM, Thierry Reding
> <thierry.reding@gmail.com> wrote:
> > On Wed, Nov 23, 2016 at 02:25:51PM +0100, Linus Walleij wrote:
>=20
> >> Everything, all kernel users and all character device users, end up
> >> calling gpiod_request().
> >
> > It looks like I stumbled across the only case where this isn't true.
> > What I was seeing, and which ultimately led me to implement the compact
> > numberspace is that gpiochip_add_data() calls ->get_direction() directly
> > without first going through ->request(). We'd have to guard that one
> > case as well in order for this to work.
>=20
> Hm. So there are two ways we could address that:
>=20
> - Make irq_valid_mask a pure .valid_mask so we can mask off
>   gpios not just for IRQs but for anything, if this is consistent
>   with what Mika needs or
>=20
> - Make the .get_direction() callback return -EINVAL or whatever
>   for the non-available lines, exactly how .request() does it,
>   and manage that in the core when looping over them to get
>   the direction in the gpiochip_add() call.

Another alternative might be to do a ->request() on the line first
before even attempting to call ->get_direction(), which would make
checking for valid lines uniform with all other places. That way a
driver wouldn't have to perform the same check in both callbacks.

> >> How this blocks the IRQs from being requested can be seen
> >> in the irqchip helpers in gpiolib.c. The common GPIOLIB_IRQCHIP
> >> gracefully handles this too.
> >
> > I don't think it does. The issue I mentioned for gpiochip_add_data()
> > exists in gpiochip_lock_as_irq(). That code assumes that all GPIOs from
> > 0 to chip.ngpio - 1 are valid.
>=20
> It shouldn't matter since we should deny these to be even
> mapped as IRQs before the irqchip callbacks for requesting
> resources are called so it's not happening. This is happening
> with GPIOLIB_IRQCHIP.

Yes, it looks as though the irqchip->irq_request_resources() will only
be called at IRQ request time, so the gpiochip_lock_as_irq() will be
called after the chip was registered and so I assume the irq_valid_mask
would be properly set up to avoid callbacks for non-existing GPIOs.

> > Each hardware block also implements a number of "ports": 8 for AON and
> > 23 for main. Each of these ports has a different number of pins. Often
> > there will be 6, 7 or 8, but a couple of ports have as little as a
> > single pin.
>=20
> What a maze. I would be happy if all this weirdness resides
> in the device driver ;)
>=20
> > Each port is associated with a given "controller", that is
> > interrupt, so when a GPIO of a port is configured as input and enabled
> > to generate an interrupt, the interrupt of it's parent controller will
> > be asserted. I'm not exactly sure how this association is done, I have
> > not found anything in the TRM.
>=20
> Is nVidia one of those throw-over-the-wall engineering companies
> where hardware engineers toss a chip over the wall to the software
> developers and don't expect them to ask any questions?
>=20
> I'm asking since there are so many nVidia people on this thread.
>=20
> I would normally expect that you could simply go and ask the
> hardware people?

I can certainly find out, but I was hoping that since Suresh had these
numbers in the patch, he would know where to find the information. It's
not so much that we can't get answers from engineering, quite the
opposite actually. I only refer to the TRM because it is supposed to be
the canonical documentation and if this information isn't there we need
to get it added. Doing that can be somewhat tedious, and me being lazy
I was hoping that I had simply missed it.

> >> It seems that "controller" refer to two different things in the two
> >> sentences. Do you mean your hardware has ONE controller with
> >> several BANKS? (as described in Documentation/gpio/driver.txt?)
> >
> > I hope the above clarifies things. struct gpio_chip represents the
> > entire hardware block (in current drivers) and the driver deals with
> > individual controllers and ports internally. The proposal I was talking
> > about above is to have one driver create multiple struct gpio_chip, each
> > representing an individual port. Hence each struct gpio_chip would be
> > assigned the exact number of pins that the port supports, removing all
> > of the problems with numberspaces. It has its own set of disadvantages,
> > such as creating a large number of GPIO chips, which may in the end be
> > just as confusing as the current implementation.
>=20
> I have a soft preference toward making one chip for each port/bank.
>=20
> But it is not strong.
>=20
> That opionon is stronger if the port/bank has resources such as a
> clock, power supply or IRQ line. Then it tends toward mandatory
> to have a gpio_chip for each.

There really aren't any per-port resources. In fact now that I think
about it adding a gpio_chip per port might actually make things more
difficult because the interrupts are per-controller which may control
one or more ports.

> >> Use the new character device, and for a new SoC like the tegra186
> >> you can CERTAINLY convince any downstream consumers to
> >> switch to that.
> >
> > I've looked a little at the character device implementation and I think
> > it would work equally bad with the compact numberspace as sysfs. The
> > reason is that gpiolib doesn't allow remapping of chip-relative indices
> > except for DT. I think this might be possible by generalizing the
> > ->of_xlate() to be used in translating internal numbers as well. The way
> > I could imagine this to work is that an IOCTL providing offsets of the
> > lines to use would pass the offsets through the chip's ->xlate()
> > function to retrieve the index (0 to chip->ngpio). The alternative is to
> > stick with the sparse numberspace and deal with non-existing GPIOs via a
> > ->request() callback.
>=20
> I don't understand. Userspace should have no concern about the
> numberspace. Lines can be named from DT or ACPI so you can
> look up line chip+offset from the names.

Userspace would have to know about the numberspace if it wants to use
the character device, right? The numberspace in DT assumes that each
port has 8 pins (this makes it very easy to create a unique index by
doing (port * 8 + offset) as in:

	#define TEGRA_MAIN_GPIO_PORT_A 0
	#define TEGRA_MAIN_GPIO_PORT_B 1
	...

	#define TEGRA_MAIN_GPIO(port, offset) \
		((TEGRA_MAIN_GPIO_PORT_##port * 8) + offset)

It also provides an easy way for the driver to check for validity: a
port can be obtained by dividing the DT index by 8, and the offset of
the pin is the remainder of the division. If the pin number is higher
than the number of pins supported by the given port we can return an
error. That's what tegra186_gpio_of_xlate() does, it translates from
the DT sparse numberspace into the compact numberspace in gpiolib and
rejects invalid pins at the same time.

> Further sysfs sys/bus/gpio (notice: NOT /sys/class/gpio !)
> contains topological information, that is the approach taken by
> userspace helpers such as udev.
>=20
> >> Please just disable CONFIG_GPIO_SYSFS from your defconfig
> >> and in any company-internal builds and point everyone and their
> >> dog to the character device: tools/gpio/*,
> >> and the UAPI <linux/gpio.h>
> >
> > I don't think we can easily do that. People may still rely on the sysfs
> > interface, or even if they aren't this might be enabled in a multi-
> > platform image.
>=20
> Good suggestion. I will go and look at the upstream multiplatform
> configs and eradicate this.
>=20
> > So I think regardless of whether or not we like the
> > interface, we have to make sure that our solution plays nicely with it.
>=20
> I would be concerned if you are designing your driver around the
> the way the legacy sysfs happens to work.
>=20
> The thing is broken. Don't design FOR it.

That's not what I meant. I just don't want the driver to crash the
kernel if somebody happened to use it via sysfs.

> You are making me tempted to require that for new hardware the
> driver has to
>=20
>    depends on !GPIO_SYSFS
>=20
> In order to make this a non-argument.
>=20
> Well it would be undiplomatic on my part I guess. But I have to
> encourage/nudge a switch somehow.
>=20
> > There is no problem with the compact numberspace, though it comes with
> > the inconvenience that numbering in sysfs is different from numbering in
> > DT.
>=20
> That is fixed in the chardev ABI. Offset on the chardev is the same
> as the internal offset of gpio_chip, and therefore the same as used
> when doing xlate in the DT for a chip, i.e. the DT offset numbering.

That's not quite true. In the version of the driver that I have the
->of_xlate() translates the DT numberspace into an internal one that
doesn't have the holes which are problematic (because the associated
registers don't exist). What you are referring to would be what the
of_gpio_simple_xlate() does.

> >   1) use a sparse numberspace and deal with non-existing GPIOs via the
> >      ->request() callback
> >
> >   2) use a compact numberspace and live with separate methods of
> >      referencing GPIOs
> >
> >   3) use a compact numberspace and introduce a mechanism to translate
> >      all hardware numbers into per-chip indices
> >
> > I think 1) is the simplest, but at the cost of wasting memory and CPU
> > cycles by maintaining descriptors for GPIOs we know don't exist.
>=20
> You could make a quick calculation of how much that is actually.
> I doubt it matters for a contemporary non-IoT platform, but I may
> be wrong.

For the main controller the number of physically available GPIO lines is
140, whereas the DT numbering assumes there are 184. That's 44 more than
there really are, which is about 30% overhead. For AON it's 47 to 64 and
about 25% overhead.

It's not so much that it's a real problem, but more of a matter of
principle. I'm not at all concerned about this having an adverse effect
in practice, I just think it's wrong.

But if everyone else thinks it's okay, I'm sure I can find ways to live
with it.

> > 2) is
> > fairly simple as well, but it's pretty inconvenient for the user. The
> > most invasive solution would be
>=20
> Inconvenient to in-kernel users or userspace users?

in-kernel users would be using DT to refer to the GPIOs and that's a
solved problem because ->of_xlate() gives us a way of translating
between them.

> Inconvenient to sysfs users or chardev users?

It would be inconvenient for both because even though chardev gives us
per-chip offsets, there is no way to translate these offsets from the
external to the internal numberspace. Hence chardev would inevitably
have to use a numberspace different from that of DT.

> If it is invonvenient to sysfs users is of no concern, as long
> as it is no broken.

For sysfs there's no way we could use a compact numberspace and be
compatible with the DT numberspace because it is not possible to
translate from the global numberspace to a per-chip numberspace if
it isn't a 1:1 mapping.

> > 3), though I personally like that best
> > because it is the most explicit. It does have the disavantage of using
> > separate numbering for sysfs and everyone else, though. Unless you're
> > willing to make sysfs use per-chip export/unexport files and the
> > ->xlate() callback.
>=20
> I don't know if I even understand (3).

Essentially this would mean generalizing the ->of_xlate() to apply to
all users (DT and chardev alike, and I suppose ACPI as well). I think
it's a superior solution because it's completely generic. Currently I
think all of the GPIO users are forced into a 1:1 mapping and working
around it if that's not how the hardware works. A generic ->xlate()
would completely separate the external numberspace from the internal
contiguous, compact numberspace. And it would allow us to do so in a
unified way.

Thierry

--wLAMOaPNJ0fu1fTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYNxYcAAoJEN0jrNd/PrOhfPYQALpOMTAxP6fJBgCFfiEx4Q+c
1IFQ+HeA9Wu5IAAOA6aFmObLUbaYm3pU70Vf3UqV29HV2ehZa+xJVWbwfi6KyqYf
Z9bLWIfqCr4uB4O8Cch7IxdiUROPtRBDAwsOgr7KK80Ybz58lN0BoVQ6BIZyjdcC
8fUPqW+0UW7FVM5H53IByGl3RATL9d1ZDOqdUjysf3rvo4pqdYU9knY0nQXdCuB2
pgoj1a9ZmThdemILwdV4yWkYG2ThLmYjRTBNVAooY6lHke5TE1ezi6ZZ92FhlURB
6aPDcxMzY1JHqO7tSD6jE/9bfwxcamc1RnFclwfNmXM9tF2KvnDLPEPEnI7/OrQG
eRTPr5YX7aacuhHMoOiV/7ZEZY8xDVpMoQzEu4PxYQA3/7LnoPPiKeRUBrB2Dh4z
EotSjSbbDhfa7K+vuV5xbNva6UnPz5JSc4sxZq9tCZsf18Ze9/t2N31Uh+z6irlo
ctsTm0QPj2VE3lqWCmusQ4qSaP5S+60Wbps8UB6aVMxczBFhh2FuFsM/TmxAypEW
2FljN7tVkH4eteZy6cxebl7O1J5DdVKLEXI4AvyYJ1r9hdbG3RoSQVIL++8XqiKg
yGm6b9kf9BEuSAycsvBc9/jjmJT2ukgM7ROC/WN7gHhaT8QPB/FlQ9GCh80lrwyd
8ynvRKuFhh53eqHS5opi
=M9FO
-----END PGP SIGNATURE-----

--wLAMOaPNJ0fu1fTG--
