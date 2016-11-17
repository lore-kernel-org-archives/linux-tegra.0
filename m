From: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] soc/tegra: Implement Tegra186 PMC support
Date: Thu, 17 Nov 2016 17:55:09 +0000
Message-ID: <6fc02d40-66c3-35eb-519a-0d24e84d5d7f@arm.com>
References: <20161117171636.20580-1-thierry.reding@gmail.com>
 <0068ebe4-09f3-4434-fc38-071cf2d553bc@arm.com>
 <20161117173110.GA7915@ulmo.ba.sec>
 <efb274c8-d361-f4d1-95aa-547b9e941d68@arm.com>
 <20161117175218.GA7751@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161117175218.GA7751-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Sudeep Holla <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 17/11/16 17:52, Thierry Reding wrote:
> On Thu, Nov 17, 2016 at 05:40:35PM +0000, Sudeep Holla wrote:
>>
>>
>> On 17/11/16 17:31, Thierry Reding wrote:

[...]

>>> would be nice to still be able to reboot via the PMC code above.
>>
>> I assume it's only for development purposes as you won't have much CPU
>> power management support without PSCI.
>
> This is what I had primarily in mind. Sometimes it might be useful to
> boot without PSCI at all (as a poor man's way of disable SMP), in which
> case this driver can still be used for reboot into the bootloader or
> recovery mode.
>

Thanks for clarification.

-- 
Regards,
Sudeep
