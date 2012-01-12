From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 7/9] arm/tegra: emc: device tree bindings
Date: Thu, 12 Jan 2012 12:03:33 -0800
Message-ID: <CAPnjgZ2p63C1UNr_RxCcwKjjqJFXzZppXD14hXh85zXH35POrw@mail.gmail.com>
References: <1324599468-12845-1-git-send-email-olof@lixom.net>
	<1324599468-12845-8-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF17761F18A6@HQMAIL01.nvidia.com>
	<CAOesGMjeVm_PcsBnxfKX9Oe96QUaCsJrvuESCRZq5vwq9gD5xA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMjeVm_PcsBnxfKX9Oe96QUaCsJrvuESCRZq5vwq9gD5xA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Olof,

On Thu, Jan 5, 2012 at 5:20 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> On Thu, Jan 5, 2012 at 4:01 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
>> Olof Johansson wrote at Thursday, December 22, 2011 5:18 PM:
>>> Device tree bindings for the EMC tables on tegra.
>> ...
>>> diff --git a/Documentation/devicetree/bindings/arm/tegra/emc.txt
>> ...
>>> +Embedded Memory Controller ram-code table
>> ...
>>> +- name : Should be emc-tables
>>> +- nvidia,ram-code : the binary representation of the ram-code boar=
d strappings
>>> + =A0for which this node (and children) are valid.
>> ...
>>> +Embedded Memory Controller configuration table
>> ...
>>> +- name : Should be emc-table
>>> +- compatible : Should contain "nvidia,tegra20-emc-table".
>>> +- reg : either an opaque enumerator to tell different tables apart=
, or
>> ...
>>
>> One more thought:
>>
>> For consistency, should the "emc-tables" node also require a compati=
ble
>> value? I suppose the existence of an "nvidia,ram-code" property is q=
uite
>> likely to be indication enough that the node is compatible, but I wo=
nder
>> if we shouldn't require and check an explicit compatible value at th=
is
>> level too?
>
> I can add it, it's trivial to add another check in
> tegra_emc_ramcode_devnode, but I don't think there's much need to
> bother. As long as nothing else is added that uses nvidia,ram-code as
> a property we'll be OK, and we can control that.

I am looking at maybe bringing this into U-Boot.

Do you have an example of the ram-code table? Would it look something l=
ike this?

emc@7000f400 {
	#address-cells =3D < 1 >;
	#size-cells =3D < 0 >;
	compatible =3D "nvidia,tegra20-emc";
	reg =3D <0x7000f4000 0x200>;
	nvidia,use-ram-code;

	emc-tables@0 {
		nvidia,ram-code =3D <0>;
		compatible =3D "nvidia,tegra20-emc-tables";
		emc-table@166000 {
			reg =3D <166000>;
			compatible =3D "nvidia,tegra20-emc-table";
			clock-frequency =3D < 166000 >;
			nvidia,emc-registers =3D < 0 0 0 0 0 0 0 0 0 0 0 0 0 0
						0 0 0 0 0 0 0 0 0 0 0 0 0 0
						0 0 0 0 0 0 0 0 0 0 0 0 0 0
						0 0 0 0 >;
		};
	};
	emc-tables@1 {
		nvidia,ram-code =3D <1>;
		compatible =3D "nvidia,tegra20-emc-tables";
		emc-table@333000 {
			reg =3D <333000>;
			compatible =3D "nvidia,tegra20-emc-table";
			clock-frequency =3D < 333000 >;
			nvidia,emc-registers =3D < 0 0 0 0 0 0 0 0 0 0 0 0 0 0
						0 0 0 0 0 0 0 0 0 0 0 0 0 0
						0 0 0 0 0 0 0 0 0 0 0 0 0 0
						0 0 0 0 >;
		};
	};
	... @2, @3 follow
};

Also, can/should we be able to specify a frequency to override the stra=
pping?

Regards,
Simon

>
>
> -Olof
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss
