From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 4/9] arm/tegra: fuse: add functions to access chip revision
Date: Wed, 4 Jan 2012 15:36:28 -0800
Message-ID: <CAOesGMg4-kkWdqEuorzzmKhg-HPChrcM1SeOsfcMkSKkohi5Gw@mail.gmail.com>
References: <1324599468-12845-1-git-send-email-olof@lixom.net>
	<1324599468-12845-5-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF17761F156A@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17761F156A-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 4, 2012 at 3:20 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:
> Olof Johansson wrote at Thursday, December 22, 2011 5:18 PM:
>> Add function to get chip revision, and print it out at boot time.
>>
>> Restructure the fuse access to just use cached variables instead
>> of always reading the fuses, and export those variables directly
>> instead of using accessor functions.
>>
>> Add a SKU ID table of currently known values.
>
>> +static enum tegra_revision tegra_get_revision(void)
>> +{
>> + =A0 =A0 void __iomem *chip_id =3D IO_ADDRESS(TEGRA_APB_MISC_BASE) =
+ 0x804;
>> + =A0 =A0 u32 id =3D readl(chip_id);
>> +
>> + =A0 =A0 switch ((id >> 16) & 0xf) {
>
> We probably should decode A01 too; I certainly had a Tegra30 A01 unti=
l
> recently, so it's entirely possible others do and want a meaningful
> result.

Ah yes, T30. I was thinking of T20/25 A01. I'll add it.

> Should the "A" should be decoded from the register too? It's bits 7:4
> of the register and IIRC, 0=3D??? 1=3DA, presumably 2=3DB etc.

Well, only A is documented in my TRM. :-)   I think it's safe to keep
it UNKNOWN until known.

>> + =A0 =A0 case 2:
>> + =A0 =A0 =A0 =A0 =A0 =A0 return TEGRA_REVISION_A02;
>> + =A0 =A0 case 3:
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (get_spare_fuse(18) || get_spare_fuse(1=
9))
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return TEGRA_REVISION_A03p=
;
>
> Does that apply equally to Tegra30 as well as Tegra20? I'm afraid I d=
on't
> know, but if you need I can try and find out.

I doubt it, so it needs to be conditional. Will add.

>> + =A0 =A0 =A0 =A0 =A0 =A0 else
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return TEGRA_REVISION_A03;
>> + =A0 =A0 case 4:
>> + =A0 =A0 =A0 =A0 =A0 =A0 return TEGRA_REVISION_A04;
>
> And there's space in the register for numbers higher than 4, although=
 I
> don't think there's any current silicon where this would matter.

Same here, not necessarily need to allocate all that much more than
what's known to be needed.


-Olof
