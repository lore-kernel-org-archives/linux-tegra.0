From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V5 07/11] of: Add bindings of hw-trip-points for soctherm
Date: Mon, 15 Feb 2016 15:15:09 +0800
Message-ID: <56C17AFD.8050203@nvidia.com>
References: <1454057260-16412-1-git-send-email-wni@nvidia.com> <CAL_JsqKwQOxkWyYPcv6sBe8ELUuPx4N+iUF94J8R63bRxsGK4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL_JsqKwQOxkWyYPcv6sBe8ELUuPx4N+iUF94J8R63bRxsGK4g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Zhang Rui <rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi, Rob

On 2016=E5=B9=B402=E6=9C=8812=E6=97=A5 22:42, Rob Herring wrote:
> On Fri, Jan 29, 2016 at 2:47 AM, Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> Add hw-trips sub-node for soctherm, which is
>> used to describe the hardware trip points for
>> each soctherm sensors.
>=20
> I still don't understand why you are doing something custom here.
> What's wrong with what is defined in:
>=20
> Documentation/devicetree/bindings/thermal/thermal.txt

In current thermal framework, it support to set trip points for the the=
rmal
zones, but this trip point is handled by SW, doesn't have callbacks to =
program
the hardware.
There had patches:
[PATCH 12/16] thermal: thermal: Add support for hardware-tracked trip p=
oints,
http://lists.infradead.org/pipermail/linux-mediatek/2015-May/000866.htm=
l,
which can support to program hardware to set trip points, but it seems =
this
series didn't be taken.
So I add this hw-trip-points sub-node for soctherm.

Hi, Sascha Hauer

Thanks.
Wei.

>=20
> Rob
>=20
