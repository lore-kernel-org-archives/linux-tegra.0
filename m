From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v6 15/20] tegra: fdt: Add function to return
 peripheral/clock ID
Date: Tue, 28 Feb 2012 15:50:19 -0800
Message-ID: <CAPnjgZ2vwck_u1HVbpz=B4QjiCVoLeX6TcvwMi-o71Fqt_m3NQ@mail.gmail.com>
References: <1330375973-10681-1-git-send-email-sjg@chromium.org>
	<1330375973-10681-16-git-send-email-sjg@chromium.org>
	<4F4C149E.3070505@nvidia.com>
	<CAPnjgZ24vhy7NKj_Dt_dzn0qJ8=rj4nF04WSsY8u9MorAanzVA@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF17BDDF1DB4@HQMAIL01.nvidia.com>
	<CAPnjgZ2+6k0Ww30vrc_Qb0AnKWVfq0BaCK85HXpzTD0q67smjQ@mail.gmail.com>
	<74CDBE0F657A3D45AFBB94109FB122FF17BDDF1DC8@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17BDDF1DC8-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

On Tue, Feb 28, 2012 at 10:51 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
> Simon Glass wrote at Tuesday, February 28, 2012 11:44 AM:
>> On Tue, Feb 28, 2012 at 10:37 AM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org=
> wrote:
>> > Simon Glass wrote at Tuesday, February 28, 2012 10:46 AM:
>> >> On Mon, Feb 27, 2012 at 3:41 PM, Stephen Warren <swarren@nvidia.c=
om> wrote:
>> >> > On 02/27/2012 01:52 PM, Simon Glass wrote:
>> >> >> A common requirement is to find the clock ID for a peripheral.=
 This is the
>> >> >> second cell of the 'clocks' property (the first being the phan=
dle itself).
>> >> >
>> >> >> +int clock_decode_periph_id(const void *blob, int node)
>> >> >
>> >> >> + =A0 =A0 valid =3D clock_periph_id_isvalid(id);
>> >> >
>> >> > clock_periph_id_isvalid() is not the correct function to use he=
re; the
>> >> > code should be checking for invalid IDs in the CAR binding, not=
 invalid
>> >> > IDs in the HW periph ID definition. They're different.
>> >> >
>> >> > Just to be explicit, the function you need here would be:
>> >> >
>> >> > int clkid_to_periphid(int clkid)
>> >> > {
>> >> > =A0 =A0if (clk_id > 95)
>> >> > =A0 =A0 =A0 =A0return -1;
>> >> > =A0 =A0switch (clk_id) {
>> >> > =A0 =A0case 1:
>> >> > =A0 =A0case 2:
>> >> > =A0 =A0case 7:
>> >> > =A0 =A0case 10:
>> >> > =A0 =A0case 20:
>> >> > =A0 =A0case 30:
>> >> > =A0 =A0case 35:
>> >> > =A0 =A0case 49:
>> >> > =A0 =A0case 56:
>> >> > =A0 =A0case 74:
>> >> > =A0 =A0case 77:
>> >> > =A0 =A0case 78:
>> >> > =A0 =A0case 79:
>> >> > =A0 =A0case 80:
>> >> > =A0 =A0case 81:
>> >> > =A0 =A0case 82:
>> >> > =A0 =A0case 83:
>> >> > =A0 =A0case 91:
>> >> > =A0 =A0case 95:
>> >> > =A0 =A0 =A0 =A0return -1;
>> >> > =A0 =A0default:
>> >> > =A0 =A0 =A0 =A0return clkid;
>> >> > =A0 =A0}
>> >> > }
>> >>
>> >> Ick.
>> >>
>> >> Why is 7 in there,
>> >
>> > 7 affects both the UART2 and VFIR clocks/blocks.
>> >
>> >> and did you miss 76?
>> >
>> > No, that's the undocumented "la" clock.
>> >
>> >> Also U-Boot only goes up to 88
>> >> at present so should I change the first test to match?
>> >
>> > No, clocks 89, 90, 92, 93, and 94 are defined in the binding, whic=
h
>> > matches the CLK_OUT_ENB registers in the Tegra CAR HW (albeit not =
the
>> > CLK_RST registers, since there are some differences between the tw=
o).
>>
>> For both of your comments, since they aren't used in U-Boot, wouldn'=
t
>> it be more correct to flag these as errors also? We would have to
>> update at least the clock.h header to support them.
>
> It's probably more correct to update the periph_id enum to define all
> the valid values, but either way is fine.

OK - BTW what does 'LA' stand for?

Regards,
Simon

>
> --
> nvpublic
>
