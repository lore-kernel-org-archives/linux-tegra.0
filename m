From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC 1/2] ARM:Tegra: Device Tree Support: Initialize the audio
 card from the device tree.
Date: Thu, 2 Jun 2011 10:04:45 -0600
Message-ID: <20110602160445.GA8373@ponder.secretlab.ca>
References: <20110527205444.21000.90209.stgit@riker>
 <20110527205706.21000.34832.stgit@riker>
 <BANLkTi=NMjBjWVv_o3PocejhgGr8TdG+1Q@mail.gmail.com>
 <BANLkTi=PtEhxxmZo2DqvmySCmnEd3LbezQ@mail.gmail.com>
 <BANLkTikWpiY_o27OF-Jxvq7iPeWzrAYOsQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <BANLkTikWpiY_o27OF-Jxvq7iPeWzrAYOsQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jun 02, 2011 at 05:07:02PM +0800, Barry Song wrote:
> 2011/6/2 Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>:
> > On Wed, Jun 1, 2011 at 1:07 AM, Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
> >> 2011/5/28 John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>:
> >>> This patch makes it so the top level audio card is initialized fr=
om the device
> >>> tree. This is just the first step getting the audio complex of de=
vices
> >>> iniialized from device tree nodes.
> >>>
> >>> Signed-off-by: John Bonesio<bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> >>> ---
> >>>
> >>> =A0arch/arm/boot/dts/tegra-harmony.dts | =A0 =A04 +++
> >>> =A0arch/arm/mach-tegra/board-dt.c =A0 =A0 =A0| =A0 =A03 ++
> >>> =A0sound/soc/tegra/harmony.c =A0 =A0 =A0 =A0 =A0 | =A0 45 +++++++=
+++++++++++++++++++++++++---
> >>> =A03 files changed, 48 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/arch/arm/boot/dts/tegra-harmony.dts b/arch/arm/boot/=
dts/tegra-harmony.dts
> >>> index 05521a5..217a7f0 100644
> >>> --- a/arch/arm/boot/dts/tegra-harmony.dts
> >>> +++ b/arch/arm/boot/dts/tegra-harmony.dts
> >>> @@ -53,6 +53,10 @@
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0clock-frequency =3D <400000>;
> >>> =A0 =A0 =A0 =A0};
> >>>
> >>> + =A0 =A0 =A0 harmony_audio: audio_card {
> >>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,harmony-audi=
o";
> >>> + =A0 =A0 =A0 };
> >>> +
> >>> =A0 =A0 =A0 =A0serial@70006300 {
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0status =3D "ok";
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0clock-frequency =3D < 216000000 >;
> >>> diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra=
/board-dt.c
> >>> index c498e84..a569ad9 100644
> >>> --- a/arch/arm/mach-tegra/board-dt.c
> >>> +++ b/arch/arm/mach-tegra/board-dt.c
> >>> @@ -56,6 +56,9 @@ static struct platform_device *tegra250_devices=
[] __initdata =3D {
> >>> =A0 =A0 =A0 =A0&tegra_i2c_device2,
> >>> =A0 =A0 =A0 =A0&tegra_i2c_device3,
> >>> =A0 =A0 =A0 =A0&tegra_i2c_device4,
> >>> + =A0 =A0 =A0 &tegra_i2s_device1,
> >>> + =A0 =A0 =A0 &tegra_das_device,
> >>> + =A0 =A0 =A0 &tegra_pcm_device,
> >>
> >> i am thinking whether platform_device should be created by
> >> of_platform_device_create after scanning device tree, but not by
> >> hard-code? looks like the two patches are only trying to let devic=
e
> >> tree deliver gpio to drivers?
> >
> > Can you please restate your question? =A0I don't think I understand=
 what
> > you are trying to ask.
>=20
> i mean we don't need to have this platform device registerred by the
> old way here. we may get it by matching information in dts and delete
> all platform_device and related codes in arch/arm. For example:

Ah, I see what you mean.  Yes, it is ultimately the goal to register
all the device from data in the device tree, but we're taking things
one step at a time.  For this series, it is expedient to register the
on-chip devices, and to move to dynamic registration later.

Right now we can't do dynamic registration for on-chip devices in a
lot of cases because we don't have the infrastructure to hook up the
associated struct clks.

g.
