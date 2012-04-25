From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCHv3 2/4] ARM: tegra: Add SMMU enabler in AHB
Date: Wed, 25 Apr 2012 09:51:50 -0600
Message-ID: <4F981D96.3000401@wwwdotorg.org>
References: <1335352072-4001-1-git-send-email-hdoyu@nvidia.com> <1335352072-4001-2-git-send-email-hdoyu@nvidia.com> <20120425112950.GC3564@arwen.pp.htv.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120425112950.GC3564-S8G//mZuvNWo5Im9Ml3/Zg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: Hiroshi DOYU <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, H Hartley Sweeten <hsweeten-3FF4nKcrg1dE2c76skzGb0EOCMrvLtNR@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/25/2012 05:29 AM, Felipe Balbi wrote:
> Hi,
> 
> On Wed, Apr 25, 2012 at 02:07:37PM +0300, Hiroshi DOYU wrote:
>> Add extern func, "tegra_ahb_enable_smmu()" to inform AHB that SMMU is
>> ready.

>> +#ifdef CONFIG_ARCH_TEGRA_3x_SOC
>> +static int __tegra_ahb_enable_smmu(struct device *dev, void *data)
>> +{
>> +	u32 val;
>> +	struct tegra_ahb *ahb = dev_get_drvdata(dev);
>> +
>> +	val = gizmo_readl(ahb, AHB_ARBITRATION_XBAR_CTRL);
>> +	val |= AHB_ARBITRATION_XBAR_CTRL_SMMU_INIT_DONE;
>> +	gizmo_writel(ahb, val, AHB_ARBITRATION_XBAR_CTRL);
>> +	return 0;
>> +}
>> +
>> +int tegra_ahb_enable_smmu(void)
>> +{
>> +	return driver_for_each_device(&tegra_ahb_driver.driver, NULL, NULL,
>> +				      __tegra_ahb_enable_smmu);
>> +}
>> +EXPORT_SYMBOL(tegra_ahb_enable_smmu);
>> +#endif
> 
> this is still not correct. If you will always call this whenever you run
> on tegra 3, why do you even expose this function ?

I think the issue is that this function should only be called after the
SMMU driver has initialized the SMMU, and it's ready to be activated.
