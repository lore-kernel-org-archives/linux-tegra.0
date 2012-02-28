From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v6 11/20] tegra: fdt: Add clock bindings for Tegra2
 Seaboard
Date: Tue, 28 Feb 2012 09:32:23 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17BDDF1D6A@HQMAIL01.nvidia.com>
References: <1330375973-10681-1-git-send-email-sjg@chromium.org>
	<1330375973-10681-12-git-send-email-sjg@chromium.org>
	<4F4C11E9.1050907@nvidia.com>
 <CAPnjgZ0_xzn0tvETt3C=pjyRX-MXNA-JXy4fuAs9L8OdHuvLhg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAPnjgZ0_xzn0tvETt3C=pjyRX-MXNA-JXy4fuAs9L8OdHuvLhg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Simon Glass wrote at Tuesday, February 28, 2012 10:21 AM:
> On Mon, Feb 27, 2012 at 3:29 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> =
wrote:
> > On 02/27/2012 01:52 PM, Simon Glass wrote:
> >> Add the definition of the oscillator clock frequency.
> >
> >> diff --git a/board/nvidia/dts/tegra2-seaboard.dts b/board/nvidia/d=
ts/tegra2-seaboard.dts
> >
> >> + =A0 =A0 clock@60006000 {
> >> + =A0 =A0 =A0 =A0 =A0 =A0 clocks =3D <&osc>;
> >> + =A0 =A0 };
> >
> > The CAR takes two clock inputs; one 32KHz clock (typically from the
> > PMU/PMIC) and one from the oscillator. The 32KHz one is missing her=
e. I
> > guess this won't make any difference to U-Boot since it isn't using=
 the
> > clock inputs in the CAR driver, but it'd be best if the .dts file
> > contained the correct content so it didn't act as an incorrect exam=
ple.
> > See the example in the binding documentation for what should be the=
re.
>=20
> Yes I saw that - but it adds an i2c binding which I don't yet have. I
> add i2c in the next series.
>=20
> I will add that one i2c node here.

The clock doesn't /have/ to be represented by its full I2C source; you
could represent it as another global fixed-clock source until the I2C
node is available to act as a clock source.

Note that in order to actually use the tps6586x node to provide the
clock source, you'll need to write or modify the tps6586x's bindings to
document which clock sources it provides. I haven't actually looked at
the tps6586x's bindings at all; it's possible that part of the example
is entirely incorrect. In my original email I quoted above, the part
of the example I was caring about was that the CAR itself needs two
entries in its clocks property; I don't really care where they come fro=
m
at present.

--=20
nvpublic
