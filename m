From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 6/7] pinctrl: tegra: Add DT binding for io pads control
Date: Sat, 16 Apr 2016 00:13:27 +0530
Message-ID: <5711364F.6070009@nvidia.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com> <1460473007-11535-7-git-send-email-ldewangan@nvidia.com> <5710F7A4.5070902@nvidia.com> <5710F6CA.6060700@nvidia.com> <57110560.80004@nvidia.com> <57110558.8010209@nvidia.com> <57110CA4.6050903@nvidia.com> <571119C6.6000107@nvidia.com> <5711288D.7060701@nvidia.com> <571129B9.7050602@nvidia.com> <57113340.6090701@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57113340.6090701-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Saturday 16 April 2016 12:00 AM, Jon Hunter wrote:
> On 15/04/16 18:49, Laxman Dewangan wrote:
>> On Friday 15 April 2016 11:14 PM, Jon Hunter wrote:
>>> On 15/04/16 17:41, Laxman Dewangan wrote:
>>>> On Friday 15 April 2016 09:15 PM, Jon Hunter wrote:
>>>>> On 15/04/16 16:14, Laxman Dewangan wrote:
>>>>>> I used pins as this is the property from pincon generic so that I can
>>>>>> use the generic implementation.
>>>>>>
>>>>>> Here, I will not go to the pin level control as HW does not support
>>>>>> pin
>>>>>> level control.
>>>>>>
>>>>>> I will say the unit should be interface level. Should we say
>>>>>> IO_GROUP_CSIA, IO_GROUP_CSIB etc?
>>>>> So we need to reflect the hardware in device-tree and although yes the
>>>>> power-down for the CSI_x_xxx pads are all controlled together as a
>>>>> single group, it does not feel right that we add a pseudo pin called
>>>>> csix to represent these.
>>>>>
>>>>> The CSI_x_xxx pads are already in device-tree and so why not add a
>>>>> property to each of these pads which has the IO rail information for
>>>>> power-down and voltage-select?
>>>> Which dt binding docs have these?
>>>> I looked for nvidia,tegra210-pinmux.txt and not able to find csi_xxx.
>>> For CSI you are right they are not included by the current DT binding
>>> docs, however, the sdmmc1/3 pads are. So that makes things a bit more
>>> messy as some are and some are not.
>> Yaah and so lets have the names in new dt files. Names may be same but
>> define all possible names f groups in dt binding and need not to refer
>> from other file which does not have all.
> I still do not like that. In the case of sdmmc we now have two pinctrl
> drivers to deal with for a single set of pins. That does not seem
> correct IMO.

We are ending two drivers because of the HW blocks. Pins interface and 
pad control are seen two different blocks.

Do you want to add the IO group names also in existing pin control 
driver and the new property, power-enable/disable and 
power-source-voltage belongs to these new io group names.

In this way we will have single driver. We need to see how we can 
support group/pins together.


>
>
>> But interfaces are complex. As a client, it is easy to say power down
>> SDMMC1 IO interface rather than saying power down 10 pins (names) of
>> that group.
> Right and like I said, we could always look up the IO rail from the pins
> associated once at probe time and then control it from there.

I did not get it fully. Can you please help on this using some psuedo 
code and dt property.

For  init, we can pass the regulator handle of the supply to this driver 
and during probe, it can get the voltage from regulator call and then 
set 1.8V or 3.3V. So we need to provide regulator handle from DT instead 
of voltage for probe configuration. Is this what you mean?
