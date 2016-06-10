From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: fix missing include <soc/tegra/cpuidle.h>
Date: Fri, 10 Jun 2016 16:07:32 +0100
Message-ID: <575AD7B4.4040609@nvidia.com>
References: <1465404897-16654-1-git-send-email-ben.dooks@codethink.co.uk>
 <20160610142210.GN27142@ulmo.ba.sec> <575ACFB5.4070706@nvidia.com>
 <20160610145520.GP27142@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160610145520.GP27142-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 10/06/16 15:55, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Fri, Jun 10, 2016 at 03:33:25PM +0100, Jon Hunter wrote:
>>
>> On 10/06/16 15:22, Thierry Reding wrote:
>>>> Old Signed by an unknown key
>>>
>>> On Wed, Jun 08, 2016 at 05:54:57PM +0100, Ben Dooks wrote:
>>>> The prototype of tegra_cpuidle_pcie_irqs_in_use() is missing
>>>> from the cpuidle.c file, it is defined in <soc/tegra/cpuidle.h>
>>>> so add that include to avoid the following warning:
>>>>
>>>> arch/arm/mach-tegra/cpuidle.c:51:6: warning: symbol 'tegra_cpuidle_pcie_irqs_in_use' was not declared. Should it be static?
>>>>
>>>> Signed-off-by: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
>>>> ---
>>>> Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
>>>> Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>> Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>>>> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>>>> ---
>>>>  arch/arm/mach-tegra/cpuidle.c | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>
>>> I've been carrying a set of patches to fix these, and a couple of other
>>> sparse warnings, in my tree locally, but never sent them out because
>>> they were so trivial. I probably should've to avoid the duplication of
>>> effort. Sorry about that.
>>
>> I think you did send them out ;-)
>>
>> http://patchwork.ozlabs.org/patch/616249/
>> http://patchwork.ozlabs.org/patch/616250/
>> http://patchwork.ozlabs.org/patch/616251/
>> http://patchwork.ozlabs.org/patch/616252/
> 
> Hah! Excellent. No more guilty conscience for me. =)
> 
> I've pulled those patches into the Tegra tree now.

Great! I have sent you a list of some others from patchwork that I think
we should merge as well.

Jon

-- 
nvpublic
