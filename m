From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 27/27] drm/tegra: Add Tegra114 gr2d support
Date: Tue, 15 Oct 2013 08:51:47 +0300
Message-ID: <525CD7F3.10907@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com> <1381134884-5816-28-git-send-email-treding@nvidia.com> <52587F2D.9070007@wwwdotorg.org> <525B880A.7090802@nvidia.com> <20131014140010.GC16302@ulmo.nvidia.com> <525C3497.6010700@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <525C3497.6010700-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 14.10.2013 21:14, Stephen Warren wrote:
> On 10/14/2013 08:00 AM, Thierry Reding wrote:
>> Yes, as long as the device tree files includes the most specific
>> value in the compatible this should still be possible. So we'd have
>> this:
>>
>> gr2d@54140000 { compatible = "nvida,tegra114-gr2d",
>> "nvidia,tegra20-gr2d"; ... };
>>
>> and the driver will match on "nvidia,tegra20-gr2d" if the more
>> specific "nvidia,tegra114-gr2d" is not there. When the driver is
>> updated to support Tegra114 specific functionality, then a more
>> specific entry can be added to the compatible table to handle it.
> 
> True, but the DT fragment above is also only accurate /if/ a driver
> that only knows about "nvidia,tegra20-gr2d" can operate 100% of the
> features in Tegra20 HW on Tegra114 HW forever.

I don't know of any hardware incompatibility. The only difference is
related to something not directly to 2D. We moved host1x away from the
power domain, so in Tegra114 we're able to power gate 2D and EPP. The
DVFS tables are also different.

I'd say say adding the compatible property "nvidia,tegra20-gr2d" for
Tegra114's 2D is accurate and we're able to use the match table to drive
any SW policy differences.

Terje
