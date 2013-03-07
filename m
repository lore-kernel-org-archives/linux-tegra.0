From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH] usb: phy: rename all phy drivers to phy-$name.c
Date: Thu, 7 Mar 2013 17:46:42 +0200
Message-ID: <20130307154642.GG16577@arwen.pp.htv.fi>
References: <1362671126-24571-1-git-send-email-balbi@ti.com>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VACxsDaSTfeluoxK"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1362671126-24571-1-git-send-email-balbi-l0cyMroinI0@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Linux USB Mailing List <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, aletes.xgr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, stigge-uj/7R2tJ6VmzQB+pC5nmwQ@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, yuxu-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--VACxsDaSTfeluoxK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 07, 2013 at 05:45:26PM +0200, Felipe Balbi wrote:
> this will make sure that we have sensible names
> for all phy drivers. Current situation was already
> quite bad with too generic names being used.
>=20
> Signed-off-by: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>

Hi, I compiled what I could with allmodconfig and allyesconfig. Make
sure to test on your own platform.

--=20
balbi

--VACxsDaSTfeluoxK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJROLZiAAoJEIaOsuA1yqREqgcQAInGEZA2h6lFLUCQGmm9DtUf
WzWhFdVG5fj6M9gHeRx6KTXzpnKJNS061AxBVAS/9VuN6SfvrOBpanSF4RD+nfD4
jsPMrHzGt1HcvOiv7TTBviQf/YnID9e2Yupth1/me1DEKWluwi31l0zRzKeDlzid
rVzAaXskUQ4/4ufV56nXtx2qlrq252QcnCELHZvLvj9cMnx7oIp1lNaQVyjhOrfv
RVR/rtG03TDfmi2IUozBUldIzZ78c37sJJTkjhxdCJ84+e3R89U5hyVmOQOSvdDN
jFsiUJ4ktaAlrOPwvDy0emqwyqJt9sQvIrYmndkBDTWsZ3ZCgWWSuhDnJI2dyiuY
cy3kGiVo8FETY7t9tVP/tN6hwcKfVlzgNOOHVwYcRHJ1/7J66Fo1sOWyZjceBoft
ov1a3FJdSqUQYgkBHevrjW+uEqcUEq+8rYyD0GdfSgAYJiRiy0wkYeTeGIcsXlmR
3/m3K7MPC8uDTxr1tLog7jqYLWgGkC18JEn/KgkC9HGuQ6+TOhRI0NSjURvEzCsQ
E7ahoYt5XisLJCkwAnSacaZ2WADaV7QS+p1GRzz2m8WQU8jNOyc2e0e9MRxCCTa6
GXudcL1ZXzLT/M7FxByitUylb0GBudJ8LTpMF01pAZ1u3MlAJavM747Eltp+NK7D
81UKCOW6q+GTc2AWobNt
=n8oF
-----END PGP SIGNATURE-----

--VACxsDaSTfeluoxK--
