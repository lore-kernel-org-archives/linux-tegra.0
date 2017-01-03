From: Claudio Scordino <claudio-YOzL5CV4y4YG1A2ADO40+w@public.gmane.org>
Subject: Re: Ethernet on Tegra TX
Date: Tue, 3 Jan 2017 10:46:51 +0100
Message-ID: <CAGWmfYpu0B-dSMg2z08yXN7H97HY-+_RDzjuP4=vsXtwMd10Gg@mail.gmail.com>
References: <CAGWmfYqgarb5cC08wtkWiWjWMR3tXm39z7bKH8+LZN+sThD8Qg@mail.gmail.com>
 <8056dcbc-193c-3516-a874-c914656ca371@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8056dcbc-193c-3516-a874-c914656ca371-/1wQRMveznE@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Mikko,

thank you for your help.

I've downloaded the xusb.bin from



2017-01-02 17:48 GMT+01:00 Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>:
> The reason would likely be that the onboard Ethernet is a USB RTL8152 which
> does not seem to be compiled in. Additionally you may need to ensure the
> XUSB controller firmware (firmware/nvidia/tegra210/xusb.bin) is available
> during boot, either on an initrd or built-in to the kernel. I agree that
> this should be documented.
>
>
> On 01/02/2017 05:50 PM, Claudio Scordino wrote:
>>
>> Dear guys,
>>
>> just to let you know that trying the instructions at
>> http://elinux.org/Jetson/TX1_Upstream_Kernel with a TX1 board and a
>> 4.9 kernel, the Ethernet interface doesn't start.
>>
>> The console complains saying "RTNETLink Network unreachable" and
>> ifconfig only shows the loopback interface.
>>
>> Attached the .config file.
>>
>> Once found the reason (I still have to investigate but you may already
>> know), you may want to update the page with further instructions.
>>
>> Best regards and wishes for 2017.
>>
>>                 Claudio
>>
>
> Happy new year,
> Mikko.



-- 
Claudio Scordino, Ph.D.
Project Manager - Funded research projects

Evidence Srl
Via Carducci 56
56010 S.Giuliano Terme - Pisa - Italy
Phone:  +39 050 99 11 224
Mobile: + 39 393 811 7491
Fax:   +39 050 99 10 812
http://www.evidence.eu.com
