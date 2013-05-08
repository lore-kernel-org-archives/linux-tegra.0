From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: disable LP2 cpuidle state if PCIe is enabled
Date: Wed, 08 May 2013 12:41:02 -0600
Message-ID: <518A9C3E.2060803@wwwdotorg.org>
References: <1367872744-25002-1-git-send-email-swarren@wwwdotorg.org> <20130507124849.GM7949@tbergstrom-lnx.Nvidia.com> <20130507130850.GA11202@avionic-0098.adnet.avionic-design.de> <518915A7.1020105@wwwdotorg.org> <20130508094004.GL7949@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130508094004.GL7949-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Jay Agarwal <jagarwal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/08/2013 03:40 AM, Peter De Schrijver wrote:
> On Tue, May 07, 2013 at 04:54:31PM +0200, Stephen Warren wrote:
>> On 05/07/2013 07:08 AM, Thierry Reding wrote:
>>> On Tue, May 07, 2013 at 03:48:49PM +0300, Peter De Schrijver
>>> wrote:
>>>> On Mon, May 06, 2013 at 10:39:04PM +0200, Stephen Warren wrote:
>>>>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>>>
>>>>> Tegra20 HW appears to have a bug such that PCIe device
>>>>> interrupts, whether they are legacy IRQs or MSI, are lost when
>>>>> LP2 is enabled. To work around this, simply disable LP2 if the
>>>>> PCI driver and DT node are both enabled.
>>>>>
>>>>
>>>> Wouldn't it make more sense to disable LP2 when we actually
>>>> detect a PCIe device?
>>
>> I did consider that, but rejected the idea for the reasons Thierry
>> mentioned.
...
>>> Furthermore, it is quite likely that the PCIe controller will only
>>> be enabled in DT for devices that actually have a PCIe device
>>> hooked up.
> 
> That's not always true though. Eg Harmony has a miniPCIe slot, so it should be
> listed in DT, but there is not necessarily a card present in the slot.

I initially thought that this issue only affected Tegra20, so I was
prepared to ignore the lack of optimality of this solution, since it
only affects Harmony. However, initial experimentation with Jay's
Tegra30 PCIe patches imply the same issue is present on Tegra30. I need
to do more research to confirm whether it's the same problem or
something else though. If this turns out to be true, we'll have to come
up with a more complex solution, since this current solution would
disable LP2 outright on all currently supported Tegra30 boards:-(
