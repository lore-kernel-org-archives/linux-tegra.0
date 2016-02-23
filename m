From: Krzysztof Adamski <krzysztof.adamski-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org>
Subject: Re: regulator: core: Request GPIO before creating sysfs entries
Date: Tue, 23 Feb 2016 14:56:51 +0100
Message-ID: <20160223135650.GA19954@box2.japko.eu>
References: <1456129440-28143-1-git-send-email-krzysztof.adamski@tieto.com>
 <56CC5D1E.6010101@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56CC5D1E.6010101-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 23, 2016 at 01:22:38PM +0000, Jon Hunter wrote:
>Hi Mark, Krzysztof,
>
>It appears that commit daad134d6649 ("regulator: core: Request GPIO
>before creating sysfs entries") breaks boot on tegra124-nyan-big in
>-next today.
>
>Looking at the change, it does not appear that the exit path has been
>updated correctly and so if a regulator is deferred then there is a
>crash in the exit path. I am not sure that there is a simple way to
>workaround this because of fix from commit 53032dafc6b9 ("regulator
>core: fix double-free in regulator_register() error path") unless we
>move regulator_ena_gpio_free() into regulator_dev_release().

Hi Jon,

You are totally right about the problem but I can't see why changing 
"goto wash" to "goto clean" in error path of regulator_ena_gpio_request 
is not enough. What am I missing?

Best regards,
Krzysztof Adamski
