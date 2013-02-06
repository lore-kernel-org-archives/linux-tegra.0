From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 06/14] ARM: pci: Keep pci_common_init() around after init
Date: Wed, 6 Feb 2013 20:35:21 +0100
Message-ID: <20130206193521.GA455@avionic-0098.mockup.avionic-design.de>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de>
 <1357764194-12677-7-git-send-email-thierry.reding@avionic-design.de>
 <20130205204147.GA29726@avionic-0098.mockup.avionic-design.de>
 <20130206163041.GG17833@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0653537109869526369=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130206163041.GG17833-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
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
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============0653537109869526369==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 06, 2013 at 04:30:41PM +0000, Russell King - ARM Linux wrote:
> On Tue, Feb 05, 2013 at 09:41:48PM +0100, Thierry Reding wrote:
> > On Wed, Jan 09, 2013 at 09:43:06PM +0100, Thierry Reding wrote:
> > > When using deferred driver probing, PCI host controller drivers may
> > > actually require this function after the init stage.
> > >=20
> > > Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> > > ---
> > >  arch/arm/kernel/bios32.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> >=20
> > Russell,
> >=20
> > Can this patch and patch 7 (ARM: pci: Allow passing per-controller
> > private data) of this series be applied for 3.9? Thomas uses them in his
> > Marvell PCIe series as well and it would allow to reduce the complexity
> > of the dependencies.
>=20
> It'll need to go into the patch system in that case...

Alright, I'll submit them to the patch system. Thanks.

Thierry

--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJRErB5AAoJEN0jrNd/PrOhlQYP/274urM3pDA6Rp0viIJuGCB2
rClDIKcja8RxeRkJJ47MxIVo5HaXEXreMeptf6NYr2IBEacU0hAqadkq95BzWT0d
w/j/eDOmXgulhON+6nn7x7gCCZpZVzAnGVZFoiFdfa60gOwUZPk76wD6lBGXNtsL
1ocaEXhE3HvgTaGwQNAQi56+JVhPywSs56OHZk0LZiF9mCzA03POHZJzHYV2yLk4
6ZkfnDIfj6y54SNkL9vA5daCxipqPLmEERALSQTBh9nClUYwfz+Qb8LNzPJ4Jrsl
AMMwqOP3OgSADUquKgn3a8RoSvcSLwue/EvYXvaoXlHFxgBbp1kv4/czqwQrj9/U
37Pvi/Rm+NNfv4wocwFv4CHi1o4zBV3gT7VIDdhX2yXqw/El3pJpVMP1itjC6mwv
CvqZCiyiHoJ2QnQ+JeOZeSJxQAcTEHJXpgu/7hYDWDk/jjN+ATPZdTpNDXUgWJYU
IceYAvNniKWRmfjpHV/qaqyO3tbMrC6BoYOsk1PjECFOMWhevn8ISLp6AUjcQ2Fe
QcdP1wGVi1lNSWzYArngKGQ3+3ifK42+1hw5s07UMBG2QUtHO31fBjEXcq6KdbC3
reNP0igpRjgRRE9z5XOjCkkHdCiNoPrd7GTbyDtVqFZXF/cMcvU4g0x7J9uzoHBx
0RMBCojsf7zv2HLDGSRi
=WH1T
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--

--===============0653537109869526369==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0653537109869526369==--
