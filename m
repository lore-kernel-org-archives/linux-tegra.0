From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [U-Boot] [PATCH 4/4] ARM: tegra210: gpu: configure WPR region
Date: Mon, 9 Nov 2015 09:18:16 -0700
Message-ID: <5640C748.8080207@wwwdotorg.org>
References: <1445230624-30314-1-git-send-email-acourbot@nvidia.com>
 <1445230624-30314-5-git-send-email-acourbot@nvidia.com>
 <56310CE8.3050107@wwwdotorg.org> <20151109143654.GB11362@ulmo.nvidia.com>
 <5640B994.7050307@wwwdotorg.org> <20151109154742.GE11362@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151109154742.GE11362-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/09/2015 08:48 AM, Thierry Reding wrote:
> On Mon, Nov 09, 2015 at 08:19:48AM -0700, Stephen Warren wrote:
>> On 11/09/2015 07:36 AM, Thierry Reding wrote:
>>> On Wed, Oct 28, 2015 at 11:59:04AM -0600, Stephen Warren wrote:
>>>> On 10/18/2015 10:57 PM, Alexandre Courbot wrote:
>>>>> T210's GPU secure firmware loading requires a write-protected region
>>>>> to be set up.
>>>>>
>>>>> This patch reserves the upper 256KB of RAM as the WPR region and locks
>>>>> it so the kernel can initiate secure firmware loading.
>>>>
>>>> On T210, it's the responsibility of nvtboot (which runs before U-Boot) to
>>>> set up any and all carve-outs. This code should not be necessary, and indeed
>>>> I expect the registers it touches can't actually be programmed from U-Boot,
>>>> which runs in non-secure mode after WPR is already locked.
>>>
>>> Can we document this assumption somewhere? It's entirely possible that
>>> someone might want to run U-Boot without nvtboot
>>
>> That's not currently a supported use-case.
>
> Isn't the whole point of open-source for people to be able to do all the
> things that aren't supported?

Sure, but the default case that we support should "just work", and be 
represented by the code we ship, and be supported by us. Any non-default 
case is going to require some research or additional coding/fixing/... 
effort, and we haven't necessarily published the information require to 
make those cases work.

>>> , in which case nvtboot
>>> would still need to be responsible for setting this up.
>>
>> I assume s/nvtboot/whatever other bootloader is in use/?
>
> Right, I was going to write U-Boot here, but that's obviously only true
> if U-Boot is still running in secure mode. Otherwise, yes, it'd be what-
> ever is the other bootloader being used.
>
>>> Or if it isn't
>>> we could still point at some location where the interactions between a
>>> first stage bootloader and U-Boot are documented.
>>>
>>> Do we have a document of this kind already?
>>
>> The L4T U-Boot source code:-)
>
> There's a bunch of things that even the L4T U-Boot doesn't document. The
> fact that it doesn't initialize the SMMU or WPR doesn't indicate that it
> is something that a first stage bootloader needs to do.

I meant this more along the lines of "if there's no code to do something 
in L4T U-Boot, upstream U-Boot wouldn't need that code either". That 
should be true at least w.r.t. nvtboot integration; certainly there are 
features that only exist in upstream U-Boot and haven't been back-ported 
downstream. I wasn't really implying that there's actual documentation 
(comments) in the L4T U-Boot source code.
