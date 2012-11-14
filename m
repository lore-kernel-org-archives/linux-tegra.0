From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add Tegra20 host1x support
Date: Wed, 14 Nov 2012 18:45:23 +0200
Message-ID: <50A3CAA3.2060908@nvidia.com>
References: <1352467202-27903-1-git-send-email-thierry.reding@avionic-design.de> <1352467202-27903-2-git-send-email-thierry.reding@avionic-design.de> <50A357D3.9080002@nvidia.com> <20121114084931.GA31837@avionic-0098.mockup.avionic-design.de> <50A3712E.7000104@nvidia.com> <20121114105406.GA31455@avionic-0098.mockup.avionic-design.de> <50A3C485.7080704@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50A3C485.7080704-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 14.11.2012 18:19, Stephen Warren wrote:
> I'd rather initialize it explicitly. If setting it to 216MHz works
> fine as Terje indicated, we may as well just do that.

I'd prefer explicit setting, too.

> I suspect the issue with the original code:
> 
>> { "host1x",     "pll_c",        144000000,      false },
> 
> ... is that perhaps the requested 144MHz can't be generated from
> pll_c's 600MHz rate, since there's a simple U7.1 divider there (you
> could get 120, 133.333, 150), so the clock ends up being programmed to
> some incorrect value. In the pll_p/216MHz case, pll_p is programmed to
> generate 216MHz anyway, so requesting the same rate for host1x yields
> a divider of 1 exactly which works fine.

I could try the values you proposed tomorrow when I get back to office.
I believe we've always kept host1x under non-fractional dividers, so I'd
like to try 150MHz on Ventana and 150MHz and 300MHz on Cardhu.

600MHz sounds pretty high for PLLC on Tegra20. For Tegra30 it would be
understandable. In internal kernel I believe we have lower rate for
Tegra20 PLLC. Do we have anything running from PLLC in Tegra20 upstream
kernel?

Terje
