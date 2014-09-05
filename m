From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2] i2c: i2c-tegra: Move clk_prepare/clk_set_rate to probe
Date: Fri, 05 Sep 2014 10:56:07 -0600
Message-ID: <5409EB27.4000905@wwwdotorg.org>
References: <1409909298-11361-1-git-send-email-cyndis@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1409909298-11361-1-git-send-email-cyndis-/1wQRMveznE@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09/05/2014 03:28 AM, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Currently the i2c-tegra bus driver prepares, enables
> and set_rates its clocks separately for each transfer.
> This causes locking problems when doing I2C transfers
> from clock notifiers; see
> http://lists.infradead.org/pipermail/linux-arm-kernel/2014-July/268653.html
>
> This patch moves clk_prepare/unprepare and clk_set_rate calls to
> the probe function, leaving only clk_enable/disable to be
> done on each transfer. This solves the locking issue.

Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
