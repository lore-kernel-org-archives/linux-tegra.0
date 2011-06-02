From: Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 1/2] ARM:Tegra: Device Tree Support: Initialize the audio
 card from the device tree.
Date: Fri, 3 Jun 2011 00:21:50 +0800
Message-ID: <BANLkTikGp_O-Wd3nMhbV+-RLeXZoWeB6eQ@mail.gmail.com>
References: <20110527205444.21000.90209.stgit@riker> <20110527205706.21000.34832.stgit@riker>
 <BANLkTi=NMjBjWVv_o3PocejhgGr8TdG+1Q@mail.gmail.com> <BANLkTi=PtEhxxmZo2DqvmySCmnEd3LbezQ@mail.gmail.com>
 <BANLkTikWpiY_o27OF-Jxvq7iPeWzrAYOsQ@mail.gmail.com> <20110602160445.GA8373@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110602160445.GA8373-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

2011/6/3 Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>
> On Thu, Jun 02, 2011 at 05:07:02PM +0800, Barry Song wrote:
> > 2011/6/2 Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>:
> > > On Wed, Jun 1, 2011 at 1:07 AM, Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wr=
ote:
> > >> 2011/5/28 John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>:
> > >>> This patch makes it so the top level audio card is initialized =
from the device
> > >>> tree. This is just the first step getting the audio complex of =
devices
> > >>> iniialized from device tree nodes.
> > >>>
> > >>> Signed-off-by: John Bonesio<bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> > >>> ---
> > >>>
> > >>> =C2=A0arch/arm/boot/dts/tegra-harmony.dts | =C2=A0 =C2=A04 +++
> > >>> =C2=A0arch/arm/mach-tegra/board-dt.c =C2=A0 =C2=A0 =C2=A0| =C2=A0=
 =C2=A03 ++
> > >>> =C2=A0sound/soc/tegra/harmony.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | =C2=A0 45 ++++++++++++++++++++++++++++++++---
> > >>> =C2=A03 files changed, 48 insertions(+), 4 deletions(-)
> > >>>
> > >>> diff --git a/arch/arm/boot/dts/tegra-harmony.dts b/arch/arm/boo=
t/dts/tegra-harmony.dts
> > >>> index 05521a5..217a7f0 100644
> > >>> --- a/arch/arm/boot/dts/tegra-harmony.dts
> > >>> +++ b/arch/arm/boot/dts/tegra-harmony.dts
> > >>> @@ -53,6 +53,10 @@
> > >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clock-fr=
equency =3D <400000>;
> > >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0};
> > >>>
> > >>> + =C2=A0 =C2=A0 =C2=A0 harmony_audio: audio_card {
> > >>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 compatible =3D=
 "nvidia,harmony-audio";
> > >>> + =C2=A0 =C2=A0 =C2=A0 };
> > >>> +
> > >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0serial@70006300 {
> > >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0status =3D=
 "ok";
> > >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clock-fr=
equency =3D < 216000000 >;
> > >>> diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-teg=
ra/board-dt.c
> > >>> index c498e84..a569ad9 100644
> > >>> --- a/arch/arm/mach-tegra/board-dt.c
> > >>> +++ b/arch/arm/mach-tegra/board-dt.c
> > >>> @@ -56,6 +56,9 @@ static struct platform_device *tegra250_devic=
es[] __initdata =3D {
> > >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0&tegra_i2c_device2,
> > >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0&tegra_i2c_device3,
> > >>> =C2=A0 =C2=A0 =C2=A0 =C2=A0&tegra_i2c_device4,
> > >>> + =C2=A0 =C2=A0 =C2=A0 &tegra_i2s_device1,
> > >>> + =C2=A0 =C2=A0 =C2=A0 &tegra_das_device,
> > >>> + =C2=A0 =C2=A0 =C2=A0 &tegra_pcm_device,
> > >>
> > >> i am thinking whether platform_device should be created by
> > >> of_platform_device_create after scanning device tree, but not by
> > >> hard-code? looks like the two patches are only trying to let dev=
ice
> > >> tree deliver gpio to drivers?
> > >
> > > Can you please restate your question? =C2=A0I don't think I under=
stand what
> > > you are trying to ask.
> >
> > i mean we don't need to have this platform device registerred by th=
e
> > old way here. we may get it by matching information in dts and dele=
te
> > all platform_device and related codes in arch/arm. For example:
>
> Ah, I see what you mean. =C2=A0Yes, it is ultimately the goal to regi=
ster
> all the device from data in the device tree, but we're taking things
> one step at a time. =C2=A0For this series, it is expedient to registe=
r the
> on-chip devices, and to move to dynamic registration later.
>
> Right now we can't do dynamic registration for on-chip devices in a
> lot of cases because we don't have the infrastructure to hook up the
> associated struct clks.
Arnd has required me to use device tree in our new SoC for the coming
upstream. so i am trying to define a property like clock =3D "uart" in
dts. then in drivers,
i get this  string by:
clk =3D of_get_property(np, "clock", NULL);
then request this clock by clk_get().

it does work for the moment, but maybe is not what you like :-)

>
> g.
>
>
