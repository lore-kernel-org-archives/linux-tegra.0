From: Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH v2 02/12] of: Document long-ram-code property in nvidia,tegra20-apbmisc
Date: Wed, 22 Oct 2014 10:39:15 +0300
Message-ID: <54475F23.7050900@kapsi.fi>
References: <1413902788-7727-1-git-send-email-tomeu.vizoso@collabora.com> <1413902788-7727-3-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1413902788-7727-3-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/21/2014 05:45 PM, Tomeu Vizoso wrote:
> Needed to properly decode the ram code register.
>
> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> ---
>   Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt b/Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt
> index b97b8be..e2562ed 100644
> --- a/Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt
> +++ b/Documentation/devicetree/bindings/misc/nvidia,tegra20-apbmisc.txt
> @@ -11,3 +11,6 @@ Required properties:
>          The second entry gives the physical address and length of the
>          registers indicating the strapping options.
>
> +Optional properties:
> +- nvidia,long-ram-code: boolean that tells whether the ram code is long (4 bit)
> +			or short (2 bit). If not present, false.
>

I think just "If present, the RAM code is long (4 bit). If not, short (2 
bit)" would be clearer, as the booleanness of this property is not 
really present in the device tree file.
