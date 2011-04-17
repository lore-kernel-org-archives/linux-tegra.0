From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 4/4] ASoC: Tegra: Support more boards
Date: Sat, 16 Apr 2011 23:08:13 -0700
Message-ID: <BANLkTi=why0CsT+QN=vk2tOYrObV2J-QQw@mail.gmail.com>
References: <1302630039-19514-1-git-send-email-swarren@nvidia.com>
	<1302630039-19514-4-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1302630039-19514-4-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: broonie-yzvPICuk2ABKfpSzmGQP03H4hr9OvL1i0E9HWUfgJXw@public.gmane.org, lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Tue, Apr 12, 2011 at 10:40 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
> diff --git a/sound/soc/tegra/Kconfig b/sound/soc/tegra/Kconfig
> index 21125b3..14f7119 100644
> --- a/sound/soc/tegra/Kconfig
> +++ b/sound/soc/tegra/Kconfig
> @@ -16,12 +16,13 @@ config SND_SOC_TEGRA_I2S
>
> =A0config SND_SOC_TEGRA_WM8903
> =A0 =A0 =A0 =A0tristate "SoC Audio support for Tegra boards using a W=
M8903 codec"
> - =A0 =A0 =A0 depends on SND_SOC_TEGRA && MACH_HARMONY && I2C
> + =A0 =A0 =A0 depends on SND_SOC_TEGRA && I2C
> + =A0 =A0 =A0 depends on MACH_HARMONY || MACH_VENTANA || MACH_SEABOAR=
D || MACH_KAEN || MACH_AEBL

This kind of Kconfig logic scales poorly.

It's better to add a silent option that those boards select in their
Kconfig (something like MACH_TEGRA_HAS_WM8903 or whatever), and depend
on that. Fewer merge conflicts down the road, etc.


-Olof
