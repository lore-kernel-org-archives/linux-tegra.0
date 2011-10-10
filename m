From: Sergei Shtylyov <sshtylyov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH v2 10/14] ARM: tegra: tegra_powergate_is_powered should
 be static
Date: Mon, 10 Oct 2011 14:44:02 +0400
Message-ID: <4E92CC72.3030809@ru.mvista.com>
References: <1317956064-17650-1-git-send-email-olof@lixom.net> <1318224484-2090-1-git-send-email-olof@lixom.net> <1318224484-2090-11-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1318224484-2090-11-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello.

On 10-10-2011 9:28, Olof Johansson wrote:

> Not exported and not used externally.

> Also, fix return type  and change to instead WARN_ON on bad parameters.

    Change to what? You're changing _to_ WARN_ON() as we can see, not from it...

> Signed-off-by: Olof Johansson<olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> ---
>   arch/arm/mach-tegra/include/mach/powergate.h |    1 -
>   arch/arm/mach-tegra/powergate.c              |    5 ++---
>   2 files changed, 2 insertions(+), 4 deletions(-)

[...]
> diff --git a/arch/arm/mach-tegra/powergate.c b/arch/arm/mach-tegra/powergate.c
> index 3cee9aa..9483064 100644
> --- a/arch/arm/mach-tegra/powergate.c
> +++ b/arch/arm/mach-tegra/powergate.c
> @@ -89,12 +89,11 @@ int tegra_powergate_power_off(int id)
>   	return tegra_powergate_set(id, false);
>   }
>
> -bool tegra_powergate_is_powered(int id)
> +static bool tegra_powergate_is_powered(int id)
>   {
>   	u32 status;
>
> -	if (id < 0 || id >= TEGRA_NUM_POWERGATE)
> -		return -EINVAL;
> +	WARN_ON(id<  0 || id>= TEGRA_NUM_POWERGATE);
>
>   	status = pmc_read(PWRGATE_STATUS)&  (1<<  id);
>   	return !!status;

WBR, Sergei
