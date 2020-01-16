From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3] mmc: tegra: fix SDR50 tuning override
Date: Thu, 16 Jan 2020 15:39:54 +0100
Message-ID: <CAPDyKFqXmbnH_NWZZTHHCE+Lt-f3JHAhJ8-=aoKNEPyQed44YA@mail.gmail.com>
References: <9aff1d859935e59edd81e4939e40d6c55e0b55f6.1578390388.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9aff1d859935e59edd81e4939e40d6c55e0b55f6.1578390388.git.mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, "linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 7 Jan 2020 at 10:47, Micha=C5=82 Miros=C5=82aw <mirq-linux-CoA6ZxLDdyE@public.gmane.org=
m.pl> wrote:
>
> Commit 7ad2ed1dfcbe inadvertently mixed up a quirk flag's name and
> broke SDR50 tuning override. Use correct NVQUIRK_ name.
>
> Fixes: 7ad2ed1dfcbe ("mmc: tegra: enable UHS-I modes")
> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # 4f6aa3264af4: mmc: tegra: Only advertise U=
HS modes if IO regulator is present

I am dropping this tag, simply because I don't understand what it should te=
ll.

Instead, please monitor responses from stable maintainers, to see if
there is failure to apply this for stable and then send a manual
backport.

> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
> Acked-by: Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Tested-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>

Applied for fixes, thanks!

Kind regards
Uffe


>
> ---
>  v3: added Thierry's signs that were missing in v2
>  v2: converted 'Depends-On' tag to proper 'Cc: stable' lines
>
> Signed-off-by: Micha=C5=82 Miros=C5=82aw <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
> ---
>  drivers/mmc/host/sdhci-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegr=
a.c
> index 7bc950520fd9..403ac44a7378 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -386,7 +386,7 @@ static void tegra_sdhci_reset(struct sdhci_host *host=
, u8 mask)
>                         misc_ctrl |=3D SDHCI_MISC_CTRL_ENABLE_DDR50;
>                 if (soc_data->nvquirks & NVQUIRK_ENABLE_SDR104)
>                         misc_ctrl |=3D SDHCI_MISC_CTRL_ENABLE_SDR104;
> -               if (soc_data->nvquirks & SDHCI_MISC_CTRL_ENABLE_SDR50)
> +               if (soc_data->nvquirks & NVQUIRK_ENABLE_SDR50)
>                         clk_ctrl |=3D SDHCI_CLOCK_CTRL_SDR50_TUNING_OVERR=
IDE;
>         }
>
> --
> 2.20.1
>
