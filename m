From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 27/27] drm/tegra: Add Tegra114 gr2d support
Date: Mon, 14 Oct 2013 12:13:46 -0600
Message-ID: <525C345A.2060102@wwwdotorg.org>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com> <1381134884-5816-28-git-send-email-treding@nvidia.com> <52587F2D.9070007@wwwdotorg.org> <525B880A.7090802@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <525B880A.7090802-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/13/2013 11:58 PM, Terje Bergstr=F6m wrote:
> On 12.10.2013 01:43, Stephen Warren wrote:
>> On 10/07/2013 02:34 AM, Thierry Reding wrote:
>>> The gr2d hardware in Tegra114 is compatible with that of Tegra20 an=
d
>>> Tegra30. No functionaly changes are required.
>>
>> Similarly here, if the HW is 100% backwards-compatible, there's no n=
eed
>> to add compatible values to the driver.
>=20
> We've used this mechanism for attaching a per-hw-version data structu=
re
> in match table to accomodate differences in how the hardware is power
> gated, reset, booted, some per-soc performance related changes etc.

If there are differences in those aspects of the HW, such that a driver
written only to the full specification of e.g. Tegra30 would not work o=
n
Tegra114, then the HW is not actually compatible, and hence we do need
multiple compatible values in DT, and entries in the of_match table.

It sounds like the statement in the commit description:

>>> The gr2d hardware in Tegra114 is compatible with that of Tegra20 an=
d
>>> Tegra30. No functionaly changes are required.

Might not be absolutely accurate in terms of HW, but only in terms of
the features that the driver uses so far. It'd be good to explicitly
qualify this in the commit description.

=2E..
> Upstream driver is not yet in a state where that is relevant.

The compatible values should be picked based on the full feature-set of
the HW, not based on the subset of features supported by a particular
driver.
