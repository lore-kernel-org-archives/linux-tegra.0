From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: pci: tegra: Update for per-lane PHYs
Date: Mon, 11 Apr 2016 10:55:32 -0600
Message-ID: <570BD704.2060900@wwwdotorg.org>
References: <1460131994-24493-1-git-send-email-thierry.reding@gmail.com>
 <20160408191142.GD15034@localhost> <20160411112654.GC17743@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160411112654.GC17743-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/11/2016 05:26 AM, Thierry Reding wrote:
> On Fri, Apr 08, 2016 at 02:11:42PM -0500, Bjorn Helgaas wrote:
>> Hi Thierry,
>>
>> I have a couple more questions, probably just because I'm
>> DT-illiterate.
>>
>> On Fri, Apr 08, 2016 at 06:13:13PM +0200, Thierry Reding wrote:
>>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> Changes to the pad controller device tree binding have required that
>>> each lane be associated with a separate PHY. Update the PCI host bridge
>>> device tree binding to allow each root port to define the list of PHYs
>>> required to drive the lanes associated with it.

>>> diff --git a/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt b/Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt

>>> -Required properties on Tegra124 and later:
>>> +Required properties on Tegra124 and later (deprecated):
>>>   - phys: Must contain an entry for each entry in phy-names.
>>>   - phy-names: Must include the following entries:
>>>     - pcie
>>>
>>> +These properties are deprecated in favour of per-lane PHYs define in each of
>>> +the root ports (see below).
>>> +
>>>   Power supplies for Tegra20:
>>>   - avdd-pex-supply: Power supply for analog PCIe logic. Must supply 1.05 V.
>>>   - vdd-pex-supply: Power supply for digital PCIe I/O. Must supply 1.05 V.
>>> @@ -122,6 +125,13 @@ Required properties:
>>>     - Root port 0 uses 4 lanes, root port 1 is unused.
>>>     - Both root ports use 2 lanes.
>>>
>>> +Required properties for Tegra124 and later:
>>
>> I had a little trouble disambiguating this from the "Required
>> properties on Tegra124 and later (deprecated)" line above.  It might
>> help if they said:
>>
>>    Required PCIe controller properties on Tegra124 and later (deprecated):
>>    Required PCIe Root Port properties for Tegra124 and later:
...
>> I'm not sure how to interpret the "deprecated" part.  Assume I'm
>> writing a DTS.  What am I supposed to include?
>>
>>    - "phys" and "phy-names" under the PCIe controller *and*
>>      "phys" and "phy-names" under the Root Port?
>>
>>    - "phys" and "phy-names" under the PCIe controller only if I don't
>>      supply "phys" and "phy-names" under the Root Port?
>>
>> My guess is that a board with more than one PHY for PCIe should omit
>> "phys" and "phy-names" under the PCIe controller and include them
>> under each Root Port.  And a board with only one PHY could conceivably
>> supply these properties either under the controller or the Root Port
>> or both.
>
> Whatever is marked as deprecated should not be used in new bindings at
> all. That is, new board files should move to per-lane PHYs, no matter
> how many lanes they enable.
>
> The XUSB pad controller that provides these PHYs can be driven by two
> different drivers: a pinctrl driver that exposes a single PHY for all
> PCI lanes (it uses per-lane nvidia,iddq properties to enable or disable
> each of the lanes) or a PHY driver that exposes one PHY per lane. Each
> PHY can separately be powered on.
>
> Perhaps a better approach would be to simply remove the deprecated
> properties to avoid any possible confusion. It does have the drawback
> that old device trees won't have a documentation counterpart.

I recall requests during past DT binding reviews that deprecated 
properties still be documented. That allows legacy bindings and driver 
support for them to be understood, since they're still documented.
