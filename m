From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC 1/2] ARM:Tegra: Device Tree Support: Initialize the audio
 card from the device tree.
Date: Wed, 1 Jun 2011 10:47:06 -0600
Message-ID: <BANLkTi=PtEhxxmZo2DqvmySCmnEd3LbezQ@mail.gmail.com>
References: <20110527205444.21000.90209.stgit@riker> <20110527205706.21000.34832.stgit@riker>
 <BANLkTi=NMjBjWVv_o3PocejhgGr8TdG+1Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <BANLkTi=NMjBjWVv_o3PocejhgGr8TdG+1Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 1, 2011 at 1:07 AM, Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 2011/5/28 John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>:
>> This patch makes it so the top level audio card is initialized from =
the device
>> tree. This is just the first step getting the audio complex of devic=
es
>> iniialized from device tree nodes.
>>
>> Signed-off-by: John Bonesio<bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>> ---
>>
>> =A0arch/arm/boot/dts/tegra-harmony.dts | =A0 =A04 +++
>> =A0arch/arm/mach-tegra/board-dt.c =A0 =A0 =A0| =A0 =A03 ++
>> =A0sound/soc/tegra/harmony.c =A0 =A0 =A0 =A0 =A0 | =A0 45 ++++++++++=
++++++++++++++++++++++---
>> =A03 files changed, 48 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/tegra-harmony.dts b/arch/arm/boot/dts=
/tegra-harmony.dts
>> index 05521a5..217a7f0 100644
>> --- a/arch/arm/boot/dts/tegra-harmony.dts
>> +++ b/arch/arm/boot/dts/tegra-harmony.dts
>> @@ -53,6 +53,10 @@
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0clock-frequency =3D <400000>;
>> =A0 =A0 =A0 =A0};
>>
>> + =A0 =A0 =A0 harmony_audio: audio_card {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,harmony-audio";
>> + =A0 =A0 =A0 };
>> +
>> =A0 =A0 =A0 =A0serial@70006300 {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0status =3D "ok";
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0clock-frequency =3D < 216000000 >;
>> diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/bo=
ard-dt.c
>> index c498e84..a569ad9 100644
>> --- a/arch/arm/mach-tegra/board-dt.c
>> +++ b/arch/arm/mach-tegra/board-dt.c
>> @@ -56,6 +56,9 @@ static struct platform_device *tegra250_devices[] =
__initdata =3D {
>> =A0 =A0 =A0 =A0&tegra_i2c_device2,
>> =A0 =A0 =A0 =A0&tegra_i2c_device3,
>> =A0 =A0 =A0 =A0&tegra_i2c_device4,
>> + =A0 =A0 =A0 &tegra_i2s_device1,
>> + =A0 =A0 =A0 &tegra_das_device,
>> + =A0 =A0 =A0 &tegra_pcm_device,
>
> i am thinking whether platform_device should be created by
> of_platform_device_create after scanning device tree, but not by
> hard-code? looks like the two patches are only trying to let device
> tree deliver gpio to drivers?

Can you please restate your question?  I don't think I understand what
you are trying to ask.

g.
