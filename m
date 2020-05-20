From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: sram: add documentation for
 reserved-only flag
Date: Wed, 20 May 2020 10:55:58 +0200
Message-ID: <20200520085558.GB2136208@ulmo>
References: <20200512144803.24344-1-ykaukab@suse.de>
 <20200512144803.24344-2-ykaukab@suse.de>
 <52f099e4-5c03-2141-f049-cd3adeb04c5b@wwwdotorg.org>
 <20200513104127.GA2309@suse.de>
 <efcc6b5e-423c-8ae1-8a46-d6a06c1a1bab@wwwdotorg.org>
 <20200519230326.GA827289@bogus>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="61jdw2sOBCFtR2d/"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200519230326.GA827289@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Mian Yousaf Kaukab <ykaukab@suse.de>, robin.murphy@arm.com, devicetree@vger.kernel.org, talho@nvidia.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, afaerber@suse.de, arnd@arndb.de, gregkh@linuxfoundation.org
List-Id: linux-tegra@vger.kernel.org


--61jdw2sOBCFtR2d/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2020 at 05:03:26PM -0600, Rob Herring wrote:
> On Tue, May 19, 2020 at 10:16:43AM -0600, Stephen Warren wrote:
> > On 5/13/20 4:41 AM, Mian Yousaf Kaukab wrote:
> > > On Tue, May 12, 2020 at 01:45:28PM -0600, Stephen Warren wrote:
> > >> On 5/12/20 8:48 AM, Mian Yousaf Kaukab wrote:
> > >>> Add documentation for the new optional flag added for SRAM driver.
> > >>
> > >>> diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Doc=
umentation/devicetree/bindings/sram/sram.yaml
> > >>
> > >>> +  reserved-only:
> > >>> +    description:
> > >>> +      The flag indicating, that only SRAM reserved regions have to=
 be remapped.
> > >>> +      remapping type is selected depending upon no-memory-wc as us=
ual.
> > >>> +    type: boolean
> > >>
> > >> This feels a bit like a SW flag rather than a HW description, so I'm=
 not
> > >> sure it's appropriate to put it into DT.
> > >=20
> > > Reserved regions themselves are software descriptions, no? Then we ha=
ve 'pool'
> > > flag which is again a software flag and so on. This flag falls into s=
ame
> > > category and nothing out of ordinary.
> >=20
> > I suppose that's true to some extent. This is indeed a description of
> > the system environment presented to the SW that consumes the DT, which
> > is a bit more than pure HW description but still a description of
> > something imposed externally rather than describing something that's up
> > to the discretion of the consuming SW. So, go ahead.
> >=20
> > >> Are there any cases where the SW should map all of the SRAM, i.e. wh=
ere
> > >> we wouldn't expect to set reserved-only? [...]
> > >=20
> > > Yes, here are a few examples:
> > > arch/arm/boot/dts/aspeed-g*.dtsi
> > > arch/arm/boot/dts/at91*.dtsi
> > > arch/arm/boot/dts/bcm7445.dtsi
> > > Then arch/arm/boot/dts/dra7.dtsi is an example where we should map ev=
erything
> > > except the reserved region.
> > >=20
> > >> [...] I'd expect reserved-only to be
> > >> the default, and perhaps only, mode of operation for the SRAM driver.
> > >=20
> > > It will break compatibility with existing dtbs.
> > >=20
> > >> If we can't do that because some SW currently expects to be able to =
map
> > >> arbitrary portions of the SRAM, shouldn't that SW be fixed to tell t=
he
> > >> SRAM driver which parts it's using, hence still allowing the driver =
to
> > >> only map in-use portions?
> > >=20
> > > User doesn=E2=80=99t need sram driver in that case. It can use genall=
oc api directly.
> >=20
> > This sounds a bit odd. Without a driver for the reserved region, nothing
> > should be touching it, since otherwise there's no code that owns an
> > manages the region. If any code needs to consume the region, it should
> > obtain info about the region from some form of provider code that can
> > handle both the allocation and mapping. Anything else sounds like some
> > consumer code directly making use of DT nodes it doesn't own. But since
> > I'm not familiar enough with the SRAM driver and genalloc code that you
> > mention to fully understand the allocation paths I guess I won't object
> > for now, although it does still sound fishy.
>=20
> I'm fine with the concept, but I don't think a single flag is adequate.=
=20
> If there are reserved regions within the SRAM, then define child nodes=20
> to mark those regions reserved. I don't think you need a new flag. Just=
=20
> a 'reg' property and nothing else.

