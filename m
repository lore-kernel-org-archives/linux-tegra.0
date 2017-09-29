From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] usb: phy: tegra: Fix phy suspend for UDC
Date: Fri, 29 Sep 2017 16:12:02 +0100
Message-ID: <de96e627-2627-217e-09a9-eb2452116827@nvidia.com>
References: <1506690388-23112-1-git-send-email-jonathanh@nvidia.com>
 <e97b9710-92c6-7eda-1bc2-0e97be5ded90@nvidia.com>
 <2a496e06-1857-ae2a-4cc5-ebda4965590b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2a496e06-1857-ae2a-4cc5-ebda4965590b-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 29/09/17 15:57, Dmitry Osipenko wrote:
> On 29.09.2017 16:10, Jon Hunter wrote:
>> Adding Dmitry ...
>>
>> Felipe, Thierry, this is needed for v4.14-rc because suspend is currently
>> broken for some Tegra devices.
>>
>> Jon
>>
>> On 29/09/17 14:06, Jon Hunter wrote:
>>> Commit dfebb5f43a78 ("usb: chipidea: Add support for Tegra20/30/114/124")
>>> added UDC support for Tegra but with UDC support enabled, is was found
>>> that Tegra30, Tegra114 and Tegra124 would hang on entry to suspend.
>>>
>>> The hang occurred during the suspend of the USB PHY when the Tegra PHY
>>> driver attempted to disable the PHY clock. The problem is that before
>>> the Tegra PHY driver is suspended, the chipidea driver already disabled
>>> the PHY clock and when the Tegra PHY driver suspended, it could not read
>>> DEVLC register and caused the device to hang.
>>>
>>> The Tegra USB PHY driver is used by both the Tegra EHCI driver and now
>>> the chipidea UDC driver and so simply removing the disabling of the PHY
>>> clock from the USB PHY driver would not work for the Tegra EHCI driver.
>>> Fortunately, the status of the USB PHY clock can be read from the
>>> USB_SUSP_CTRL register and therefore, to workaround this issue, simply
>>> poll the register prior to disabling the clock in USB PHY driver to see
>>> if clock gating has already been initiated. Please note that it can take
>>> a few uS for the clock to disable and so simply reading this status
>>> register once on entry is not sufficient.
>>>
>>> Please note that no issues are seen with Tegra20 because it has a slightly
>>> different PHY to Tegra30/114/124.
>>>
>>
>> I forgot the fixes tag ...
>>
>> Fixes: dfebb5f43a78 ("usb: chipidea: Add support for Tegra20/30/114/124")
>>  
>>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>  drivers/usb/phy/phy-tegra-usb.c | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/usb/phy/phy-tegra-usb.c b/drivers/usb/phy/phy-tegra-usb.c
>>> index 5fe4a5704bde..c8fff99bd16e 100644
>>> --- a/drivers/usb/phy/phy-tegra-usb.c
>>> +++ b/drivers/usb/phy/phy-tegra-usb.c
>>> @@ -329,6 +329,14 @@ static void utmi_phy_clk_disable(struct tegra_usb_phy *phy)
>>>  	unsigned long val;
>>>  	void __iomem *base = phy->regs;
>>>  
>>> +	/*
>>> +	 * The USB driver may have already initiated the phy clock
>>> +	 * disable so wait to see if the clock turns off and if not
>>> +	 * then proceed with gating the clock.
>>> +	 */
>>> +	if (utmi_wait_register(base + USB_SUSP_CTRL, USB_PHY_CLK_VALID, 0) == 0)
>>> +		return;
>>> +
>>>  	if (phy->is_legacy_phy) {
>>>  		val = readl(base + USB_SUSP_CTRL);
>>>  		val |= USB_SUSP_SET;
>>>
>>
> 
> Adding analogical check to clk_enable fixes "utmi_phy_clk_enable: timeout
> waiting for phy to stabilize" error message during of kernel boot-up on Tegra20.
> 
> What about to incorporate it to this patch?
> 
> @@ -354,16 +354,25 @@ static void utmi_phy_clk_disable(struct tegra_usb_phy *phy)
>  		pr_err("%s: timeout waiting for phy to stabilize\n", __func__);
>  }
> 
>  static void utmi_phy_clk_enable(struct tegra_usb_phy *phy)
>  {
>  	unsigned long val;
>  	void __iomem *base = phy->regs;
> 
> +	/*
> +	 * The USB driver may have already initiated the phy clock
> +	 * enable so wait to see if the clock turns on and if not
> +	 * then proceed with ungating the clock.
> +	 */
> +	if (utmi_wait_register(base + USB_SUSP_CTRL, USB_PHY_CLK_VALID,
> +						     USB_PHY_CLK_VALID) == 0)
> +		return;
> +
>  	if (phy->is_legacy_phy) {
>  		val = readl(base + USB_SUSP_CTRL);
>  		val |= USB_SUSP_CLR;
>  		writel(val, base + USB_SUSP_CTRL);
> 
>  		udelay(10);
> 
>  		val = readl(base + USB_SUSP_CTRL);
> 

Yes, I see that message as well. However, looks like that has been
around for a long time (for all v4.x kernels)! I also see the following
on Tegra20-trimslice (for all v4.x kernels as well) ...

[    1.852474] ulpi_phy_power_on: ulpi write failed
[    1.857086] tegra-ehci c5004000.usb: Failed to power on the phy
[    1.863039] tegra-ehci: probe of c5004000.usb failed with error -110

The above is not related to this issue though. Let me take a look at bit
closer at these messages.

Cheers
Jon

-- 
nvpublic
