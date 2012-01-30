From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V4] regulator: tps65910: Sleep control through external
 inputs
Date: Mon, 30 Jan 2012 13:31:22 +0000
Message-ID: <20120130133122.GE4882@opensource.wolfsonmicro.com>
References: <1327743477-31512-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gMR3gsNFwZpnI/Ts"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1327743477-31512-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: lrg-l0cyMroinI0@public.gmane.org, jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--gMR3gsNFwZpnI/Ts
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jan 28, 2012 at 03:07:57PM +0530, Laxman Dewangan wrote:
> Add support for sleep controls of different regulator through
> external inputs EN1, EN2 or EN3.
> Each regulator's output will be active when its external
> input is high and turns to OFF/Low power mode when its
> external input is low.
> The configuration parameters for sleep control is provided through
> board specific platform data.

Applied, thanks.

--gMR3gsNFwZpnI/Ts
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPJpujAAoJEBus8iNuMP3dvgMP/ibQLpN7RwjUamWKuB7+ViC+
g7sWj8MRmJ5wnqDMtraHaqTkNfGt7+UeNW8rN9G7Y1AvXEc4MhMA65Bb6wqzQMQk
HqrI46y4N1U0TAsFmJAOlBOqqNX6uRwZRtDdA3E9pvKKe09aTo9lEtAQ0ahzpQNV
qQon32HswvDaMCU6lhioflT4/EX79wrNRCM9PJlFFgPcspmhBtqzHaitCq3h0liy
54Esx/up0qe0Gw5hPYGROhM4e4biP0nc3CDMh+XDcJ7M7WPucczIRz/pV5Ms67Ij
Dnp4OiATOBqdlb5BhLZMl305lmpy0FmbRF9PNnLe5uQ8Mb1kc8BNJmph3EYhkxrl
4Zw6OXSy0tqS2LBWpFEFWOmr0xK1ImJ6kGqiOPrdQLVcoj44lACIqp/s+TzLGgUh
9IkzMvweETYpHLuO5umemJU4CccU8C8EODOOs6mNI1dfQRKuZx3FOLkPjGhhQjxV
mp2oMnuPZdod3tlVyNT/HaXYyW9CTviz3YpTQ2S0MsE/rfBo+5R1X0qPQbKdK8sq
ZnYztoL7KSPDUXkyL096yqTlNIi0XravoPjuDkwAOGc3y85V0dhdy9fYcOD2ZNhd
UrBB4fD+LLgYQN722Kl3ZEnCAewTDzeY4q/wyzRwjMIyo4TR22h885XUlmYAPohz
szgnyEScuIjtzXHfDEf6
=oBo7
-----END PGP SIGNATURE-----

--gMR3gsNFwZpnI/Ts--
