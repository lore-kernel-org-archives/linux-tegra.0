From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Add Tegra20 host1x support
Date: Wed, 14 Nov 2012 13:15:54 -0700
Message-ID: <50A3FBFA.3080008@wwwdotorg.org>
References: <1352467202-27903-1-git-send-email-thierry.reding@avionic-design.de> <1352467202-27903-2-git-send-email-thierry.reding@avionic-design.de> <50A357D3.9080002@nvidia.com> <20121114084931.GA31837@avionic-0098.mockup.avionic-design.de> <50A3712E.7000104@nvidia.com> <20121114105406.GA31455@avionic-0098.mockup.avionic-design.de> <50A3C485.7080704@wwwdotorg.org> <20121114200415.GA10335@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121114200415.GA10335-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/14/2012 01:04 PM, Thierry Reding wrote:
...
> According to tegra20_clocks_data.c, the maximum clock frequency
> for host1x is 166 MHz, so 216 is probably not a good idea. 150 MHz
> sounds sensible, though.

As a general rule, I wouldn't rely on the upstream clock driver to
specify accurate maximum clock rates at the moment. Our downstream
kernel is more likely to be accurate. Still, upstream might be correct
here already...
