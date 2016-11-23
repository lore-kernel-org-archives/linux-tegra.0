From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] gpio: tegra186: Add support for T186 GPIO
Date: Wed, 23 Nov 2016 20:40:36 +0100
Message-ID: <20161123194036.GA25876@ulmo.ba.sec>
References: <1478083719-14836-1-git-send-email-smangipudi@nvidia.com>
 <0e3e89a8-a2f1-68c2-0586-58902fb91587@wwwdotorg.org>
 <20161122173042.GA3239@ulmo.ba.sec>
 <CACRpkdbfkv7Yt3cOah_BGcgnqVtxvzWOqm2+HH_rkrpnJt0nFA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VbJkn9YxBvnuCH5J"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbfkv7Yt3cOah_BGcgnqVtxvzWOqm2+HH_rkrpnJt0nFA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Suresh Mangipudi <smangipudi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--VbJkn9YxBvnuCH5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 23, 2016 at 02:25:51PM +0100, Linus Walleij wrote:
> On Tue, Nov 22, 2016 at 6:30 PM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>=20
> > So I don't really know how to go about merging both. I'll reply to this
> > email later with a copy of the patch that I wrote, maybe we can take it
> > from there.
>=20
> I trust you nVidia people to sort this out.
>=20
> I guess in worst case you can have a company strategy meeting about it.
>=20
> Let me just say: when one of you have a patch that bears the ACK of the
> other, I will merge it.
>=20
> > However there's another problem with this patch. If you try and export
> > a non-existing GPIO via sysfs and try to read the value file you can
> > easily make the driver hang a CPU. This only seems to happen for the
> > AON GPIO controller.
>=20
> That sounds like a bug. But I strongly suggest you first and foremost
> to test your code with the character device and not through sysfs.
>=20
> sysfs is second priority, and while I don't want it to screw things up, it
> is an optional legacy bolt-on not a compiled-in recommended thing.
>=20
> The character device, on the other hand, is a recommended
> practice for userspace GPIO.

The root cause here would be that we don't implement .request(), hence
we're not actually preventing access to the non-existing GPIOs.

> > One way to solve this is to make a massive change to the GPIO subsystem
> > to check for the validity of a GPIO before any access. I'm not sure if
> > that's desirable, maybe Linus has some thoughts about that.
>=20
> This is already possible and several drivers are doing this.
>=20
> Everything, all kernel users and all character device users, end up
> calling gpiod_request().

It looks like I stumbled across the only case where this isn't true.
What I was seeing, and which ultimately led me to implement the compact
numberspace is that gpiochip_add_data() calls ->get_direction() directly
without first going through ->request(). We'd have to guard that one
case as well in order for this to work.

> We agree violently that if this GPIO is not valid, inaccessible (etc)
> it should not return a valid GPIO descriptor.

Yes.

> Consider drivers/gpio/gpio-stmpe.c which has a device tree property
> "st,norequest-mask" that mark some GPIO lines as "nonusable".
> This is because they are statically muxed for something else.
>=20
> (It is a subject of debate whether that is a good way to mark the
> lines as unusable, probably not, but it is legacy code.)
>=20
> We know a number of lines are not elegible for request
> or to be used for triggering interrupts.
>=20
> The code does this in .request():
>=20
> if (stmpe_gpio->norequest_mask & BIT(offset))
>                 return -EINVAL;
>=20
> Thus any gpiod_get() will fail. And we are fine.
>=20
> Further, since it can also be used as an interrupt parent, it
> does this in .probe():
>=20
> of_property_read_u32(np, "st,norequest-mask",
>                  &stmpe_gpio->norequest_mask);
>=20
> if (stmpe_gpio->norequest_mask)
>          stmpe_gpio->chip.irq_need_valid_mask =3D true;
> for (i =3D 0; i < sizeof(u32); i++)
>          if (stmpe_gpio->norequest_mask & BIT(i))
>                    clear_bit(i, stmpe_gpio->chip.irq_valid_mask);
>=20
> How this blocks the IRQs from being requested can be seen
> in the irqchip helpers in gpiolib.c. The common GPIOLIB_IRQCHIP
> gracefully handles this too.

