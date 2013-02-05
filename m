From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 06/14] ARM: pci: Keep pci_common_init() around after init
Date: Tue, 5 Feb 2013 21:41:48 +0100
Message-ID: <20130205204147.GA29726@avionic-0098.mockup.avionic-design.de>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de>
 <1357764194-12677-7-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4153354459586715448=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1357764194-12677-7-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
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
To: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============4153354459586715448==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 09, 2013 at 09:43:06PM +0100, Thierry Reding wrote:
> When using deferred driver probing, PCI host controller drivers may
> actually require this function after the init stage.
>=20
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> ---
>  arch/arm/kernel/bios32.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Russell,

Can this patch and patch 7 (ARM: pci: Allow passing per-controller
private data) of this series be applied for 3.9? Thomas uses them in his
Marvell PCIe series as well and it would allow to reduce the complexity
of the dependencies.

Thierry

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJREW6LAAoJEN0jrNd/PrOhf/cP/AkweukDR4WeNx0QMOdyK/iW
f1Dguos5LKUkopCySMS2Qk6+DVo4hQo27XXyt3cwCouv1+AuGmbOwPUmwbb87NMu
r5pxzJymWRHz2qay7rxzPE2/ATiX2gC2TTt3ocfkRI8S/8T2X+XKgVyxpORBcXPg
MnVc1/09CENjShYTVxDYYXrMaJx0wvlrSsXZ7c6SQNQmjFj9DLo86nak22ujJz3K
HvucbWD+P47P/NVr9acNaDBBsHSBsS1mdMVfzzvijFXUcoFQroy+5lvfTxDBHlBq
dT4Sck0Xnr19azQ8GVG3snzLQg0lYmEcjjEHzxaC04G0I1hLZejm7VwMblUBSrxe
8up2hoZBCyXY6Aio7j/jsOV5wtHxk8warI+vAdpNAfboyXYFZ4Hilw9QQfZSCvrL
p7XNAuH39rEcZML6SBLO2j2xrvIU8lkxH2qNL4KnQ5AAnwOJ9vvXv23z7HN41l0k
FOR2JN8Fc49tSqfdH78srNbv4KXaIwGc/ZmcsV5hgn89nkhMvdX9dxeDLjneAIKS
F4Mnu7iYE5QlMIOb4Ex3cmACkEn2k9w1B3UWNJgaMznpNlgm6Z9szBJazcujfYDD
fDPLgsV7tfIcHxdikFH6GTV4dOMXt+z5K4Yt7R8r1iRiJpdbWTfiMr2brFGCqYWv
iLSbdQcQUFeIbqRMON0J
=+bQg
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--

--===============4153354459586715448==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4153354459586715448==--
