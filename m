From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/2] bus: tegra-aconnect: use devm_clk_*() helpers
Date: Thu, 28 Mar 2019 17:32:48 +0100
Message-ID: <20190328163248.GB31367@ulmo>
References: <1552452119-6574-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="l76fUT7nc3MelDdI"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1552452119-6574-1-git-send-email-spujar@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sameer Pujar <spujar@nvidia.com>
Cc: treding@nvidia.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--l76fUT7nc3MelDdI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2019 at 10:11:58AM +0530, Sameer Pujar wrote:
> aconnect bus driver is using pm_clk_*() interface for managing clocks.
> With this, clocks seem to be always ON. This happens on Tegra devices
> which use BPMP co-processor to manage clock resources, where clocks
> are enabled during prepare phase. This is necessary because calls to
> BPMP are always blocking. When pm_clk_*() interface is used on such
> Tegra devices, clock prepare count is not balanced till driver remove()
> gets executed and hence clocks are seen ON always. Thus this patch
> replaces pm_clk_*() with devm_clk_*() framework.
>=20
> Suggested-by: Mohan Kumar D <mkumard@nvidia.com>
> Reviewed-by: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> ---
>  drivers/bus/tegra-aconnect.c | 64 ++++++++++++++++++++++++++++++--------=
------
>  1 file changed, 44 insertions(+), 20 deletions(-)

Both patches applied to for-5.2/bus, thanks.

Thierry

--l76fUT7nc3MelDdI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlyc9y8ACgkQ3SOs138+
s6ERBg//U8ylvk0qzMcb6sgjNdaXLC1+tH5hvx9MldWTobCNl/kySlSfiPM9Evaq
sJruCUQIrGrqK/5bApPB/tmxhD7Rjm51xJL9ETRnAauZKEVNomVsYdbSTi7wFjRh
clZ6vEaobWwSEl5IPTv0WN7Gg22LMDVXrPu4CRFavvTCOCalp7xbvqGEHGP2zipc
dzTESdlx5RO0azzreorgYcQWEfEnqiXr9V6PJm9DnTx9LtrObu+iU92l+ysgaaGe
xBQbmL5Kv2avdmUvm9FXX2HNB1F9igAAa4gJfTcdkC2XpHXPhCeVEhIKRucKAvJQ
tQonbJc8yGU7ywCncS79QyM7zxMWY6k5XJAxVKaRHk3amQajFVC3+781eEVgwi3d
76OOfBbCnSXw015lHf29sWanzEZ6yUuK2Hsqwg02hMTNYG0jy7HKDrNoja2ynjfg
3g2KSulWC/ZYX0Yp6B4VReAVA9xS+Hsp8C02PzhxKWHRe7q9tsX6pzeMimFCt7qz
MK4jWFjrazSN5dkKtNOmbj53oxPInv91J0z2+6nD2nEy1RI/Jfe6o6OJememzFoj
YuEW3xVvZEUYz94EodVg4V9F82TE54m+vyF0bZI6iOgJq9GGQUOKVPTp2vj6i3JI
JKTUNl8A/VBOYoS6uMabtGNj0Qy90sdP2dWZrhzXO2ftwUTEGPk=
=Jrro
-----END PGP SIGNATURE-----

--l76fUT7nc3MelDdI--