I don't think it does. The issue I mentioned for gpiochip_add_data()
exists in gpiochip_lock_as_irq(). That code assumes that all GPIOs from
0 to chip.ngpio - 1 are valid. And perhaps that's exactly how it should
be. But that's not true in this version of the driver. Perhaps I should
clarify what exactly we're talking about here, because I'm not sure it's
obvious.

On Tegra186 there are two "controllers" (perhaps I should say hardware
blocks) that provide GPIOs. One is in the always-on partition of the
chip and is therefore typically called "AON", whereas the other is
called "main". Both of these hardware blocks implement a number of
"controllers": 1 for AON and 6 for main. This is really only apparent in
the number of interrupts that they receive. AON has one interrupt line
whereas main has 6 of them.

Each hardware block also implements a number of "ports": 8 for AON and
23 for main. Each of these ports has a different number of pins. Often
there will be 6, 7 or 8, but a couple of ports have as little as a
single pin. Each port is associated with a given "controller", that is
interrupt, so when a GPIO of a port is configured as input and enabled
to generate an interrupt, the interrupt of it's parent controller will
be asserted. I'm not exactly sure how this association is done, I have
not found anything in the TRM. Perhaps Laxman, Suresh or Stephen can
clarify. Looking at Suresh's patch there's no clear pattern to it, so I
guess I just missed the table that has this information. In my driver I
chose the easy route and just requested each interrupt with the same
handler, which means we potentially waste some time by reading some
interrupt status registers that we don't have to. This could be made
cleverer by filtering for those that match the controller whose
interrupt we're handling.

Anyway, to get back to what we're really talking about here: Suresh's
patch registers 8 pins per port, regardless of the actual number of pins
that the port has. This simplifies things in some ways. For example the
numbering in DT (see include/dt-bindings/gpio/tegra186-gpio.h) is the
same as gpiolib's internal numbering. Which means that everyone can just
use the index of the desired port, multiply it by 8 and add the pin
index to get at the GPIO number relative to the GPIO chip. The downside
is that we make gpiolib believe that there are more GPIOs in the chip
than actually exist. It's not so much that these pins aren't accessible
because they are used for other purposes (that's something that could
happen in addition) but because they simply don't exist.

