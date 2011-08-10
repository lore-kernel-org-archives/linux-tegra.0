From: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3] ARM: tegra: paz00: add clocks required for usb operation
Date: Wed, 10 Aug 2011 15:24:33 +0400
Message-ID: <4E426A71.1000100@ru.mvista.com>
References: <201108092308.11580.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201108092308.11580.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello.

On 10-08-2011 1:08, Marc Dietrich wrote:

> These clocks are required for usb operation. pll_p_out4 needs to be set
> to 24 MHz. The other clocks default to "off" in order to safe some energy.

    s/safe/save/

    You didn't sign off on the patch.

> ---
>   arch/arm/mach-tegra/board-paz00.c |    6 ++++++
>   1 files changed, 6 insertions(+), 0 deletions(-)

> diff --git a/arch/arm/mach-tegra/board-paz00.c b/arch/arm/mach-tegra/board-
> paz00.c
> index 45111f6..cde36dc 100644
> --- a/arch/arm/mach-tegra/board-paz00.c
> +++ b/arch/arm/mach-tegra/board-paz00.c
> @@ -145,6 +145,12 @@ static __initdata struct tegra_clk_init_table
> paz00_clk_init_table[] = {
>   	/* name		parent		rate		enabled */
>   	{ "uarta",	"pll_p",	216000000,	true },
>   	{ "uartd",	"pll_p",	216000000,	true },
> +
> +	{ "pll_p_out4",	"pll_p",	24000000,	true },
> +	{ "usbd",	"clk_m",	12000000,	false },
> +	{ "usb2",	"clk_m",	12000000,	false },
> +	{ "usb3",	"clk_m",	12000000,	false },
> +
>   	{ NULL,		NULL,		0,		0},
>   };
>

WBR, Sergei
