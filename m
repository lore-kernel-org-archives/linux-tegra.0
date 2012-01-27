From: Leon Romanovsky <leon-2ukJVAZIZ/Y@public.gmane.org>
Subject: Re: [PATCH 1/3] ARM: dt: tegra: Enable device tree audio on PAZ00 board.
Date: Fri, 27 Jan 2012 18:02:00 +0200
Message-ID: <CALq1K=+1czTOPyQOU05H8psyGO5RncOHrJm+tLtzOdTLHqtVDQ@mail.gmail.com>
References: <1327517363-29698-1-git-send-email-leon@leon.nu> <74CDBE0F657A3D45AFBB94109FB122FF178CB821B2@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF178CB821B2-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org" <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 26, 2012 at 00:21, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrot=
e:
> Leon Romanovsky wrote at Wednesday, January 25, 2012 11:49 AM:
>> This patch adds initial device tree support of ALC5632 sound codec a=
nd
>> machine driver for PAZ00 board. The implementation is based on the W=
M8903 codec.
>
>> +++ b/Documentation/devicetree/bindings/sound/tegra-audio-alc5632.tx=
t
>> @@ -0,0 +1,55 @@
>> +NVIDIA Tegra audio complex
>> +
>> +Required properties:
>> +- compatible : "nvidia,tegra-audio-alc5632"
>> +- nvidia,model : The user-visible name of this sound complex.
>> +- nvidia,audio-routing : A list of the connections between audio co=
mponents.
>> + =C2=A0Each entry is a pair of strings, the first being the connect=
ion's sink,
>> + =C2=A0the second being the connection's source. Valid names for so=
urces and
>> + =C2=A0sinks are the ALC5632's pins:
>> +
>> + =C2=A0ALC5632 pins:
>> +
>> + =C2=A0* SPKOUT
>> + =C2=A0* SPKOUTN
>> + =C2=A0* HPL
>> + =C2=A0* HPR
>> + =C2=A0* AUXOUT
>
> My copy of the ALC5632 datasheet indicates there are both AUX_OUT_P a=
nd
> AUX_OUTN pins. Are they always used together such that it makes sense=
 to
> group them together in the device tree binding?

You are right, it must be the same as SPKOUT

>
>> + =C2=A0* LINEINL
>> + =C2=A0* LINEINR
>> + =C2=A0* PHONEP
>> + =C2=A0* PHONEP
>
> PHONEN
>
>> + =C2=A0* MIC1
>> + =C2=A0* MIC2
>
> Same as above; the datasheet lists MIC1_P, MIC1_N, MIC2_P, MIC2_N.
>
>> + =C2=A0* MICBIAS1
>> + =C2=A0* MICBIAS2
>
> I only see MICBIAS1 in the datasheet, not MICBIAS2.
You are right if you are looking on function block only (page 3), but
in register description you can find reference to MICBIAS2 (reg 22h,
microphone control).

>
>> +
>> + =C2=A0Board connectors:
>> +
>> + =C2=A0* Headset Stereophone
>> + =C2=A0* Int Spk
>> + =C2=A0* MIC1
>> + =C2=A0* MICBIAS1
>
> Those last two are codec pins, not board connectors.
>
> Don't you need "Headset Mic" in the list too?
>
> ...
>> + =C2=A0 =C2=A0 nvidia,audio-routing =3D
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "Int Spk", "SPKOUT",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "Int Spk", "SPKOUTN",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "MIC1", "MICBIAS1",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "MICBIAS1", "Headset Mic",
>
> I think those last two lines should read:
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"Headset Mic", "MICBIAS1",
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"MIC1", " Headset Mic",
>
> The DAPM route table in the driver probably needs updating to say the
> same thing too.
>
> (all the comments on the example above apply to the copy in the .dts
> file too)
Microphone is not tested at all, so you probably right. I prefer to be
close as possible to previous board implementation and provide
followup patches to clean the microphone path.

> Overall, this looks like the same structure as the Tegra+WM8903 bindi=
ngs,
> so it works for me.


> --
> nvpublic
>



--=20
Leon Romanovsky | Independent Linux Consultant
=C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0www.leon.nu=C2=A0| leon-2ukJVAZIZ/Y@public.gmane.org
