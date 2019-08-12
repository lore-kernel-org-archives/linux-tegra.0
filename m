From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V15 00/13] PCI: tegra: Add Tegra194 PCIe support
Date: Mon, 12 Aug 2019 12:25:19 +0200
Message-ID: <20190812102519.GN8903@ulmo>
References: <20190809044609.20401-1-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6138060843856164482=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190809044609.20401-1-vidyas@nvidia.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com, mperttunen@nvidia.com, mmaddireddy@nvidia.com, linux-pci@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, linux-kernel@vger.kernel.org, kthota@nvidia.com, kishon@ti.com, linux-tegra@vger.kernel.org, robh+dt@kernel.org, gustavo.pimentel@synopsys.com, jingoohan1@gmail.com, bhelgaas@google.com, digetx@gmail.com, jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--===============6138060843856164482==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e8/wErwm0bqugfcz"
Content-Disposition: inline


--e8/wErwm0bqugfcz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 09, 2019 at 10:15:56AM +0530, Vidya Sagar wrote:
> Tegra194 has six PCIe controllers based on Synopsys DesignWare core.
> There are two Universal PHY (UPHY) blocks with each supporting 12(HSIO:
> Hisg Speed IO) and 8(NVHS: NVIDIA High Speed) lanes respectively.
> Controllers:0~4 use UPHY lanes from HSIO brick whereas Controller:5 uses
> UPHY lanes from NVHS brick. Lane mapping in HSIO UPHY brick to each PCIe
> controller (0~4) is controlled in XBAR module by BPMP-FW. Since PCIe
> core has PIPE interface, a glue module called PIPE-to-UPHY (P2U) is used
> to connect each UPHY lane (applicable to both HSIO and NVHS UPHY bricks)
> to PCIe controller
> This patch series
> - Adds support for P2U PHY driver
> - Adds support for PCIe host controller
> - Adds device tree nodes each PCIe controllers
> - Enables nodes applicable to p2972-0000 platform
> - Adds helper APIs in Designware core driver to get capability regs offset
> - Adds defines for new feature registers of PCIe spec revision 4
> - Makes changes in DesignWare core driver to get Tegra194 PCIe working
>=20
> Testing done on P2972-0000 platform
> - Able to get PCIe link up with on-board Marvel eSATA controller
> - Able to get PCIe link up with NVMe cards connected to M.2 Key-M slot
> - Able to do data transfers with both SATA drives and NVMe cards
> - Able to perform suspend-resume sequence

Do you happen to have a patch for P2972-0000 PCI support? I don't see it
in this series.

Thierry

--e8/wErwm0bqugfcz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1RPo8ACgkQ3SOs138+
s6H7Pg//dh1al8/AaKqfOXUV7vJCuuAAP7eFAzEZssLuFIavDHghC4X+d5w0OsdZ
eOnaJyrojkIFvpialETEQ3G+MLw2HyFoBt+f1G827JsyxMvVe+LDkGa2skg79F1y
wa3gCp2zTkMM1mzS7cfm4wxGSdN1nUuuu63kMvBHpBOALTYnWeGv6hov5/rO+Yqg
B9Wjbwu2rzNjNKirRW98/nUL5A9Ilxd4rVBu7o7JLz0VSoCdZ/5+DpursUTzZZz/
9EbUFzy7pngftxrHxOL4DabxegjdehBj5JKQ7vR1ORmSo/9iukVrXh8dptqayijU
8KUUWoYpnXmCCjBIAoc7mBwrwGfqZm9hF9rGedCILnpWxlVLgrXCxClsvBUn84TL
db/VKF34Qo20wUfEPwUl0k5QjFwUc369XjfBEhBibkIXQb8+/4pA0EvolU7kedv7
VrcLkUkEEPgGpTieaEKN11N3gARx8sEDde0muyKMG/bnRQmnvbq65nT0iiNI+lbj
anvrkE3goyCno6raR0u7JLiWxCOgLVXA94aY+95h+16XpG6+jSQzgJfYWV0Xhi2L
yPAuIH5zKzz2uzzbyqa4eF39lW0P4oBxghVt8jEvUfuqzcTXnR4VenQaciTjUb2A
4S5Rtd/jNgp48OFTOpJTxcSPIBRZLzPKZnGGRhFGrpWZWUGikmY=
=BYfL
-----END PGP SIGNATURE-----

--e8/wErwm0bqugfcz--


--===============6138060843856164482==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6138060843856164482==--
