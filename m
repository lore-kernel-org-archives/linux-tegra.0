From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] ARM: use "depends on" for SoC configs instead of "if"
 after prompt
Date: Mon, 16 Nov 2015 11:05:16 +0100
Message-ID: <4171977.M1BLuS2ZzP@wuerfel>
References: <1447643170-23773-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1447643170-23773-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Viresh Kumar <vireshk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen-Yu Tsai <wens@csie>
List-Id: linux-tegra@vger.kernel.org

On Monday 16 November 2015 12:06:10 Masahiro Yamada wrote:
> Many ARM sub-architectures use prompts followed by "if" conditional,
> but it is wrong.
> 
> Please notice the difference between
> 
>     config ARCH_FOO
>             bool "Foo SoCs" if ARCH_MULTI_V7
> 
> and
> 
>     config ARCH_FOO
>             bool "Foo SoCs"
>             depends on ARCH_MULTI_V7
> 
> These two are *not* equivalent!
> 
> In the former statement, it is not ARCH_FOO, but its prompt that
> depends on ARCH_MULTI_V7.  So, it is completely valid that ARCH_FOO
> is selected by another, but ARCH_MULTI_V7 is still disabled. As it is
> not unmet dependency, Kconfig never warns.  This is probably not what
> you want.

Did you encounter a case where someone actually did a 'select' on one
of those symbols? I probably introduced a lot of them and did not
expect that to happen.

> The former should be used only when you need to do so, and you really
> understand what you are doing.  (In most cases, it should be wrong!)
> 
> For enabling/disabling sub-architectures, the latter is always correct.
> 
> As a good side effect, this commit fixes some entries over 80 columns
> (mach-imx, mach-integrator, mach-mbevu).
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
> ---
> 
> I hope this patch is applied to ARM-SOC, but am CCing Kbuild ML
> because the correct understanding of Kconfig is required for this patch.

Yes, we can take it through arm-soc, I don't think it's important but
I also don't mind the change.

> diff --git a/arch/arm/mach-integrator/Kconfig b/arch/arm/mach-integrator/Kconfig
> index 02d0834..2fa9d11 100644
> --- a/arch/arm/mach-integrator/Kconfig
> +++ b/arch/arm/mach-integrator/Kconfig
> @@ -1,5 +1,6 @@
>  config ARCH_INTEGRATOR
> -	bool "ARM Ltd. Integrator family" if (ARCH_MULTI_V4T || ARCH_MULTI_V5 || ARCH_MULTI_V6)
> +	bool "ARM Ltd. Integrator family"
> +	depends on ARCH_MULTI_V4T || ARCH_MULTI_V5 || ARCH_MULTI_V6
>  	select ARM_AMBA
>  	select ARM_PATCH_PHYS_VIRT if MMU
>  	select AUTO_ZRELADDR

There is one related change that I would like to see, and that is
to convert all top-level 'config' statements that have sub-options
into 'menuconfig' statements for consistency. At the moment, the
platform menu has a mix of platform-selection and platform-specific
options, and I'd like to make that more consistent.

	Arnd
