From: Stephen Warren <swarren@nvidia.com>
Subject: RE: [PATCH] arm/tegra: Harmony: Configure PMC for low-level interrupts
Date: Tue, 11 Oct 2011 10:03:20 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173BE19AC3@HQMAIL01.nvidia.com>
References: <1316643040-7998-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1316643040-7998-1-git-send-email-swarren@nvidia.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>, Colin Cross <ccross@android.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren wrote at Wednesday, September 21, 2011 4:11 PM:
> Without this, the PMC continually detects an interrupt when the PMU_IRQ
> line is high, causing the tps6686x IRQ handler thread to hog an entire
> CPU.
> 
> This change was originally written by Wei Ni <wni@nvidia.com> for Seaboard
> in the ChromeOS kernel.
> 
> Long-term, this should probably be moved into some kind of PMU driver,
> or perhaps integrated into the GPIO/IRQ/pinmux system?

Olof, is this change OK for inclusion? Or, should we create some kind
of PMU driver and interrupt controller to solve this?

Thanks.

>  int __init harmony_regulator_init(void)
>  {
> +	void __iomem *pmc = IO_ADDRESS(TEGRA_PMC_BASE);
> +	u32 pmc_ctrl;
> +
> +	/*
> +	 * Configure the power management controller to trigger PMU
> +	 * interrupts when low
> +	 */
> +	pmc_ctrl = readl(pmc + PMC_CTRL);
> +	writel(pmc_ctrl | PMC_CTRL_INTR_LOW, pmc + PMC_CTRL);
> +
>  	i2c_register_board_info(3, harmony_regulators, 1);
> 
>  	return 0;

-- 
nvpublic
