From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V7 3/3] soc/tegra: pmc: Add support for IO pads power
 state and voltage
Date: Thu, 16 Jun 2016 18:46:20 +0530
Message-ID: <5762A6A4.6030604@nvidia.com>
References: <1463755530-20941-1-git-send-email-ldewangan@nvidia.com> <1463755530-20941-4-git-send-email-ldewangan@nvidia.com> <5742C773.6080609@nvidia.com> <57443193.5010900@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57443193.5010900-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

On Tuesday 24 May 2016 04:18 PM, Jon Hunter wrote:
> On 23/05/16 10:03, Jon Hunter wrote:
>> On 20/05/16 15:45, Laxman Dewangan wrote:
>>> The IO pins of Tegra SoCs are grouped for common control of IO
>>> interface like setting voltage signal levels and power state of
>>> the interface. The group is generally referred as IO pads. The
>>> power state and voltage control of IO pins can be done at IO pads
>>> level.
>>>
>>> Tegra generation SoC supports the power down of IO pads when it
>>> is not used even in the active state of system. This saves power
>>> from that IO interface. Also it supports multiple voltage level
>>> in IO pins for interfacing on some of pads. The IO pad voltage is
>>> automatically detected till T124, hence SW need not to configure
>>> this. But from T210, the automatically detection logic has been
>>> removed, hence SW need to explicitly set the IO pad voltage into
>>> IO pad configuration registers.
>>>
>>> Add support to set the power states and voltage level of the IO pads
>>> from client driver. The implementation for the APIs are in generic
>>> which is applicable for all generation os Tegra SoC.
>>>
>>> IO pads ID and information of bit field for power state and voltage
>>> level controls are added for Tegra124, Tegra132 and Tegra210. The SOR
>>> driver is modified to use the new APIs.
>>>
>>> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Can you please review this?

Thanks,
Laxman
