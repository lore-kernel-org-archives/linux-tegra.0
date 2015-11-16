From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] watchdog: tegra: Stop watchdog first if restarting
Date: Mon, 16 Nov 2015 11:48:43 +0100
Message-ID: <20151116104841.GA31033@ulmo.nvidia.com>
References: <1447114298-5516-1-git-send-email-achew@nvidia.com>
 <56463F7E.8040008@roeck-us.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZGiS0Q5IWpPtfppv"
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56463F7E.8040008-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Content-Disposition: inline
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--ZGiS0Q5IWpPtfppv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2015 at 11:52:30AM -0800, Guenter Roeck wrote:
> On 11/09/2015 04:11 PM, Andrew Chew wrote:
> >If we need to restart the watchdog due to someone changing the timeout
> >interval, stop the watchdog before restarting it.  Otherwise, the new
> >timeout doesn't seem to take.
> >
> >Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
>=20
> Some feedback from the maintainers would be helpful, though,
> especially if there is some other means to change the timeout
> without stopping the watchdog.

I don't think there is. The TIMER_WDT<w>_COMMAND_0 register has this
description:

	"The StartCounter bit enables watchdog counter operation, loads
	the watchdog counter, starts the watchdog timer to count down,
	resets the expiration count to 0, and clears all flags. Also
	used as restart.
=09
	..."

The way I read this is that the watchdog period (the field that the
wdd->timeout value gets written to) is latched when the StartCounter
bit transitions from 0 to 1. So this change looks correct to me:

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Andrew, it might be worthwhile to file an internal bug report to see if
we can get the TRM updated with a more explicit programming sequence or
at least get confirmation from one of the hardware designers whether or
not this is the correct sequence when changing the period.

Thierry

--ZGiS0Q5IWpPtfppv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWSbSHAAoJEN0jrNd/PrOhvzMP/RTwkcp/xAmEd96jSU4U84oE
7rs7/PNq7x7xmLMiUJWpSGzn3ptuFIko0gpZ5Rtoa2y/rGjio2bGwedGFKF4LDX4
hcisBkbo1RMkOLMZ2zvJpZ/AwaVLFAWX/z1HM+5ghsHJoNYsEn6gwCGCoPKKp6wx
WrUM8zfix1JmrVMoF4biGb7tCw4gJ2dnz+mAhpKHRPezb0Ylnq1wUUgg5N9Xfsfm
kTxLUITvGqGYue0CJ0Wi4ImTSnCWJ1SbTX66ilLjW18RZEjumW0R9pBWwA7Gt0MG
BAFEvhK29M3JOL8pFV5Id90J0cpCvgnw7DMXge/XVts1UxMIudkiuvYIQpiziyJn
BYKyuKJqiB32Ah6b0CiDzlV4f1zZda1ujneWkomm23PtlmyRAAVgLSvI1R0mjjdL
zj7eNSgn2dKh6IMdV05oYEdjhP44UZQOhyQZJhyr3OKzbwaeQh0hxgEXJal7GjH7
XwNJWk4yhwKZO4isP05YjcjCizccJsQpbLMaFPX+nO9O6EbiFkgmMYBzpJnRy+oZ
EebOPOFQb5KVxyRZFbS3klJ98wOKxNk3hpTlYGgQRz6ZRhf9LgcTCC3RnOOzlrDL
1ckd3xt/3SQi3HqrtmD5vPH/4jhD7TFhvQAllx1oRtuta5Mu9IRvbWm1C/ubmFRK
w1GHp1KiuSRgJpPzw5D4
=PTai
-----END PGP SIGNATURE-----

--ZGiS0Q5IWpPtfppv--
--
To unsubscribe from this list: send the line "unsubscribe linux-watchdog" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
