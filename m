From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v8 21/21] tegra: fdt: Enable FDT support for Ventana
Date: Wed, 07 Mar 2012 10:10:47 -0700
Message-ID: <4F579697.4050108@wwwdotorg.org>
References: <1331089833-25262-16-git-send-email-sjg@chromium.org> <1331089833-25262-22-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1331089833-25262-22-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/06/2012 08:10 PM, Simon Glass wrote:
> From: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This switches Ventana over to use FDT for run-time config instead of
> CONFIG options.
> 
> At present Ventana does not have its own device tree file - it just uses
> the Seaboard one.

But there's a Ventana-specific tegra-ventana.dts in the kernel...

> Signed-off-by: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

Have you tested this on Ventana in mainline U-Boot?
