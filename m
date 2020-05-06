From: Hans Verkuil <hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>
Subject: Re: [RFC PATCH v12 7/9] MAINTAINERS: Add Tegra Video driver section
Date: Wed, 6 May 2020 08:53:50 +0200
Message-ID: <f8c66ec5-7641-5600-b79e-30624a18ebdd@xs4all.nl>
References: <1588645920-20557-1-git-send-email-skomatineni@nvidia.com>
 <1588645920-20557-8-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1588645920-20557-8-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/05/2020 04:31, Sowjanya Komatineni wrote:
> Add maintainers and mailing list entries to Tegra Video driver section.
> 
> Acked-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Since this goes through Thierry:

Signed-off-by: Hans Verkuil <hverkuil-cisco-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org>

Regards,

	Hans

> ---
>  MAINTAINERS | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fe55b3f..611d7bc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16652,6 +16652,16 @@ M:	Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>  S:	Supported
>  F:	drivers/spi/spi-tegra*
>  
> +TEGRA VIDEO DRIVER
> +M:	Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> +M:	Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> +M:	Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> +L:	linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> +L:	linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
> +F:	drivers/staging/media/tegra/
> +
>  TEGRA XUSB PADCTL DRIVER
>  M:	JC Kuo <jckuo-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>  S:	Supported
> 
