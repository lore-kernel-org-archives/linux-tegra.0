From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: trimslice: enable HDMI port
Date: Fri, 16 Nov 2012 16:27:24 +0100
Message-ID: <20121116152723.GA28991@avionic-0098.mockup.avionic-design.de>
References: <1353021614-29200-1-git-send-email-swarren@wwwdotorg.org>
 <1353021614-29200-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VS++wcV0S1rZb1Fb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1353021614-29200-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--VS++wcV0S1rZb1Fb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 15, 2012 at 04:20:14PM -0700, Stephen Warren wrote:
> From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
>=20
> Enable host1x, and the HDMI output. Harmony also has a DVI port with an
> HDMI form-factor connector, driven by Tegra's LVDS output. This isn't
> enabled yet, due to potential issues with having multiple outputs enabled.
>=20
> Correct DDC I2C frequency to 100KHz.
>=20
> Add dummy/fixed regulators to satisfy the HDMI driver.
>=20
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> [swarren: add commit description, remove enable of DVI port]
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Heh, I suppose I can't add a Reviewed-by to a patch that was originally
my own, but this looks good to me.

Thierry

--VS++wcV0S1rZb1Fb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQpltbAAoJEN0jrNd/PrOh8z4QALczy4yVq7HzuS/y/GaibNkM
vpfG/mVW5ZW0MHY8LOeFdO+fjdFEwb/h5RQjbS6gUyFtFahLnhpGvGgzkt4MX+p9
rRrQF7MmYNmTjdlKXkHzQQ1TzQvgEujw+iRO0WlJ9LoQQ2CVkChwGg3quLCFDY8m
eSyf1ilspGYf2t4g2v9f103fWf4eCVZVtLUC76A1LVZv6nLnz0MC/5cCSumrMxct
0p0OiZOlol0nUa/+Ca9wDOtjEB0kxwem7JOrg3IMrmEySBtC6Ho+hZ9u07TuaDim
ZWrk4z/2q9hqKx2MKl6zPzKWBA40gROJe6Mxn2rIWJyLPODr2/wOXRBSh9hYbKzB
KeBGKI0VeDtulp7KVgg7Ds/Vf8P1eog1D/j0zQmzoN2dGdJSraqGvOYuKhL1jady
KcyotdrewtlwSzIygKvkaHCEIKHSR8YwfNWJouwUUi2lFVJHcxa04Ooc72QVICmU
4F5aa2WW5OwwfVSHJlN2ZYirQyDKeXbd0iQSuXvKfg+fY1hEnDUjaGKhDn95//tg
W1BgIPaaInA4Wkpvgme2TSErwlsQRugAR/nfN4YK3caUT2LX4dfhi/RvpBNnHIY8
eNM8PJIDZx/yOid1EytoJWyBaakQiubiOtXjQojxLMRgkDpYdC1Xa29+RXfh5JQn
/ntMFmvfq/aDo4QnlzVe
=xmYV
-----END PGP SIGNATURE-----

--VS++wcV0S1rZb1Fb--
