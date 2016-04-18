From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v3 1/2] i2c: tegra: add separate function for config_load
Date: Mon, 18 Apr 2016 16:10:40 +0200
Message-ID: <20160418141040.GA20508@ulmo.ba.sec>
References: <1460985355-28901-1-git-send-email-smohammed@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EVF5PPMfhYS0aIcm"
Return-path: <linux-i2c-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1460985355-28901-1-git-send-email-smohammed@nvidia.com>
Sender: linux-i2c-owner@vger.kernel.org
To: Shardar Shariff Md <smohammed@nvidia.com>
Cc: ldewangan@nvidia.com, swarren@wwwdotorg.org, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, wsa@the-dreams.de, gnurou@gmail.com
List-Id: linux-tegra@vger.kernel.org


--EVF5PPMfhYS0aIcm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 18, 2016 at 06:45:54PM +0530, Shardar Shariff Md wrote:
> - Define separate function for configuration load register handling
> to make it use by different functions later.
> - Instead of calculating timeout for the config load during init,
> calculate it when config load register is written. Also use the
> msecs_to_jiffies for timeout calculation instead of macro HZ.

Looking really good now. One minor nit: If you need to resort to lists
in the commit message, it's usually a sign that you can split things up
into further patches. In this particular case I think moving the timeout
computation can be considered implicit in splitting apart the function.
That is, I'd simply skip the second list item (and remove the - from the
first line).

> Signed-off-by: Shardar Shariff Md <smohammed@nvidia.com>
>=20
> Changes since v1:
> - Add separate function for config load handling
> ---

Almost perfect. The changelog should go *below* the --- separator. This
is somewhat tricky to do because the separator will only be added by git
format-patch. You can either manually move it after git format-patch or
add the separator to the commit message. If you do the latter you'll get
two separators, but git send-email/apply/am will do the right things and
skip everything after the first separator and the beginning of the diff.

Finally, one nitpick below, which you don't necessarily have to address.

>  drivers/i2c/busses/i2c-tegra.c | 39 +++++++++++++++++++++++++-----------=
---
>  1 file changed, 25 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegr=
a.c
> index d764d64..6235f16 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -423,12 +423,31 @@ static inline void tegra_i2c_clock_disable(struct t=
egra_i2c_dev *i2c_dev)
>  		clk_disable(i2c_dev->fast_clk);
>  }
> =20
> +static int tegra_i2c_wait_for_config_load(struct tegra_i2c_dev *i2c_dev)
> +{
> +	unsigned long timeout;
> +
> +	if (i2c_dev->hw->has_config_load_reg) {

You could move the timeout variable declaration into the conditional
block and initialize it immediately. That saves one line of code and
restricts the scope of the variable to the conditional.

Thierry

--EVF5PPMfhYS0aIcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXFOrdAAoJEN0jrNd/PrOhgwgP/00FRHmjTw8Od0v/mtimrUf0
YSIE7Ubs2WSeuKw0deCBOFFeNHm77rCfUlfFQe9O+DRpG98mvl7MfXYnRFGlZW0b
IniOXxVGsSdWi0pQT9Dq7JutRU6YtDOLT4vudWBN4uzLLJhuNMvkSswrL3xaGAuN
wMxm9gHP2a2irA8QLDslhwI4Mj1l2g75mT8r+BUheyui7t5kHWJJDsoLf2IUGowA
oR43g2zuGo6D+q4aE2pNBFxXJlrqvTXusp+1TtJm7leVi1UFT2eFhN0j0Y6jsfc7
QwXuqNG36/FiRlmsvXiD2XOAWgx2HTznnRKTkj0hs4MQJTHXbXxzGzP2V98wAXLe
lyaLB9FeigYrDiu1VdDNgeHQezs+wokJ1TdXyV9mj1ihjGIzGkfn5ZFXBT1Af81U
igjO7jbIANpDZm3jm/d4Om5CdnmNo+RW0iPrzdWM327B41ZspavqCS/K/VVPhKBM
Pf24Zid1CFLiPzNZYdbVvl6Kb6WclmUvmMHCHMPg4c/OJnBmb4U5CoDBmTwyle3v
DAibrenqROHXCQKomn3ZV2Y52eaO4BUnHLNAyKXSmEbR47DAfVAMJdER2GY/ZB2a
j0gLpX79MAvy8nlHZ24jP9gyhDlLuYSGCyIICGyTtCYOQG5FIieqBzRKKQSJ7U4A
FIBj+he2b400M/6GPWsd
=rqPa
-----END PGP SIGNATURE-----

--EVF5PPMfhYS0aIcm--
