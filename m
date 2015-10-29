From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [U-Boot] [PATCH 4/4] ARM: tegra210: gpu: configure WPR region
Date: Wed, 28 Oct 2015 21:47:50 -0600
Message-ID: <563196E6.8040106@wwwdotorg.org>
References: <1445230624-30314-1-git-send-email-acourbot@nvidia.com>
 <1445230624-30314-5-git-send-email-acourbot@nvidia.com>
 <56310CE8.3050107@wwwdotorg.org> <5631605B.4020800@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5631605B.4020800-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/28/2015 05:55 PM, Alexandre Courbot wrote:
> On 10/29/2015 02:59 AM, Stephen Warren wrote:
>> On 10/18/2015 10:57 PM, Alexandre Courbot wrote:
>>> T210's GPU secure firmware loading requires a write-protected region
>>> to be set up.
>>>
>>> This patch reserves the upper 256KB of RAM as the WPR region and locks
>>> it so the kernel can initiate secure firmware loading.
>>
>> On T210, it's the responsibility of nvtboot (which runs before U-Boot)
>> to set up any and all carve-outs. This code should not be necessary, and
>> indeed I expect the registers it touches can't actually be programmed
>> from U-Boot, which runs in non-secure mode after WPR is already locked.
> 
> Ok, I was running from Thierry's miniloader which did not program or
> lock these registers.
> 
> The question then is: do we have an official nvtboot binary available
> for upstream support? AFAICT Thierry's miniloader solution is the only
> solution available to the public, and without this setup one cannot use
> the GPU on T210.

Once L4T for T210 has been released, it'll contain a full set of nvtboot
binaries and flashing support. You an easily acquire this internally
already; send me an email if you need a link. I'd expect a public SW
release by the time any T210 boards capable of running upstream are
available.
