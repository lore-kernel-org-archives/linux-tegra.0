From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/7] arm64: tegra: Add SOR power-domain for Tegra210
Date: Wed, 24 Aug 2016 16:52:35 +0200
Message-ID: <20160824145235.GD6887@ulmo.ba.sec>
References: <1470756082-19099-1-git-send-email-jonathanh@nvidia.com>
 <1470756082-19099-4-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9dgjiU4MmWPVapMU"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470756082-19099-4-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--9dgjiU4MmWPVapMU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 09, 2016 at 04:21:18PM +0100, Jon Hunter wrote:
> Add node for SOR power-domain for Tegra210 and populate the SOR
> power-domain phandle for DPAUX, DSI, MIPI-CAL and SOR and nodes that are
> dependent on this power-domain.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)

Applied, thanks.

Thierry

--9dgjiU4MmWPVapMU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXvbSzAAoJEN0jrNd/PrOhUHUQAIfuHfqUwWvZ1DpJE/L1AqMM
oKkDDxRklbE6ph1u8ttgBPeOgyDShn40x7JR5wkWv6rFIdVsHERDyqb/j4doCK3m
3vAtGJI7IHbS09EQOp7XJO3IBKnAcRviFMQ0WUm1yUiSI6VpBR2hfeglHt5F1iEW
PutKez9dBkB2BEIj0avMam/8LEt+GICufl3KF/misRe2J7gyE1wdJ8v/FPuPgTkM
qEaiVPfPo8aloYNLtR6HRiutO5tq0AWMieUhGEjR/sjqYh5VfpBYivngUBUBi3qC
5yWR9FCzNRX/PySd8NG7HXbu/CdoLuFno03CsFo44SFdmLtb8tSqq8DrbxtXeuuE
IMGQvvDhHGQc5g06NYIcvphyoJFBTmFneHQUZ2l73lGZNy96mZHnKYMq7jl2aKPX
tEo+rzal/17kGpwDZ5WGuiNNsNDFhCJhNxU41WMnN5+Jv+Kz85RlicV6PiTC8bg3
9XYQw1+4Z4UFOXoShfuvN6ex2Ma6qFpChDmXCppmpPDpmvVVnmDSSIhm8896HP7C
3YFSeJ6Qi+Ukll/UsNniGZ7FCcbdDoxtZjmU1VdtnzXQ0Tge5hdk5CsYUC9Im2Aw
E04b5U2gbonQGgh+yiW4yUi5Iihmcg3y348jph7yvH4AA1mWvT6illbuoHOsqF/u
GF5PIdMmhsYbB+R8u6Vu
=ktCp
-----END PGP SIGNATURE-----

--9dgjiU4MmWPVapMU--
