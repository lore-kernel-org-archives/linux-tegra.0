From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v3 07/12] PCI: tegra: Move PCIe driver to drivers/pci/host
Date: Fri, 5 Apr 2013 09:37:03 +0200
Message-ID: <20130405073703.GB15848@avionic-0098.mockup.avionic-design.de>
References: <1365000318-28256-1-git-send-email-thierry.reding@avionic-design.de>
 <1365000318-28256-8-git-send-email-thierry.reding@avionic-design.de>
 <515DF096.2000703@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <515DF096.2000703-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--98e8jtXdkpgskNou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 04, 2013 at 03:28:54PM -0600, Stephen Warren wrote:
[...]
> > diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.=
txt b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
>=20
> > +Required properties:
>=20
> > +- interrupts: the interrupt outputs of the controller
> > +- interrupt-names: list of names to identify interrupts
>=20
> The specification part of this file should define which interrupt
> outputs must be included in this list, and the order they must appear in
> the list.

Okay, I can add such a description similar to what you propose below for
the clocks and clock-names properties. Something like this:

- interrupts: A list of interrupt outputs of the controller. Must contain an
  entry for each entry in the interrupt-names property.
- interrupt-names: Must include the following entries:
  "intr": The Tegra interrupt that is asserted for controller interrupts
  "msi": The Tegra interrupt that is asserted when an MSI is received

Would that be acceptable?

I should probably update the reg properties in a similar way. Maybe like
so:

- reg: A list of physical base address and length for each set of controller
  registers. Must contain an entry for each entry in the reg-names property.
- reg-names: Must include the following entries:
  "pads": PADS registers
  "afi": AFI registers
  "cs": configuration space region

> I believe that the entries in the interrupts property must
> have a defined order, so I'm not sure whether interrupt-names is useful
> here?

Actually the interrupt-names property is there specifically so that the
order doesn't matter. The driver uses platform_get_irq_byname(), using
"intr" and "msi" respectively so that they don't have to appear in a
specific order. I did this so that it is more in line with properties
such as clocks and reg.

> > +- ranges: describes the translation of addresses for root ports
>=20
> Shouldn't there be some discussion re: how the range are expected to be
> set up so that everything works? We shouldn't expect people to just
> blindly copy the example without any way of understanding it.

Possibly. I wouldn't like to go too much into the details, though, since
the ranges property is not only rather complex but also well documented
in other places. But I could add some explanation about which entries
are expected and how they work together. In this case even order is
important. The port register entries need to be listed before the
non-prefetchable memory window entry, otherwise the ranges parser gets
confused. How does the following sound?

- ranges: Describes the translation of addresses for root ports and standard
  PCI regions. The entries must be 6 cells each, where the first three cells
  correspond to the address as described for the #address-cells property
  above, the fourth cell is the physical CPU address to translate to and the
  fifth and six cells are as described for the #size-cells property above.
  - The first two entries are expected to translate the addresses for the r=
oot
    port registers, which are referenced by the assigned-addresses property=
 of
    the root port nodes (see below).
  - The remaining entries setup the mapping for the standard I/O, memory and
    prefetchable PCI regions. The first cell determines the type of region
    that is setup:
    - 0x81000000: I/O memory region
    - 0x82000000: non-prefetchable memory region
    - 0xc2000000: prefetchable memory region
  Please refer to the standard PCI bus binding document for a more detailed
  explanation.

> > +- clocks: the clock inputs of the controller
> > +- clock-names: list of names to identify clocks
>=20
> The specification part of this file should define which clocks are
> required, and not rely on the example below to do this. I would suggest
> re-writing this as:
>=20
> - clocks : Must contain an entry for each entry in clock-names.
> - clock-names : Must include the following entries:
>   "pex" (The Tegra clock of that name)
>   "afi" (The Tegra clock of that name)
>   "pcie_xclk" (The Tegra clock of that name)
>   "pll_e" (The Tegra clock of that name)

Okay, sounds good. Although the Tegra clocks are named somewhat
differently. "pex" is named "pcie" and "pcie_xclk" is "unassigned" (!)
according to the nvidia,tegra20-car.txt binding document. Perhaps I
should update the binding document to replace unassigned with pcie_xclk
for clock 74. And maybe rename pex in the PCIe binding to pcie to match
the CAR binding?

> > +Root ports are defined as subnodes of the PCIe controller node.
> > +
> > +Required properties:
> ...
> > +- ranges: sub-ranges distributed from the PCIe controller node
>=20
> Here, I think it's worth mentioning that an empty ranges is all that's
> required.

