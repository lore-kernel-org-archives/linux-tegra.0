From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 09/14] ARM: tegra: Move pmc.h to include/mach
Date: Fri, 11 Jan 2013 05:08:23 +0100
Message-ID: <20130111040823.GE28094@avionic-0098.adnet.avionic-design.de>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de>
 <1357764194-12677-10-git-send-email-thierry.reding@avionic-design.de>
 <50EF598B.2030307@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0209851283092697008=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <50EF598B.2030307-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============0209851283092697008==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="o0ZfoUVt4BxPQnbU"
Content-Disposition: inline


--o0ZfoUVt4BxPQnbU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2013 at 05:15:07PM -0700, Stephen Warren wrote:
> On 01/09/2013 01:43 PM, Thierry Reding wrote:
> > In preparation for moving the PCIe driver into the drivers/pci/host
> > directory, this header, which contains prototypes that are required by
> > the PCIe driver, needs to be moved to a globally visible location.
> >=20
> > Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> > ---
> > Note that eventually the code in pmc.c and powergate.c should probably
> > be split out into a separate driver. The PMC registers are also directly
> > accessed from tegra20_clocks.c and tegra30_clocks.c, so that it might be
> > required to provide that functionality through the new driver as well.
> > ---
> >  arch/arm/mach-tegra/common.c           |  2 +-
> >  arch/arm/mach-tegra/include/mach/pmc.h | 24 ++++++++++++++++++++++++
> >  arch/arm/mach-tegra/pmc.h              | 24 ------------------------
>=20
> On IRC, we'd talked about putting the public functionality in
> include/linux/tegra-pmc.h so that we wouldn't add to include/mach, which
> would make it harder to make Tegra support ARM multi-platform. Perhaps
> that IRC discussion happened after you posted this series?

I'm not sure, it's equally possible that I just forgot. Will fix it up.

Thierry

--o0ZfoUVt4BxPQnbU
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ75A3AAoJEN0jrNd/PrOhUdAP/jx4poxyVjj6V33Sz/v8nlnQ
1U4BlJxgUTOrRfu1h5bgGRRRyRszW8Umdlb8YYJzSwgivam1DMuVyylxuSbseP+T
rokEN5r7XKpzZ4M26HGeOWZN9xi8eQyGyESUN2lPrXjtCYmVleGrOWoWMNtmGiZg
DaA67Jn0a4bqa6IpKOgxvG5Hu7HqgaJXLW87Ht/kCvWIJPM+vkDSM76fygQYwXj1
0h7/zX0yOJlW/yENJA/1CZzaE5CR8xmzcyB2EtmelTLhLpTi0L9rnPvbua1dKyO4
15sQ/6VeHScjKNYh7jNQtTIdouwwLFRUbvdM9dXaxfeKuuW2fSBvci54WbApeXGI
vmGR1iXaF1ObcxDFjBcKkS/UWyU8fU/Tx/CuXRen690wTAZt4irsb0NR8kH432BA
QbfrBYV1b8ytLrnTvqaNMHJHCy3A1FiSJ28ywUyC8daWtWQBTbFa9M3Dh0KaOuNq
1HdIzn7C1YzUgSUJsO5uaWNt3XOMGfJvds1RCFpqAhXvQLklfZA/Nv/Gx4uET62N
BxMUjsqE0oiQzZ+xGnHFH6JbT9M99n7EGAZJ2BG40iUX9TWSoOEqum3zABHCPZ41
ZbsJ5FN+MMd7scYeV5fQY0Fl+JCEbzzS4XNH7RUrl0/ulTWQgEGZ7SXdZaf3ZnDf
aXb7TNK63K0pUTsgpniV
=ykwn
-----END PGP SIGNATURE-----

--o0ZfoUVt4BxPQnbU--

--===============0209851283092697008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0209851283092697008==--
