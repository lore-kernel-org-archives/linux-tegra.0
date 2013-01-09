From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 05/14] lib: Add I/O map cache implementation
Date: Wed, 9 Jan 2013 22:57:09 +0100
Message-ID: <20130109215709.GB13648@avionic-0098.adnet.avionic-design.de>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de>
 <1357764194-12677-6-git-send-email-thierry.reding@avionic-design.de>
 <20130109212847.GT3931@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8724143435127194344=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130109212847.GT3931-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
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
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============8724143435127194344==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BwCQnh7xodEAoBMC"
Content-Disposition: inline


--BwCQnh7xodEAoBMC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 09, 2013 at 09:28:47PM +0000, Russell King - ARM Linux wrote:
> On Wed, Jan 09, 2013 at 09:43:05PM +0100, Thierry Reding wrote:
> > The I/O map cache is used to map large regions of physical memory in
> > smaller chunks to avoid running out of vmalloc()/ioremap() space.
> >=20
> > Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
>=20
> We already have a means where we record the mappings which ioremap()
> creates.  If you look at /proc/vmallocinfo, you'll notice lines such
> as:
>=20
> 0xf7b72000-0xf7b74000    8192 e1000_probe+0x291/0xa68 [e1000e] phys=3Dfc0=
25000 ioremap
>=20
> which gives you the virtual address range, physical address and type
> of the mapping.  Why do we need a duplicated data structure?
>=20
> Moreover, you seem to suggest that you want to break up a large
> ioremap() mapping into several smaller mappings.  Why?  The idea
> behind ioremap() is that this relationship holds true:
>=20
> 	ptr =3D ioremap(cookie + n, size);
>=20
> For any 'n' in the range 0 .. size, the location shall be accessible
> via ptr + n when using the IO space accessors.  If you're going to
> break up a mapping into several smaller ones, this no longer holds
> true.
>=20
> If the problem is that you're ioremapping huge address ranges because
> you're passing larger-than-required resources to devices, then that's
> part of the problem too.

The resource is not larger than required. It's just that in order to
address the extended configuration space of all PCI devices we require a
full 256 MiB window.

What this patch tries to achieve is allow a driver to take a large
region and ioremap() it page by page on an as needed basis.

Thierry

--BwCQnh7xodEAoBMC
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ7ee1AAoJEN0jrNd/PrOhOR8QALpJ5WTlmh+6oJQPNzCj0qvX
IQ9mDhcWeNfUXC/6qZzZrzQ9fIQl2BalXFnS+baGZ/3e+3+7DPCC+zipFfNb7r1t
2WgZFgHDSwDqFOtHzpEV6Q2sDMchefFqmCXiAY+kg3yfu6jK02NdMigm7Sxi0dwd
j9h4rq+FLZ4HDKBmDOxPlR8Wzgy7raXpKPY07Qi+2jaXQ/pCPxNf7zhi/wRu8GOW
0h5/K6QVs8MvjkAnbMep3SBp4xNCh4NdsB+fTc1q2rO5xXa0+7m4f+/CQ6qqGsOv
NIxTQS9/A16dNYlpdW/VrhjCzcALStwLwqd76y9lFeFiBdjBBLhLbVnrivTZq1sk
wen8pXvPcMNSWMHuaSiQwWOelloI4dYaH4ygE5O5L27t/wrFmhdrQEDV9nuxyQtX
npR9kLQyKSAdlJElLa3icmqwd5rwNHnqEUwG6Kp8HSQ/jTYmICPyj2xuf7HbM7uQ
P7Fh21QQ8mZBu7a1fz5HEiC8Hqx3XHD4VR0cnFdb2P9ai8lknYJg29BbXnXBQ0fq
l4nTVFEsxEEp2UoDPwO22Nk9pOiSGMfB/NdDgtj0lhjpKwpArPzmhekgrQW8kze3
DE57yTPS1KvIRLrnNjrdiM6EEscJV4up8nfNzA07pIn2nlqxRa1blKE6SWYG/7ld
7ogVxXsA3J3RVOEFO4HD
=zQeU
-----END PGP SIGNATURE-----

--BwCQnh7xodEAoBMC--

--===============8724143435127194344==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8724143435127194344==--
