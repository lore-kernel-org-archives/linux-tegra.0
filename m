From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH] watchdog: tegra: Stop watchdog first if restarting
Date: Fri, 13 Nov 2015 11:52:30 -0800
Message-ID: <56463F7E.8040008@roeck-us.net>
References: <1447114298-5516-1-git-send-email-achew@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447114298-5516-1-git-send-email-achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/09/2015 04:11 PM, Andrew Chew wrote:
> If we need to restart the watchdog due to someone changing the timeout
> interval, stop the watchdog before restarting it.  Otherwise, the new
> timeout doesn't seem to take.
>
> Signed-off-by: Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Reviewed-by: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>

Some feedback from the maintainers would be helpful, though,
especially if there is some other means to change the timeout
without stopping the watchdog.

Guenter

> ---
>   drivers/watchdog/tegra_wdt.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/watchdog/tegra_wdt.c b/drivers/watchdog/tegra_wdt.c
> index 7f97cdd..9ec5760 100644
> --- a/drivers/watchdog/tegra_wdt.c
> +++ b/drivers/watchdog/tegra_wdt.c
> @@ -140,8 +140,10 @@ static int tegra_wdt_set_timeout(struct watchdog_device *wdd,
>   {
>   	wdd->timeout = timeout;
>
> -	if (watchdog_active(wdd))
> +	if (watchdog_active(wdd)) {
> +		tegra_wdt_stop(wdd);
>   		return tegra_wdt_start(wdd);
> +	}
>
>   	return 0;
>   }
>