With the AON controller this seems critical because it will hang a CPU
(though I've also seen exceptions rather than hangs) if registers that
belong to these non-existing GPIOs are accessed (presumably there are
hardware checks for registers that don't exist).

> If the sysfs ABI does not block the use of the same lines
> as efficiently, it is a bug in the sysfs code. This works fine
> to block access for all in-kernel and chardev users.
>=20
> But as far as I can tell, sysfs ALSO uses gpiod_get() so it should
> work fine.

Yeah, I think the implementation is fine, it's just that it relies on a
mechanism that this driver doesn't implement.

> > If we stick with a compacted number space, there are two solutions that
> > I can think of to remedy the sysfs problem. One would be to register a
> > separate struct gpio_chip for each controller. That's kind of a sledge-
> > hammer solution because it will create multiple number spaces and hence
> > completely avoid the sparse number space for the whole controller. I
> > think Stephen had originally proposed this as a solution.
>=20
> Note ambigous use of "controller" above. I'm confused.
>=20
> "One would be to register a separate struct gpio_chip for each controller=
=2E"
> / "and hence completely avoid the sparse number space for the whole
> controller."
>=20
> Eheheh
>=20
> It seems that "controller" refer to two different things in the two
> sentences. Do you mean your hardware has ONE controller with
> several BANKS? (as described in Documentation/gpio/driver.txt?)

I hope the above clarifies things. struct gpio_chip represents the
entire hardware block (in current drivers) and the driver deals with
individual controllers and ports internally. The proposal I was talking
about above is to have one driver create multiple struct gpio_chip, each
representing an individual port. Hence each struct gpio_chip would be
assigned the exact number of pins that the port supports, removing all
of the problems with numberspaces. It has its own set of disadvantages,
such as creating a large number of GPIO chips, which may in the end be
just as confusing as the current implementation.

> > The other possibility would be for the GPIO subsystem to gain per-chip
> > GPIO export via sysfs. That is, instead of the global export file that
> > you write a global GPIO number to, each per-chip directory would get
> > an export file.
>=20
> No. The sysfs ABI is in
> Documentation/ABI/obsolete/sysfs-gpio
> for a reason: I hate it and it should not be extended whatsoever.
>=20
> Use the new character device, and for a new SoC like the tegra186
> you can CERTAINLY convince any downstream consumers to
> switch to that.

I've looked a little at the character device implementation and I think
it would work equally bad with the compact numberspace as sysfs. The
reason is that gpiolib doesn't allow remapping of chip-relative indices
except for DT. I think this might be possible by generalizing the
->of_xlate() to be used in translating internal numbers as well. The way
I could imagine this to work is that an IOCTL providing offsets of the
lines to use would pass the offsets through the chip's ->xlate()
function to retrieve the index (0 to chip->ngpio). The alternative is to
stick with the sparse numberspace and deal with non-existing GPIOs via a
->request() callback.

> Please just disable CONFIG_GPIO_SYSFS from your defconfig
> and in any company-internal builds and point everyone and their
> dog to the character device: tools/gpio/*,
> and the UAPI <linux/gpio.h>

I don't think we can easily do that. People may still rely on the sysfs
interface, or even if they aren't this might be enabled in a multi-
platform image. So I think regardless of whether or not we like the
interface, we have to make sure that our solution plays nicely with it.
There is no problem with the compact numberspace, though it comes with
the inconvenience that numbering in sysfs is different from numbering in
DT.

In summary I think we have three options:

  1) use a sparse numberspace and deal with non-existing GPIOs via the
     ->request() callback

  2) use a compact numberspace and live with separate methods of
     referencing GPIOs

  3) use a compact numberspace and introduce a mechanism to translate
     all hardware numbers into per-chip indices

I think 1) is the simplest, but at the cost of wasting memory and CPU
cycles by maintaining descriptors for GPIOs we know don't exist. 2) is
fairly simple as well, but it's pretty inconvenient for the user. The
most invasive solution would be 3), though I personally like that best
because it is the most explicit. It does have the disavantage of using
separate numbering for sysfs and everyone else, though. Unless you're
willing to make sysfs use per-chip export/unexport files and the
->xlate() callback.

Thierry

--VbJkn9YxBvnuCH5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJYNfCwAAoJEN0jrNd/PrOhlnEP/jWceHskwxsdTkSthaGwWhNX
rCPr6oM3ejEyb8qEEIbwuMSm8XwwSUJhi/bl+t/NubuociXX0kYpy9NRD0nTSEXL
BpTChTBbiZLUn214P3NAgRKQfBQl34+01RJ37tAcvnDPN7FfmAnRwdRdPeOpmNGT
A6ykdPrsA+NFHNApxveUAqYLj8FekvbScChpDnbvQfZRTIcGE3LRpPM/fb0ybUMh
gPDHIMTRmJpgwf5KamwxI2xbbgSCGdvw9QA1HVDqE6QDq13isooNrxtWYEvO2aQP
tgzEMdAUtVYkX5gfFNMvQIKW45crF70KBPBPYmESDDvTwhNu+yEyxWrA5CIXRsWb
Kn0BK/Kfb90uKHvBbVz3XV/Q8C2U9nqcNmjp0XWrmlkDTo8/ebDPWFxRorRQEkNJ
5zTEXLymnnYbjT25lZ5b6bO5Up6ybyugznJrLWOjTp2BuVDW8dOXZPEjrKA7N7dr
1cROct8e9HbJTPaZH1ely5XmJ3zrX5k+vWiX+/Yj8ResS4GowBIUAiDL4K/er7rI
OVKyrCnGVHUcXc6ziE1Fl4lKK+DQzNRcJoAPO+twfMoRe1K+TIKdik2U/7eEzX/f
doIZ0CoT8dXrw4fiArp7tTVvfPqCyAd9TsNpadBwpf1MWRj54yf0f62tClOm5zz7
iuC1XRwlL0t/xxmFRtRJ
=LVuE
-----END PGP SIGNATURE-----

--VbJkn9YxBvnuCH5J--
