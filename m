From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] ARM: use "depends on" for SoC configs instead of "if"
 after prompt
Date: Tue, 17 Nov 2015 08:49:53 +0900
Message-ID: <564A6BA1.6020103@samsung.com>
References: <1447643170-23773-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-reply-to: <1447643170-23773-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liviu Dudau <liviu.dudau-5wv7dgnIgG8@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Viresh Kumar <vireshk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, bcm-kerne
List-Id: linux-tegra@vger.kernel.org

On 16.11.2015 12:06, Masahiro Yamada wrote:
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
> 
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
> 
> 
>  arch/arm/Kconfig                 |  3 ++-
>  arch/arm/mach-alpine/Kconfig     |  3 ++-
>  arch/arm/mach-at91/Kconfig       | 15 ++++++++++-----
>  arch/arm/mach-axxia/Kconfig      |  3 ++-
>  arch/arm/mach-bcm/Kconfig        | 27 ++++++++++++++++++---------
>  arch/arm/mach-berlin/Kconfig     |  3 ++-
>  arch/arm/mach-cns3xxx/Kconfig    |  3 ++-
>  arch/arm/mach-exynos/Kconfig     |  3 ++-
>  arch/arm/mach-highbank/Kconfig   |  3 ++-
>  arch/arm/mach-hisi/Kconfig       | 12 ++++++++----
>  arch/arm/mach-imx/Kconfig        |  6 ++++--
>  arch/arm/mach-integrator/Kconfig |  3 ++-
>  arch/arm/mach-mediatek/Kconfig   |  3 ++-
>  arch/arm/mach-meson/Kconfig      |  3 ++-
>  arch/arm/mach-moxart/Kconfig     |  3 ++-
>  arch/arm/mach-mvebu/Kconfig      | 24 ++++++++++++++++--------
>  arch/arm/mach-picoxcell/Kconfig  |  3 ++-
>  arch/arm/mach-prima2/Kconfig     |  3 ++-
>  arch/arm/mach-qcom/Kconfig       |  3 ++-
>  arch/arm/mach-rockchip/Kconfig   |  3 ++-
>  arch/arm/mach-s5pv210/Kconfig    |  3 ++-

For Exynos and S5PV210:
Acked-by: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

Best regards,
Krzysztof

>  arch/arm/mach-shmobile/Kconfig   |  4 ++--
>  arch/arm/mach-socfpga/Kconfig    |  3 ++-
>  arch/arm/mach-spear/Kconfig      |  3 ++-
>  arch/arm/mach-sti/Kconfig        |  3 ++-
>  arch/arm/mach-sunxi/Kconfig      |  3 ++-
>  arch/arm/mach-tegra/Kconfig      |  3 ++-
>  arch/arm/mach-u300/Kconfig       |  4 ++--
>  arch/arm/mach-ux500/Kconfig      |  4 ++--
>  arch/arm/mach-vexpress/Kconfig   |  3 ++-
>  arch/arm/mach-zx/Kconfig         |  3 ++-
>  arch/arm/mach-zynq/Kconfig       |  3 ++-
>  32 files changed, 110 insertions(+), 58 deletions(-)
> 
