From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] ARM: tegra: Mark expected switch fall-through
Date: Mon, 29 Jul 2019 09:33:29 -0700
Message-ID: <201907290933.7D54BDAB@keescook>
References: <20190728231526.GA22066@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190728231526.GA22066@embeddedor>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Cc: Russell King <linux@armlinux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
List-Id: linux-tegra@vger.kernel.org

On Sun, Jul 28, 2019 at 06:15:26PM -0500, Gustavo A. R. Silva wrote:
> Mark switch cases where we are expecting to fall through.
> 
> This patch fixes the following warning:
> 
> arch/arm/mach-tegra/reset.c: In function 'tegra_cpu_reset_handler_enable':
> arch/arm/mach-tegra/reset.c:72:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    tegra_cpu_reset_handler_set(reset_address);
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> arch/arm/mach-tegra/reset.c:74:2: note: here
>   case 0:
>   ^~~~
> 
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  arch/arm/mach-tegra/reset.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-tegra/reset.c b/arch/arm/mach-tegra/reset.c
> index 5a67a71f80cc..76a65df42d10 100644
> --- a/arch/arm/mach-tegra/reset.c
> +++ b/arch/arm/mach-tegra/reset.c
> @@ -70,7 +70,7 @@ static void __init tegra_cpu_reset_handler_enable(void)
>  	switch (err) {
>  	case -ENOSYS:
>  		tegra_cpu_reset_handler_set(reset_address);
> -		/* pass-through */
> +		/* fall through */
>  	case 0:
>  		is_enabled = true;
>  		break;
> -- 
> 2.22.0
> 

-- 
Kees Cook
