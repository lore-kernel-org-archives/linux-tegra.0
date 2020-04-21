From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
Date: Tue, 21 Apr 2020 03:32:21 +0300
Message-ID: <b01cec76-bb39-9fb5-8f6e-4023c075e6b3@gmail.com>
References: <20200324191217.1829-1-digetx@gmail.com>
 <20200324191217.1829-2-digetx@gmail.com>
 <1e259e22-c300-663a-e537-18d854e0f478@nvidia.com>
 <f59ba318-8e99-c486-fa4d-1ee28a7b203d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <f59ba318-8e99-c486-fa4d-1ee28a7b203d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

21.04.2020 01:11, Dmitry Osipenko пишет:
> Hello Jon,
> 
> 20.04.2020 22:53, Jon Hunter пишет:
>> Hi Dmitry,
>>
>> On 24/03/2020 19:12, Dmitry Osipenko wrote:
>>> Boot CPU0 always handle I2C interrupt and under some rare circumstances
>>> (like running KASAN + NFS root) it may stuck in uninterruptible state for
>>> a significant time. In this case we will get timeout if I2C transfer is
>>> running on a sibling CPU, despite of IRQ being raised. In order to handle
>>> this rare condition, the IRQ status needs to be checked after completion
>>> timeout.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>> ---
>>>  drivers/i2c/busses/i2c-tegra.c | 27 +++++++++++++++------------
>>>  1 file changed, 15 insertions(+), 12 deletions(-)
>>
>>
>> I have noticed a regression on tegra30-cardhu-a04 when testing system
>> suspend. Git bisect is pointing to this commit and reverting it fixes
>> the problem. In the below console log I2C fails to resume ...
>>
> ...
>> [   60.690035] PM: Device 3000.pcie failed to resume noirq: error -16
> 
> ...
>> [   60.696859] tegra-mc 7000f000.memory-controller: fdcdwr2: write @0x877e8400: EMEM address decode error (SMMU translation error [--S])
>>
>> [   60.708876] tegra-mc 7000f000.memory-controller: fdcdwr2: write @0x877e8400: Page fault (SMMU translation error [--S])
> 
> This looks very wrong, the error tells that 3d hardware is active and
> doing something odd. Are you running some 3d tests?
> 
> ...
>> Have you seen this?
> 
> No, I haven't seen that. I'm not using PCIE and it looks like it's the
> problem.
> 
> Looking at the PCIE driver code, seems it's not syncing the RPM state on
> suspend/resume.
> 
> Please try this change:
> 
> --- >8 ---
> diff --git a/drivers/pci/controller/pci-tegra.c
> b/drivers/pci/controller/pci-tegra.c
> index 3e64ba6a36a8..b1fcbae4109c 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -2870,8 +2870,8 @@ static int __maybe_unused
> tegra_pcie_pm_resume(struct device *dev)
> 
>  static const struct dev_pm_ops tegra_pcie_pm_ops = {
>  	SET_RUNTIME_PM_OPS(tegra_pcie_pm_suspend, tegra_pcie_pm_resume, NULL)
> -	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_pcie_pm_suspend,
> -				      tegra_pcie_pm_resume)
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				      pm_runtime_force_resume)
>  };
> 
> 
>  static struct platform_driver tegra_pcie_driver = {
> --- >8 ---
> 
> Secondly, I2C driver suspends on NOIRQ level, while APBDMA driver
> suspends on default level. This is also wrong, please try to apply this
> hunk as well:
> 
> --- >8 ---
> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
> index f6a2f42ffc51..e682ac86bd27 100644
> --- a/drivers/dma/tegra20-apb-dma.c
> +++ b/drivers/dma/tegra20-apb-dma.c
> @@ -1653,7 +1653,7 @@ static int __maybe_unused
> tegra_dma_dev_resume(struct device *dev)
>  static const struct dev_pm_ops tegra_dma_dev_pm_ops = {
>  	SET_RUNTIME_PM_OPS(tegra_dma_runtime_suspend, tegra_dma_runtime_resume,
>  			   NULL)
> -	SET_SYSTEM_SLEEP_PM_OPS(tegra_dma_dev_suspend, tegra_dma_dev_resume)
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(tegra_dma_dev_suspend, tegra_dma_dev_resume)
>  };
> 
>  static const struct of_device_id tegra_dma_of_match[] = {
> --- >8 ---
> 

Although, I'm now having a second though about the APBDMA change... I'm
recalling that there are some complications in regards to PCIE driver
suspending, requiring it to be at NOIRQ level, but this should be wrong
because PCIE driver uses voltage regulator driver at NOIRQ level, while
regulator drivers suspend on default level. The current behavior of the
PCIE driver should be wrong, I think it needs to be moved to the default
suspend-resume level somehow.
