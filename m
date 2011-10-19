From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [RFC] [PATCH] ARM: tegra: emc: device tree bindings
Date: Wed, 19 Oct 2011 08:19:53 -0700
Message-ID: <CAOesGMiz+u4s2e-XBTrz2ssFEtug_ZRXUTXfx9gYG9_rN=a86w@mail.gmail.com>
References: <1318873976-25335-1-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF173CA2CBFB@HQMAIL01.nvidia.com>
	<CAOesGMh387Oghyd_TobnTOja6tU2uU5kt-86_HwQe7nFiL+svw@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF173CA2CC18@HQMAIL01.nvidia.com>
	<CAOesGMghu6Bn3RrFKEUBKkUNS_K8Y0ho3Y2uFZh_LXbfT80hFw@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF173CA2CCA9@HQMAIL01.nvidia.com>
	<4E9E3801.6080707@gmail.com>
	<CAOesGMj8TREZ94RFhE3Qy=eaytOuB0YKBWw6--HAERoMB9m7Qg@mail.gmail.com>
	<4E9EE07A.20301@gmail.com>
	<CAOesGMhfAxrG4pMQ86XFzmBnHwBgrD=45eTvmA0-G2gTjaSL6Q@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF173D51BDEB@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF173D51BDEB-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 19, 2011 at 8:11 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> Olof Johansson wrote at Wednesday, October 19, 2011 9:07 AM:
>> On Wed, Oct 19, 2011 at 7:36 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>=
 wrote:
> ...
>> > Using the frequency as was previously proposed would work assuming=
 that
>> > is unique.
>>
>> Someone suggested (off-list) to just use dummy addressing like cpu
>> nodes do. Sounds reasonable to me.
>>
>> So:
>>
>> emc {
>> =A0 compatible =3D "tegra20-emc";
>> =A0 nvidia,use-ram-code;
>> =A0 emc-tables@<ram-code> {
>> =A0 =A0 =A0nvidia,ram-code =3D < <ram-code> >;
>> =A0 =A0 =A0emc-table@<dummy enumerator> {
>> =A0 =A0 =A0 =A0 compatible =3D "tegra20-emc-table";
>> =A0 =A0 =A0 =A0 clock-frequency =3D < >;
>> =A0 =A0 =A0 =A0 nvidia,emc-regs =3D < >;
>> =A0 =A0 =A0}
>> =A0 }
>>
>> This also avoids having to handle 2-dimensional dummy numbering (i.e=
=2E
>> <ramcode,table-number>) by breaking it in two levels:
>>
>> Where nvidia,use-ram-code is missing in the emc node, the immediate
>> child nodes will be scanned for the compatible nodes
>> Where nvidia,use-ram-code is present, first scan will be of all chil=
d
>> nodes containing an nvidia,ram-code property, then from there treat =
it
>> the same as the first case.
>>
>> In the above, none of the names have meaning, so they can be changed
>> as needed (but these seem like a reasonably generic and descriptive
>> name to me).
>
> OK, I'm good with that general structure.
>
> But, as Rob suggests, you may as well use the frequency instead of th=
e
> <dummy enumerator> for the unit address of the final tables, right?
> The search algorithm might not care, but it'll be easier for humans
> to read the resulting dts file.

Sure, anything can probably be used so that's fine with me -- it won't
change the table walking code.


-Olof
