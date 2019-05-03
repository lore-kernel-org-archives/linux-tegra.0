From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V5 03/16] PCI: Export pcie_bus_config symbol
Date: Fri, 3 May 2019 13:07:32 +0200
Message-ID: <20190503110732.GC32400@ulmo>
References: <20190424052004.6270-1-vidyas@nvidia.com>
 <20190424052004.6270-4-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1289226113309427538=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190424052004.6270-4-vidyas@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com, mperttunen@nvidia.com, mmaddireddy@nvidia.com, linux-pci@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, kthota@nvidia.com, kishon@ti.com, linux-tegra@vger.kernel.org, robh+dt@kernel.org, gustavo.pimentel@synopsys.com, jingoohan1@gmail.com, bhelgaas@google.com, jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--===============1289226113309427538==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="R+My9LyyhiUvIEro"
Content-Disposition: inline


--R+My9LyyhiUvIEro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2019 at 10:49:51AM +0530, Vidya Sagar wrote:
> Export pcie_bus_config to enable host controller drivers setting it to a
> specific configuration be able to build as loadable modules
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> Changes since [v4]:
> * None
>=20
> Changes since [v3]:
> * None
>=20
> Changes since [v2]:
> * None
>=20
> Changes since [v1]:
> * This is a new patch in v2 series
>=20
>  drivers/pci/pci.c | 1 +
>  1 file changed, 1 insertion(+)

It doesn't look to me like this is something that host controller
drivers are supposed to change. This is set via the pci kernel command-
line parameter, meaning it's a way of tuning the system configuration.
Drivers should not be allowed to override this after the fact.

Why do we need to set this?

Thierry

> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index f5ff01dc4b13..731f78508601 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -94,6 +94,7 @@ unsigned long pci_hotplug_mem_size =3D DEFAULT_HOTPLUG_=
MEM_SIZE;
>  unsigned long pci_hotplug_bus_size =3D DEFAULT_HOTPLUG_BUS_SIZE;
> =20
>  enum pcie_bus_config_types pcie_bus_config =3D PCIE_BUS_DEFAULT;
> +EXPORT_SYMBOL_GPL(pcie_bus_config);
> =20
>  /*
>   * The default CLS is used if arch didn't set CLS explicitly and not
> --=20
> 2.17.1
>=20

--R+My9LyyhiUvIEro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzMIPQACgkQ3SOs138+
s6GSnA/9HdsbQNxtdYHMx36I9O7XPCiJpWTqbqCG5v80y6wwm85gZ7gKZ3tnpqoG
AVff+CvhQQwIIW7t5OxkdDNvNz/65YPCYRngILQIIgQbXppF/tMu3YMQVPWGNY6R
LuV8/SkicRqGoyYvEhNY8oxObL191X964tV6roAy2zaPCk4FuNCqJPlRPpu7fXlG
u9H5zlpi/gVtvZNyJyOJLb/zG9cXIaO4lJCN43thTSD/vVCtytgvQRNWHWT9r7lR
wqy5o69fRtUXowCRNjlVR/nYJfguU1Eh+9YVr8l0Hen9XgKyNv6ebrzWSeZx76nS
xTj3bgbOrGm4yWM4EbQZNiGzM1d1+Ggz08osM7n6dqymSMP1zjAHAvb/S+7AulfC
J2b9VwKf/VnRzdU5fkbQEHtPsoOAwA7t70z5qwukraNLVgE7BO0R4A+Wca1kRRJ+
2NMhLmTFJJoR42ZI80UGH6KjixdU7p8cAup1ftb6YqxAWxIthSjb+xhka9s0cPV0
/XcAjoNMXXV9LRk/VoiuNhPMNs17u19NwVZ4O4f/l6qiSvI4BsjMs5B/70UXJgET
aAw4RI207uObGTDCKFKEXNVKf3WPwjiCRBv8X06OfKReDdnPobVETv4boTZFfreZ
WNKJYDqWndqUkSMR46sxPEUnfXNr+he7XCyzGLhOs3lAxGEsdPE=
=F/Ew
-----END PGP SIGNATURE-----

--R+My9LyyhiUvIEro--


--===============1289226113309427538==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============1289226113309427538==--
