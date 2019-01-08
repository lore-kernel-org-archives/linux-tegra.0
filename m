From: Joseph Lo <josephl@nvidia.com>
Subject: Re: [PATCH V4 10/20] clk: tegra: dfll: build clk-dfll.c for Tegra124
 and Tegra210
Date: Tue, 8 Jan 2019 08:33:23 +0800
Message-ID: <e35cf7f7-e46c-43f0-7789-2f237f2ce9bb@nvidia.com>
References: <20190104030702.8684-1-josephl@nvidia.com>
 <20190104030702.8684-11-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190104030702.8684-11-josephl@nvidia.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 1/4/19 11:06 AM, Joseph Lo wrote:
> From: Peter De Schrijver <pdeschrijver@nvidia.com>
> 
> Tegra210 has a DFLL as well and can share the majority of the code with
> the Tegra124 implementation. So build the same code for both platforms.
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> *V4:
>   - remove parenthesis in Kconfig of DFLL driver
> *V3:
>   - no change
> *V2:
>   - add ack tag
> ---

Hi Stephen,

Could you help me to review this patch again?

Thanks,
Joseph
>   drivers/clk/tegra/Kconfig  | 5 +++++
>   drivers/clk/tegra/Makefile | 2 +-
>   2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/tegra/Kconfig b/drivers/clk/tegra/Kconfig
> index 7ddacae5d0b1..1adcccfa7829 100644
> --- a/drivers/clk/tegra/Kconfig
> +++ b/drivers/clk/tegra/Kconfig
> @@ -5,3 +5,8 @@ config TEGRA_CLK_EMC
>   config CLK_TEGRA_BPMP
>   	def_bool y
>   	depends on TEGRA_BPMP
> +
> +config TEGRA_CLK_DFLL
> +	depends on ARCH_TEGRA_124_SOC || ARCH_TEGRA_210_SOC
> +	select PM_OPP
> +	def_bool y
> diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
> index 6507acc843c7..4812e45c2214 100644
> --- a/drivers/clk/tegra/Makefile
> +++ b/drivers/clk/tegra/Makefile
> @@ -20,7 +20,7 @@ obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         += clk-tegra20.o
>   obj-$(CONFIG_ARCH_TEGRA_3x_SOC)         += clk-tegra30.o
>   obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= clk-tegra114.o
>   obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= clk-tegra124.o
> -obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= clk-tegra124-dfll-fcpu.o
> +obj-$(CONFIG_TEGRA_CLK_DFLL)		+= clk-tegra124-dfll-fcpu.o
>   obj-$(CONFIG_ARCH_TEGRA_132_SOC)	+= clk-tegra124.o
>   obj-y					+= cvb.o
>   obj-$(CONFIG_ARCH_TEGRA_210_SOC)	+= clk-tegra210.o
> 
