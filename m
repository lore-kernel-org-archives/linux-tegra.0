From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v6 4/5] arm64: tegra: Add XUSB and pad controller on
 Tegra194
Date: Mon, 17 Feb 2020 09:31:19 +0100
Message-ID: <20200217083119.GC1339021@ulmo>
References: <20200212061133.11665-1-jckuo@nvidia.com>
 <20200212061133.11665-5-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="69pVuxX8awAiJ7fD"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200212061133.11665-5-jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--69pVuxX8awAiJ7fD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2020 at 02:11:32PM +0800, JC Kuo wrote:
> Adds the XUSB pad and XUSB controllers on Tegra194.
>=20
> Signed-off-by: JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v6: rebase
> Changes in v5: none
> Changes in v4: none
> Changes in v3: none
> Changes in v2:
>  - renamed xhci@3610000 with usb@3610000
>  - moved padctl@3520000 and usb@3610000 inside /cbb
>  - cleaned up "clocks" property of usb@3610000 node
>  - added blanks lines to visually separate blocks
>=20
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 139 +++++++++++++++++++++++
>  1 file changed, 139 insertions(+)

Applied to for-5.7/arm64/dt, thanks.

Thierry

--69pVuxX8awAiJ7fD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5KT1cACgkQ3SOs138+
s6GnYA//Sd6ujIPiLIfMs8BIr5umZlDgL84Yb3sZrCSLrvv75bXQiLBSIUUlaJXA
TrUEzOv4zD6AfYw/4+dQOWm9FKLwYDY2Cde/vVuILP5bKxnGFSqKYuFnFSFfko1m
1wP90nroVW/83B+i/28eI19IPL0tRXnjGbOhEGuKEiFLMv1wytH2OuThDjkrNbnw
hahF+j7Ip17EXejh5SFCk3oFMTwAQrD60B2CrfmHdc9EkaLRT885BSFY2EGfCTud
peNf1olQukAdafJJ27qOmoPL2WEwhVQJf1rOGrPygYPb8CcrHpwakuzYczvvA3kK
IYA+wqZxDnaNAVQurr1PM5dceI7514AW3TeZK3VlCQ6l2AJg+ZAzeOBMit7Qq1Bt
MGe4wgQyV6zhyaisPy7TrZIc8Ua/DO0ZJz6sgSWykfN+g5t7PPFPv/i4LXb/w3IB
Ndrw+AH+iDDSNSE1JbQEczmxlyDD5Yb41i6uvLhNayCuVD25k1HGlPLMOe+7qVfn
7siMqO+t2DozPnkgd1dtsYG2JzxYRwIz++rH69gyCc1LOCuKFs/hKH0qkLnGegBx
nxATs+cVNo7qab7XuoRDi47JwVZw4/IyZckYim5j6gRJR4eMooteZJVeWQ5o/9vf
G855HvFBew+mmvpfDPd0sQ1vfGYqFnSSiMmacW0nhlQFr7b9GhM=
=F5ca
-----END PGP SIGNATURE-----

--69pVuxX8awAiJ7fD--
