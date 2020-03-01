From: Avri Altman <Avri.Altman-Sjgp3cTcYWE@public.gmane.org>
Subject: RE: [PATCH v1 1/3] mmc: core: Add raw_boot_mult field to mmc_ext_csd
Date: Sun, 1 Mar 2020 10:50:35 +0000
Message-ID: <MN2PR04MB699121991FCB80BE39FC106FFCE60@MN2PR04MB6991.namprd04.prod.outlook.com>
References: <20200224231841.26550-1-digetx@gmail.com>
 <20200224231841.26550-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200224231841.26550-2-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Billy Laws <blaws05-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-block-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-block-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Gilles Grandou <gilles-4LeZiQkTMnPR7s880joybQ@public.gmane.org>, Ryan Grachek <ryan-JnT2LfGw4MD1P9xLtpHBDw@public.gmane.org>, "linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,
>=20
>=20
> In order to support parsing of NVIDIA Tegra Partition Table format, we
> need to know the BOOT_SIZE_MULT value of the Extended CSD register
> because
> NVIDIA's bootloader linearizes the boot0/boot1/main partitions into a
> single virtual space, and thus, all partition addresses are shifted by
> the size of boot0 + boot1 partitions.
>=20
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/mmc/core/mmc.c   | 2 ++
>  include/linux/mmc/card.h | 1 +
>  2 files changed, 3 insertions(+)
>=20
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index f6912ded652d..88e5b4224d3c 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -417,6 +417,8 @@ static int mmc_decode_ext_csd(struct mmc_card
> *card, u8 *ext_csd)
>                 ext_csd[EXT_CSD_ERASE_TIMEOUT_MULT];
>         card->ext_csd.raw_hc_erase_grp_size =3D
>                 ext_csd[EXT_CSD_HC_ERASE_GRP_SIZE];
> +       card->ext_csd.raw_boot_mult =3D
> +               ext_csd[EXT_CSD_BOOT_MULT];
You might want at this point multiply it by 128K,
And get rid of: part_size =3D ext_csd[EXT_CSD_BOOT_MULT] << 17;
Below...

Thanks,
Avri
