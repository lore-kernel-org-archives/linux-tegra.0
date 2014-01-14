From: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: fix tegra_powergate_sequence_power_up() inline
Date: Tue, 14 Jan 2014 08:04:40 -0800
Message-ID: <87k3e28s87.fsf@linaro.org>
References: <1389650502-30017-1-git-send-email-swarren@wwwdotorg.org>
	<20140114134225.GC10936@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140114134225.GC10936-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org> (Thierry Reding's
	message of "Tue, 14 Jan 2014 14:42:26 +0100")
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> writes:

> On Mon, Jan 13, 2014 at 03:01:42PM -0700, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> 
>> Remove an invalid semicolon from the inline dummy, thus solving:
>> In file included from drivers/gpu/drm/tegra/gr3d.c:15:0:
>> include/linux/tegra-powergate.h:119:1: error: expected identifier or '(' before '{' token
>> 
>> Fixes: 80b28791ff04 ("ARM: tegra: pass reset to tegra_powergate_sequence_power_up()")
>> Reported-by: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  include/linux/tegra-powergate.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Applied to next/soc (where the offending patch was merged), merged into
for-next, and pushed out.

Kevin
