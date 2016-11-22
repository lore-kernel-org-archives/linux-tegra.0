From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 0/4] soc/tegra: pmc: Add support for IO pad configuration
 and sub-driver
Date: Tue, 22 Nov 2016 17:02:09 +0530
Message-ID: <58342CB9.6040203@nvidia.com>
References: <1478696962-11831-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478696962-11831-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Thierry,

On Wednesday 09 November 2016 06:39 PM, Laxman Dewangan wrote:
> Tegra SoC support the configutaion of IO pads to multi-level voltage
> and low power state. The conifguration is done via pictrl framework
> and the io pad driver in pinctrl frameowrk uses the APIs from pmc to
> access PMC registers.
>
> his series add the API to get the IO pad power status and register
> the pmc child devices like IO pad drvier.
>
> The patches were send earlier part of different series but applied
> partially in the Thierry's t186 branch
> 	https://github.com/thierryreding/linux/tree/tegra186.
>
> Resending the patches as the new start to avoid any confusion.
> This need to be applied in
> 	https://github.com/thierryreding/linux/tree/tegra186
>

Any comment on this?
I saw that your patches are available from t186 branch to linux-next.

Do I need to re-send the patches on top of linux-next?