Yes, that's a good idea.

> > +Board DTS:
> > +
> > +	pcie-controller {
> > +		status =3D "okay";
> > +
> > +		vdd-supply =3D <&pci_vdd_reg>;
> > +		pex-clk-supply =3D <&pci_clk_reg>;
> > +
> > +		/* root port 00:01.0 */
> > +		pci@1,0 {
> > +			status =3D "okay";
>=20
> Is it worth putting a comment here stating that the explicit devices
> included below in this example are entirely optional?

Would it be acceptable to annotate the 01:00.0 bridge with "optional"?
Like so:

	pcie-controller {
		...
		pci@1,0 {
			...
			/* bridge 01:00.0 (optional) */
			pci@0,0 {
				...
			};
		};
	};

Alternatively I could add something like below:

---snip---

Note that devices on the PCI bus are dynamically discovered using PCI's bus
enumeration and therefore don't need corresponding device nodes in DT. Howe=
ver
if a device on the PCI bus provides a non-probeable bus such as I2C or SPI,
device nodes need to be added in order to allow the bus' children to be
instantiated at the proper location in the operating system's device tree (=
as
illustrated by the optional nodes in the example above).

---snip---

Maybe I'll just do both.

> > diff --git a/arch/arm/mach-tegra/board-harmony-pcie.c b/arch/arm/mach-t=
egra/board-harmony-pcie.c
> > deleted file mode 100644
>=20
> Hmmm. Is this patch meant to include a change to tegra20-harmony.dtsi to
> hook up all the regulators through device tree? Same for TrimSlice?

As discussed above I think it'd be preferrable, in order to keep
dependencies simpler, to separate the changes into different patches.
Aside from the oddity on Harmony I don't think there's anything that
prevents that.

> > diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
> > diff --git a/drivers/pci/Makefile b/drivers/pci/Makefile
> > diff --git a/drivers/pci/host/Kconfig b/drivers/pci/host/Kconfig
> > diff --git a/drivers/pci/host/Makefile b/drivers/pci/host/Makefile
>=20
> I think the creation of those files should be a separate patch, and
> hopefully get into 3.10 to remove any dependencies. Otherwise, 3 or 4
> different patches are all going to try and do the same thing. Didn't the
> Marvell series split out the creation of drivers/pci/host/ into a
> separate patch that's suitable for this, and could go into 3.10?

At the time when I wrote the patch to move the driver to drivers/pci,
there were no other drivers so I didn't think it necessary to split out
those changes. I had also been overly optimistic that the patches could
be merged at that point. Meanwhile there are a few more drivers that
will go into that directory, so yes they should go into a separate patch
like Thomas has done. If that makes it into 3.10, all the better.

> > diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
>=20
> I'll review that file separately later.

Okay, thanks for reviewing.

Thierry

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRXn8fAAoJEN0jrNd/PrOhgqEP/j7LrCzXsKHhZ4/cL+DVvund
DIyYy0n8oWp4n2ipUzHe+4UhDgFJFNURF8cxYkG8RnraPu8Mh7ONkT3CE4BVmS/8
gWYgj6r+ReeH7H+sp2+cHai7ZD+CdY5WH0ljd1Pcbs/wILLQj0YqGpUsu2D80IY4
B/H+sC4l4CcLjrChJwPBTiVjewD822xwMq8yaTt9gX94dWLmZj+/6vNR+pcxesfJ
DgvTXR/HOSSlQi7z7kaQ+xS06YcPENs864riKJB7fweXvG4LwOvJGrrNqnF5yfry
+A1mpsTBKPYl4UEhHczeG9/fu/KkGeSEBV24flupj91uuqaThveaCFT0OQHEsRKG
B+W7yhNM2Ytij4TLcMBw9TT3nvjlmECpoZazbSNe8Wf9xZcTA6UdBaewo5s1HZr8
qU0Mn1uKXcYGHifFxk/YZNs10j5pstBzBfuIwUuJJojmxBFnkJ8ZvkxPsHORnZLb
XBB1OhjW4UPAxpuz92sMsTiV8U5Fllm5tSNzGupzgz3ZP8oG7P8z6wE90Y+B+r/W
7luDwlvO5LIw+XCRvsEZRE728D320jPejywiNxO6cJRypQPtRQz3stnFLH1A03YL
An7pMbshMmoAa1X4zEfSlesAFEe71ltKAoEVt20DfMgklPlvq+bHwm0dKui3q6aa
F5QpgFY6avbzZ5TqoBr5
=7XBD
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
