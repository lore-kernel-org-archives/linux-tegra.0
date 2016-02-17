From: Wei Ni <wni@nvidia.com>
Subject: Re: [PATCH V5 07/11] of: Add bindings of hw-trip-points for soctherm
Date: Wed, 17 Feb 2016 17:46:37 +0800
Message-ID: <56C4417D.2030409@nvidia.com>
References: <1454057260-16412-1-git-send-email-wni@nvidia.com> <CAL_JsqKwQOxkWyYPcv6sBe8ELUuPx4N+iUF94J8R63bRxsGK4g@mail.gmail.com> <56C17AFD.8050203@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <56C17AFD.8050203@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Thierry Reding <thierry.reding@gmail.com>, Zhang Rui <rui.zhang@intel.com>, MLongnecker@nvidia.com, Stephen Warren <swarren@wwwdotorg.org>, Mikko Perttunen <mikko.perttunen@kapsi.fi>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi, Rob

On 2016=E5=B9=B402=E6=9C=8815=E6=97=A5 15:15, Wei Ni wrote:
> Hi, Rob
>=20
> On 2016=E5=B9=B402=E6=9C=8812=E6=97=A5 22:42, Rob Herring wrote:
>> On Fri, Jan 29, 2016 at 2:47 AM, Wei Ni <wni@nvidia.com> wrote:
>>> Add hw-trips sub-node for soctherm, which is
>>> used to describe the hardware trip points for
>>> each soctherm sensors.
>>
>> I still don't understand why you are doing something custom here.
>> What's wrong with what is defined in:
>>
>> Documentation/devicetree/bindings/thermal/thermal.txt

I think it's better to add a .set_trip_temp for of-thermal's
thermal_zone_of_device_ops{}, so that we can set trip points on hardwar=
e. I'm
preparing patches, and will send out next version.
Thanks for your comments.

>=20
> In current thermal framework, it support to set trip points for the t=
hermal
> zones, but this trip point is handled by SW, doesn't have callbacks t=
o program
> the hardware.
> There had patches:
> [PATCH 12/16] thermal: thermal: Add support for hardware-tracked trip=
 points,
> http://lists.infradead.org/pipermail/linux-mediatek/2015-May/000866.h=
tml,
> which can support to program hardware to set trip points, but it seem=
s this
> series didn't be taken.
> So I add this hw-trip-points sub-node for soctherm.
>=20
> Hi, Sascha Hauer
>=20
> Thanks.
> Wei.
>=20
>>
>> Rob
>>
