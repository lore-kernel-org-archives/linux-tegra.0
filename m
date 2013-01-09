From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 10/14] PCI: tegra: Move PCIe driver to drivers/pci/host
Date: Wed, 9 Jan 2013 22:58:15 +0100
Message-ID: <20130109215815.GC13648@avionic-0098.adnet.avionic-design.de>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de>
 <1357764194-12677-11-git-send-email-thierry.reding@avionic-design.de>
 <201301092122.08011.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2244997602880735946=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201301092122.08011.arnd-r2nGTMty4D4@public.gmane.org>
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
Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============2244997602880735946==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZwgA9U+XZDXt4+m+"
Content-Disposition: inline


--ZwgA9U+XZDXt4+m+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 09, 2013 at 09:22:07PM +0000, Arnd Bergmann wrote:
> On Wednesday 09 January 2013, Thierry Reding wrote:
> > Move the PCIe driver from arch/arm/mach-tegra into the drivers/pci/host
> > directory. The motivation is to collect various host controller drivers
> > in the same location in order to facilitate refactoring.
> >=20
> > The Tegra PCIe driver has been largely rewritten, both in order to turn
> > it into a proper platform driver and to add MSI (based on code by
> > Krishna Kishore <kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>) as well as device tree support.
> >=20
> > Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
>=20
> Can you split this patch into two patches, one that moves the file,
> and another one that does all the changes? It's a little hard to
> review when I can't easily see which code is actually new here.

Stephen suggested I post this as removal/addition because pretty much
everything changed. Reviewing the individual changes would be more
confusing than actually reviewing a new driver.

Thierry

--ZwgA9U+XZDXt4+m+
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ7ef2AAoJEN0jrNd/PrOhdEkP/2GUkig98fNrXYHKCPF9or9+
cJisvvH8SPAGt09p5RYaO5XgBGJK4XnmAdGConWD3EtKP1pk2SEYCJ5pvjNgXftM
T4QokPjKjttA1NYU8zVQhdYG1qr13is7mpNEEjCHD9q0b8TXYh1E7pvFf8KPvwKE
uE0qpbOMMdd33UsrLEkJyVPJ1zfrCrCCHUrBbSwyYgknDPb66yxTlNYOVyR0t5UP
6Nq/30GPGMiv+hl7sZeddZ9sLh5NzJE+QaElYQ0N0EW/iwzlKmKyFXUzBW9ZZB6Q
4quSKUxZKgTSCi2Urjct/zP67/d6ZGw8eeaTxgp0Hy0K8jJ4MJ4+cL9w6vUGhS7C
bqqC9TokrGVmlRyOj/wSkdoYWzbqGyIRSHcWBD3cioywfo8LQizJqcdXrgtqfa0Q
iBNDS+S/2cG25lqiCbeTwv0Q7lYWRvQjPRc4Db9HpvA1E8aHucqGV0EUqaXQOZD1
X/VSEyWVBefJiF1ta6DvCznJ0JJae4FBenlkPHYOSjF/3QJkX7PHb/3EqR6sOUw6
tqypC0HMiKA1eAa2PT9tO1fno7c+rCKSwmHLasExTF1Q6E5o6c1/rzVNXACyvFXf
isB2EcwOx/+9BJlz5UxBZNY5dmMGOOpfB/xsXMLAbe+CjIkt6XJGs8fJWuaorrf/
uTEEPPGoykfodSDltlw2
=GWfc
-----END PGP SIGNATURE-----

--ZwgA9U+XZDXt4+m+--

--===============2244997602880735946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============2244997602880735946==--
