From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: usb: chipidea: udc: BUG: sleeping function called from invalid
 context
Date: Thu, 5 Mar 2020 23:53:46 +0300
Message-ID: <7a142dd4-9ae8-2560-e5be-25648f88a864@gmail.com>
References: <bfa5b2f7-cf52-0055-ffb2-2cb8278a1181@gmail.com>
 <20200305021226.GA12837@b29397-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200305021226.GA12837@b29397-desktop>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Chen <peter.chen-3arQi8VN3Tc@public.gmane.org>
Cc: "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

05.03.2020 05:12, Peter Chen пишет:
> On 20-03-04 19:10:08, Dmitry Osipenko wrote:
>> Hello,
>>
>> I was trying out today's linux-next-20200304 and noticed this splat in KMSG:
>>
...
>> I haven't tried to figure out what change causes this problem, it didn't
>> happen using next-20200218. Please take a look, thanks in advance.
> 
> Dmitry, thanks for reporting. I haven't met that issue, it maybe I
> enable runtime pm, but you have not? So I don't trigger
> "dev->power.runtime_status != RPM_ACTIVE" condition below
> 
> 	might_sleep_if(!(rpmflags & RPM_ASYNC) && !dev->power.irq_safe &&
> 			dev->power.runtime_status != RPM_ACTIVE);

The runtime PM always presents on Tegra, do you have
CONFIG_DEBUG_ATOMIC_SLEEP=y in the kernel's config?

> I send the fix patch, but git send-email seems doesn't add auto cc
> according to reported-by tag, so you are not at cc list. Would you
> please have a test?

It fixes the problem, thanks!
