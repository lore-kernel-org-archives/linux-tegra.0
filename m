From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/2] arm64: tegra: Add CPU nodes to Tegra194 device tree
Date: Wed, 27 Jun 2018 10:57:30 -0600
Message-ID: <20180627165730.GA15867@rob-hp-laptop>
References: <20180620122827.14165-1-mperttunen@nvidia.com>
 <20180620122827.14165-2-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20180620122827.14165-2-mperttunen@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, jonathanh@nvidia.com, thierry.reding@gmail.com, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 20, 2018 at 03:28:27PM +0300, Mikko Perttunen wrote:
> Add CPU and PSCI nodes to device tree. The Tegra194 SoC contains
> eight NVIDIA Carmel CPUs.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 40 +++++++++++++++++++
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi       | 53 ++++++++++++++++++++++++++
>  2 files changed, 93 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
> index ecb034177fc2..859ab5af17c1 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
> @@ -229,6 +229,46 @@
>  		};
>  	};
>  
> +	cpus {
> +		cpu@0 {
> +			enable-method = "psci";
> +		};

Kind of strange to have this separated out. I guess you have non-PSCI 
firmware too? In any case, unless things have changed, upstream is only 
supporting spin-table or PSCI for arm64. So please combine this with the 
rest of the cpu nodes.

Rob
