From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 0/5] ARM: tegra: enable wlan for t20 and t30
Date: Mon, 15 Oct 2012 15:18:39 -0600
Message-ID: <507C7DAF.6020504@wwwdotorg.org>
References: <1348217700-12309-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1348217700-12309-1-git-send-email-wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: krakesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/21/2012 02:54 AM, Wei Ni wrote:
> Enable wlan for following tegra board:
> Tegra30: Cardhu.
> Tegra20: Seaboard, Ventana.
> 
> Note that this series depends on specific brcmfmac patches:
> http://thread.gmane.org/gmane.linux.kernel.wireless.general/97337.

Now that those patches are in 3.7-rc1, I've applied this series to
Tegra's for-3.8/wifi branch (first 4) and for-3.8/defconfig branch (last
1). I'm not 100% sure yet exactly which patches will appear for 3.8; I
might just make a single for-3.8/dt branch instead of having a separate
wifi branch; we'll see...

Thanks.
