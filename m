From: Leon Romanovsky <leon@leon.nu>
Subject: Re: [PATCH 1/3] ARM: dt: tegra: Enable device tree audio on PAZ00 board.
Date: Fri, 27 Jan 2012 19:03:50 +0200
Message-ID: <CALq1K=Ld2+zsJBBpBtis6sDYmGMoPNq3XUhKGYASbro20pHw_A@mail.gmail.com>
References: <1327517363-29698-1-git-send-email-leon@leon.nu>
 <74CDBE0F657A3D45AFBB94109FB122FF178CB821B2@HQMAIL01.nvidia.com>
 <CALq1K=+1czTOPyQOU05H8psyGO5RncOHrJm+tLtzOdTLHqtVDQ@mail.gmail.com> <74CDBE0F657A3D45AFBB94109FB122FF178E123E36@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF178E123E36@HQMAIL01.nvidia.com>
Sender: linux-doc-owner@vger.kernel.org
To: Stephen Warren <swarren@nvidia.com>
Cc: "grant.likely@secretlab.ca" <grant.likely@secretlab.ca>, "rdunlap@xenotime.net" <rdunlap@xenotime.net>, "lrg@ti.com" <lrg@ti.com>, "broonie@opensource.wolfsonmicro.com" <broonie@opensource.wolfsonmicro.com>, "olof@lixom.net" <olof@lixom.net>, "ccross@android.com" <ccross@android.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Marc Dietrich <marvin24@gmx.de>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jan 27, 2012 at 18:45, Stephen Warren <swarren@nvidia.com> wrot=
e:
> Leon Romanovsky wrote at Friday, January 27, 2012 9:02 AM:
>> On Thu, Jan 26, 2012 at 00:21, Stephen Warren <swarren@nvidia.com> w=
rote:
>> > Leon Romanovsky wrote at Wednesday, January 25, 2012 11:49 AM:
>> >> This patch adds initial device tree support of ALC5632 sound code=
c and
>> >> machine driver for PAZ00 board. The implementation is based on th=
e WM8903 codec.
>> >
>> >> +++ b/Documentation/devicetree/bindings/sound/tegra-audio-alc5632=
=2Etxt
>> >> @@ -0,0 +1,55 @@
>> >> +NVIDIA Tegra audio complex
>> >> +
>> >> +Required properties:
>> >> +- compatible : "nvidia,tegra-audio-alc5632"
>> >> +- nvidia,model : The user-visible name of this sound complex.
>> >> +- nvidia,audio-routing : A list of the connections between audio=
 components.
>> >> + =C2=A0Each entry is a pair of strings, the first being the conn=
ection's sink,
>> >> + =C2=A0the second being the connection's source. Valid names for=
 sources and
>> >> + =C2=A0sinks are the ALC5632's pins:
>> >> +
>> >> + =C2=A0ALC5632 pins:
>> >> +
>> >> + =C2=A0* SPKOUT
>> >> + =C2=A0* SPKOUTN
>> >> + =C2=A0* HPL
>> >> + =C2=A0* HPR
>> >> + =C2=A0* AUXOUT
>> >
>> > My copy of the ALC5632 datasheet indicates there are both AUX_OUT_=
P and
>> > AUX_OUTN pins. Are they always used together such that it makes se=
nse to
>> > group them together in the device tree binding?
>>
>> You are right, it must be the same as SPKOUT
>
> I think the opposite; AUXOUT and SPKOUT aren't the same pin. I meant
> that AUX_OUT_P and AUX_OUT_N are different pins, so I'm asking why th=
ey're
> a single pin in the above pin list (and in the ASoC codec driver). In
> contrast, SPKOUT is represented explicitly as two pins which seems to=
 make
> more sense.
Sorry for the misunderstanding, This is what i wanted to say.

>
>> >> + =C2=A0* LINEINL
>> >> + =C2=A0* LINEINR
>> >> + =C2=A0* PHONEP
>> >> + =C2=A0* PHONEP
>> >
>> > PHONEN
>> >
>> >> + =C2=A0* MIC1
>> >> + =C2=A0* MIC2
>> >
>> > Same as above; the datasheet lists MIC1_P, MIC1_N, MIC2_P, MIC2_N.
>> >
>> >> + =C2=A0* MICBIAS1
>> >> + =C2=A0* MICBIAS2
>> >
>> > I only see MICBIAS1 in the datasheet, not MICBIAS2.
>>
>> You are right if you are looking on function block only (page 3), bu=
t
>> in register description you can find reference to MICBIAS2 (reg 22h,
>> microphone control).
>
> I do see that register bit, but the pinout doesn't include it in the
> codec's own datasheet nor the AC100 schematics. I suspect that there
> really is no MICBIAS2 feature and the register documentation is simpl=
y
> incorrect, perhaps a carry-over from some other codec? Still, I suppo=
se
> that just in case the signal really is routed to one of the pins labe=
led
> "NC" in the datasheet, there isn't too much harm including it in the
> driver, and this binding.
Sure

>
>> >> + =C2=A0Board connectors:
> ...
>> > Don't you need "Headset Mic" in the list too?
> ...
>> >> + =C2=A0 =C2=A0 nvidia,audio-routing =3D
> ...
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "MIC1", "MICBIAS1",
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "MICBIAS1", "Headset Mic",
>> >
>> > I think those last two lines should read:
>> >
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"Headset Mic", "MICBIAS1",
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"MIC1", " Headset Mic",
>> >
>> > The DAPM route table in the driver probably needs updating to say =
the
>> > same thing too.
>>
>> Microphone is not tested at all, so you probably right. I prefer to =
be
>> close as possible to previous board implementation and provide
>> followup patches to clean the microphone path.
>
> I guess that doesn't actually affect the structure of the binding, ju=
st
> the data contained in the properties, so it's not a big deal if it go=
es
> in like this. Mark might have a different opinion though, since it's
> a simple fix...
>
> --
> nvpublic
>



--=20
Leon Romanovsky | Independent Linux Consultant
=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0www.leon.nu=C2=A0| leon@leon.nu
