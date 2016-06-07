From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM64: boot: dts: Add regulators for Tegra210 Smaug
Date: Tue, 7 Jun 2016 17:05:16 +0530
Message-ID: <5756B174.5090909@nvidia.com>
References: <1464985365-11612-1-git-send-email-rklein@nvidia.com> <57551AAD.2020805@nvidia.com> <b28b44d9-7f3e-c1bb-7df8-238191ab1941@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b28b44d9-7f3e-c1bb-7df8-238191ab1941-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Tuesday 07 June 2016 03:22 AM, Rhyland Klein wrote:
> On 6/6/2016 2:39 AM, Laxman Dewangan wrote:
>> On Saturday 04 June 2016 01:52 AM, Rhyland Klein wrote:
>>> +					regulator-disable-ramp-delay = <4080>;
>>> +					regulator-ramp-delay = <27500>;
>>> +					regulator-ramp-delay-scale = <300>;
>> There is no disable-ramp-delay in mainline.
>> Please use the correct value for property as:
>>                                        regulator-ramp-delay = <9000>;
>>                                        maxim,ramp-rate-setting = <27500>;
>>
>>
>> instead of regulator-ramp-delay and regulator-ramp-delay-scale.
>> The property differs from downstream.
>>
>> regulator-ramp-delay is what you see in platform and
>> maxim,ramp-rate-setting is what you want in register.
> Where does "<9000>" come from in the above comment? It looks like
> maxim,ramp-rate-setting sets the slew rate, and regulator-ramp-delay
> will as well, but will be ignored if maxim,ramp-delay-setting is set. So
> does it ever make sense to have both defined for a regulator? And if
> not, should max77620 regulators just use the maxim property and not the
> regulator core property?
>


9000uV/us is what measured ramp delay in the platform after setting the 
device register to 27500uV/us.

This is derived from our downstream table as ramp-delay *100/scale
so here 27500 *100/300 is approx to 9000.

This is used when your measured is varied from register configuration 
which is true in most of our platform.
If your platform does not have diff then please provide 
regulator-ramp-delay only with what you measured.
