From: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: tegra-devfreq hangs TK1 with R21.4 u-boot
Date: Mon, 13 Jun 2016 07:45:10 +0200
Message-ID: <CAAObsKAEGzuXQCHsgGLzHMjCW9akTqfcn3DFT6+YuN0yi9S7oA@mail.gmail.com>
References: <20160612034541.GA31426@jirafa.cyrius.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160612034541.GA31426-IRMp5PtgtdoigzW5ZibpNwC/G2K4zDHf@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12 June 2016 at 05:45, Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org> wrote:
> I noticed that the Jetson TK1 hangs during boot (when/before mounting
> the SD disk) when CONFIG_ARM_TEGRA_DEVFREQ=y is set and when u-boot
> from R21.4 is used (2014.10-rc2).
>
> The hang does not occur when I disable tegra-devfreq or when I use
> tegra-devfreq in combination with u-boot 2016.03 (from DENX upstream,
> built by Debian).

Works as well with 2015.01, which is closer to the one in R21.4.

https://lava.collabora.co.uk/scheduler/job/238991/log_file#L_3_5

Regards,

Tomeu

> Steps to reproduce:
>
> ARCH=arm make multi_v7_defconfig
> Set CONFIG_ARM_TEGRA_DEVFREQ=y
> Boot from an external SD card and it will hang when/before mounting the
> SD card.
>
> --
> Martin Michlmayr
> http://www.cyrius.com/
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
