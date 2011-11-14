From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] arm: tegra: export tegra_chip_uid
Date: Mon, 14 Nov 2011 10:37:17 -0800
Message-ID: <CAOesGMgPfECqOn6eOezAaf3gOm01ZG=CABT_=bi8PL_KbokBnA@mail.gmail.com>
References: <1321248620-5147-1-git-send-email-vwadekar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1321248620-5147-1-git-send-email-vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, heinold-cPcqOTmdTlv31zTM6d8ziw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sun, Nov 13, 2011 at 9:30 PM, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> the crypto driver will need this api to use
> it in the rng calculations. in order to build
> the crypto driver as a module, tegra_chip_uid
> has to be exported.

Please use proper capitalization.

> Original author: Henning Heinold <heinold-cPcqOTmdTlv31zTM6d8ziw@public.gmane.org>

See instructions from Stephen on the other patch. Also, if Henning
wrote it, why doesn't it have his signed-off-by?

> Signed-off-by: Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> =A0arch/arm/mach-tegra/fuse.c | =A0 =A02 ++
> =A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/fuse.c b/arch/arm/mach-tegra/fuse.c
> index 1fa26d9..ea49bd9 100644
> --- a/arch/arm/mach-tegra/fuse.c
> +++ b/arch/arm/mach-tegra/fuse.c
> @@ -19,6 +19,7 @@
>
> =A0#include <linux/kernel.h>
> =A0#include <linux/io.h>
> +#include <linux/module.h>
>
> =A0#include <mach/iomap.h>
>
> @@ -58,6 +59,7 @@ unsigned long long tegra_chip_uid(void)
> =A0 =A0 =A0 =A0hi =3D fuse_readl(FUSE_UID_HIGH);
> =A0 =A0 =A0 =A0return (hi << 32ull) | lo;
> =A0}
> +EXPORT_SYMBOL(tegra_chip_uid);
>
> =A0int tegra_sku_id(void)
> =A0{
> --
> 1.7.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
