From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra20: Store CPU "resettable" status in IRAM
Date: Tue, 20 Jan 2015 10:59:56 +0900
Message-ID: <CAAVeFuKX_EL_b8HsHSa8g67QYZTE6YeNY9n4GCnsB3G2iJZgBQ@mail.gmail.com>
References: <1421319545-23920-1-git-send-email-digetx@gmail.com>
 <1421319545-23920-2-git-send-email-digetx@gmail.com> <20150119141224.GF23778@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150119141224.GF23778-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stable <stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jan 19, 2015 at 11:12 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
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
>>  arch/arm/mach-tegra/cpuidle-tegra20.c |  5 ++---
>>  arch/arm/mach-tegra/reset-handler.S   | 10 +++++++---
>>  arch/arm/mach-tegra/reset.h           |  4 ++++
>>  arch/arm/mach-tegra/sleep-tegra20.S   | 37 ++++++++++++++++++++---------------
>>  arch/arm/mach-tegra/sleep.h           |  4 ++++
>>  5 files changed, 38 insertions(+), 22 deletions(-)
>
> I'm leaning towards applying this. Stephen, Alex, Peter: any objections?

None from me ; but I am not qualified to give an valuable opinion on
this part of the code.
