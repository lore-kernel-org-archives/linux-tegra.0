From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v1 08/29] dt-bindings: interconnect: tegra: Add initial
 IDs
Date: Tue, 19 Nov 2019 07:25:35 +0100
Message-ID: <20191119062535.GC2462695@ulmo>
References: <20191118200247.3567-1-digetx@gmail.com>
 <20191118200247.3567-9-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="2JFBq9zoW8cOFH7v"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191118200247.3567-9-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--2JFBq9zoW8cOFH7v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 18, 2019 at 11:02:26PM +0300, Dmitry Osipenko wrote:
> Define interconnect IDs for memory controller (MC), external memory
> controller (EMC), external memory (EMEM) and memory clients of display
> controllers (DC).
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  include/dt-bindings/interconnect/tegra-icc.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 include/dt-bindings/interconnect/tegra-icc.h

There was a bit of discussion regarding this for a recent patch that I
was working on, see:

	http://patchwork.ozlabs.org/project/linux-tegra/list/?series=3D140318

I'd rather not use an additional set of definitions for this. The memory
controller already has a set of native IDs for memory clients that I
think we can reuse for this.

I've only added these client IDs for Tegra194 because that's where we
need it to actually describe a specific hardware quirk, but I can come
up with the equivalent for older chips as well.

Thierry

> diff --git a/include/dt-bindings/interconnect/tegra-icc.h b/include/dt-bi=
ndings/interconnect/tegra-icc.h
> new file mode 100644
> index 000000000000..e6b6a819434a
> --- /dev/null
> +++ b/include/dt-bindings/interconnect/tegra-icc.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef DT_BINDINGS_ICC_TEGRA_H
> +#define DT_BINDINGS_ICC_TEGRA_H
> +
> +#define TEGRA_ICC_EMC			0
> +#define TEGRA_ICC_EMEM			1
> +#define TEGRA_ICC_MC			2
> +#define TEGRA_ICC_MC_DC			3
> +#define TEGRA_ICC_MC_DCB		4
> +
> +#endif
> --=20
> 2.23.0
>=20

--2JFBq9zoW8cOFH7v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl3Tit8ACgkQ3SOs138+
s6FbJQ//VVTt70KCgYKF7BpZnoqtwCSp/64y3GlIbyP1biK5lLzBZzmmtlm6ivKf
pqxNy8JoBbunV+2+mNyT5YWfKXEcpFW/eLPcklnZwFjVVx9j5suAzdHeybkt4G3h
g2ChCvkLAD/oDmmUvKDje+Mo51CdDlmk5FgKiZQoBr5r3wMCW2hg7aCiv54VgQJt
uPv+7kFsNRiaku0ZoW9iiDKPAhdMT7PDAoHwGX4z+ugBha/iFr1q24olO0Glub75
j35vMrNPXZUEP74vlGyfqhMrOqZoIEuI8vTbEe9pBqbgAYTJEclUIrwt9oX3u6sR
58My8zbNHmFD1P0xNFqLTDyKeOhHAMkTofF70v88IiL0YH7hTsxPFIIN1T9Z4l2F
lPpAScOhh/8pNOJsoC7TJgssD+VFJMTwU6CZTEgcR4rarjN1JZIU1b/+NqyU+3n9
bbIZ1g7hXLKuldou1GENsFUFUomaQg+0+nXNd8McDufr6wNp9qwEaI4aGdFvWaxK
CM7FotJCcqq4OejmSnAFypwWoPEjkAKbmWm7C8aINkoA3W7Bnq7kNvCm900WXX0r
/Al1ZCihymQE7Z03xBGlZqHmHB936PInmasQ+QhQeoAhJ6cWXY28XYIwsUnhy/IN
MVm9blRz9OFwT1y3iHz7ow7XxFLljf//K1VKFcXhM4orcsqQd2I=
=lq7Q
-----END PGP SIGNATURE-----

--2JFBq9zoW8cOFH7v--
