From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [pinmux scripts PATCH 1/2] soc: Avoid parked_reg and parked_bank
Date: Tue, 3 May 2016 10:06:07 -0600
Message-ID: <5728CC6F.5090200@wwwdotorg.org>
References: <1462214805-26735-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1462214805-26735-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/02/2016 12:46 PM, Laxman Dewangan wrote:
> NVIDIA's Tegra210 support the park bit to make pinmux configuration
> enable/disable. If parked bit is 1 then configuration does not apply
> and if it is 0 then pinmux configuration applies. This is to support
> to avoid any glitch in pinmux configurations.
>
> The parked bit is part of mux register and mux bank and hence it is
> not required to have member for the parked_reg and parked bank very
> similar to other bit field of the same register.
>
> Remove the need of the parked register and parked bank and get whether
> parked function supported or not by parked_bit.
>
> This is to make the parked bit handling same as other fields of mux
> registers.

I've applied the series.
