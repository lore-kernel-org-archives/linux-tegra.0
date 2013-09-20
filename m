From: Steev Klimaszewski <steev-4jv++OSWV9OTkO8mciVlQg@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra_defconfig: enable CONFIG_ARM_APPENDED_DTB
Date: Thu, 19 Sep 2013 19:59:57 -0500
Message-ID: <CAKCjkJbavWtWBxvKqpesmJfcKTUCpbsM_xL0JfS49vOpkZ8AUw@mail.gmail.com>
References: <1379638594-28888-1-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1379638594-28888-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

CompuLab provide a u-boot that supports dtb, and afaik, it's supported
in mainline u-boot as well.

On Thu, Sep 19, 2013 at 7:56 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> This is needed on TrimSlice, since the u-boot on that hardware is too old
> to support native device tree booting. Same for any device that currently
> run fastboot, but none of that hardware is supported in mainline today;
> or at least there are modern u-boot ports for it.
>
> Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> ---
>  arch/arm/configs/tegra_defconfig |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
> index ea042e8..b694a09 100644
> --- a/arch/arm/configs/tegra_defconfig
> +++ b/arch/arm/configs/tegra_defconfig
> @@ -39,6 +39,8 @@ CONFIG_AEABI=y
>  CONFIG_HIGHMEM=y
>  CONFIG_ZBOOT_ROM_TEXT=0x0
>  CONFIG_ZBOOT_ROM_BSS=0x0
> +CONFIG_ARM_APPENDED_DTB=y
> +CONFIG_ARM_ATAG_DTB_COMPAT=y
>  CONFIG_KEXEC=y
>  CONFIG_CPU_FREQ=y
>  CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
> --
> 1.7.10.4
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
This e-mail and any attachments are for the sole use of the intended 
recipients(s) and may be confidential. Use of any Pwnie Express product 
signifies your agreement to the Rapid Focus Security EULA<http://pwnieexpress.com/pdfs/RFSEULA.pdf>and is subject to export controls under the U.S. Commerce Department's 
Export Administration Regulations ("EAR").
