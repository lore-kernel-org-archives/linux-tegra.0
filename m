From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V4 0/5] Add support for PCIe endpoint mode in Tegra194
Date: Tue, 3 Mar 2020 14:40:53 +0100
Message-ID: <20200303134053.GC2854899@ulmo>
References: <20200303105418.2840-1-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="kVXhAStRUZ/+rrGn"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200303105418.2840-1-vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, andrew.murray-5wv7dgnIgG8@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, gustavo.pimentel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sagar.tv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--kVXhAStRUZ/+rrGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2020 at 04:24:13PM +0530, Vidya Sagar wrote:
> Tegra194 has three (C0, C4 & C5) dual mode PCIe controllers that can oper=
ate
> either in root port mode or in end point mode but only in one mode at a t=
ime.
> Platform P2972-0000 supports enabling endpoint mode for C5 controller. Th=
is
> patch series adds support for PCIe endpoint mode in both the driver as we=
ll as
> in DT.
> This patch series depends on the changes made for Synopsys DesignWare end=
point
> mode subsystem that are recently accepted.
> @ https://patchwork.kernel.org/project/linux-pci/list/?series=3D202211
> which in turn depends on the patch made by Kishon
> @ https://patchwork.kernel.org/patch/10975123/
> which is also under review.
>=20
> V4:
> * Started using threaded irqs instead of kthreads
>=20
> V3:
> * Re-ordered patches in the series to make the driver change as the last =
patch
> * Took care of Thierry's review comments
>=20
> V2:
> * Addressed Thierry & Bjorn's review comments
> * Added EP mode specific binding documentation to already existing bindin=
g documentation file
> * Removed patch that enables GPIO controller nodes explicitly as they are=
 enabled already
>=20
> Vidya Sagar (5):
>   soc/tegra: bpmp: Update ABI header
>   dt-bindings: PCI: tegra: Add DT support for PCIe EP nodes in Tegra194
>   arm64: tegra: Add PCIe endpoint controllers nodes for Tegra194
>   arm64: tegra: Add support for PCIe endpoint mode in P2972-0000
>     platform
>   PCI: tegra: Add support for PCIe endpoint mode in Tegra194

Hi Lorenzo,

I've acked patches 1, 2 and 5 of the series. I think you're going to
need to apply patch 1 in order to satisfy a build-time dependency from
patch 5. I can apply patches 3 and 4 to the Tegra tree since they're
only adding device tree content that may conflict with some other
patches that I have in the Tegra tree.

Does that sound reasonable?

Thierry

--kVXhAStRUZ/+rrGn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5eXmUACgkQ3SOs138+
s6FGqQ//SZc5V8LZwgjymzl/i7cT6pra9G4FiC7lOGh3wefGsiUhHtjnSMK0T1fv
oeOyO1/dIIAWsl/qztmbf6Cq6ARu0f4bBo/ZpRAdC3CiyHn6kRmk8dChB9/JN+HY
RshU2ZcppcNhvhSQKWkyFBj8S05T4ceTO1GAoxwTd1OuVcORYXT3gP7Fiht6sfQu
74cIXdMELea+aDoucY2joPWmZRUkr0Rs+P1oQSSoCcETlEmM7I+cyM5QPQk1qLJK
q6b/peT9yJ/JBQuxo/MZ2K4ebUgyEVNQsreHbTOPLzHwidFSGSjev63CDPBEdTsD
4T+7thNE0OlFRoTfSBuaCrxtvPKpvWF+5XXYMYM2z8xyJAKZok9nz7CQPPOTUiNn
t5Qbf/vLBjbUD22sEUaZXBlalAeJgBOK0aW4YnxOh5xfRXKz6f5T4FLOwxKc91Zu
m3pHTaDLvm8YSXmiTbq62IvCp9Hc2fqBw3vUzbH1tvkcJA0DwH465rQx1ADM+To+
IQOOum66ZXNRrU4ctc5eZhEGF9rRclXXirdzIDPLmAbp1fjr23+Vxr46pwSGazcY
9tQb4UtptzcuvaWQ0HhkatEFWGHkjKKTevtRJ1J8w32/NzbaMZpGUBJIGfK8pe8z
OGhxDwZ77g2oQ3ULktj27BDFPzP8TT42JPvi+AHOmEiJTfFKNGo=
=Datu
-----END PGP SIGNATURE-----

--kVXhAStRUZ/+rrGn--
