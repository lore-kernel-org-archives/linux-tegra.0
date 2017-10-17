From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH V2] firmware: tegra: add BPMP debugfs support
Date: Tue, 17 Oct 2017 12:44:56 +0200
Message-ID: <20171017104456.GE30589@ulmo>
References: <1507011133-21817-1-git-send-email-talho@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jTMWTj4UTAEmbWeb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1507011133-21817-1-git-send-email-talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--jTMWTj4UTAEmbWeb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 03, 2017 at 09:12:13AM +0300, Timo Alho wrote:
> Tegra power management firmware running on co-processor (BPMP)
> implements a simple pseudo file system akin to debugfs. The file
> system can be used for debugging purposes to examine and change the
> status of selected resources controlled by the firmware (such as
> clocks, resets, voltages, powergates, ...).
>=20
> Add support to "mirror" the firmware's file system to debugfs. At
> boot, query firmware for a list of all possible files and create
> corresponding debugfs entries. Read/write of individual files is
> implemented by sending a Message ReQuest (MRQ) that passes the full
> file path name and data to firmware via DRAM.
>=20
> Signed-off-by: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v2:
>  - Address Jonathan's review feedback
>   * restructure error printing and what error codes passed to higher
>     layers
>   * don't use IS_ERR_OR_NULL()
>   * avoid overwriting last-character of filename in one corner case
>     (name length =3D 255)
>  =20
>  drivers/firmware/tegra/Makefile       |   4 +-
>  drivers/firmware/tegra/bpmp.c         |   4 +
>  drivers/firmware/tegra/bpmp_debugfs.c | 444 ++++++++++++++++++++++++++++=
++++++
>  include/soc/tegra/bpmp.h              |  14 ++
>  4 files changed, 465 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/firmware/tegra/bpmp_debugfs.c

I've applied this, though I turned the _ to - in the filename for
consistency with other files in the above directory.

Thanks,
Thierry

--jTMWTj4UTAEmbWeb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlnl3ygACgkQ3SOs138+
s6HY8g//eCDjfeJdhDcG17ZJFQxQeE/aTIqnWoA970X7P0zxCs3ZB+LZCKSwSJsf
Ll9ReTFKsltaXU7prrVt0I0tGdCnFU0UaHMxDQtNqT30bp5z5oaxH4YY8ooLaxHJ
RBeCUMDIkp35OCGxn0+ErClf4F3zNQXdK/OtP/gXqhSdGS1cZBxBYe57Ss+vepyG
RKGdcGQhnpfcEYaMirQr3Cg8bWCQdZ0JZ18SxCMypo3DvCkt8bf/B6RrST5PvJnQ
V0o6sPpgpZLOmvXHsIPT6k1Oq0q8PIwjVEsNjv7w5GBvUNQHgz0VPxP/BN9uwP89
3WGG9moTsfiXtwpse3sEagNuyUJPZI5O4zI9OcXR13Zgpzu0LFEe92USQhxXKoRe
sxmr2W5kKmIdWG4mqZSqqf2LAJR08FCbLSW+3zAgbbsbq20i+KsuJ4Fo+4Xk1Q4e
PCKYv3k4INhawNizMwrXBO8lU1xOinnWahhuFQEu761Nm9jRvO/1set9okPBiEWY
JqtZkOXcwKA5877nBju7uD9VFKrxdsNN1U76ZC8I8v4aRPR9hBGmYK/EWIUmY+LR
+D2NS0A5vYY481YKjL8MGWdSdk2lmYG+2pyj7xoIGsA6vWv3rABxa20k1kOH2IPo
dCh0H1C40gnk/CudoEOPPYHsvhWjWADbJHo/lfE6aiOmaOrDM+Q=
=ZPG1
-----END PGP SIGNATURE-----

--jTMWTj4UTAEmbWeb--