It sounds to me like there are two different interpretations of SRAM and
reserved regions. On one hand, as you suggest, we have one SRAM that's
made available as genalloc pool and then individual regions can be
marked as reserved so that they aren't added to that pool.

At the same time, each reserved region is also exposed as a separate
pool and that's in fact used by many consumers as a way of getting a
specific chunk of the SRAM for their own use (via phandle to the region
=66rom the consumer's device tree node).

In addition to that, the reserved region code doesn't actually fully do
its job because while the reserved region isn't actually added to the
"top-level" SRAM pool, the memory is still mapped. At the same time this
is something that we actually want because, like I mentioned, some of
the consumers do want to get at their SRAM chunks via references to the
partitions.

The problem that this patch series is really trying to solve is another
still: the complete SRAM is always mapped to kernel memory, irrespective
of whether any regions are marked reserved or not and that can cause
speculative accesses to memory outside of the defined regions.

Stephen's suggestion is to default to only mapping memory for which a
partition has been defined in the SRAM and assuming that all SRAM
outside of those partitions is off limits. I think that's a sensible
default and it's unambiguous.

But as Yousaf points out that would break compatibility with existing
device trees. Depending on how you interpret the bindings one could
argue that those device trees are buggy and should have partitions
defined (in the cases I've looked at they end up using a fixed region
anyway, so that could've just been made explicit in the device tree).

However, it also looks like all of the users that rely on the original
behaviour where they can just access the full pool are those that don't
define any reserved regions, whereas all users that do reserve regions
will actually use those reserved regions.

So I think we can make use of this by differentiating in the driver
between SRAM nodes with or without children and change the behaviour
accordingly. I think that has the big advantage that it makes things
work as (I think) most people would expect and doesn't further
complicate the binding with extra flags.

Thierry

--61jdw2sOBCFtR2d/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl7E8JwACgkQ3SOs138+
s6FCbRAAu99Kz3Uxhw2U9xjzQlZtnWqUzDmY88C6asAaz9iRAWVA27FTlfDv/zR4
PEBc0v03dUILdc5trq4qoe67oO6zuHqQKOioGl88Id4k5YtAPaCTG+EHXNNyLWiI
Ey91iH6LNyCe8PRSUBGaN3sgGHoZfNlUlgWz7+GPG6CZ4oQttR8s1Nv2fCgl8LsW
pX1+cESlq8eg+PLrxD2MQuDGf9+9D6Arp6GNXq5wyF2qeQqNQKkUGSu/upRiZ5or
qIvSSbV7Z3oEypHHTkZQvVovyjY61CCyz5XbozOikAvUQ2WQQ/lm05N7/RwSJCNt
FiB/CzW9YACQR0UhHJ77fozuuoLM5qdpdMeqgmtedhNqco+6dmVKiZCal4tnubGN
WNXgx0bZwdfGRrYoV2yvlvHRUHnbJg1cWl0LWw/Qse5BfJa7gsSQYchbggOxjqMT
06LLEdOpiCP7e/S133aq9aey/uMZuZmmD90moRkA6q2OjoDCWho75EKHu0PSE1iV
gPQmcKiEW1jWMsA03kulNVQYfLK3O+O1Pmo3WDXEBRP308ra19vTyFEd3Q7PfC9B
p1SgjRSZTGAP4IPYkV0FwiWWqcak1tEvU75BpXLTcDmzD+npOp+MZLGc2qdAk3V7
FEmyCQH8pyRfgxGJtSKjXrgaxmSrjxLEykn0luglH8ooONwR6nY=
=Y1pM
-----END PGP SIGNATURE-----

--61jdw2sOBCFtR2d/--
