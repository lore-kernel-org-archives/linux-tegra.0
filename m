From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v3 10/10] ARM: tegra: pcie: Add device tree support
Date: Thu, 16 Aug 2012 06:55:39 +0200
Message-ID: <20120816045539.GA17067@avionic-0098.mockup.avionic-design.de>
References: <1343332512-28762-1-git-send-email-thierry.reding@avionic-design.de>
 <CAErSpo7c4L=Ny=CtZwLB_XWTcN8tVWs_quuE_T+XLEGyhWwHkg@mail.gmail.com>
 <20120815145708.GA11331@avionic-0098.mockup.avionic-design.de>
 <201208152025.25252.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0026162521287504520=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201208152025.25252.arnd-r2nGTMty4D4@public.gmane.org>
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
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============0026162521287504520==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 15, 2012 at 08:25:25PM +0000, Arnd Bergmann wrote:
> On Wednesday 15 August 2012, Thierry Reding wrote:
> > Yes, that was my understanding as well. So currently I haven't seen any
> > problems with this because I only use one of the two host bridges. But I
> > suppose I should add code to initialize the bus number aperture properly
> > either via platform device resources (for the non-DT case) and the
> > device tree otherwise.
>=20
> I think when we last discussed this, the assumption was that each
> root port has its own config space range and its own pci domain,
> so you don't have to worry about bus apertures because each root port
> can then have all 255 bus numbers. Has that turned out to be incorrect
> now?

At least for the config space this is incorrect. There's a single region
to access the configuration space for all devices below the PCIe
controller. So it is shared by both (Tegra20) or all three (Tegra30)
root ports.

I'm not sure about PCI domains. Do you have any good pointers as to
where I could read up on them? If they need special hardware support,
then I think Tegra doesn't support them either. At least I haven't come
across any mention of domains while going through the, admittedly some-
what sparse on PCIe, Tegra documentation.

Thierry

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQLH1LAAoJEN0jrNd/PrOhIHUP/1sOotMJa3z1fX+uxtQju+6D
vi144oZ8Bnt6TrwcXfY9uF6GNwH1gwUb5lDqt09axW8kPipsJCwIdx3PIh2tUfsV
rEmznl33DkbybXaHfC8N9DMHvcehkrTikev5DYrBif+4gXC2WUfjbjzlv1kUP0y8
hedhqpVRIAxTCfcgeQgFhSJouzZWqUI2F0e8vGVZTd/NmBXhWdg7Xqjoz3GFk6yu
bXmidOv5j/3tArrAPM5d1dmKvbzDGQCB6Z7nFX5m0AD0/3f/vpWMq9/MUiZqUjws
0ziTwYUQP2lLzlnwu67jKHK25W4uFGylTy35DBQrPvJ5Y9kD0qiRTNDKvHBUOdaI
qZnfruEYEu2M9W/DpHOcnZ0nkwQMcybx7lyknU6TWiOF8nSOxdy62E1KKYYjJ5Cy
K5/bSIaKFhiewOwawdLYULFguudnCsgtOcmJWlLdrat7rKJSFDGsqfbJCJjY0Dan
HQ597/I8o2lqh0i+Nl4xo0KexyFm6KxeWK2B5/870jZsBzbemcN3Ka0MCORxtDmp
JY3/PW3Fc2znMm7WFFbi/5rwNe5M4cXQLxOTBLA0Itp5AjREIkmmp/Ruus8N0bH3
1NVWh65ZwCB1Tw5CO+WndWMgm6IuolKCBdCtpMN8BNAoORZVaZS+PuzyNaukZGiL
ltBBCoPWa/4wHFTMwsXF
=POl0
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--

--===============0026162521287504520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0026162521287504520==--
