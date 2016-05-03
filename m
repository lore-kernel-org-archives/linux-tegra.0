From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] base: dd: don't remove driver_data in -EPROBE_DEFER case
Date: Tue, 3 May 2016 15:11:26 +0200
Message-ID: <20160503131126.GA18494@ulmo.ba.sec>
References: <1457450122-5792-1-git-send-email-yizhang_hust@163.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1457450122-5792-1-git-send-email-yizhang_hust-9Onoh4P/yGk@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yi Zhang <yizhang_hust-9Onoh4P/yGk@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 08, 2016 at 11:15:22PM +0800, Yi Zhang wrote:
> the driver_data may be used for sanity check, it fails the
> probe() if driver_data is NULL after it is re-triggered.
> for example, soc_probe() in sound/soc/soc-core.c
>=20
> Signed-off-by: Yi Zhang <yizhang_hust-9Onoh4P/yGk@public.gmane.org>
> ---
>  drivers/base/dd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Hi Greg,

This causes a boot regression on at least one board, caused by one of
the drivers looking at driver data to check whether or not the driver
has properly loaded. If the code encounters a non-NULL pointer it
tries to dereference it, but because it's already been freed there is
no memory backing it and things crash.

I don't think keeping stale pointers around is a good idea. The whole
point of setting this to NULL in the core is so that probe failures
result in the same starting conditions no matter what.

Can we please get this reverted?

Cc'ing linux-tegra for visibility since that's where the boot regression
is observed.

Thierry

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXKKN8AAoJEN0jrNd/PrOhNp4P+QH3GeEyglW4LAiHbDOZ4e9c
wVHve7UWb0yqCf34W8t+WBANCezq9EdKVfMxrj06xvCd7KUf7atZBSmQ7nQ9vF5E
AThT7bDByGn6yy1Ydx6Q725cvkhXG+QxvKeCLOHydm5txa/vGTI3Ib2yLvOuFqwc
kExphQVeJlqQxioPxaizDZJohrzLZaYrJq8OqIkCqcQox18g2stFalyaTjlD/qpR
mLEtkTujTPSMMjVNK2vYHu5gHGXSJKz28/6X5SvXOmhMf6ggaDzJNNrLMWs8AjgQ
lg+qObeUhLCwUZnRntdBuiSyo8NJaFg1gRm77ODg36c5PPt5fUm4PCVvoCpKfxqJ
1Piyiqb8IL4qnl4sWa93i/RJEredItaga6V8Yr+Y4qXij/k+AACDVizG/ujPbiAn
WXD5BUK41AwRTYxx/5BuBPnXbmiF+442eZpd8P5M+nCjDV3oFsFNeC9TbrSiTKhx
xikDoYcDm9SHiJ9PZu7ieJt2/HAw2ssoQfgpFOVdCU7VlBz0LsR23m3Py1jcfOoi
cjgFMVEz1daH+fAz02HIBIiXKi7LkTNjodMbZO3kmlhHsd/dQ2fWzahFFq2uZZhp
1c/qYy/q89kGBX1PqZ+47RBKfknq+z6EmlI7VRWbccC4IujKCtWE2UXUvT94u+tg
aYWbbGQLoKdZt00V7ZRA
=v34p
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
