From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 11/14] ARM: tegra: tamonten: Add PCIe support
Date: Thu, 10 Jan 2013 21:21:27 +0100
Message-ID: <20130110202127.GB26139@avionic-0098.adnet.avionic-design.de>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de>
 <1357764194-12677-12-git-send-email-thierry.reding@avionic-design.de>
 <201301092123.37491.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1815094033726468638=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <201301092123.37491.arnd-r2nGTMty4D4@public.gmane.org>
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


--===============1815094033726468638==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RASg3xLB4tUQ4RcS"
Content-Disposition: inline


--RASg3xLB4tUQ4RcS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 09, 2013 at 09:23:37PM +0000, Arnd Bergmann wrote:
> On Wednesday 09 January 2013, Thierry Reding wrote:
> > Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/tegra20-tamonten.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> It's not clear how this one-line patch adds PCIe support to the
> platform. Are you missing the actual change here?

This is really just required to associate a name with the regulator, but
I think I can achieve the same by adding an alias to the TEC DTSI.

Thierry

--RASg3xLB4tUQ4RcS
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ7yLHAAoJEN0jrNd/PrOhrnoP/juo2Zm53MQ6LlVa70kC7rW1
LCGYxaQr1AJyxEqlBxHAS4w3M9+HJ9MF2MDUuT3pOm+umRLFcNR0cctObjCTUyfV
6YeT1Om0H1mmHPpgHBi6sM11q8dumsDqePqDNIFiILEK70EzKnUQtOrJ2O8sEnx3
j2twKGBTa2kQL+iyaoVC/2uszEwjH9WE89CVbEMnOS8wFnyyN4lrvB4KSLnkU/77
qzZ6nejKbyF2jMpR0CNK1BFzgBWQGv6pLAnXK4gvKWhfwaYm6+u5CLl/lOsSTCtL
cS49wDotsB92YgQae0i7Gj3ex4+zepIAtPDUT15klhN9g6Dx67IGQLEwsdzHN44i
RXzhqHCDfo6HfM9zTf2LkWWJvpNSYMOvjSDQqQeubeDHJVhbQGp6DTypfUKpeOBh
e5iw6DFDX3Vll7g+pXGIaWnXK/nK4uUVphGBK3YdmiNjPFinnWOeNqrwV5W52LsC
xOo/diDOBVMOBaWPh3AyF1Sd5rAKysxmLpgv9jKCbY2Q++q/9Awac4rgVa2ObTOa
jcn1W6HRDCgFYnwoe8akuOo5NZEOvef2JkOhXW0YvI8hPLKteHAxLzLlYREPWwyF
o+w0vDVlRX0emP4vzsS+j0TuWusv4MU9TkUe5Z+8KN+drqcMfeI1ZEgQlg17GjMf
dD4HO1wyDemBUgul7AZH
=1MWh
-----END PGP SIGNATURE-----

--RASg3xLB4tUQ4RcS--

--===============1815094033726468638==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============1815094033726468638==--
