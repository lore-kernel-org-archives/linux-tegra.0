From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/7] ARM: tegra: finalize USB EHCI and PHY bindings
Date: Wed, 20 Mar 2013 11:30:15 -0600
Message-ID: <5149F227.7080702@wwwdotorg.org>
References: <1363609781-4045-1-git-send-email-vbyravarasu@nvidia.com> <1363609781-4045-2-git-send-email-vbyravarasu@nvidia.com> <51499B3E.3080602@ti.com> <D958900912E20642BCBC71664EFECE3E6E5092FFE5@BGMAIL02.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <D958900912E20642BCBC71664EFECE3E6E5092FFE5-QZ+emBqkIFBDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: kishon <kishon-l0cyMroinI0@public.gmane.org>, "gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org" <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, "stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org" <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/20/2013 06:15 AM, Venu Byravarasu wrote:
>> -----Original Message-----
>> From: kishon [mailto:kishon-l0cyMroinI0@public.gmane.org]
>> Sent: Wednesday, March 20, 2013 4:49 PM
>> To: Venu Byravarasu
>> Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org; stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org;
>> balbi-l0cyMroinI0@public.gmane.org; linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
>> swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-
>> discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> Subject: Re: [PATCH 1/7] ARM: tegra: finalize USB EHCI and PHY bindings
>>
>> Hi,
>>
>> On Monday 18 March 2013 05:59 PM, Venu Byravarasu wrote:
>>> The existing Tegra USB bindings have a few issues:
>>>
>>> 1) Many properties are documented as being part of the EHCI controller
>>> node, yet they apply more to the PHY device. They should be moved.
>>>
>>> 2) Some registers in PHY1 are shared with PHY3, and hence PHY3 needs a
>>> reg entry to point at PHY1's register space. We can't assume the PHY1
>>> driver is present, so the PHY3 driver will directly access those
>>> registers.
>>>
>>> 3) The list of clocks required by the PHY was missing some required
>>> entries.
>>>
>>> This patch fixes the binding definition to resolve these issues.
>>>
>>> Signed-off-by: Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>   .../bindings/usb/nvidia,tegra20-ehci.txt           |   27 +++----------------
>>>   .../bindings/usb/nvidia,tegra20-usb-phy.txt        |   27
>> +++++++++++++++++--
>>>   2 files changed, 29 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
>> b/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
>>> index 34c9528..df09330 100644
>>> --- a/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
>>> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra20-ehci.txt
>>> @@ -6,27 +6,10 @@ Practice : Universal Serial Bus" with the following
>> modifications
>>>   and additions :
>>>
>>>   Required properties :
>>> - - compatible : Should be "nvidia,tegra20-ehci" for USB controllers
>>> -   used in host mode.
>>> - - phy_type : Should be one of "ulpi" or "utmi".
>>>
>>>   Optional properties:
>>> -  - dr_mode : dual role mode. Indicates the working mode for
> 
>>> index 6bdaba2..7ceccd3 100644
>>> --- a/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt
>>> +++ b/Documentation/devicetree/bindings/usb/nvidia,tegra20-usb-phy.txt
>>> @@ -4,8 +4,24 @@ The device node for Tegra SOC USB PHY:
>>>
>>>   Required properties :
>>> + - phy_type : Should be one of "utmi", "ulpi" or "hsic".
>>
>> dt property names generally dont have "_".
> 
> Thanks Kishon, for your comments.
> Is it mandatory or optional?
> If it is mandatory, then I might have to change dr_mode as well along with phy_type.

This rule is basically mandatory for *new* property definitions.

However, both phy_type and dr_mode are properties that already exist and
have historical precedence for their naming. So, I don't think we can
change them. In fact, IIRC, someone even posted some patches to provide
a common set of parsing functions for those properties, and I assume
those patches use the existing names with _ in them. The patches aren't
applied yet though, I think.

(Venu, we already discussed this rule downstream)
