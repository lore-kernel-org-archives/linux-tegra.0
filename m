From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] regulator: core: fix error path of
 regulator_ena_gpio_free
Date: Wed, 24 Feb 2016 09:20:19 +0000
Message-ID: <56CD75D3.3070805@nvidia.com>
References: <56CC7863.4080202@nvidia.com>
 <1456302479-14045-1-git-send-email-krzysztof.adamski@tieto.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456302479-14045-1-git-send-email-krzysztof.adamski-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Adamski <krzysztof.adamski-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 24/02/16 08:27, Krzysztof Adamski wrote:
> This problem was introduced by:
> commit daad134d6649 ("regulator: core: Request GPIO before creating
> sysfs entries")
> 
> The error path was not updated correctly and in case
> regulator_ena_gpio_free failed, device_unregister was called even though
> it was not registered yet.
> 
> Signed-off-by: Krzysztof Adamski <krzysztof.adamski-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org>
> Reported-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Make sure you tag the patch as V2, etc, so that Mark knows which version
to pick up.

Jon
