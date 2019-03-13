From: Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH 1/5] irqchip/gic-pm: add driver remove support
Date: Wed, 13 Mar 2019 17:34:36 +0100
Message-ID: <20190313163435.GA6926@ulmo>
References: <1552474956-25513-1-git-send-email-spujar@nvidia.com>
 <0cd78fb7-4bcb-b735-54ca-24a179b9ff72@arm.com>
 <bc00b804-2248-4f8b-1537-3e3db151d74d@nvidia.com>
 <da01de60-b76a-9575-16ed-138a78d997c1@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <da01de60-b76a-9575-16ed-138a78d997c1@arm.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: Sameer Pujar <spujar@nvidia.com>, tglx@linutronix.de, jason@lakedaemon.net, catalin.marinas@arm.com, heiko@sntech.de, horms+renesas@verge.net.au, maxime.ripard@bootlin.com, andy.gross@linaro.org, olof@lixom.net, bjorn.andersson@linaro.org, jagan@amarulasolutions.com, enric.balletbo@collabora.com, stefan.wahren@i2se.com, ezequiel@collabora.com, marc.w.gonzalez@free.fr, christoffer.dall@arm.com, drjones@redhat.com, julien.thierry@arm.com, will.deacon@arm.com, jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2019 at 02:20:41PM +0000, Marc Zyngier wrote:
> On 13/03/2019 13:50, Sameer Pujar wrote:
> >=20
> > On 3/13/2019 4:52 PM, Marc Zyngier wrote:
> >> First things first:
> >>
> >> - Where is the cover letter?
> >> - This series should be flagged as v2, as it not the same as the one y=
ou
> >> sent last week.
> > I had the dilemma whether to name this series as v2 or not, thought the=
=20
> > commits
> > in the series are different and v2 may not be necessary.
>=20
> This is an iteration on the same theme. Please always bump up the
> counter. Better do it more often than not.
>=20
> > Also felt commit messages are descriptive enough and all belong to=20
> > irq-gic-pm,
> > hence did not send cover letter.
> > If you suggest so, I will send a cover letter next patch version(v2)
>=20
> You should always send a cover letter if you have more than a single patc=
h.
>=20
> >>
> >> On 13/03/2019 11:02, Sameer Pujar wrote:
> >>> This is a preparatory patch for using irq-gic-pm driver as module and=
 thus
> >>> implement remove() call for the driver. Details of remove() are as be=
low,
> >>>
> >>>   * pm_runtime_force_suspend() is added to balance runtime PM, otherw=
ise
> >>>     following is seen: "agic-controller: Unbalanced pm_runtime_enable=
!"
> >>>   * Function gic_teardown() is exported from gic driver and called in=
 remove
> >>>     to perform io unmap.
> >>>   * pm_clk_destroy() to free clock resources
> >>>   * irq is unmapped and freed with irq_dispose_mapping()
> >>>
> >> Let's be clear, I have no desire to export any GIC symbol at all. Why
> >> should we do this? This "driver" is the tiniest thing, and making it
> >> modular doesn't get us anything.
> >>
> >> So what's the rational for doing so?
> > Reason for this was, the driver gets used for AGIC block and audio is n=
ot
> > boot critical and hence module option was preferred.
>=20
> Sure, but look at the result:
>=20
> - you remove your gic-pm module
> - the MMIO mapping disappears
> - the GIC data structures *are still live*
> - a driver does a disable_irq() on an interrupt routed to this block
> (because nothing has taken the interrupts away, as far as the kernel is
> concerned)
> - ...
> - profit! (or kernel panic, your choice)

I suppose we could use device links to model the dependency, but perhaps
it's not worth it for something like the GIC. The AGIC is somewhat of an
outlier because it serves a fairly encapsulated part of the system, so
it would be manageable to make it unloadable.

> Even better if something else in the system has mapped anything that
> ends up in the same vmalloc range. Congratulations, you have now
> corrupted unsuspecting memory. This reminds me of the e1000 corruption
> bug. Great stuff.

Can you elaborate on this point? How would unloading a driver cause
memory corruption in another driver's mapped memory? I've never heard of
this before, so I want to make sure I understand what to look out for in
the future.

> So for the whole thing, NAK. You don't pull an irqchip from under the
> kernel's feet.

Maybe we should also set the driver's .suppress_bind_attrs =3D true while
at it, to prevent anyone from trying to force unbind the driver via
sysfs?

Thierry

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyJMRgACgkQ3SOs138+
s6HZUBAAhqhibTf2QlD1pmZBh0+EyimR5sRBhDhvjOhPJhCnBi3Qt4vhe8lBIcu4
ZZWIgrv4uUL6R98sqN7J9Q5sEpfANyI1cFogUTAlJRh8VdQDZRl6eUcuLFblfHIo
q0U3hNbNO7Tol2mcq3t/cdxNWwXGgVsMxtpu1SrRI8eXGDoXp/7bq0K5aCSwfXhX
VXYJrRwVKbB1g33Z6yNT3xJFdfNt4vyuYo2DsQ1nupzVfNwQNQizIM0G/Tmp2pOr
wecewxKHCWv3c4iHCDrugyYDPPgrso8HkrRqOPUueZCh2Uz1XhG+Fsdx9qAXPavR
b3r9PD27d8aiBhkV4Vs2nfGQY7J/LzyHCFbTtnUun+hFzCMo6ms3AP6SF5Xk867n
0Gf99xLgSG8K7AGDc19XrVY0JHTx8AWrIdI4GLpJHTRrWlx0x7UHA9THPCQkfgfb
zc778BAcDPadKIstO9WZCB59jIHri5ZqLQ354SY93HqVmByFgXMEe6uei+/SxZ5x
BY7fg6VllbS2zLonsUHEF7Vm+VN8azl6U/s3MGzVuGVwAv6LRk1Bxu0NvYtmNOVk
AxWsZgu3QDzaYonvA/dKqTfC4lmmnLp8puBHvqAd3F1NW8dBUu2h1INf58XpKmI5
v+6fX0BxqbDJvJkRG/aewKs0bboglLFX0fHHnaz8LfwG+Cg8Ues=
=H1Cm
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
