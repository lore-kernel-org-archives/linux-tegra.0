From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [cbootimage PATCH v3 0/3] Add support for Tegra210
Date: Wed, 25 Mar 2015 09:33:00 +0100
Message-ID: <20150325083259.GA3794@ulmo.nvidia.com>
References: <1426897221-20307-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Nq2Wo0NMKNjxTN9z"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1426897221-20307-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--Nq2Wo0NMKNjxTN9z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2015 at 05:20:18PM -0700, Jimmy Zhang wrote:
> Four t210 specific supporting files are added under src/t210 diretory.
> Comparing T210 bct to T132 bct, the main changes include the size increas=
ed
> to 10240 from 8704. The number of boot devices that can be specified in b=
ct
> is reduced from 4 to 1. And many new fileds are added to nvboot_sdram_par=
ams.
>=20
> v1: Initial changes
> v2: Fix some minor issues found in v1
>     Removed files src/t210/nvboot_config.h and src/t210/sdram_param.h
>             that were added unintentionally in v1.
> v3: Remove "deprecated" from help -t option help text.
> =20
> Jimmy Zhang (3):
>   Add support for Tegra210
>   Remove misleading message "deprecated"
>   Bump to version 1.5
>=20
>  configure.ac                       |    2 +-
>  src/Makefile.am                    |   12 +-
>  src/bct_dump.c                     |    1 +
>  src/cbootimage.c                   |   10 +-
>  src/cbootimage.h                   |    6 +-
>  src/data_layout.c                  |    2 +
>  src/parse.c                        |    1 +
>  src/parse.h                        |  390 ++++++
>  src/set.c                          |    6 +
>  src/t210/nvbctlib_t210.c           | 2314 ++++++++++++++++++++++++++++++=
++++++
>  src/t210/nvboot_bct_t210.h         |  406 +++++++
>  src/t210/nvboot_sdram_param_t210.h |  953 +++++++++++++++
>  src/t210/parse_t210.c              |  741 ++++++++++++
>  13 files changed, 4835 insertions(+), 9 deletions(-)
>  create mode 100644 src/t210/nvbctlib_t210.c
>  create mode 100644 src/t210/nvboot_bct_t210.h
>  create mode 100644 src/t210/nvboot_sdram_param_t210.h
>  create mode 100644 src/t210/parse_t210.c

Tested-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--Nq2Wo0NMKNjxTN9z
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJVEnK4AAoJEN0jrNd/PrOhq5gP/Ajk9NxXTzMAN4SRAq7/SzmF
/6B4/KvqcRJ6N87qofDaTf+gAF77RPJ9K9JDEWQOjZe/7z5mlwzEMGjzEcEyut4q
btRqgDRQcskjsqdFRFiwGif0EMblGwwFrNGqbKm8zOHCJ38V5/qaPuCHllKXfV+I
sp7Bl7EKQbczwD4xNjHvIqe3NNuUHH2LGmGwpxUbuTCBK1KtOiKQpE+Kdx18GXO/
KdFFLG96BnJDy9Dz3zif20VKY76gshwSzjR3CJQ475UwMtmAyEpLFF3iENvHZleg
Jmlu3PAscR2VuaDQ97ZFAuIYH5f/88HdwsAXLwOqfEsrS56lGXpzNAWj2Xy468Be
0jUE8VXLhgknywASB0bTkBksh+He09HNG6qMuV33CLGbd71tFhV8cRxmCpOGGRnM
dfnimoKLByqZNwoPhlbw8D280K8fZwqmhJ6MPw8764xRaKjG5HlPOLihVCcpvL7L
v5AGOhLXSL9H9OjEryjDxRtNLGEppWnem9oBRNAHTR5gvxDTHP31JlyYR9gIj397
wHXWx0WTjlPCRHrCQbqTn/JGFl55rMRKp09Tg5vc6RAlGSd1NmFCLtt4HSEkwxHk
tzkbr4ZlEy+DOKHVcIBeG3ChUAEev5HtowXq2DOZhqZpP5orkxRyqAHIPkiN0coy
NvoPoL6i83uCASbhFcne
=pYU4
-----END PGP SIGNATURE-----

--Nq2Wo0NMKNjxTN9z--
