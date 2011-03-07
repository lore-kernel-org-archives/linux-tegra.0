From: Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: tegra: harmony: register i2c devices
Date: Mon, 07 Mar 2011 18:43:44 +0300
Message-ID: <4D74FD30.5010806@ru.mvista.com>
References: <1299486399-21761-1-git-send-email-olof@lixom.net> <1299486399-21761-3-git-send-email-olof@lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1299486399-21761-3-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello.

On 07-03-2011 11:26, Olof Johansson wrote:

> Register the base i2c busses on harmony. Devices coming at a later date,
> but this allows for hand-probing of some of them at least.

> Signed-off-by: Olof Johansson<olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
> ---
>   arch/arm/mach-tegra/board-harmony.c |   32 ++++++++++++++++++++++++++++++++
>   1 files changed, 32 insertions(+), 0 deletions(-)

> diff --git a/arch/arm/mach-tegra/board-harmony.c b/arch/arm/mach-tegra/board-harmony.c
> index 38c2ab8..d46268d 100644
> --- a/arch/arm/mach-tegra/board-harmony.c
> +++ b/arch/arm/mach-tegra/board-harmony.c
[...]
> @@ -78,6 +80,35 @@ static struct platform_device harmony_audio_device = {
>   	},
>   };
>
> +static struct tegra_i2c_platform_data harmony_i2c1_platform_data = {
> +	.bus_clk_rate   = 400000,
> +};
> +
> +static struct tegra_i2c_platform_data harmony_i2c2_platform_data = {
> +	.bus_clk_rate   = 400000,
> +};
> +
> +static struct tegra_i2c_platform_data harmony_i2c3_platform_data = {
> +	.bus_clk_rate   = 400000,
> +};
> +
> +static struct tegra_i2c_platform_data harmony_dvc_platform_data = {
> +	.bus_clk_rate   = 400000,
> +};

    Why not share the paltform data between devices if it's the same anyway?

WBR, Sergei
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
