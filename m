From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: tegra: Make gr2d and gr3d clocks children of
 pll_c
Date: Tue, 2 Apr 2013 08:28:53 +0300
Message-ID: <515A6C95.4060900@nvidia.com>
References: <1364502688-5135-1-git-send-email-thierry.reding@avionic-design.de> <1364502688-5135-2-git-send-email-thierry.reding@avionic-design.de> <51560BC4.8020400@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51560BC4.8020400-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 29.03.2013 23:46, Stephen Warren wrote:
> On 03/28/2013 02:31 PM, Thierry Reding wrote:
>> By default these clocks are children of pll_m, but in downstream kernels
>> they are reparented to pll_c. While at it, decrease their frequencies to
>> 300 MHz because the defaults aren't in the specified range.
>>
>> gr2d can reportedly run at much higher frequencies, but 300 MHz works
>> and is a more conservative default.
> 
> Questions on this patch:
> 
> Do we need to do the same thing for Tegra30 and/or Tegra114?
> 
> Is 300MHz the right value?
> 
> I'm hoping that Peter, Prashant, and/or Terje can provide guidance here.

We need a patch for all SoC's. 2D can fail subtly with the too high
clocks, even though most of the time it seems to be doing just fine.

In Tegra20, 300MHz is the max rate we drive 2D in. Later Tegras have a
higher max clock, and in Tegra114 we drive it from a different PLL. But
for all of them 300MHz and PLLC should be a working configuration. I
haven't checked how we use PLLC in upstream, so I'm not 100% sure.

In downstream, the nvhost driver is responsible for setting a sane value
to the host1x clients. In upstream host1x, we missed that because we
didn't include the clock management code.

Terje
