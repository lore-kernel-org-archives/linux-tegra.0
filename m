From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: usb: chipidea: udc: BUG: sleeping function called from invalid
 context
Date: Fri, 6 Mar 2020 05:38:06 +0300
Message-ID: <a000d34c-acae-18e7-f690-0cb3deb85d31@gmail.com>
References: <bfa5b2f7-cf52-0055-ffb2-2cb8278a1181@gmail.com>
 <20200305021226.GA12837@b29397-desktop>
 <7a142dd4-9ae8-2560-e5be-25648f88a864@gmail.com>
 <20200306015344.GA29800@b29397-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200306015344.GA29800@b29397-desktop>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
Cc: "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

06.03.2020 04:53, Peter Chen пишет:
> On 20-03-05 23:53:46, Dmitry Osipenko wrote:
>> 05.03.2020 05:12, Peter Chen пишет:
>>> On 20-03-04 19:10:08, Dmitry Osipenko wrote:
>>>> Hello,
>>>>
>>>> I was trying out today's linux-next-20200304 and noticed this splat in KMSG:
>>>>
>> ...
>>>> I haven't tried to figure out what change causes this problem, it didn't
>>>> happen using next-20200218. Please take a look, thanks in advance.
>>>
>>> Dmitry, thanks for reporting. I haven't met that issue, it maybe I
>>> enable runtime pm, but you have not? So I don't trigger
>>> "dev->power.runtime_status != RPM_ACTIVE" condition below
>>>
>>> 	might_sleep_if(!(rpmflags & RPM_ASYNC) && !dev->power.irq_safe &&
>>> 			dev->power.runtime_status != RPM_ACTIVE);
>>
>> The runtime PM always presents on Tegra, do you have
>> CONFIG_DEBUG_ATOMIC_SLEEP=y in the kernel's config?
>>
> 
> No, the reason should be "dev->power.runtime_status != RPM_ACTIVE", your
> ci device's runtime may not be active at that time, if I move the spinlock
> above pm_runtime_get_sync at ci_hdrc_gadget_connect, I could reproduce it
> too.
> 
> I enabled CONFIG_DEBUG_ATOMIC_SLEEP, but can't reproduce the dump
> without above changes.

It happened using a setup where UDC is set to a hardcoded USBNET
peripheral-mode, the splat happened as soon as UDC is probed and cable
is plugged.

I'm not sure whether RPM needs to be explicitly enabled for the CI
device by the tegra_udc_driver. If yes, then indeed Tegra's CI driver
doesn't support RPM and it should be in a disabled state.
