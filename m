From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH 2/7] dt-bindings: arm-smmu: Add binding for nvidia,smmu-v2
Date: Mon, 2 Sep 2019 09:38:06 +0200
Message-ID: <20190902073806.GA930@ulmo>
References: <1567118827-26358-1-git-send-email-vdumpa@nvidia.com>
 <1567118827-26358-3-git-send-email-vdumpa@nvidia.com>
 <37034b76-7e3f-5f3c-25b2-696e25127682@arm.com>
 <BYAPR12MB271012F225E35C1459E58D07B3BD0@BYAPR12MB2710.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BYAPR12MB271012F225E35C1459E58D07B3BD0@BYAPR12MB2710.namprd12.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krishna Reddy <vdumpa@nvidia.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Sachin Nikam <Snikam@nvidia.com>, "Thomas Zeng (SW-TEGRA)" <thomasz@nvidia.com>, Juha Tukkinen <jtukkinen@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Pritesh Raithatha <praithatha@nvidia.com>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Timo Alho <talho@nvidia.com>, Yu-Huan Hsu <YHsu@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, Alexander Van Brunt <avanbrunt@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org


--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 30, 2019 at 06:12:08PM +0000, Krishna Reddy wrote:
> >> +                        "nidia,smmu-v2"
> >>                           "qcom,smmu-v2"
>=20
> >I agree with Mikko that the compatible must be at least SoC-specific, bu=
t potentially even instance-specific (e.g. "nvidia,tegra194-gpu-smmu")
> > depending on how many of these parallel-SMMU configurations might be hi=
ding in current and future SoCs.
>=20
> I am correcting the spelling mistake pointed by Mikko.  The NVIDIA SMMUv2=
 implementation is getting used beyond  Tegra194 SOC. =20
> To be able to use the smmu compatible string across multiple SOC's, "nvid=
ia,smmu-v2" compatible string is chosen.
> Are you suggesting to make it soc specific and add another one in future?

Yeah, I think that's the safest thing to do. Even if we're using the
same implementation in future SoCs, chances are there will be some
changes. Even if the changes are just fixes, having a SoC-specific
compatible string will ensure we can apply workarounds only to the
implementations that are missing the fixes.

So I think "nvidia,tegra194-smmu" is a good candidate. It uniquely
identifies the instantiation of the IP in Tegra194. Also, if it ever
turns out that the instantiation of the SMMU in the next Tegra
generation is *exactly* the same (even if highly unlikely), there's
nothing wrong with reusing the "nvidia,tegra194-smmu".

We've done similar things in the past, where some new IP was mostly
compatible with old IP. Typically we still include a new compatible
string in case any errata are discovered subsequently. It's not uncommon
to see things like:

	compatible =3D "nvidia,tegra124-xyz", "nvidia,tegra20-xyz";

Basically this means that this is the IP that was also used in Tegra20
and the same Tegra20 driver can be used to drive this hardware on
Tegra124. The Tegra124-specific compatible string may enable newer
features if there's a driver that supports it.

Thierry

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1sxtoACgkQ3SOs138+
s6GyPBAApW9UCw6JCRUfPi6qMLdZo6ec3gtTq0ja+vujc8MIwNw0hNPf3Z6XrJxr
23cQ6NAbVv869Lv6yBjoa/s90EimzSOn9MSQh7u5Vocwxv+ptUcL3S+zeE5cYWCq
6il8nVLmckknwL7lWG7gYfxJ0VC/jVtnzblUWSBQVUyRLNiABMEZomEvi9/8UaMk
Ac9m3z7K5Le2aWyAeGgh1jsrkb/Vmid9f8stmrsM/kwp0v9CVfxXR0C9Wwt/n91A
ibiOWlFW3mHuo0uadSLjyUFpA8YAj0dNsTCK1Gws0ojSoMMQM5arb+qSULe3tsmh
nylujZWpqzpjSxZJ/0TgJxgJONmgRLamvFlbmFQNuApVK3oTc7PHNC3GPQVB/owk
bbw4CNVlatnwXUPT+Wis14qid/rE5hxWHdEQTpAPd/kF5yFjTEWqHgDX1BPVMbnv
HpxQmPwq8+x1W+9eHMBWrBoHvGXI2V4p5szFvst4fKlWH2cyfDNxMgJR6K6zBze7
Qw81D3FhJ4ZdwsABSmMTULv8EYuCInKgZGjNPlmtlyuuAiKDZDU7xfxntVNvK7cj
ay0xxvRolXiaKhFL5PptMX7hE+H/hlNeFcBqzGtf0hHOupI2g6gCZrB5+5h93ovq
fy8z4p2GCZaEsJscj7Fp3nvBu+DMiFUp4rmygKSC+MWt4tMyXSI=
=+U+B
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
