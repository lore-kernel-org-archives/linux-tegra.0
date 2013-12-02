From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: tegra: Header file for pinctrl constants
Date: Mon, 2 Dec 2013 15:25:23 +0100
Message-ID: <20131202142522.GA17566@ulmo.nvidia.com>
References: <1385992502-12771-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SUOF0GtieIMvvwua"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1385992502-12771-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--SUOF0GtieIMvvwua
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 02, 2013 at 07:25:01PM +0530, Laxman Dewangan wrote:

I think the canonical subject prefix for Tegra is:

	ARM: tegra:

Perhaps also mention that you "Add" the header file? Like so:

	ARM: tegra: Add header file for pinctrl constants

> Defines pincontrol constants to use from Tegra's DTS file

Perhaps: "This new header file defines..."? "DTS files"

> for tegra pincontrol properties option.

"Tegra"

>=20
> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  include/dt-bindings/pinctrl/pinctrl-tegra.h |   65 +++++++++++++++++++++=
++++++
>  1 files changed, 65 insertions(+), 0 deletions(-)
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-tegra.h
>=20
> diff --git a/include/dt-bindings/pinctrl/pinctrl-tegra.h b/include/dt-bin=
dings/pinctrl/pinctrl-tegra.h
[...]
> +/* Pull up/down/normal */
> +#define TEGRA_PIN_PUPD_NORMAL				0
> +#define TEGRA_PIN_PUPD_PULL_DOWN			1
> +#define TEGRA_PIN_PUPD_PULL_UP				2

Perhaps these would be easier to use as:

	#define TEGRA_PIN_PULL_NONE	0
	#define TEGRA_PIN_PULL_DOWN	1
	#define TEGRA_PIN_PULL_UP	2

?

> +/* Tristate/normal */
> +#define TEGRA_PIN_NORMAL				0
> +#define TEGRA_PIN_TRISTATE				1
> +
> +/* Rcv Sel enable/disable */
> +#define TEGRA_PIN_RCV_SEL_DISABLE			0
> +#define TEGRA_PIN_RCV_SEL_ENABLE			1
> +
> +/* Lock enable/disable */
> +#define TEGRA_PIN_LOCK_DISABLE				0
> +#define TEGRA_PIN_LOCK_ENABLE				1
> +
> +/* Open drain enable/disable */
> +#define TEGRA_PIN_OPEN_DRAIN_DISABLE			0
> +#define TEGRA_PIN_OPEN_DRAIN_ENABLE			1
> +
> +/* High speed mode */
> +#define TEGRA_PIN_DRIVE_HIGH_SPEED_MODE_DISABLE		0
> +#define TEGRA_PIN_DRIVE_HIGH_SPEED_MODE_ENABLE		1
> +
> +/* Schmitt enable/disable */
> +#define TEGRA_PIN_DRIVE_SCHMITT_DISABLE			0
> +#define TEGRA_PIN_DRIVE_SCHMITT_ENABLE			1

These are all boolean, so I wonder if perhaps we should be simply
defining a single pair and reuse that in different contexts:

	#define TEGRA_PIN_DISABLE	0
	#define TEGRA_PIN_ENABLE	1

The property names should provide enough context for them to be used
unambiguously.

Thierry

--SUOF0GtieIMvvwua
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSnJhSAAoJEN0jrNd/PrOhRZIQAIUaiF7TTu5T1jBH2mshQXrE
3/cH7uS2y6kAUOVMPTLJNVw5XrJuvRzwl9hFxjc8oYJ40BGH/zKR1z8u4FDlBsXh
WNGEAwabYSRtYjkcVu4qccmg1iUB+5n35K8o0AQrmUXmrQnLO9TFEjC+/b5ZA2zk
92VI0KLoXxWgOpUhsXlJJU+ZiJ2Sd/bzgFmA4c2tQAE00DB7ZwT/7jbof/Jdjhv7
o4LK5x0oPNoZhpbh9NlNcfb+p3bV/9xK3ROO03/vGX2nXHE0SjZUDdNmCJND9uCe
3KWwQfduVgpt9kJwUlAreRW9cAnmyKYMLnbEeS3mFaZJHeng4rvQfKYL1oU/Dl/f
joP9ZEJB4ADAhU2e9+S17oiZn2bIrmVFN0CIB9/WLBh8wezE0b9+LJdChnLafsTo
VWRO5FyneEM9t4socItm0D0Lj+jsAGEFSdxNZAnBhQIAlx5faBlXVcUYkfkbU7RR
v0//CzLUmJuPZYJ2ZkowysJ5kNSjApfWEhIQxKRbIKibMByeeciZhn9JouZbUwcT
NaGyv7H2nkAWUbyfkxAObDGj33X1ya+4kekTvydZyEuVeiacVG9fDsTLy3Up6OVs
IhwtisY1tETp+J5w9T2GpbOqTF5LxIqfz8uJqC8/6U+rStiRJgw+DnN+kEIfac+k
NqLN7O+z54rFsd5vldRZ
=AuJL
-----END PGP SIGNATURE-----

--SUOF0GtieIMvvwua--
