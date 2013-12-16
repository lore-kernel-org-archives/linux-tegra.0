From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage-configs PATCH] Add Colibri T30 BCT files
Date: Mon, 16 Dec 2013 11:22:16 -0700
Message-ID: <52AF44D8.8030306@wwwdotorg.org>
References: <1387217034-16426-1-git-send-email-stefan.agner@toradex.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387217034-16426-1-git-send-email-stefan.agner-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan.agner-2KBjVHiyJgBBDgjK7y7TUQ@public.gmane.org>, stefan-XLVq0VzYD2Y@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/16/2013 11:03 AM, Stefan Agner wrote:
> The file defines memory timing for 1GB Nanya module for 400MHz used
> during boot.

>  2 files changed, 268 insertions(+)
>  create mode 100755 tegra30/toradex/colibri-t30/Colibri_t30_12MHz_1GB_NT5CC256M16CP-DI_400MHz-shmoo.bct.cfg
>  create mode 100644 tegra30/toradex/colibri-t30/Colibri_t30_12MHz_1GB_NT5CC256M16CP-DI_400MHz-shmoo.img.cfg

I think you forgot build.sh and Makefile.

> diff --git a/tegra30/toradex/colibri-t30/Colibri_t30_12MHz_1GB_NT5CC256M16CP-DI_400MHz-shmoo.bct.cfg b/tegra30/toradex/colibri-t30/Colibri_t30_12MHz_1GB_NT5CC256M16CP-DI_400MHz-shmoo.bct.cfg

> +# 3. This notice may not be removed or altered from any source distribution.
> +
> +
> +Version        = 0x00030001;
...
> +DeviceParam[0].SdmmcParams.SdController            =  NvBootSdmmcCntrl_4;
> +
> +
> +DevType[1]  =  Sdmmc;

I'd rather all the double/triple blank lines be collapsed to just one
blank line.
