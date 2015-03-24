From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v6 10/12] soc/tegra: pmc: move to using a restart handler
Date: Tue, 24 Mar 2015 11:26:51 +0100
Message-ID: <20150324102650.GB18115@ulmo.nvidia.com>
References: <1426672363-30667-1-git-send-email-tomeu.vizoso@collabora.com>
 <1426672363-30667-11-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="98e8jtXdkpgskNou"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1426672363-30667-11-git-send-email-tomeu.vizoso@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-tegra@vger.kernel.org, David Riley <davidriley@chromium.org>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Paul Walmsley <paul@pwsan.com>, Mikko Perttunen <mperttunen@nvidia.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--98e8jtXdkpgskNou
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2015 at 10:52:25AM +0100, Tomeu Vizoso wrote:
> From: David Riley <davidriley@chromium.org>
>=20
> The pmc driver was previously exporting tegra_pmc_restart, which was
> assigned to machine_desc.init_machine, taking precedence over the
> restart handlers registered through register_restart_handler().
>=20
> Signed-off-by: David Riley <davidriley@chromium.org>
> [tomeu.vizoso@collabora.com: Rebased]
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Acked-by: Stephen Warren <swarren@nvidia.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  arch/arm/mach-tegra/tegra.c |  1 -
>  drivers/soc/tegra/pmc.c     | 31 +++++++++++++++++++++----------
>  2 files changed, 21 insertions(+), 11 deletions(-)

Applied with minor cleanup to the for-4.1/soc branch.

Thanks,
Thierry

--98e8jtXdkpgskNou
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVETvqAAoJEN0jrNd/PrOhyekQAKo/ty2nfpetJuU8XA+8KbXH
mi6gyDtu0l96kZN6SNELanJ6GE4sfM/WrOMevG3EBCoGMRzsLQJYerWx9gXs/0NQ
+7Ouyjj6S6vjrxdzXcQSHJoEnpqGLfJ867HMfaSwKstrTUz0sV44jsoG3lyxc/Uz
WMvMi9WhJ5wc3aoIKVITZ4ejrXTK7B54nsTAMMbnER8a42r1m0V4PYHA3caiYddd
7H4l/dU7xpEfmM4cNMGcRBVe6vD66JLgxmJ4FVLJYMZ1ynkCRCCBHePCCGFQPnuc
0O7ojDUcO4EoYx1sFB51juhphH81USvMh1B8gTdx3AKtYzy1c9wb0LXJAfPdmI+n
sVT1ADrsIq67ixNSCmTj+ajSlQxbiHDwnaKm+GhbjdB2wsboXgwrzuCUMe/15WZd
d5b71qIny/rqWGyxVfuBCd8T6VOjws88YYmnazz0GB7EJMRPLWZ33ri2KIdMfQ3X
FxN3IE0a0BHKOT+Kv1k6kjWfvw48qcg68Fz/Oq0vcF/RR9SsFyv9tsc0z+q61FVP
NzJ+J8CTAs1iSbzavWZQHEsF/go4v9vWiPXsx0ZZT5wjJIY+VZdvxQ49dFO6itGG
eUHH5ZCLzLcRxSHT09uixQBmOHqfuXJvtvhXH+IOp8Y1wsBoyL5MVHw0w91K8VZG
fBtA+KNFp9/wavHeOjGx
=xa1j
-----END PGP SIGNATURE-----

--98e8jtXdkpgskNou--
