From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v1] ARM: tegra: Fix sd4 regulator in Jetson TK1 device
 tree
Date: Mon, 29 Sep 2014 09:45:02 -0600
Message-ID: <54297E7E.1030306@wwwdotorg.org>
References: <1411408675-32315-1-git-send-email-vidyas@nvidia.com> <5420731E.6040104@wwwdotorg.org> <1862760b05184b95948b5e4952db010d@bgmail103.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1862760b05184b95948b5e4952db010d-7W72rfoJkVnYuxH7O460wFaTQe2KTcn/@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krishna Thota <kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 09/29/2014 04:25 AM, Vidya Sagar wrote:
>
>> -----Original Message-----
>> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
>> Sent: Tuesday, September 23, 2014 12:36 AM
>> To: Vidya Sagar
>> Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; Laxman Dewangan; Krishna Thota; linux-
>> tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org; linux-
>> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Subject: Re: [PATCH v1] ARM: tegra: Fix sd4 regulator in Jetson TK1 device
>> tree
>>
>> On 09/22/2014 11:57 AM, Vidya Sagar wrote:
>>> sd4 is an always on regulator which is turned on at boot time.
>>> It is externally controller through gpio. This change reflects the
>>> same in Jetson TK1 device tree
>>
>> In the schematics, the "Power Sequencing" timing diagram says "S/W
>> controlled" for SD4/+1.05V_RUN. I also don't see an "ENABLE1" pin on the
>> AS3722, which would be required for ...

Can you please comment on this aspect of the issue?

>>> +					ams,ext-control = <1>;
>>
>> ... to be valid.
>>
>> What's the source of information behind this change?
>>
>> What symptoms does this patch correct?
>
> I'm seeing one issue when I add support for PCIe suspend/resume functionality.
> The issue is that, when regulator_bulk_diable() is called, disabling one of the power rails (which is deriving its voltage from SD4) of PCIe is failing.
> The reason being, I2C controller is getting power gated

Why is the fix being applied to SD4 if the issue is with a power rail 
derived from SD4? Shouldn't any fix be applied directly to the 
problematic rail rather than some parent rail?

Since the I2C controller is part of the SoC and we don't have power 
domain support yet, the only way the I2C controller can get power gated 
is when the SoC as a whole is turned off.

 > before power rail disable is called.

... so without making SD4 dependant on ext-control, since no SW can be 
running at this point, the only way SD4 could get turned off is that the 
PMIC turns it off itself at the appropriate point in the system power 
sequence based on its OTP programming, or the board HW is already set up 
to turn off SD4 at the appropriate time somehow. Is that not happening? 
That would imply incorrect PMIC programming wouldn't it?

> Hence SD4 is made dependent on ENABLE1, which is nothing but the deep sleep signal coming from Tegra,
> So eventually, SD4 will be powered off when system enters into deep-sleep state.

This sounds like a workaround that happens to make the system do what 
you want rather than a root-cause fix.

> Source of information is from downstream kernel

We need to use HW schematics and other primary data to determine the 
correct approach.
