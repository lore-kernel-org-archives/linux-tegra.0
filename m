From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v3 00/10] ARM: tegra: Add PCIe device tree support
Date: Wed, 15 Aug 2012 22:19:56 +0200
Message-ID: <20120815201956.GG12870@avionic-0098.mockup.avionic-design.de>
References: <50294BCA.1070807@wwwdotorg.org>
 <CAErSpo7og1XgOSv_mFCQ=hP7pq0j3gXWh2QFL2wBJjz7kcAq=g@mail.gmail.com>
 <502AA96B.2050709@wwwdotorg.org>
 <20120814195834.GA10431@avionic-0098.mockup.avionic-design.de>
 <CAErSpo4Bm_Ryx=OK+svjqAwD4N8v0vrheLVdc-N1ijx8i_-N3w@mail.gmail.com>
 <502AD82F.3080702@wwwdotorg.org> <502AE485.8060307@wwwdotorg.org>
 <502BF2B4.9030401@wwwdotorg.org>
 <20120815200905.GD12870@avionic-0098.mockup.avionic-design.de>
 <502C025E.6000009@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8861758151215531252=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <502C025E.6000009-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
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
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============8861758151215531252==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="f5QefDQHtn8hx44O"
Content-Disposition: inline


--f5QefDQHtn8hx44O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 15, 2012 at 02:11:10PM -0600, Stephen Warren wrote:
> On 08/15/2012 02:09 PM, Thierry Reding wrote:
> > On Wed, Aug 15, 2012 at 01:04:20PM -0600, Stephen Warren wrote:
> >> On 08/14/2012 05:51 PM, Stephen Warren wrote:
> >>> On 08/14/2012 04:58 PM, Stephen Warren wrote:
> >> ...
> >>>> Can't we make the call to pci_bus_add_devices() optional in=20
> >>>> pci_scan_root_bus() somehow; one of:
> >>>=20
> >>> Sigh, that turns out not to work correctly; it solves at least
> >>> this part of the problem when booting using device tree, but
> >>> when booting using a board file, it causes the IRQ number
> >>> passed to the PCIe device to be bogus:-(
> >>>=20
> >>> I give up for now.
> >>=20
> >> I think the appropriate workaround for Tegra in 3.6 is to simply
> >> make any drivers for PCIe-based devices be modules instead of
> >> built-in, as Thierry hinted at much earlier in the thread. I've
> >> validated that the Ethernet works just fine on TrimSlice with
> >> that change, booting v3.6-rc1 using either board files or device
> >> tree.
> >=20
> > That's certainly the easiest and least error-prone solution.
> >=20
> >> For 3.7, we should continue the discussion about a real fix; I'll
> >> look into the change Bjorn requested and see if it works,
> >> although given that hacking pci_scan_root_bus as described
> >> immediately previously in this thread caused a regression when
> >> booting using a board file, and the fact that board files are no
> >> longer supported on Tegra, I'm not too confident in the
> >> outcome...
> >=20
> > I don't understand this last part. If the problem is there when
> > booting from board files and the board files are removed, doesn't
> > that remove the problem as well? =3D)
>=20
> It does for ARM SoCs/CPUs exclusively using device tree, but not all
> ARM systems are converting to device tree, so the fact that Tegra has
> makes it harder for me not to break anything else.

I think the best road to a real fix would be to implement a custom scan
function for Tegra along the lines of what Bjorn suggested. Ideally,
this implementation should eventually converge to what's done on other
architectures. At that point maybe ARM can completely be converted to
this new generic implementation and the Tegra-specific hook removed.

Thierry

--f5QefDQHtn8hx44O
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQLARsAAoJEN0jrNd/PrOhx3wP/AnSFDaleSAGsJB6ssvMDoKN
uwB6jkZMDroYl8zwOdnRIiB2InTFtv4EoUeBb1Ga1uGhkWS0rgJraH5iNcs3171A
/7g6vj34W4ngGTbkTuN02R2NxGQTgAbsEgMZaqjmMUkS9vSmiiEEhUnXod0nFCTV
YNlxGKWy4HV55vAMFP1PTBgU4ZriyaYhJkkZcxrCfhRQWeQTas6NVe7uR0dn+EYM
XcIxWNMOxOIZEb95BbiL+JZ1Et2YSIHFKINJc1mCIHyeko6/5wyP+jivV4wbxSmA
/11QRBb7OI4GGQioHgtt1LjPUJb5xH7Cd5dDjpjUzXeonRnmH1SH3YZQledsRSbn
F3fEcRsbxmqBcKku7LYT3dhVmvPVNzoCI7aeeBTjvBzRt0j+z4xyCNfl2kLnT2BK
DCeAsdJoufQIaQeuGYKZHZpaHal1JhJdmHaa5NBZIccTqlde/4819lbxlwsNtkmY
rkc3CjzgAsOGu/ExDQ7epzZuNhS+w+urdFX4yf5QuQUtgqe1BrAOmy2cInyuU0H3
ikXJxRRSEeR3oWPQEQTKSbyg3lEHaOQQvUlZCRxB39AhU9Y7/26hNHkOxMLcAwWH
3SS33cBUN5KnqmZDD7dWOGZ5qeCdEJdyn6U997eaj2MYt8Q2HeK+SBe9hnODY9Aw
x7eLA85s4TKUMYcjpLV+
=i4cG
-----END PGP SIGNATURE-----

--f5QefDQHtn8hx44O--

--===============8861758151215531252==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============8861758151215531252==--
