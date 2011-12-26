From: Sergei Shtylyov <sshtylyov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCH] arm/tegra: Support Tegra30 in decompressor UART setup
Date: Mon, 26 Dec 2011 14:51:27 +0400
Message-ID: <4EF851AF.60203@ru.mvista.com>
References: <1324587719-32731-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1324587719-32731-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello.

On 23-12-2011 1:01, Stephen Warren wrote:

> On Tegra20, the UART clock runs at 216MHz, whereas on Tegra30 it runs at
> 408MHz. Modify arch_decomp_setup() to detect Tegra20-vs-Tegra30 at run-
> time, and program the correct divisor.

> This makes uncompressor messages work correctly on Tegra30. This also
> fixes early printk, assuming zImage is used and this setup code runs.

> Signed-off-by: Stephen Warren<swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   arch/arm/mach-tegra/include/mach/uncompress.h |   20 ++++++++++++++++++--
>   1 files changed, 18 insertions(+), 2 deletions(-)

> diff --git a/arch/arm/mach-tegra/include/mach/uncompress.h b/arch/arm/mach-tegra/include/mach/uncompress.h
> index 4e83237..61d6e08 100644
> --- a/arch/arm/mach-tegra/include/mach/uncompress.h
> +++ b/arch/arm/mach-tegra/include/mach/uncompress.h
[...]
> @@ -45,15 +47,29 @@ static inline void flush(void)
>
>   static inline void arch_decomp_setup(void)
>   {
> +	u8 *distctr = (u8 *)(TEGRA_ARM_INT_DIST_BASE +
> +			     GIC_DIST_CTR);
> +	u32 ctlrs, div;
>   	volatile u8 *uart = (volatile u8 *)TEGRA_DEBUG_UART_BASE;
>   	int shift = 2;
>
>   	if (uart == NULL)
>   		return;
>
> +	/*
> +	 * Tegra20 has 4 interrupt controllers
> +	 * Tegra30 has 5 interrupt controllers
> +	 * Future SoCs may need additional means of identification
> +	 */
> +	ctlrs = (*distctr) & 0x1f;

    () not necessary.

WBR, Sergei
