From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 0/6] soc/tegra: Add support for IO pads control via
 pinctrl interface
Date: Tue, 3 May 2016 12:38:41 +0100
Message-ID: <57288DC1.20405@nvidia.com>
References: <1462191434-28933-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462191434-28933-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 02/05/16 13:17, Laxman Dewangan wrote:
> The IO pins of Tegra SoCs are grouped for common control of IO
> interface like setting voltage signal levels and power state of
> the interface. The group is generally referred as IO pads. The 
> power state and voltage control of IO pins can be done at IO pads
> level.
> 
> Before Tegra210, the voltage level of IO rails are auto detected and
> configure IO pads accordingly but on T210, it is require to set
> explicitly by SW.
> 
> This series:
> - add public APIs from Tegra PMC interface for io pads control
>   for power state and voltage levels.
> - Add pincontrol driver to use these APIs to configure the IO
>   pads voltage and power state.
> 
> ---
> Changes from V1: 
> - Use pinconfig generic property for power enable/disable.
> - Rename power-source-voltage properties.
> - Make all register read/write value to u32.
> - Add IO pads macros and APIs which is nearest definiton of HW blocks.

Nit ... if this is a V2 it should be stated in the subject.

Jon
