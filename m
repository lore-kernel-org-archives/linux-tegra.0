From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: Ethernet on Tegra TX
Date: Tue, 3 Jan 2017 16:26:41 +0200
Message-ID: <48e6995c-dac3-7af5-0779-16ee6b7dda38@kapsi.fi>
References: <CAGWmfYqgarb5cC08wtkWiWjWMR3tXm39z7bKH8+LZN+sThD8Qg@mail.gmail.com>
 <8056dcbc-193c-3516-a874-c914656ca371@kapsi.fi>
 <CAGWmfYpu0B-dSMg2z08yXN7H97HY-+_RDzjuP4=vsXtwMd10Gg@mail.gmail.com>
 <CAGWmfYrC0jkvqdH1XZWG4XA+agcGVqFA7Gj+UUykPbLFrEA_tQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGWmfYrC0jkvqdH1XZWG4XA+agcGVqFA7Gj+UUykPbLFrEA_tQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Claudio Scordino <claudio-YOzL5CV4y4YG1A2ADO40+w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

You need to have the firmware in the correct path under firmware 
(nvidia/tegra210/xusb.bin), and subsequently the CONFIG_EXTRA_FIRMWARE 
option needs to be "nvidia/tegra210/xusb.bin"

Thanks,
Mikko.

On 01/03/2017 04:03 PM, Claudio Scordino wrote:
> Hi guys,
>
> thank you for your help.
>
> I've downloaded the xusb.bin firmware from
> http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
> and included in the kernel image.
> I've also built the kernel with symbols CONFIG_PHY_TEGRA_XUSB,
> CONFIG_USB_RTL8150 and CONFIG_USB_RTL8152 enabled (I've tried both as
> kernel modules and in the kernel image).
>
> However I still get such annoying error message("RTNETLINK answers:
> Network is unreachable") with ifconfig showing just one interface.
>
> Attached the boot log and the config file. Apparently the kernel can't
> load the firmware (which however is a blob included at build time).
>
> Many thanks and best regards,
>
>               Claudio
>
> 2017-01-03 10:46 GMT+01:00 Claudio Scordino <claudio-YOzL5CV4y4YG1A2ADO40+w@public.gmane.org>:
>> Hi Mikko,
>>
>> thank you for your help.
>>
>> I've downloaded the xusb.bin from
>>
>>
>>
>> 2017-01-02 17:48 GMT+01:00 Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>:
>>> The reason would likely be that the onboard Ethernet is a USB RTL8152 which
>>> does not seem to be compiled in. Additionally you may need to ensure the
>>> XUSB controller firmware (firmware/nvidia/tegra210/xusb.bin) is available
>>> during boot, either on an initrd or built-in to the kernel. I agree that
>>> this should be documented.
>>>
>>>
>>> On 01/02/2017 05:50 PM, Claudio Scordino wrote:
>>>>
>>>> Dear guys,
>>>>
>>>> just to let you know that trying the instructions at
>>>> http://elinux.org/Jetson/TX1_Upstream_Kernel with a TX1 board and a
>>>> 4.9 kernel, the Ethernet interface doesn't start.
>>>>
>>>> The console complains saying "RTNETLink Network unreachable" and
>>>> ifconfig only shows the loopback interface.
>>>>
>>>> Attached the .config file.
>>>>
>>>> Once found the reason (I still have to investigate but you may already
>>>> know), you may want to update the page with further instructions.
>>>>
>>>> Best regards and wishes for 2017.
>>>>
>>>>                 Claudio
>>>>
>>>
>>> Happy new year,
>>> Mikko.
>>
>>
>>
>> --
>> Claudio Scordino, Ph.D.
>> Project Manager - Funded research projects
>>
>> Evidence Srl
>> Via Carducci 56
>> 56010 S.Giuliano Terme - Pisa - Italy
>> Phone:  +39 050 99 11 224
>> Mobile: + 39 393 811 7491
>> Fax:   +39 050 99 10 812
>> http://www.evidence.eu.com
>
>
>
