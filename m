From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH 09/10] PCI: tegra: Add Tegra194 PCIe support
Date: Wed, 3 Apr 2019 14:45:49 +0530
Message-ID: <d51370ab-16be-18c8-5912-73ff9863a8ca@nvidia.com>
References: <1553613207-3988-1-git-send-email-vidyas@nvidia.com>
 <1553613207-3988-10-git-send-email-vidyas@nvidia.com>
 <20190329203159.GG24180@google.com>
 <5eb9599c-a6d6-d3a3-beef-5225ed7393f9@nvidia.com>
 <20190402141424.GB8017@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190402141424.GB8017@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, lorenzo.pieralisi@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, tiwai@suse.de, spujar@nvidia.com, skomatineni@nvidia.com, liviu.dudau@arm.com, krzk@kernel.org, heiko@sntech.de, horms+renesas@verge.net.au, olof@lixom.net, maxime.ripard@bootlin.com, andy.gross@linaro.org, bjorn.andersson@linaro.org, jagan@amarulasolutions.com, enric.balletbo@collabora.com, ezequiel@collabora.com, stefan.wahren@i2se.com, marc.w.gonzalez@free.fr, l.stach@pengutronix.de, tpiepho@impinj.com, hayashi.kunihiko@socionext.com, yue.wang@amlogic.com
List-Id: linux-tegra@vger.kernel.org

