From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH] fix drivers/staging/nvec linkage error when keyboard is disabled
Date: Sun, 09 Oct 2011 17:47:38 +0200
Message-ID: <1534774.fR3YHUzZE9@fb07-iapwap2>
References: <20112.34922.209107.730268@pilspetsen.it.uu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20112.34922.209107.730268-tgku4HJDRZih8lFjZTKsyTAV6s6igYVG@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikael Pettersson <mikpe-1zs4UD6AkMk@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Mikael,

thanks for review. The nvec driver received some overhaul in the 3.1 release cycle 
and he fruids can be viewed in linux-next tree. The nvec client drivers were 
converted to mfd children in the mean time. This solves the build error, but is not 
very flexible. We are planing to move the mfd stuct to the board file(s) in the next 
cycle.

Also the maintainers were added. If you still find problems, please send email to the 
linux driver developemnt project and cc Julian and me. You may also check our 
development tree at http://gitorious.org/ac100/marvin24s-tree.  

Thanks

Marc

Am Samstag, 8. Oktober 2011, 19:29:14 schrieb Mikael Pettersson:
> Building linux-3.1-rc9 for the Tegra ARM SoC with CONFIG_MFD_NVEC=y
> and CONFIG_KEYBOARD_NVEC=n results in the following linkage error:
> 
> drivers/built-in.o: In function `tegra_nvec_probe':
> /tmp/linux-3.1-rc9/drivers/staging/nvec/nvec.c:373: undefined reference to
> `nvec_kbd_init' make: *** [.tmp_vmlinux1] Error 1
> 
> Fixed by #ifdef:ing the call to nvec_kbd_init(), similar to the
> existing #ifdef CONFIG_SERIO_NVEC_PS2 around the nvec_ps2() call.
> 
> Signed-off-by: Mikael Pettersson <mikpe-1zs4UD6AkMk@public.gmane.org>
> ---
> 
> --- linux-3.1-rc9/drivers/staging/nvec/nvec.c.~1~	2011-10-08 16:28:20.000000000
> +0200 +++ linux-3.1-rc9/drivers/staging/nvec/nvec.c	2011-10-08 19:09:18.000000000
> +0200 @@ -370,7 +370,9 @@ static int __devinit tegra_nvec_probe(st
>  	nvec_write_async(nvec, EC_ENABLE_EVENT_REPORTING,
>  				sizeof(EC_ENABLE_EVENT_REPORTING));
> 
> +#ifdef CONFIG_KEYBOARD_NVEC
>  	nvec_kbd_init(nvec);
> +#endif
>  #ifdef CONFIG_SERIO_NVEC_PS2
>  	nvec_ps2(nvec);
>  #endif
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
