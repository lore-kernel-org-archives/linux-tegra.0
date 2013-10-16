From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 27/27] drm/tegra: Add Tegra114 gr2d support
Date: Wed, 16 Oct 2013 15:05:41 +0300
Message-ID: <525E8115.7080903@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com> <1381134884-5816-28-git-send-email-treding@nvidia.com> <52587F2D.9070007@wwwdotorg.org> <525B880A.7090802@nvidia.com> <20131014140010.GC16302@ulmo.nvidia.com> <525C3497.6010700@wwwdotorg.org> <20131015083731.GI7856@ulmo.nvidia.com> <525D5CF6.3020600@wwwdotorg.org> <20131016084804.GC21963@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131016084804.GC21963-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 16.10.2013 11:48, Thierry Reding wrote:
> On Tue, Oct 15, 2013 at 09:19:18AM -0600, Stephen Warren wrote:
>> Taking advantage of new functionality isn't the issue. The issue is
>> whether a driver that was written purely to the spec of Tegra20 can
>> successfully operate on the HW. If it can't, then the HW is not
>> compatible with Tegra20. Terje's previous comments sounded like the HW
>> is not backwards-compatible, although his more recent comments make it
>> sound like only SW policy differences, which shouldn't be part of DT
>> anyway.
> 
> Well, as good as I can tell it is backwards-compatible. I've been
> testing the code included in this series with the same simple test
> program that clears a rectangle on Tegra20, Tegra30 and Tegra114.
> 
> Furthermore our internal register specification files are identical,
> with the exception of some whitespace changes for all three generations.
> I think that qualifies as backwards-compatible?

A driver written for Tegra20 2D works with Tegra114 2D. Not necessarily
vice versa, because Tegra114's driver can ask for higher clocks, or it
might want to power gate 2D.

I mentioned earlier bringup activities. Perhaps Stephen took that in a
way I didn't intend.

Terje
