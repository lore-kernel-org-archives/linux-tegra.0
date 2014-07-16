From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [cbootimage PATCH V3 2/3] Add Tegra132 support for the
 cbootimage utility
Date: Tue, 15 Jul 2014 21:18:07 -0700
Message-ID: <20140716041807.GA6912@nvidia.com>
References: <1405478237-19178-1-git-send-email-vinceh@nvidia.com>
 <1405478237-19178-2-git-send-email-vinceh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1405478237-19178-2-git-send-email-vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 15, 2014 at 07:37:16PM -0700, Vince Hsu wrote:
> This patch adds support for Tegra132. This are only slight
> differences between Tegra124 and Tegra132. The command line
> usage is exactly the same as other platforms like Tegra124.
> 
> The structure nvboot_mts_info is added into the bct for Tegra132.
> So the bootrom and first stage bootloader know where to load the
> preboot and mts images. Two parse items "Mts=" and "MtsPreboot="
> are added to embedded MTS images in BCT image like what we do for
> bootloader. The syntax is also the same. For example:
> 
> MtsPreboot = <preboot_image>,<load_address>,<entry_address>,Complete;
> Mts        = <mts_image>,<load_address>,<entry_address>,Complete;
> 
> The load and entry addresses depned on your board design.
> 
> Four files are added in src/t132:
> 
> nvbctlib_t132.c - is cloned from nvbctlib_t124.c and adds mts
>                   information getter and setter.
> nvboot_bct_t132.h - adds mts structure into bct
> nvboot_sdram_param_t132.h - clone of nvboot_sdram_param_t124.h
> parse_t132.c - clone of parse_t124.c
> 
> Signed-off-by: Vince Hsu <vinceh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 

Acked-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>


> diff --git a/src/t132/nvboot_sdram_param_t132.h b/src/t132/nvboot_sdram_param_t132.h
> new file mode 100644
> index 000000000000..80799226db34
> --- /dev/null
> +++ b/src/t132/nvboot_sdram_param_t132.h
> ...
> +       /* End of generated code by warmboot_code_gen */
> +} nvboot_sdram_params;
> +#endif /* #ifndef INCLUDED_NVBOOT_SDRAM_PARAM_T132_H */
> +

whitespace at end of file.  I'll fix when I apply.


-Allen

nvpublic
