From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 27/27] drm/tegra: Add Tegra114 gr2d support
Date: Tue, 15 Oct 2013 09:19:18 -0600
Message-ID: <525D5CF6.3020600@wwwdotorg.org>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com> <1381134884-5816-28-git-send-email-treding@nvidia.com> <52587F2D.9070007@wwwdotorg.org> <525B880A.7090802@nvidia.com> <20131014140010.GC16302@ulmo.nvidia.com> <525C3497.6010700@wwwdotorg.org> <20131015083731.GI7856@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131015083731.GI7856-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/15/2013 02:37 AM, Thierry Reding wrote:
> On Mon, Oct 14, 2013 at 12:14:47PM -0600, Stephen Warren wrote:
>> On 10/14/2013 08:00 AM, Thierry Reding wrote:
>>> On Mon, Oct 14, 2013 at 08:58:34AM +0300, Terje Bergstr=C3=B6m
>>> wrote:
>>>> On 12.10.2013 01:43, Stephen Warren wrote:
>>>>> On 10/07/2013 02:34 AM, Thierry Reding wrote:
>>>>>> The gr2d hardware in Tegra114 is compatible with that of=20
>>>>>> Tegra20 and Tegra30. No functionaly changes are
>>>>>> required.
>>>>> Similarly here, if the HW is 100% backwards-compatible,
>>>>> there's no need to add compatible values to the driver.
>>>>=20
>>>> We've used this mechanism for attaching a per-hw-version
>>>> data structure in match table to accomodate differences in
>>>> how the hardware is power gated, reset, booted, some per-soc
>>>> performance related changes etc. It's also used in staging
>>>> features for new chips, such as disabling power features when
>>>> they're not working/verified yet.
>>>>=20
>>>> Upstream driver is not yet in a state where that is
>>>> relevant.
>>>>=20
>>>> With this, would we still be able to do that with match
>>>> table? It sounds like we could, because we can still (even
>>>> with multiple compatible properties) add separate entries in
>>>> match table and I guess the compatible properties matched in
>>>> order.
>>>=20
>>> Yes, as long as the device tree files includes the most
>>> specific value in the compatible this should still be possible.
>>> So we'd have this:
>>>=20
>>> gr2d@54140000 { compatible =3D "nvida,tegra114-gr2d",=20
>>> "nvidia,tegra20-gr2d"; ... };
>>>=20
>>> and the driver will match on "nvidia,tegra20-gr2d" if the more=20
>>> specific "nvidia,tegra114-gr2d" is not there. When the driver
>>> is updated to support Tegra114 specific functionality, then a
>>> more specific entry can be added to the compatible table to
>>> handle it.
>>=20
>> True, but the DT fragment above is also only accurate /if/ a
>> driver that only knows about "nvidia,tegra20-gr2d" can operate
>> 100% of the features in Tegra20 HW on Tegra114 HW forever.
>=20
> Yes, but given that we also list "nvidia,tegra114-gr2d" in the
> property it will be possible to add that to the driver when new
> functionality is implemented and immediately take advantage of it
> on Tegra114 hardware with an old device tree file which has both
> compatible values.

Taking advantage of new functionality isn't the issue. The issue is
whether a driver that was written purely to the spec of Tegra20 can
successfully operate on the HW. If it can't, then the HW is not
compatible with Tegra20. Terje's previous comments sounded like the HW
is not backwards-compatible, although his more recent comments make it
sound like only SW policy differences, which shouldn't be part of DT
anyway.