On 4/2/2019 7:44 PM, Thierry Reding wrote:
> On Tue, Apr 02, 2019 at 12:47:48PM +0530, Vidya Sagar wrote:
>> On 3/30/2019 2:22 AM, Bjorn Helgaas wrote:
> [...]
>>>> +static int tegra_pcie_dw_host_init(struct pcie_port *pp)
>>>> +{
> [...]
>>>> +	val_w = dw_pcie_readw_dbi(pci, CFG_LINK_STATUS);
>>>> +	while (!(val_w & PCI_EXP_LNKSTA_DLLLA)) {
>>>> +		if (!count) {
>>>> +			val = readl(pcie->appl_base + APPL_DEBUG);
>>>> +			val &= APPL_DEBUG_LTSSM_STATE_MASK;
>>>> +			val >>= APPL_DEBUG_LTSSM_STATE_SHIFT;
>>>> +			tmp = readl(pcie->appl_base + APPL_LINK_STATUS);
>>>> +			tmp &= APPL_LINK_STATUS_RDLH_LINK_UP;
>>>> +			if (val == 0x11 && !tmp) {
>>>> +				dev_info(pci->dev, "link is down in DLL");
>>>> +				dev_info(pci->dev,
>>>> +					 "trying again with DLFE disabled\n");
>>>> +				/* disable LTSSM */
>>>> +				val = readl(pcie->appl_base + APPL_CTRL);
>>>> +				val &= ~APPL_CTRL_LTSSM_EN;
>>>> +				writel(val, pcie->appl_base + APPL_CTRL);
>>>> +
>>>> +				reset_control_assert(pcie->core_rst);
>>>> +				reset_control_deassert(pcie->core_rst);
>>>> +
>>>> +				offset =
>>>> +				dw_pcie_find_ext_capability(pci,
>>>> +							    PCI_EXT_CAP_ID_DLF)
>>>> +				+ PCI_DLF_CAP;
>>>
>>> This capability offset doesn't change, does it?  Could it be computed
>>> outside the loop?
>> This is the only place where DLF offset is needed and gets calculated and this
>> scenario is very rare as so far only a legacy ASMedia USB3.0 card requires DLF
>> to be disabled to get PCIe link up. So, I thought of calculating the offset
>> here itself instead of using a separate variable.
>>
>>>
>>>> +				val = dw_pcie_readl_dbi(pci, offset);
>>>> +				val &= ~DL_FEATURE_EXCHANGE_EN;
>>>> +				dw_pcie_writel_dbi(pci, offset, val);
>>>> +
>>>> +				tegra_pcie_dw_host_init(&pcie->pci.pp);
>>>
>>> This looks like some sort of "wait for link up" retry loop, but a
>>> recursive call seems a little unusual.  My 5 second analysis is that
>>> the loop could run this 200 times, and you sure don't want the
>>> possibility of a 200-deep call chain.  Is there way to split out the
>>> host init from the link-up polling?
>> Again, this recursive calling comes into picture only for a legacy ASMedia
>> USB3.0 card and it is going to be a 1-deep call chain as the recursion takes
>> place only once depending on the condition. Apart from the legacy ASMedia card,
>> there is no other card at this point in time out of a huge number of cards that we have
>> tested.
> 
> A more idiomatic way would be to add a "retry:" label somewhere and goto
> that after disabling DLFE. That way you achieve the same effect, but you
> can avoid the recursion, even if it is harmless in practice.
Initially I thought of using goto to keep it simple, but I thought it would be
discouraged and hence used recursion. But, yeah.. agree that goto would keep
it simple and I'll switch to goto now.

> 
>>>> +static int tegra_pcie_dw_probe(struct platform_device *pdev)
>>>> +{
>>>> +	struct tegra_pcie_dw *pcie;
>>>> +	struct pcie_port *pp;
>>>> +	struct dw_pcie *pci;
>>>> +	struct phy **phy;
>>>> +	struct resource	*dbi_res;
>>>> +	struct resource	*atu_dma_res;
>>>> +	const struct of_device_id *match;
>>>> +	const struct tegra_pcie_of_data *data;
>>>> +	char *name;
>>>> +	int ret, i;
>>>> +
>>>> +	pcie = devm_kzalloc(&pdev->dev, sizeof(*pcie), GFP_KERNEL);
>>>> +	if (!pcie)
>>>> +		return -ENOMEM;
>>>> +
>>>> +	pci = &pcie->pci;
>>>> +	pci->dev = &pdev->dev;
>>>> +	pci->ops = &tegra_dw_pcie_ops;
>>>> +	pp = &pci->pp;
>>>> +	pcie->dev = &pdev->dev;
>>>> +
>>>> +	match = of_match_device(of_match_ptr(tegra_pcie_dw_of_match),
>>>> +				&pdev->dev);
>>>> +	if (!match)
>>>> +		return -EINVAL;
>>>
>>> Logically could be the first thing in the function since it doesn't
>>> depend on anything.
>> Done
>>
>>>
>>>> +	data = (struct tegra_pcie_of_data *)match->data;
> 
> of_device_get_match_data() can help remove some of the above
> boilerplate. Also, there's no reason to check for a failure with these
> functions. The driver is OF-only and can only ever be probed if the
> device exists, in which case match (or data for that matter) will never
> be NULL.
Done.

> 
>>> I see that an earlier patch added "bus" to struct pcie_port.  I think
>>> it would be better to somehow connect to the pci_host_bridge struct.
>>> Several other drivers already do this; see uses of
>>> pci_host_bridge_from_priv().
>> All non-DesignWare based implementations save their private data structure
>> in 'private' pointer of struct pci_host_bridge and use pci_host_bridge_from_priv()
>> to get it back. But, DesignWare based implementations save pcie_port in 'sysdata'
>> and nothing in 'private' pointer. So,  I'm not sure if pci_host_bridge_from_priv()
>> can be used in this case. Please do let me know if you think otherwise.
> 
> If nothing is currently stored in the private pointer, why not do like
> the other drivers and store the struct pci_host_bridge pointer there?
non-designware drivers get their private data allocated as part of pci_alloc_host_bridge()
by passing the size of their private structure and use pci_host_bridge_from_priv() to get
pointer to their own private structure (which is within struct pci_host_bridge).
Whereas in Designware core, we can get the memory for struct pcie_port much before than
calling pci_alloc_host_bridge() API, in fact, size '0' is passed as an argument to alloc API.
This is the reason why struct pcie_port pointer is saved in 'sysdata'.

> 
> Thierry
> 
