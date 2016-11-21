From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: Terga 30 CPI Issue
Date: Mon, 21 Nov 2016 20:50:51 +0200
Message-ID: <633aee5d-54d9-3bc5-a57b-7f735937a141@kapsi.fi>
References: <F9D95AC275991E48901933FBF3337AB0C2D6DF02@ex-02>
 <2b6907f4-ca67-7183-11f3-f1ccc6de2120@kapsi.fi>
 <7019aa33-7684-6b45-bcb6-a21d703e1d12@kapsi.fi>
 <F9D95AC275991E48901933FBF3337AB0C2D6E1CA@ex-02>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <F9D95AC275991E48901933FBF3337AB0C2D6E1CA@ex-02>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lamar Hansford <Lamar.Hansford-2/lGf/aFiT5Wk0Htik3J/w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/21/2016 07:54 PM, Lamar Hansford wrote:
> What does bit 2 do?

Downstream rel-16 has a patch that applies this bit on T30; claiming to 
fix a hang. Not sure if your issue is related, though.

http://nv-tegra.nvidia.com/gitweb/?p=linux-2.6.git;a=commit;h=812e6d344d35d7ef6df9ccbeed5f6a65c53e7977

>
> In the mainline linux code AFI_CONFIGURATION maps to 0xAC which maps to:
> * T_PCIE2_RP_LINK_CONTROL_STATUS_2 - Target Link speed

My TRM shows LINK_CONTROL_STATUS_2 at 0xB0 - but this is a different 
aperture compared to AFI_CONFIGURATION anyway. AFI_CONFIGURATION is 
documented at 32.3.1.8 - though incompletely. T124 TRM has the full info.

>
> However,  the PCIe Config register (no address given) the bit would map as:
> * Disable TOC0 - Disable
>
> However, the mainline code shows:
>         /* finally enable PCIe */
>         value = afi_readl(pcie, AFI_CONFIGURATION);
>         value |= AFI_CONFIGURATION_EN_FPCI;
>         afi_writel(pcie, value, AFI_CONFIGURATION);

You would add value |= (1<<2) here. Similarly FPCI_TIMEOUT, being an AFI 
register, would be accessed using afi_readl/afi_writel.

>
> Which wouldn't seem to map to either case.  In the T_PCIE2_RP_LINK_CONTROL_STATUS_2   case writing a 1 would disable Gen2 functionality, which we have successfully used.
>
> Do you have any clarification on this?  (I am trying to pull the TK1 TRM but NVida is blocking me)

See above. Not sure what you need to do nowadays to get download access, 
but it shouldn't be very complicated.

>
> FYI, I assume the FPCI timeout will provide a timeout to the AXI bus when the FPCI does not respond.  Otherwise the bus locks up (this is an assumption).
>
> Thanks in advance!
> -Lamar
>
>

Cheers,
Mikko.

>
> -----Original Message-----
> From: Mikko Perttunen [mailto:cyndis-/1wQRMveznE@public.gmane.org]
> Sent: Monday, November 21, 2016 11:23 AM
> To: Lamar Hansford; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: Terga 30 CPI Issue
>
> Also, try setting bit 2 (i.e. third bit) of AFI_CONFIGURATION
>
> On 11/21/2016 06:59 PM, Mikko Perttunen wrote:
>> On 11/21/2016 06:10 PM, Lamar Hansford wrote:
>>> Hello,
>>> I am using a Terga 30 with multiple PCIe cards.  I am experiencing a
>>> hard (non-recoverable) lock-up which occurs whenever the following
>>> wr/rd sequence is followed:
>>> * wr(a) -> rd(a)
>>>
>>> Where you write then immediately read the same address.  Validated by
>>> GPIO write before and after (2nd GPIO change never happens).
>>>
>>> I have removed this sequence from my driver (ath9k) and the device is
>>> stable for days with a single card.  However, when (multiple cards
>>> are added (same type) the lock-up still occurs.
>>>
>>> It appears that the AXI bus is hung, preventing execution by any of
>>> the cores.
>>> I see that there is a register FPCI_TIMEOUT defined in the spec.  I
>>> hope that by enabling the bus timeout I can get the system to
>>> gracefully recover.  But I cannot determine which register location
>>> it is mapped to.
>>
>> The Tegra124 manual puts it at 0xd8, and other addresses around it
>> seem to match ones in the driver, so you might try that. The Tegra124
>> manual also has the descriptions for the bits (31 and 19..0) swapped
>> which does make more sense. No idea what it's supposed to do, really
>> :)
>>
>>>
>>> * Is this an internally mapped setting?
>>> * If not what register?  Is there a way to set this
>>>
>>> I do see where the interrupt can be enabled but not the FPCI Timeout
>>> register itself (section 32.4.1.1).
>>>
>>> Any help would be appreciated,
>>> -Lamar
>>
>> Cheers,
>> Mikko.
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-tegra"
>> in the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org More majordomo
>> info at  http://vger.kernel.org/majordomo-info.html
> This email and any attachments may contain private, confidential and privileged material for the sole use of the intended recipient. If you are not the intended recipient, please immediately delete this email and any attachments.
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
