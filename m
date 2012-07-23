From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: make tegra_cpu_reset_handler_enable() __init
Date: Mon, 23 Jul 2012 14:09:30 -0600
Message-ID: <500DAF7A.3000302@wwwdotorg.org>
References: <1340053310-20855-1-git-send-email-swarren@wwwdotorg.org> <20120718150130.GV9437@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120718150130.GV9437-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Arnd Bergmann <arndb-r2nGTMty4D4@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/18/2012 09:01 AM, Peter De Schrijver wrote:
> On Mon, Jun 18, 2012 at 11:01:50PM +0200, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> This solves a section mismatch warning. I hadn't noticed this before,
>> because my compiler was inlining tegra_cpu_reset_handler_enable() inside
>> tegra_cpu_reset_handler_init(), which is already __init, but I switched
>> compilers and it stopped doing that.
> 
> Why does this generate a section mismatch warning? I see why calling a
> a __init marked function from a non __init marked function is a problem, but
> the opposite should be ok no?

The issue is that tegra_cpu_reset_handler_enable() itself (which was not
__init but the patch made to be __init) was referencing variable
__tegra_cpu_reset_handler_{start,end}. This wasn't noticed before
because when tegra_cpu_reset_handler_enable() was inlined into
tegra_cpu_reset_handler_init(), tegra_cpu_reset_handler_enable() was
effectively __init. However, when built as a separate function, you
ended up with a non-__init function referencing other things that were
__init.

In other words, this is indeed nothing to do with __init function
tegra_cpu_reset_handler_init() calling non-__init function
tegra_cpu_reset_handler_enable().

You can get the details by reverting the patch and building:-)
