From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 1/5] soc/tegra: bpmp: Update ABI header
Date: Mon, 6 Jan 2020 14:04:38 +0100
Message-ID: <20200106130438.GC1955714@ulmo>
References: <20200103124404.20662-1-vidyas@nvidia.com>
 <20200103124404.20662-2-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8370469193849529190=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20200103124404.20662-2-vidyas@nvidia.com>
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
Cc: devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com, mmaddireddy@nvidia.com, kthota@nvidia.com, gustavo.pimentel@synopsys.com, linux-kernel@vger.kernel.org, kishon@ti.com, linux-tegra@vger.kernel.org, robh+dt@kernel.org, linux-pci@vger.kernel.org, bhelgaas@google.com, andrew.murray@arm.com, jonathanh@nvidia.com, linux-arm-kernel@lists.infradead.org, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--===============8370469193849529190==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="w7PDEPdKQumQfZlR"
Content-Disposition: inline


--w7PDEPdKQumQfZlR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 03, 2020 at 06:14:00PM +0530, Vidya Sagar wrote:
> Update the firmware header to support uninitialization of UPHY PLL
> when the PCIe controller is operating in endpoint mode and host cuts
> the PCIe reference clock.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> V2:
> * Changed Copyright year from 2019 to 2020
>=20
>  include/soc/tegra/bpmp-abi.h | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)

Bjorn, Lorenzo,

subsequent patches in this series depend on this patch, so I think it'd
be best if you took this into the PCI tree along with the DT bindings
and the PCI driver changes, so:

Acked-by: Thierry Reding <treding@nvidia.com>

--w7PDEPdKQumQfZlR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl4TMGYACgkQ3SOs138+
s6F+Zg//TLpFZod96JYrSlXeoed6v2Ljl8ogG72EMMhOZIGLCcKwJWIX7ZYo1SeD
WkkHSPNRbwIIF91AMpanXAmNImq3CSbg63BrTDhYcQXBxGRnAKM19NnI/tXwesm0
Vbw5Xsq1mkVDpw/TmlJDJTB+koeIdwIXI81voGHrpja0jPn6dDWpuR6GWA+lNjKL
7RrsKeRyXeAsND0HX/LHNGc0Muyw+uAOU5kPfzhrTx7xcIpIhPymV2qI4mexMw5h
fbmppZSm/21u53VkeMhhdFBa0Ic+JM7nS7NHWaBgwl8L7RbuT423uaX159qb2KRC
NQbVh4xJGmaNMEpDq7FxSpMHszHgBthvyV3z80kkohVg5jUM1Fno+YsjlBNeFhp2
60zwuPnvqIgg0i7vP7rwYVc/mrIJBkrcUgVzxB0M1/R978xJmVZSeFE9yzVY9oty
XaqjNcwPyL+w+04TbCqOarVCbmKKnGPKmpCjuE4PlhI4LhgDXO/e7afNFR7liMGz
PRI8whwR/49g0ByoOJrNA3r7KPoL3UMfLiWXBZCUnuvwBVdL4ihXg79zVvPE/eFc
HqZOSLfj03/ZcIvi8IigUl6LVGdSanZvyJOaQzKPE5bTIJb8VzxjxxJhq4tCZJ5y
LcsdpM6sTJefSbEf7Gio2ioW6r6yUTxzVoG3Pco1xQm0Szb7UCQ=
=GkrY
-----END PGP SIGNATURE-----

--w7PDEPdKQumQfZlR--


--===============8370469193849529190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8370469193849529190==--
