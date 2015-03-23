From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [tegrarcm PATCH v1 1/8] tegrarcm: Add Tegra132 support
Date: Mon, 23 Mar 2015 10:06:51 +0100
Message-ID: <20150323090650.GB11268@ulmo>
References: <1426639141-12060-1-git-send-email-jimmzhang@nvidia.com>
 <1426639141-12060-2-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="i0/AhcQY5QxfSsSZ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1426639141-12060-2-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--i0/AhcQY5QxfSsSZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2015 at 05:38:53PM -0700, Jimmy Zhang wrote:
> From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Add Tegra132 USB device id, miniloader, and chip SKU information.
>=20
> Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  src/Makefile.am                      |    1 +
>  src/main.c                           |   15 +-
>  src/miniloader/tegra132-miniloader.h | 5259 ++++++++++++++++++++++++++++=
++++++
>  src/nv3p.h                           |    3 +
>  src/tegrarcm.1.in                    |    4 +-
>  src/usb.c                            |    3 +-
>  src/usb.h                            |    1 +
>  7 files changed, 5283 insertions(+), 3 deletions(-)
>  create mode 100644 src/miniloader/tegra132-miniloader.h
>=20
> diff --git a/src/Makefile.am b/src/Makefile.am
> index 4b548859e075..d0d45cad4fee 100644
> --- a/src/Makefile.am
> +++ b/src/Makefile.am
> @@ -18,6 +18,7 @@ tegrarcm_SOURCES =3D \
>  	miniloader/tegra30-miniloader.h \
>  	miniloader/tegra114-miniloader.h \
>  	miniloader/tegra124-miniloader.h \
> +	miniloader/tegra132-miniloader.h \
>  	usb.h
> =20
>  man_MANS =3D tegrarcm.1
> diff --git a/src/main.c b/src/main.c
> index 50adc14f0b06..24d3bf81191f 100644
> --- a/src/main.c
> +++ b/src/main.c
> @@ -60,6 +60,9 @@
>  // tegra124 miniloader
>  #include "miniloader/tegra124-miniloader.h"
> =20
> +// tegra132 miniloader
> +#include "miniloader/tegra132-miniloader.h"

I'd prefer if we stopped including miniloader (and other) blobs in the
tegrarcm binary. We already provide the MTS in a separate repository and
can reference it using command-line options. I think we should do the
same for the miniloader.

The ordering of patches here is somewhat confusing, too. This patch in
fact doesn't really add support for Tegra132 because we need MTS for
that to actually work. A more natural ordering would be to have the MTS
support go in first, followed by this patch to enable Tegra132 support.

Thierry

--i0/AhcQY5QxfSsSZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVD9eqAAoJEN0jrNd/PrOhkH8QAI7FpL13lxglB3XDRpooqGBa
ASmq+HhM6nWo2wLfb4IoI7jQnBMTrG2gYzJ5+fe2KeuuSFKlGIAPduA3t5IzNexo
WXkDcjI8qS2jMo60vR0Tk3RmidhHk26rPo7aAHG/a8GZFi2uBGExGfmHqnV0ErWj
x7DnEmDDA/0neTCKuqWdffN7OfRRFFn1LDO2woxxr2d/GMLYqUHqeItJ0temRWlG
uDP/QhAlyPKaHqQ8sN3fN3rX67KTpS0hFDxuPe8NJKZfhZa0i7+GJj/sDz3i2742
c5MkcquSMTwyKIVgBoff8Dd1pO9LpBFsmeoS61TJwn2V1VgtH0SP2gyqmdxh2i7S
lELmuVLTDGwk/R92yjN+/ez8m5YQnP3fwTruqRw3NesaHIORS3i8ZwGvE//SOv0p
LvyZ5uX1HOCjUxdWfgRZWNuxt5AOz4/oOxvAVOlwTPKXR097gQQ0Ezl7JwttU+uA
nvczX8TUC0wVXl2Ovepb+5s97aejLMfsLUClJfN8i5gNYqDEydIM9YFf72a88yPH
Fn/X+YN967gC6ysZIb1oa1eiFcpySDXldmpmKX6yzGBRzVMldX1atpnZ4x7+9DMj
9sBOu20HlKWL4YQ6jeHOOoS3CTZcPuuBY3F2/bCJ0wh1LzBZV04rH+p+D35BsAKm
ysNmuOPkv4x38spY1woZ
=xJQo
-----END PGP SIGNATURE-----

--i0/AhcQY5QxfSsSZ--
