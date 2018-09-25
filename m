From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 0/9] Implement wake event support on Tegra186 and later
Date: Tue, 25 Sep 2018 11:57:23 +0200
Message-ID: <20180925095723.GC7097@ulmo>
References: <20180921102546.12745-1-thierry.reding@gmail.com>
 <CACRpkdbLoz+gSFa292OFNszeS6tNywpBRHyGwL9SK2u5s=UhZw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Clx92ZfkiYIKRjnr"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdbLoz+gSFa292OFNszeS6tNywpBRHyGwL9SK2u5s=UhZw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: ilina@codeaurora.org, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-tegra@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>
List-Id: linux-tegra@vger.kernel.org


--Clx92ZfkiYIKRjnr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 25, 2018 at 10:48:39AM +0200, Linus Walleij wrote:
> Hi Thierry,
>=20
> thanks for working on the wakeup business!
>=20
> This patch gets me a bit confused on our different approaches
> toward wakeups in the kernel, so I included Lina, Marc and Ulf
> to see if we can get some common understanding.
>=20
> On Fri, Sep 21, 2018 at 12:25 PM Thierry Reding
> <thierry.reding@gmail.com> wrote:
>=20
> > The following is a set of patches that allow certain interrupts to be
> > used as wakeup sources on Tegra186 and later. To implement this, each
> > of the GPIO controllers' IRQ domain needs to become hierarchical, and
> > parented to the PMC domain. The PMC domain in turn implements a new
> > IRQ domain that is a child to the GIC IRQ domain.
> >
> > The above ensures that the interrupt chip implementation of the PMC is
> > called at the correct time. The ->irq_set_type() and ->irq_set_wake()
> > implementations program the PMC wake registers in a way to enable the
> > given interrupts as wakeup sources.
> >
> > This is based on a suggestion from Thomas Gleixner that resulted from
> > the following thread:
> >
> >         https://lkml.org/lkml/2018/9/13/1042
>=20
> I am not sure if you are aware about Lina's series
> "Wakeup GPIO support for SDM845 SoC"
> that is now in v3:
> https://patchwork.kernel.org/cover/10587965/
>=20
> It appears to me, though I am blissfully ignorant of the
> details, that there is a relationship between this patch
> series and the other one.
>=20
> Your approach is to insert an hiearchical PMC irq controller
> and Lina's approach is to simply put a mechanism on the
> side to inject IRQs into the GIC after sleep (IIUC).

=46rom a quick look at Lina's patches, I think it's more like adding a
demultiplex in the TLMM. So the TLMM effectively has interrupt handlers
for all wakeup interrupts so that when a wakeup interrupt happens, the
GPIO interrupts can be replayed (using the interrupt status bit in the
GPIO controller, if I'm reading things right).

=46rom a very high level view both seem indeed to be very similar and have
the same goal. Both are in a partition that is always powered on and the
goal is to enable wake up from certain interrupts. One difference I see
is that the PMC on Tegra allows wake events to originate from sources
other than GPIOs. For example the RTC or PMIC interrupts (at the GIC)
can be a source for the wake event, as can a number of other special
signals. The PDC on the other hand seems to be limited to GPIOs as wake
events.

Another area, more low-level, where these setups seem to be different is
that the PMC isn't really a proper interrupt controller in itself. It is
more of a top-level interrupt gate. If you enable a given wake event
(that is, unmask the "interrupt"), that event will be able to

> I guess your hierarchy is in response to this mail from tglx:
> https://lkml.org/lkml/2018/9/14/339

Yes, there was some good discussion in that thread which helped me come
up with this solution. I think it's pretty elegant because it allows all
of this interaction to happen almost automatically via the existing
infrastructure. I'm not sure the same could be applied to the PDC,
though, because of the need to manually replay the interrupt. That's not
something I think can be done with just the simple parent/child
relationship that we use on Tegra.

On the other hand, I don't think implementing something akin to Lina's
proposal would work on Tegra because in our case the PMC doesn't
actually raise an interrupt on wake. The hardware will simply wake up
the system, at which point all the signals will be forwarded as normal,
so the GPIO or GIC will see the interrupts as if they happened during
normal runtime.

> So from a birds eye point of view I don't see how the Tegra
> PMC irq controller and Qualcomm's PDC power domain
> controller are conceptually different. Are you doing the same
> thing in two different ways for the same problem space
> here?
>=20
> Or are these hardwares so very different that they really
> warrant two different approaches to wakeups?
>=20
> I guess I miss a bit of hardware insight... is the key difference
> that in Qualcomm's PDC the IRQs need to be replayed/injected
> by software while Tegra's PMC will do this in hardware?

Yes, I think you're exactly right here. As I said above, I don't think
there's a way to replay interrupts with a pure parent/child hierarchy
because the hierarchy doesn't actually do anything at the interrupt
handler level. You'd need to set up additional demultiplexing at that
point to make it work, which is pretty much the equivalent of what Lina
has proposed.

On the other hand, since we don't get interrupts from the PMC for wake
events themselves, we can't replay interrupts on Tegra. And we don't
have to.

Unfortunately, these seem to be really similar pieces of hardware but
with just enough of a low-level difference to require completely
different solutions.

Thierry

--Clx92ZfkiYIKRjnr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAluqBn8ACgkQ3SOs138+
s6FpFBAAhXmmvfSH0K4Das4OcJLsoXiiJcRZr6c0gKo1SX25QZVfkg3l2ZPc4Xt2
YtlGkp7ltMqVV7RD688+NU+49kra90Fg6aKcAfJ7V1/opPZHtG5E/tPJb+lYVl/4
pkh+sY+BVdFXjsPurLoFYwdd+dXn8n9JxxPg932ornQbqmC0HH1j5Dw5k2PyFbp/
Uw+sdfgn8v/w2RHk1MoCfWwdgAVgbPR0AThDuC6M6WbtjRzamsOZ05fOaKz0zX+k
OYLwJp3Q/WoUFA3TOcCGMItjY7qSoxZmUAuqn3jxd5WUnXSChf7R0W++bw/gtIIP
1kqlYr5bief+Inmq/yK1MLAAyjtQg25Q0WO6x6UjcnISCx06QbVHMoVgJ016h9Wj
rrHDnpfjKhqgD4pxxOCx3DeNLAfMN9/v50u7OwC5AQsDGypliEBnl5gg1iOGwhOH
xNuQP9qwVzeKzQ3Ea4SJeya4xzkzrYDfPpqDQxTN2IKOLJBMe3lcndlvroQ4Euva
i4oyUL81DkMgVCTrOK0JSxOBTTIZdT+lCEO8xWWwFU29mWly22f8VNtY0CmM4oP6
qOp7+U/ovzQNVJS/A0WW4CjWsD3L8iQ8oJlrsOUbMTRRa2AO5o9q1Wc7ol/5Y8VY
lFsyxHd+yIUob+OXF6XgdzA1UstVNtteblI892U1QxKnQBssyN4=
=gWl/
-----END PGP SIGNATURE-----

--Clx92ZfkiYIKRjnr--
