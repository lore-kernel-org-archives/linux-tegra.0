From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] memory: tegra20-mc: Fix hang in IRQ handler.
Date: Mon, 10 Jun 2013 22:36:42 +0200
Message-ID: <20130610203641.GA26036@mithrandir>
References: <1370855624-30564-1-git-send-email-ttynkkynen@nvidia.com>
 <1370855624-30564-2-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OXfL5xGRrasGEqWY"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1370855624-30564-2-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--OXfL5xGRrasGEqWY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 10, 2013 at 12:13:43PM +0300, Tuomas Tynkkynen wrote:
> In Tegra20 memory controller any MC interrupt would cause an
> infinite loop in the IRQ handler.
>=20
> Signed-off-by: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/memory/tegra20-mc.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/memory/tegra20-mc.c b/drivers/memory/tegra20-mc.c
> index 2ca5f28..bd5a553 100644
> --- a/drivers/memory/tegra20-mc.c
> +++ b/drivers/memory/tegra20-mc.c
> @@ -193,8 +193,11 @@ static irqreturn_t tegra20_mc_isr(int irq, void *dat=
a)
>  	mask &=3D stat;
>  	if (!mask)
>  		return IRQ_NONE;
> -	while ((bit =3D ffs(mask)) !=3D 0)
> +	while ((bit =3D ffs(mask)) !=3D 0) {
>  		tegra20_mc_decode(mc, bit - 1);
> +		mask &=3D BIT(bit);

Shouldn't this be "mask &=3D ~BIT(bit);"? The intent of the code is to
clear the bit which was handled by the loop body, right? The above
clears all other bits instead.

Thierry

--OXfL5xGRrasGEqWY
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBAgAGBQJRtjjZAAoJEN0jrNd/PrOhn+wP/0xZ/NntNOr3kNf34eC/lnB5
oX9W2GY0iYUQlBMIbAxNuC73akhDrPNmPD8FbsEVILPHZRgPN/VrRDPT6ef5l1AW
d4ja5IwUhiOZNU5Q7HeFvVlAvxyvWfgpIcI+assIqXegDX1Lsm5f2m2YY7TBxHOG
JNfD6kr2QW5cuzAtrkE1x4bn2MtCexNYCa8XXYbag0J5iIed/mUh6Xlq1NcHstL7
UON4ADjlea5JwDijpVTO2L7sBtBijB99H8fA/oSBtuwMYWHMZx0uGdX6CqiWQsm+
pdHiGyqi/1MAzDnZtBHuT6k49js7Eao7TDBkZWC57k3zrwhe1/TJO9bzpuxYn0ec
FhyuAM3uLNFpKQum9WeZbLZ9TWzC76vmPFktbDnKMJmGQmCRdJcQRgADKXIJzCXU
Jt1TdQgf+x40hCfo2ayFxzVxL/R0HOos0jtGGA0RQy2vLgPZXgj6bFhKQ2Y7m5fp
sTzscLVSD+g8hDA6UfgyiJot5MdFOTURIKfFYSRSkPh7GVPmnMfDm2u7ajQyTsnc
4tpQG9SDMxcD4AafQwJ2vLVsJfAqYopcIVISrIBczkEAxvEtAShPCU5JwqBv6KSi
7IHOat70ntb68R4mgSuY5RozsfnfJ4x7igzusyr6yK4OfZRJULEsYN14yoX0zUdW
yGte+1FgIzC2qIp7ub+/
=CLI6
-----END PGP SIGNATURE-----

--OXfL5xGRrasGEqWY--
