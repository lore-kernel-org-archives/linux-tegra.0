From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 00/11] of: dma-ranges fixes and improvements
Date: Mon, 30 Sep 2019 15:35:10 +0200
Message-ID: <20190930133510.GA1904140@ulmo>
References: <20190927002455.13169-1-robh@kernel.org>
 <CAK8P3a0oct0EOMi5t4BmpgdkiBM+LjC+2pTST4hcvNCa3MGLmw@mail.gmail.com>
 <20190930082055.GA21971@infradead.org>
 <20190930085606.GG1518582@ulmo>
 <89e33aae-bc96-53c3-2a4e-e879e9a3c73e@arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="dDRMvlgZJXvWKvBx"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <89e33aae-bc96-53c3-2a4e-e879e9a3c73e@arm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Robin Murphy <robin.murphy@arm.com>
Cc: Christoph Hellwig <hch@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, DTML <devicetree@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-pci <linux-pci@vger.kernel.org>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Florian Fainelli <f.fainelli@gmail.com>, Stefan Wahren <wahrenst@gmx.net>, Frank Rowand <frowand.list@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Oza Pawandeep <oza.oza@broadcom.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2019 at 10:55:15AM +0100, Robin Murphy wrote:
> On 2019-09-30 9:56 am, Thierry Reding wrote:
> > On Mon, Sep 30, 2019 at 01:20:55AM -0700, Christoph Hellwig wrote:
> > > On Sun, Sep 29, 2019 at 01:16:20PM +0200, Arnd Bergmann wrote:
> > > > On a semi-related note, Thierry asked about one aspect of the dma-r=
anges
> > > > property recently, which is the behavior of dma_set_mask() and rela=
ted
> > > > functions when a driver sets a mask that is larger than the memory
> > > > area in the bus-ranges but smaller than the available physical RAM.
> > > > As I understood Thierry's problem and the current code, the generic
> > > > dma_set_mask() will either reject the new mask entirely or override
> > > > the mask set by of_dma_configure, but it fails to set a correct mask
> > > > within the limitations of the parent bus in this case.
> > >=20
> > > There days dma_set_mask will only reject a mask if it is too small
> > > to be supported by the hardware.  Larger than required masks are now
> > > always accepted.
> >=20
> > Summarizing why this came up: the memory subsystem on Tegra194 has a
> > mechanism controlled by bit 39 of physical addresses. This is used to
> > support two variants of sector ordering for block linear formats. The
> > GPU uses a slightly different ordering than other MSS clients, so the
> > drivers have to set this bit depending on who they interoperate with.
> >=20
> > I was running into this as I was adding support for IOMMU support for
> > the Ethernet controller on Tegra194. The controller has a HW feature
> > register that contains how many address bits it supports. This is 40
> > for Tegra194, corresponding to the number of address bits to the MSS.
> > Without IOMMU support that's not a problem because there are no systems
> > with 40 bits of system memory. However, if we enable IOMMU support, the
> > DMA/IOMMU code will allocate from the top of a 48-bit (constrained to
> > 40 bits via the DMA mask) input address space. This causes bit 39 to be
> > set, which in turn will make the MSS reorder sectors and break network
> > communications.
> >=20
> > Since this reordering takes place at the MSS level, this applies to all
> > MSS clients. Most of these clients always want bit 39 to be 0, whereas
> > the clients that can and want to make use of the reordering always want
> > bit 39 to be under their control, so they can control in a fine-grained
> > way when to set it.
> >=20
> > This means that effectively all MSS clients can only address 39 bits, so
> > instead of hard-coding that for each driver I thought it'd make sense to
> > have a central place to configure this, so that all devices by default
> > are restricted to 39-bit addressing. However, with the current DMA API
> > implementation this causes a problem because the default 39-bit DMA mask
> > would get overwritten by the driver (as in the example of the Ethernet
> > controller setting a 40-bit DMA mask because that's what the hardware
> > supports).
> >=20
> > I realize that this is somewhat exotic. On one hand it is correct for a
> > driver to say that the hardware supports 40-bit addressing (i.e. the
> > Ethernet controller can address bit 39), but from a system integration
> > point of view, using bit 39 is wrong, except in a very restricted set of
> > cases.
> >=20
> > If I understand correctly, describing this with a dma-ranges property is
> > the right thing to do, but it wouldn't work with the current
> > implementation because drivers can still override a lower DMA mask with
> > a higher one.
>=20
> But that sounds like exactly the situation for which we introduced
> bus_dma_mask. If "dma-ranges" is found, then we should initialise that to
> reflect the limitation. Drivers may subsequently set a larger mask based =
on
> what the device is natively capable of, but the DMA API internals should
> quietly clamp that down to the bus mask wherever it matters.
>=20
> Since that change, the initial value of dma_mask and coherent_dma_mask
> doesn't really matter much, as we expect drivers to reset them anyway (and
> in general they have to be able to enlarge them from a 32-bit default
> value).
>=20
> As far as I'm aware this has been working fine (albeit in equivalent ACPI
> form) for at least one SoC with 64-bit device masks, a 48-bit IOMMU, and a
> 44-bit interconnect in between - indeed if I avoid distraction long enough
> to set up the big new box under my desk, the sending of future emails will
> depend on it ;)

