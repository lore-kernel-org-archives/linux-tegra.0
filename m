From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 05/14] lib: Add I/O map cache implementation
Date: Wed, 16 Jan 2013 11:18:22 +0100
Message-ID: <20130116101822.GA17706@avionic-0098.adnet.avionic-design.de>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de>
 <20130109231758.GA27065@obsidianresearch.com>
 <20130110071937.GG15212@avionic-0098.adnet.avionic-design.de>
 <201301100917.19577.arnd@arndb.de>
 <20130110102544.GA5546@avionic-0098.adnet.avionic-design.de>
 <20130110182007.GA28004@obsidianresearch.com>
 <20130110185505.GA22944@avionic-0098.adnet.avionic-design.de>
 <20130110190327.GA23110@avionic-0098.adnet.avionic-design.de>
 <20130110192417.GA18478@obsidianresearch.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4728084380536866641=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130110192417.GA18478-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============4728084380536866641==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2013 at 12:24:17PM -0700, Jason Gunthorpe wrote:
> On Thu, Jan 10, 2013 at 08:03:27PM +0100, Thierry Reding wrote:
>=20
> > > > You'd piece a mapping together, each bus requires 16 64k mappings, a
> > > > simple 2d array of busnr*16 of pointers would do the trick. A more
> > > > clever solution would be to allocate contiguous virtual memory and
> > > > split that up..
> =20
> > > Oh, I see. I'm not very familiar with the internals of remapping, so
> > > I'll need to do some more reading. Thanks for the hints.
> >=20
> > I forgot to ask. What's the advantage of having a contiguous virtual
> > memory area and splitting it up versus remapping each chunk separately?
>=20
> Not alot, really, but it saves you from the pointer array and
> associated overhead. IIRC it is fairly easy to do in the kernel.
>=20
> Arnd's version is good too, but you would be restricted to aligned
> powers of two for the bus number range in the DT, which is probably
> not that big a deal either?

I've been trying to make this work, but this implementation always
triggers a BUG_ON() in lib/ioremap.c, line 27:

	27 		BUG_ON(!pte_none(*pte));

which seems to indicate that the page is already mapped, right?

Below is the relevant code:

struct tegra_pcie_bus {
	struct vm_struct *area;
	struct list_head list;
	unsigned int nr;
};

static struct tegra_pcie_bus *tegra_pcie_bus_alloc(struct tegra_pcie *pcie,
						   unsigned int busnr)
{
	unsigned long flags =3D VM_READ | VM_WRITE | VM_IO | VM_PFNMAP |
			      VM_DONTEXPAND | VM_DONTDUMP;
	phys_addr_t cs =3D pcie->cs->start;
	struct tegra_pcie_bus *bus;
	struct vm_struct *vm;
	unsigned int i;
	int err;

	bus =3D devm_kzalloc(pcie->dev, sizeof(*bus), GFP_KERNEL);
	if (!bus)
		return ERR_PTR(-ENOMEM);

	INIT_LIST_HEAD(&bus->list);
	bus->nr =3D busnr;

	bus->area =3D get_vm_area(SZ_1M, VM_IOREMAP);
	if (!bus->area) {
		err =3D -ENOMEM;
		goto free;
	}

	for (i =3D 0; i < 16; i++) {
		unsigned long virt =3D (unsigned long)bus->area->addr +
				     i * SZ_64K;
		phys_addr_t phys =3D cs + busnr * SZ_64K + i * SZ_1M;

		err =3D ioremap_page_range(virt, virt + SZ_64K - 1, phys,
					 vm_get_page_prot(flags));
		if (err < 0) {
			dev_err(pcie->dev, "ioremap_page_range() failed: %d\n",
				err);
			goto unmap;
		}
	}

	return bus;

unmap:
	vunmap(bus->area->addr);
	free_vm_area(bus->area);
free:
	devm_kfree(pcie->dev, bus);
	return ERR_PTR(err);
}

Anybody see what's wrong with that?

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ9n5tAAoJEN0jrNd/PrOhUlQP/RUVN/UfOSvzFvZTgmNnopVr
uBS3wbP1GjJT+aMYih9UQyZMuyKfuiZrivc3pdcADdzxyrnNJ4nrHX/Ovsvbu274
na483q/qLqwUCuU7oDg+0ntFC7XxPJadt2/vITq/MzhMRMy9V3cNBQAk+ga4NK/U
WbZ4iX2sMsnJ6wQfFuLavOnXHivdGfgLZ2DaofoTb++TjlzO1bm5zh2rJ9Tc8VyM
Umo93ebyGERRv/IsNGEfb3ZZ7QhyLcHsBDoow1XFfvja4poCumKNMHFz8bbiLK5w
MOvEBoy/q+vwo7ZL3i3/YCxKxUoLQ/+dq6SbmXjDjVTjjiLWXH3t0lhkODoHsrWH
YsiqBIK4bnDS6qNUGWYM8HlTzOHmhhIobkeT+Do/gA0P1gvsoKsh+YpfBiqVof27
M9YDteY1M4pypSw6GctkDPwPTkSM1qCUpFXidvpya7jyrlMpncEG/NiYgEcGsNJP
eyYJ+ky0CznzcuNukcGMa+NOt5eCZzBJnBmNoOU41M1kljZ06/AJKKOI8jsddf3q
nZVDhxnavMXi7uagRpiQjc48oLdEVV2SdBtpVdLIQiHplme8EJj2sQ5c7/XY8WTd
yVDcA3WWkdezFGWxya6C5sbsd2PI/G7qvg19h8GLQgC+CGS1ctRdYr/soLYBrMMT
xIWtdPiPzIl1NqC6TT/S
=z/1p
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--

--===============4728084380536866641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4728084380536866641==--
