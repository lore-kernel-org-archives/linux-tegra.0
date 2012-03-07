From: Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v8 21/21] tegra: fdt: Enable FDT support for Ventana
Date: Wed, 7 Mar 2012 10:18:32 -0800
Message-ID: <5FBF8E85CA34454794F0F7ECBA79798F37971BBC9D@HQMAIL04.nvidia.com>
References: <1331089833-25262-16-git-send-email-sjg@chromium.org>
	<1331089833-25262-22-git-send-email-sjg@chromium.org>
	<4F579697.4050108@wwwdotorg.org>
 <CAPnjgZ0CF2Ytoj35MvdpEJa-g7JozG2U7xtQjPEGM4+p_ehtwA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPnjgZ0CF2Ytoj35MvdpEJa-g7JozG2U7xtQjPEGM4+p_ehtwA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Simon/Stephen,

> -----Original Message-----
> From: sjg-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org [mailto:sjg-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org] On Behalf Of Simon Glass
> Sent: Wednesday, March 07, 2012 10:15 AM
> To: Stephen Warren
> Cc: U-Boot Mailing List; Tom Warren; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Jerry Van
> Baren; Devicetree Discuss
> Subject: Re: [PATCH v8 21/21] tegra: fdt: Enable FDT support for Ventana
> 
> Hi Stephen,
> 
> On Wed, Mar 7, 2012 at 9:10 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> wrote:
> > On 03/06/2012 08:10 PM, Simon Glass wrote:
> >> From: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>
> >> This switches Ventana over to use FDT for run-time config instead of
> >> CONFIG options.
> >>
> >> At present Ventana does not have its own device tree file - it just
> >> uses the Seaboard one.
> >
> > But there's a Ventana-specific tegra-ventana.dts in the kernel...
> 
> Yes, that's right. Perhaps we should drop this patch for now? Ventana will
> still build, just not have USB support.
> 
> >
> >> Signed-off-by: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >> Acked-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> >
> > Have you tested this on Ventana in mainline U-Boot?
> 
> I have not, but I think Tom has - maybe Tom you can reply Tested-by here if
> so?
I haven't tested on Ventana yet (just got my board last week), but I will when I apply these patches and report back. If you want to drop the patch for now until you can get a tegra-ventana.dts prepped, that's fine by me, too.

Tom

-- 
nvpublic
> 
> Regards,
> Simon