After applying this series it does indeed seem to be working. The only
thing I had to do was add a dma-ranges property to the DMA parent. I
ended up doing that via an interconnects property because the default
DMA parent on Tegra194 is /cbb which restricts #address-cells =3D <1> and
#size-cells =3D <1>, so it can't actually translate anything beyond 32
bits of system memory.

So I basically ended up making the memory controller an interconnect
provider, increasing #address-cells =3D <2> and #size-cells =3D <2> again
and then using a dma-ranges property like this:

	dma-ranges =3D <0x0 0x0 0x0 0x80 0x0>;

to specify that only 39 bits should be used for addressing, leaving the
special bit 39 up to the driver to set as required.

Coincidentally making the memory controller an interconnect provider is
something that I was planning to do anyway in order to support memory
frequency scaling, so this all actually fits together pretty elegantly.

Thierry

--dDRMvlgZJXvWKvBx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2SBIwACgkQ3SOs138+
s6GQ0w/+M5DX25F5EvacUJzXP9QLMg2vdsP8El3gsecwnqovP1oSoUKnZyz98KUl
ABB5ViyBPyNXg7XSmlJrrGoeA95AWyZiaXCQANS2ps24cOCd81sJR90NN/mQhQ6b
WlRDS1XdpSoLYEodeHKXS2chYdSGAIWMDsxouW2JDG/wugk3yCarpm0DQzUmsip/
FwI2OAKJJP0cJ0l0bFB7RuijyI/Gs/pRG1gNrLuzB5GX0t2dZLzfcKggzY44hi4Q
MIGxkRcFT2csNs3t+Qp4yy90SjEiDi77zGVqcKNreNa+0J5dcCmn8iXE8alV+9oN
XLVfb/8/e4Gdjm3hthjKrLQQ8GtZ04RjPujBEe2BFfERdfVb+CM+lIgZa6dI+KIp
7IYWxp5ehMclUc6u0UfkpRklyBfoK/eBr9+lJfzgd5+5D28RxMYgdpGVlQiTuL++
r+sS4cUaCD3KDNmj6j7GdxCl98jfxzXgzdJ5hkm3exZRHM3JcyiNSmsf6WoiGAJh
beh65vgHal5X5xFh38HV05lM2gYjh97GwzKecmY0q3xGw36R0jPxi4tMfKylnuKh
sp0kdAq2amwxR7Z0FBJ2t26SB41rVlA4Wu6Rc09m3bIblxnW45hgJhHsfqtPLB9A
dw9MG+gJVyffkh5BaZ3Td4raeptslyoappih5w2nWFYznD2kJQM=
=5SOJ
-----END PGP SIGNATURE-----

--dDRMvlgZJXvWKvBx--
