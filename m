From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra20: Store CPU "resettable" status in IRAM
Date: Mon, 19 Jan 2015 10:26:22 -0700
Message-ID: <54BD3E3E.2040801@wwwdotorg.org>
References: <1421319545-23920-1-git-send-email-digetx@gmail.com> <1421319545-23920-2-git-send-email-digetx@gmail.com> <20150119141224.GF23778@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150119141224.GF23778-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/19/2015 07:12 AM, Thierry Reding wrote:
> On Thu, Jan 15, 2015 at 01:58:57PM +0300, Dmitry Osipenko wrote:
>> Commit 7232398abc6a ("ARM: tegra: Convert PMC to a driver") changed tegra_resume()
>> location storing from late to early and, as a result, broke suspend on Tegra20.
>> PMC scratch register 41 is used by tegra LP1 resume code for retrieving stored
>> physical memory address of common resume function and in the same time used by
>> tegra20_cpu_shutdown() (shared by Tegra20 cpuidle driver and platform SMP code),
>> which is storing CPU1 "resettable" status. It implies strict order of scratch
>> register usage, otherwise resume function address is lost on Tegra20 after
>> disabling non-boot CPU's on suspend. Fix it by storing "resettable" status in
>> IRAM instead of PMC scratch register.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> Fixes: 7232398abc6a (ARM: tegra: Convert PMC to a driver)
>> Cc: <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org> # v3.17+
>> ---
>>   arch/arm/mach-tegra/cpuidle-tegra20.c |  5 ++---
>>   arch/arm/mach-tegra/reset-handler.S   | 10 +++++++---
>>   arch/arm/mach-tegra/reset.h           |  4 ++++
>>   arch/arm/mach-tegra/sleep-tegra20.S   | 37 ++++++++++++++++++++---------------
>>   arch/arm/mach-tegra/sleep.h           |  4 ++++
>>   5 files changed, 38 insertions(+), 22 deletions(-)
>
> I'm leaning towards applying this. Stephen, Alex, Peter: any objections?

Hopefully this works out. I suppose it's unlikely anyone will be running 
code on the AVP upstrem, so any potential conflict with AVP's usage of 
IRAM isn't likely to occur.

__tegra20_cpu1_resettable_status_offset has a lot of _ at the start. 
Should the symbol be named more normally? I guess at least it's 
consistent with the existing very "underscory" 
__tegra_cpu_reset_handler_start.
