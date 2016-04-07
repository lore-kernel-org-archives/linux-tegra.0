From: Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v10 8/9] usb: xhci: Add NVIDIA Tegra XUSB controller driver
Date: Thu, 07 Apr 2016 14:50:25 +0300
Message-ID: <57064981.2030004@linux.intel.com>
References: <1457108379-20794-1-git-send-email-thierry.reding@gmail.com> <1457108379-20794-8-git-send-email-thierry.reding@gmail.com> <57063E91.1070202@linux.intel.com> <20160407110501.GA10231@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160407110501.GA10231@ulmo.ba.sec>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Andrew Bresticker <abrestic@chromium.org>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 07.04.2016 14:05, Thierry Reding wrote:
> On Thu, Apr 07, 2016 at 02:03:45PM +0300, Mathias Nyman wrote:
>> On 04.03.2016 18:19, Thierry Reding wrote:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> Add support for the on-chip XUSB controller present on Tegra SoCs. This
>>> controller, when loaded with external firmware, exposes an interface
>>> compliant with xHCI. This driver loads the firmware, starts the
>>> controller, and is able to service host-specific messages sent by the
>>> controller's firmware.
>>>
>>> The controller also supports USB device mode as well as powergating
>>> of the SuperSpeed and host-controller logic when not in use, but
>>> support for these is not yet implemented.
>>>
>>> Based on work by:
>>>     Ajay Gupta <ajayg@nvidia.com>
>>>     Bharath Yadav <byadav@nvidia.com>
>>>     Andrew Bresticker <abrestic@chromium.org>
>>>
>>> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>> Cc: Mathias Nyman <mathias.nyman@intel.com>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>
>> ...
>>
>>> +static int tegra_xusb_remove(struct platform_device *pdev)
>>> +{
>>> +	struct tegra_xusb *tegra = platform_get_drvdata(pdev);
>>   > +	struct usb_hcd *hcd = tegra->hcd;
>>> +	struct xhci_hcd *xhci;
>>> +
>>> +	if (tegra->fw_loaded) {
>>> +		xhci = hcd_to_xhci(hcd);
>>> +		usb_remove_hcd(xhci->shared_hcd);
>>> +		usb_put_hcd(xhci->shared_hcd);
>>> +		usb_remove_hcd(hcd);
>>> +		tegra_xusb_padctl_put(tegra->padctl);
>>> +		usb_put_hcd(hcd);
>>> +		kfree(xhci);
>>
>> Don't free xhci here, xhci is a part of hcd (hcd_priv) and hcd is already freed in usb_put_hcd()
>
> Ah, this was indeed reported to me about two weeks ago and fixed since
> then in my local tree.
>
>> Other than that I can't see any issues
>
> Thanks. Does this count as an Acked-by provided the kfree() is removed?
>

yes,

Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
