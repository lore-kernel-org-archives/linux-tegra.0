From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH V2 1/3] ARM: tegra: trimslice: enable PCIe when booting
 from device tree
Date: Tue, 22 May 2012 11:17:04 +0100
Message-ID: <4FBB67A0.9010606@codethink.co.uk>
References: <1337289674-18581-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1337289674-18581-1-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Olof Johansson <olof@lixom.net>, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, linux-arm-kernel@lists.infradead.org, Colin Cross <ccross@android.com>
List-Id: linux-tegra@vger.kernel.org

On 17/05/12 22:21, Stephen Warren wrote:
> From: Stephen Warren<swarren@nvidia.com>
>
> There currently aren't bindings for the Tegra PCIe controller. Work on
> this is in progress, but not yet complete. Manually initialize PCIe when
> booting from device tree, in order to bring DT support to the same
> feature level as board files, which will in turn allow board files to be
> deprecated.
>
> PCIe hosts the wired Ethernet controller on TrimSlice.
>
> To support this, add infra-structure to board-dt-tegra20.c for board-
> specific initialization code. Once device tree support for the relevant
> features is in place, this code will be removed.
>
> Signed-off-by: Stephen Warren<swarren@nvidia.com>
> ---
> v2: Use .init_late hook in DT_MACHINE_START instead of an explicit late
> initcall.
> ---
>   arch/arm/mach-tegra/board-dt-tegra20.c |   36 +++++++++++++++++++++++++++++++-
>   1 files changed, 35 insertions(+), 1 deletions(-)
>
> diff --git a/arch/arm/mach-tegra/board-dt-tegra20.c b/arch/arm/mach-tegra/board-dt-tegra20.c
> index eb7249d..9537f20 100644
> --- a/arch/arm/mach-tegra/board-dt-tegra20.c
> +++ b/arch/arm/mach-tegra/board-dt-tegra20.c
> @@ -98,6 +98,40 @@ static void __init tegra_dt_init(void)
>   				tegra20_auxdata_lookup, NULL);
>   }
>
> +#ifdef CONFIG_MACH_TRIMSLICE
> +static void __init trimslice_init(void)
> +{
> +	int ret;
> +
> +	ret = tegra_pcie_init(true, true);
> +	if (ret)
> +		pr_err("tegra_pci_init() failed: %d\n", ret);
> +}
> +#endif

Given the size of some of these functions, is it worth even
bothering with an #ifdef around them, especially as they are
marked init.

How about having some sort of standard pcie binding for the pcie
part?

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
