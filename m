From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH -next] drm/tegra: add missing clk_disable_unprepare() on
 error in gr2d_probe()
Date: Mon, 28 Oct 2013 09:54:23 +0100
Message-ID: <20131028085423.GD10718@ulmo.nvidia.com>
References: <CAPgLHd_iff-PXrhOrVKi_qsqsBU7Yx0MByJDr_3_2fpJ8QwETQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rqzD5py0kzyFAOWN"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAPgLHd_iff-PXrhOrVKi_qsqsBU7Yx0MByJDr_3_2fpJ8QwETQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--rqzD5py0kzyFAOWN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2013 at 01:38:34PM +0800, Wei Yongjun wrote:
> From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
>=20
> Add the missing clk_disable_unprepare() before return
> from gr2d_probe() in the error handling case.
>=20
> Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
> ---
>  drivers/gpu/drm/tegra/gr2d.c | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks.

Thierry

--rqzD5py0kzyFAOWN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSbiY/AAoJEN0jrNd/PrOhtI4P/0gEwyBRiaoM/UR5zV9jVaOn
EEjzdk4wvsd/fafLRKLnORX5IIWL8nlphYYfqZhY0e/RKO99o+llLT6am8p2p48M
RovLLo1s1dXcz4969Us+iZzoRdqB2kkNlhqVOjfUMRFTCi7suYui0N5y1/xySEuT
rrTmVVhRKZB6aKUVPqxuXmv0qIdNdNXwwC/i/syPL4IWLp7C3M05wT9no7NKC4aM
PWb8fk4DB0ojPiflO6Bbp/WiwN0Ht57cJYJ1eUWNjjxBHvy6lgoNPkMYPn49VeM7
ExeqpJwXYQMqkulGskOQhdOdLmsYH/WiXJtF4crz18AM7AJKeuWPEpGS4uwr2bZ9
5Pxx3w3YW9WwfSBumyB+sQB8hcw44PYpnO1VpwMZzzkW1cwdJYY1WLlv4I2UgaBz
BIUXlJEKSwHYlnX8MuRW9lvyFwRryOUJxHjchvGOxSgad8cc7gKFmVy0l+WV1gXy
2sCdB+3b1Rp1xYFTrJyv8INNzFxVOU/oNVQFhQSml2A8+JSJbEHNuzhVQb2/q7vG
Drp4nj252eRLSp59hIRoDjGENm8Kt6dNLLGWrtvPd8onOTo7BZQoPOLqhdOwTSc2
4TapNCxNolh2hPVe/f7psudXIQ/OLDcoeHQ/6gWWxmPhyeS31Xy7Nt9PR2ALMoLy
Pt6FWXLWxdcC74vtJnq4
=Q88I
-----END PGP SIGNATURE-----

--rqzD5py0kzyFAOWN--
