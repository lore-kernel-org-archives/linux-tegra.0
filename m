From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/6] ARM: tegra: Add auxiliary data for nvhost
Date: Mon, 26 Nov 2012 11:40:02 +0200
Message-ID: <50B338F2.5060501@nvidia.com>
References: <1353577684-7896-1-git-send-email-tbergstrom@nvidia.com> <1353577684-7896-3-git-send-email-tbergstrom@nvidia.com> <20121123234527.GE21555@avionic-0098.adnet.avionic-design.de> <50B07297.3090001@nvidia.com> <20121124191103.GD26154@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121124191103.GD26154-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 24.11.2012 21:11, Thierry Reding wrote:
> On Sat, Nov 24, 2012 at 09:09:11AM +0200, Terje Bergstr=C3=B6m wrote:
>> The host1x specifics (number of channels, pts etc) are description o=
f
>> hardware, so they could go to a device tree binding.
>=20
> I'm not sure that's even required. The number of syncpoints and chann=
els
> should be static for a particular version of SoC, right? In that case=
 it
> can be derived from the DT compatible property, can't it?

I might be a bit confused here about the purpose of device trees.

The register aperture, irqs and enumerated list of devices could also b=
e
derived from the information about host1x compatibility properly. They
don't change within SoC version. Why do we have them in device tree?

I have considered device trees to be the alternative to being able to
query hardware. As we can't ask the hardware the number of sync points
and channels, we should have them in device trees in the same way as we
have IO apertures and list of client modules.

Terje
