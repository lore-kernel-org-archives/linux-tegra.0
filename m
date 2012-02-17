From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V2 2/3] gpio: gpiolib: Support for open drain/collector
 gpios
Date: Fri, 17 Feb 2012 08:37:01 -0800
Message-ID: <20120217163659.GD10146@opensource.wolfsonmicro.com>
References: <1329490582-22107-1-git-send-email-ldewangan@nvidia.com>
 <1329490582-22107-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IDYEmSnFhs3mNXr+"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1329490582-22107-4-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--IDYEmSnFhs3mNXr+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 17, 2012 at 08:26:21PM +0530, Laxman Dewangan wrote:
> Adding support for the open drain gpio on which client
> can specify the open drain property through GPIO flag
> GPIOF_OPEN_DRAIN at the time of gpio request.
> The open drain pins are normally pulled high and it
> cannot be driven to output with value of 1 and so
> when client request for setting the pin to HIGH, the
> gpio will be set to input direction to make pin in tristate
> and hence PULL-UP on pins will make the state to HIGH.
> The open drain pin can be driven to LOW by setting output
> with value of 0.

Reviwed-by: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>

--IDYEmSnFhs3mNXr+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPPoIkAAoJEBus8iNuMP3dVMsP/15Newz7Jvsq8s58AGgzMEFo
Gj1kgrfJoh/icSNsf64g3GqCHzQmoT7eePXAJQK18z4YsM6Pd1VxdGVT75FAWaRN
O/0Kine5DQmwDPrmpTIJesvYppSP0cIrXPAZJzlj/REnBBXl8X5h9eB8tn19QOzZ
1q7bXngaDwZUIdNDp3QL0oKlk4RCo+yAwBVp7R9nFZf9CH07YMEbu72yc3UD25Bl
1n0akGGAMMmCwJdTQAWtrO3aowrVXOD9LD2XhHpEPS3q23JoQ/BBcRX9H1VfxvG8
MCk8Y+09fDj5WO/O5RqN0/xY8aFfe3GmHy5SLMmnU785z7z0pDljgQWk0mBXXiaR
FXEkeYwHHCsY5ZE28h9pPB4SaJVOJNli0qKM+xSUMRCf8d7mbxBycnvgaNtEMbHs
y5YhPmK/W/A837xQFv6Tl4VAc5m5HKvkDKNw58UAd6unx8eECxO+mFJ0th7Bmw1e
YPF+12HFLIG0XoK/5j3HqzukwXafrSMSUwagi6kb0AJEHYRwmuoPSHOl5h2h8jT/
1+6wWkrnQUAgwQxpxQUUaNLirlREEcB6QDTlrot3H5yDabs6b3p/ZQaNPLUeE9W4
6RJmp0oa/EKO98pRZ+Ei4NSfumtl0i9R6hg6A+IAWsU6qhgGB4Av1w7BiHM5IT36
68+3GsdrAIoukigUqc3r
=/UZE
-----END PGP SIGNATURE-----

--IDYEmSnFhs3mNXr+--
