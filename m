From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 09/10] arm64: tegra: enable AHUB modules for few Tegra
 chips
Date: Thu, 20 Feb 2020 14:52:05 +0000
Message-ID: <b55acd02-a492-77cd-833c-d3b18f230037@nvidia.com>
References: <1582180492-25297-1-git-send-email-spujar@nvidia.com>
 <1582180492-25297-10-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1582180492-25297-10-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 20/02/2020 06:34, Sameer Pujar wrote:
> This patch enables AHUB, ADMAIF modules for following Tegra platforms.
> Along with this specific instances of I/O modules are enabled as per
> the board design.
> 
>  * Jetson TX1
>    - I2S1, I2S2, I2S3, I2S4 and I2S5
>    - DMIC1, DMIC2 and DMIC3
> 
>  * Jetson TX2
>    - I2S1, I2S2, I2S3, I2S4, I2S5 and I2S6
>    - DMIC1, DMIC2 and DMIC3
>    - DSPK2
> 
>  * Jetson AGX Xavier
>    - I2S1, I2S2, I2S4 and I2S6
>    - DMIC2 and DMIC3
>    - DSPK1
> 
> Signed-off-by: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 48 ++++++++++++++++++++++
>  arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts | 36 ++++++++++++++++
>  arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts | 40 ++++++++++++++++++
>  3 files changed, 124 insertions(+)
Thanks!

Reviewed-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic
