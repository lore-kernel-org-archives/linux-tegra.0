From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 27/27] drm/tegra: Add Tegra114 gr2d support
Date: Mon, 14 Oct 2013 08:58:34 +0300
Message-ID: <525B880A.7090802@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com> <1381134884-5816-28-git-send-email-treding@nvidia.com> <52587F2D.9070007@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52587F2D.9070007-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12.10.2013 01:43, Stephen Warren wrote:
> On 10/07/2013 02:34 AM, Thierry Reding wrote:
>> The gr2d hardware in Tegra114 is compatible with that of Tegra20 and
>> Tegra30. No functionaly changes are required.
> Similarly here, if the HW is 100% backwards-compatible, there's no need
> to add compatible values to the driver.

We've used this mechanism for attaching a per-hw-version data structure
in match table to accomodate differences in how the hardware is power
gated, reset, booted, some per-soc performance related changes etc. It's
also used in staging features for new chips, such as disabling power
features when they're not working/verified yet.

Upstream driver is not yet in a state where that is relevant.

With this, would we still be able to do that with match table? It sounds
like we could, because we can still (even with multiple compatible
properties) add separate entries in match table and I guess the
compatible properties matched in order.

Terje
