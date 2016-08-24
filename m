From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] arm64: tegra: Drop clock and reset names for XUSB
 powergates
Date: Wed, 24 Aug 2016 16:33:01 +0200
Message-ID: <20160824143301.GA6887@ulmo.ba.sec>
References: <1471354857-1408-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Q68bSM7Ycu6FN28Q"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1471354857-1408-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Q68bSM7Ycu6FN28Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2016 at 02:40:57PM +0100, Jon Hunter wrote:
> Drop the clock and reset names for the Tegra210 XUSB powergates because
> these are not currently used and not required by the Tegra PMC binding
> documentation.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 6 ------
>  1 file changed, 6 deletions(-)

Applied, thanks.

Thierry

--Q68bSM7Ycu6FN28Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXvbAdAAoJEN0jrNd/PrOhOQkQAIn6BjqR2HLM1zwRx8VGlBM1
VP/JOAGcMwFHGkdebT9JxNaKPFnli9zcRYmim33Ejdq8p6/6bfVi2OEUx3EE8qbj
3ILQNNjcFxoFL5zfl4AgkX1wpjk7EsODGtfr/Y/ombeY68qA2kC11rRmNr7E6E9U
AV+0oHxs+z17sHf/ap/NQub/NOqthUvitOXDXcSlBAu188Iv+3dCqgeffA7givEp
ZhoSzlww0pboboVRGS4fGUY+I7GY9iyubQ19sWY3HuVFPMdfCBifiVjch0cTc8y7
dt0QMjqH3uRzfN9Y7f7QDyrVbl4z/Hd45pkMpEtoXFrvuNCjs0hCqUNMDH4tKMEe
s352XWb8+mYIjLZNiU4X0dfa47U1+ZsqcAv5PI0NGrpxb1XpscGTmM9IJE6Dzu6E
HE+npyWFIDlVakqSp0uTp40teSg17vzMYhs/8qFLT+NngRvt+caussSJgjv/1f4k
u3/sW3s+DSvvFfmli116lrm5B74gEBPcPCt0FnA1hejBWb587IWOhZWKHKfbg6tI
VpLLLQHfheHFaB3Sya5LrnVkgUb9Bj1vzlpYYBViuWnhvFjXDGnmvodMHWEdJGDC
sTKK20lqq11poBy7iypN8Q1oFceM+9GcOp+ppeyy0wJDncl3wkSwT8WRbkbKpG4h
G+lgTQteHKmkgfZQukgQ
=GP/d
-----END PGP SIGNATURE-----

--Q68bSM7Ycu6FN28Q--
