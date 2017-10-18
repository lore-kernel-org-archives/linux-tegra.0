From: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 2/4] PCI: tegra: Add Tegra186 PCIe support
Date: Wed, 18 Oct 2017 19:44:12 +0530
Message-ID: <9ceb5f5c-7fcc-d729-e5d8-d13142bee8ed@nvidia.com>
References: <1506513517-25870-1-git-send-email-mmaddireddy@nvidia.com>
 <1506513517-25870-3-git-send-email-mmaddireddy@nvidia.com>
 <20171017173428.GE5641@bhelgaas-glaptop.roam.corp.google.com>
 <20171017202749.GB10482@ulmo>
 <20171018132752.GO5641@bhelgaas-glaptop.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171018132752.GO5641-1RhO1Y9PlrlHTL0Zs8A6p5iNqAH0jzoTYJqu5kTmcBRl57MIdRCFDg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 18-Oct-17 6:57 PM, Bjorn Helgaas wrote:
> On Tue, Oct 17, 2017 at 10:27:49PM +0200, Thierry Reding wrote:
>> On Tue, Oct 17, 2017 at 12:34:28PM -0500, Bjorn Helgaas wrote:
>>> On Wed, Sep 27, 2017 at 05:28:35PM +0530, Manikanta Maddireddy wrote:
>>>> UPHY programming is performed by BPMP, PHY enable calls are
>>>> not required for Tegra186 PCIe. Power partition ungate is
>>>> done by BPMP powergate driver.
>>>>
>>>> Signed-off-by: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>> Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>> Tested-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>> ---
>>>> V2: Add soc->program_uphy check for phy_exit call
>>>>  drivers/pci/host/pci-tegra.c | 132 +++++++++++++++++++++++++++++++++++--------
>>>>  1 file changed, 108 insertions(+), 24 deletions(-)
>>>
>>>> @@ -1012,10 +1016,12 @@ static int tegra_pcie_enable_controller(struct tegra_pcie *pcie)
>>>>  		afi_writel(pcie, value, AFI_FUSE);
>>>>  	}
>>>>  
>>>> -	err = tegra_pcie_phy_power_on(pcie);
>>>> -	if (err < 0) {
>>>> -		dev_err(dev, "failed to power on PHY(s): %d\n", err);
>>>> -		return err;
>>>> +	if (soc->program_uphy) {
>>>> +		err = tegra_pcie_phy_power_on(pcie);
>>>> +		if (err < 0) {
>>>> +			dev_err(dev, "failed to power on PHY(s): %d\n", err);
>>>> +			return err;
>>>> +		}
>>>
>>> This looks good: it's obvious that the previously-supported devices
>>> continue to work the same way because you set ".program_uphy = true"
>>> for them.  (It would be even more obvious if you changed the sense so
>>> that only the new device had to add this initializaer, but in general
>>> I prefer the positive logic as you have here, and I did verify that
>>> you added the initializer for all tegra_pcie_soc variants.)
>>>
>>>> @@ -1048,19 +1054,23 @@ static int tegra_pcie_enable_controller(struct tegra_pcie *pcie)
>>>>  static void tegra_pcie_power_off(struct tegra_pcie *pcie)
>>>>  {
>>>>  	struct device *dev = pcie->dev;
>>>> +	const struct tegra_pcie_soc *soc = pcie->soc;
>>>>  	int err;
>>>>  
>>>>  	/* TODO: disable and unprepare clocks? */
>>>>  
>>>> -	err = tegra_pcie_phy_power_off(pcie);
>>>> -	if (err < 0)
>>>> -		dev_err(dev, "failed to power off PHY(s): %d\n", err);
>>>> +	if (soc->program_uphy) {
>>>> +		err = tegra_pcie_phy_power_off(pcie);
>>>> +		if (err < 0)
>>>> +			dev_err(dev, "failed to power off PHY(s): %d\n", err);
>>>> +	}
>>>>  
>>>>  	reset_control_assert(pcie->pcie_xrst);
>>>>  	reset_control_assert(pcie->afi_rst);
>>>>  	reset_control_assert(pcie->pex_rst);
>>>>  
>>>> -	tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
>>>> +	if (!dev->pm_domain)
>>>> +		tegra_powergate_power_off(TEGRA_POWERGATE_PCIE);
>>>
>>> But this one isn't obvious because nothing in your patch obviously
>>> affects dev->pm_domain, so I can't tell whether this is safe.  It's
>>> worth a changelog comment to help justify this.
>>
>> The last sentence in the commit message is what this is about. Maybe it
>> should be more verbose:
>>
>> 	Since the BPMP controls the powergates on Tegra186, there is no
>> 	need to manually power on and off the PCIe power partition. The
>> 	BPMP generic power domain driver takes care of it instead.
> 
> If you know Tegra intimately, maybe that clarifies it.  I don't, so my
> problem is that there's nothing in the patch that helps me verify
> this.  I infer that maybe there's something different in the DT that
> means dev->pm_domain will be set for Tegra186, but not for other
> variants?
> 
> There should be something that helps the reader connect the dots.
> 
> Bjorn
> 
Hi Bjorn,

Till tegra210 pmc driver provides direct powergate power ON/OFF functions.

In tegra186.dtsi power-domains property is added in pcie@10003000 DT node. reference: https://patchwork.ozlabs.org/patch/819113/
powergate-bpmp.c is the pm domain provider for pcie powergate. 
Platform driver will look for pm domain provider of Tegra pcie host driver and sets dev->pm_domains.
powergate-bpmp.c driver registers powergate power ON/OFF functions to generic PD power_on/powerr_off callback functions.
Generic power domain will take care of calling power_on before Tegra PCIe probe.

So in this patch I used dev->pm_domain to skip pmc driver calls.
