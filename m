From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH V3] ARM: tegra: Define Tegra20 CAR binding
Date: Wed, 15 Feb 2012 12:25:15 -0800
Message-ID: <CAPnjgZ0VGt4+aY4ck9kjRycY+k_UyzRBxAbDD1V_O=MTyOpiCQ@mail.gmail.com>
References: <1329329667-26725-1-git-send-email-swarren@nvidia.com>
	<CAPnjgZ32TD_P4Pa650Y1MpxryxSOMtJHdJB28ZNFxv4hxqGMRA@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF178FACB8D6@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF178FACB8D6-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

On Wed, Feb 15, 2012 at 11:14 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
> Simon Glass wrote at Wednesday, February 15, 2012 11:45 AM:
>> On Wed, Feb 15, 2012 at 10:14 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org=
> wrote:
>> > The Tegra20 CAR (Clock And Reset) Controller controls most aspects=
 of
>> > most clocks within Tegra20. The device tree binding models this as=
 a
>> > single monolithic clock provider, which exports ~130 clocks. This =
reduces
>> > the number of nodes needed in device tree to represent these clock=
s.
>> >
>> > This binding is only useful for Tegra20; the set of clocks that ex=
ists on
>> > Tegra30 is sufficiently different to merit its own binding.
>>
>> It seems there is a large common element - they are almost backwards
>> compatible. Should we not at least look at this now?
>
> I don't believe there's any need for the clock IDs for the two chips =
to
> align in any way. These are two different chips, with different sets =
of
> clocks, different tegra*.dtsi files, different clock "drivers" that d=
efine
> the available clocks, etc.
>
> And while as you say, there are a lot of similarities, there are also=
 a
> number of differences within these first 96 clocks which make having
> things completely aligned impractical. I imagine you'd rather that
> Tegra30's binding follow Tegra30's CLK_OUT_ENB register layouts exact=
ly,
> rather than attempting to align with Tegra20 even in the face of
> differences in HW.

OK my question was really more about how you deal with multi-arch in
Linux / U-Boot. Does it make sense to ignore the commonality. Perhaps
instead the range from 96 to 160 should be reserved?

>
>> > + =A073 =A0 csite
>>
>> Would 'coresight' be better given that you have csi also?
>
> The clock is named "csite" in the TRM; renaming it would make it hard=
er
> to correlate the binding with the TRM.

OK

>
>> > + =A076 =A0 la
>>
>> What is this one?
>
> It's in the kernel's tegra2_clocks.c. It's undocumented, but I've
> confirmed that it does exist.

OK

>
>> + =A096 =A0 uart2
>> + =A097 =A0 vfir
>> + =A098 =A0 spdif_in
>> + =A099 =A0 spdif_out
>> + =A0100 =A0vi
>> + =A0101 =A0vi_sensor
>> + =A0102 =A0tvo
>> + =A0103 =A0cve
>>
>> These clocks follow on directly from the above numbers. What is your
>> plan for T30? I think this has another 64 clocks. Should we reserve
>> those spaces now so that the binding are compatible between the two?
>
> For Tegra30, I imagine the first 160 clock IDs would be assigned in a
> way that matches the CLK)OUT_ENB registers (since there are 160 bits =
in
> them), and any other clocks would be assigned IDs starting with 160.
>
> P.S. Your HTML mail was a little hard to quote.

Sorry, I turned it on to send something odd, and forgot to turn it off.

Regards,
Simon

>
> --
> nvpublic
>
