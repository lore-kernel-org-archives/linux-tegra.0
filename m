From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 1/2] drm: constify edid handling functions
Date: Wed, 16 Jan 2013 16:23:56 +0100
Message-ID: <20130116152355.GA965@avionic-0098.adnet.avionic-design.de>
References: <1358347002-10999-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AhhlLboLdkugWU4S"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1358347002-10999-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--AhhlLboLdkugWU4S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 16, 2013 at 03:36:41PM +0100, Lucas Stach wrote:
[...]
> @@ -705,7 +705,7 @@ static int standard_timing_level(struct edid *edid)
>   * monitors fill with ascii space (0x20) instead.
>   */
>  static int
> -bad_std_timing(u8 a, u8 b)
> +bad_std_timing(const u8 a, const u8 b)
>  {
>  	return (a == 0x00 && b == 0x00) ||
>  	       (a == 0x01 && b == 0x01) ||

Was this intended to go in here?

> @@ -721,8 +721,8 @@ bad_std_timing(u8 a, u8 b)
>   * and convert them into a real mode using CVT/GTF/DMT.
>   */
>  static struct drm_display_mode *
> -drm_mode_std(struct drm_connector *connector, struct edid *edid,
> -	     struct std_timing *t, int revision)
> +drm_mode_std(struct drm_connector *connector, const struct edid *edid,
> +	     const struct std_timing *t, int revision)
>  {
>  	struct drm_device *dev = connector->dev;
>  	struct drm_display_mode *m, *mode = NULL;

I know I'm being picky, but you're constifying the t parameter here as
well without saying so in the commit message.

Thierry

--AhhlLboLdkugWU4S
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ9sYLAAoJEN0jrNd/PrOhmPMP/25arGBdWzRxRHsuXhZ42xq6
hr/DIlSMooF2dfc7duKV3+lR1ULD9U3g3/s8slTYrkbJB9huyvOVQk8XL8FF0beG
xHQanQucEnHVxPZNHmonIv1idpF+GynLsRN9tREoWvWVlDfHUGmKLSCY9KBKcKHa
TIgLeAY7mF/V8t8/UlkvbZbHrIe9ZAiLRbuZS8d/kJSb6icKubYVJ/MR+5IYZELi
Etzu8A7s9yVGHZkbFAF+5S3pz5kZ8EukGWcyYtXFYeYkIbzsmyz+Fo55UZyzdkyO
V3fxJmBMQshQr9WC8AcyEdCuqLvdyi/L6b7iDW5UHIdTel32C2IMEU0TTu04omV5
nGYqLhKJvVUF4JiuOZJoYHUHTvwOccCoxI2sM/GuTreYbRrvA8S1hQA8l0oepSO4
Z9XLoRxLaPXhUjQ7Re9gxS2S2SrefkLqEKpneLs/ud1fTcQGrzx9WSNWtrk4BPyn
XLEycjljf9SfBgStFdEqgD/7u28jUaO6beu43za6BMBKU4XFCZMoiluv0K9fzD19
jH7Bex/+tWKpNjkm3ZjA+Rj3+PETqkqcFWaW221II104y1Qd0C5bs5Np2BRw6s7K
8/Ntv5UoikfUu43J7nzBAbM37r7YtiCIUU5Nk2Hx7EcxqEVdX9cYIjOekNMZtyDU
Vk5Jm5FA4ckSqvhIpQsz
=shy1
-----END PGP SIGNATURE-----

--AhhlLboLdkugWU4S--
