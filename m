From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [tegrarcm PATCH 1/2] tegrarcm: Add Tegra132 support
Date: Wed, 11 Mar 2015 11:38:03 +0100
Message-ID: <20150311103802.GO19577@ulmo.nvidia.com>
References: <1421194802-28198-1-git-send-email-jimmzhang@nvidia.com>
 <1421194802-28198-2-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JWJEtCrVvH5hpatL"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1421194802-28198-2-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--JWJEtCrVvH5hpatL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2015 at 04:20:01PM -0800, Jimmy Zhang wrote:
> From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Add Tegra132 USB device id, miniloader, and chip SKU information.
>=20
> Signed-off-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

As far as I remember Allen's original work included workarounds for an
backwards-incompatibility that was introduced in an early version of the
NV3P protocol for Tegra132. Does the miniloader included here no longer
have that incompatibility?

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
[...]
> diff --git a/src/miniloader/tegra132-miniloader.h b/src/miniloader/tegra1=
32-miniloader.h
> new file mode 100644
> index 000000000000..2e8a7e8d20b6
> --- /dev/null
> +++ b/src/miniloader/tegra132-miniloader.h
> @@ -0,0 +1,5259 @@
> +/*
> + * Copyright (c) 2011 NVIDIA CORPORATION.  All Rights Reserved.

Was this file really generated in 2011? We released the chip in early
2014, so it's quite unlikely the miniloader existed 3 years before that.

Thierry

--JWJEtCrVvH5hpatL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVABsKAAoJEN0jrNd/PrOheCQP/24FvNK7j7wAahHcGVSyIEWm
ZbElVJgs4KwasqPlGFIU9yQs3pdiMo9La1vgcmBy3YqzzgtXah87P6HUIR3eTu26
Vk9sZRDmJt9vJKFxW4dWXMEDeh5tWilbIjVrA5mK9Q8h5+CZYt3CgaKhIeFhE9ew
covH2JfRkWTl7Lzc9toB00RTGzt2SGnEyRFZCt+JW4/GokbZ+PDvtv+hBbSea10x
7FYEcDsfI2MFruJKmtkufowhJpALYlIuS/gjxda50A28pMKYlpfaDXN8XWPqAJ0m
kyhxpkV547MGg4EXJ6pVnklUx4rrO8ceJiypQYqhyf1Et4SteNpuYW0/C3yrd9x2
agpUNcoxAtDl5aVd7Irw+NnOiuZe2Hba2KjVSn+tvB0KKmALdIHilvXUQnH+hU56
hAQ8BtyCg0xPzzGtWWTo4vhZq0Rmnm9wUhdh4ryqQrp0UIpjw/u3OzuwND8iEquy
mAk/pxh6xI0hMf/hEGIfy0UaqFBe5m4OKBSx1HSkbIDsTB51/rZlprWhss4aG1VQ
z8doEEjLHch0NAXUEWyaYHvoxj9luIQd/NV/B5loY+jl0qGPuwtPmpZPlYjCh/0S
bQwJavGFhi+buwLBepLPibgqqYHilO8BSMJAnm+MDGjPmfpEjf0FmRiGByUjOeg1
Iy6+DTvFl/JuHQ+JECtg
=Geo8
-----END PGP SIGNATURE-----

--JWJEtCrVvH5hpatL--
