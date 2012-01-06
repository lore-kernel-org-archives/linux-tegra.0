From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 7/9] arm/tegra: emc: device tree bindings
Date: Thu, 5 Jan 2012 17:20:36 -0800
Message-ID: <CAOesGMjeVm_PcsBnxfKX9Oe96QUaCsJrvuESCRZq5vwq9gD5xA@mail.gmail.com>
References: <1324599468-12845-1-git-send-email-olof@lixom.net>
	<1324599468-12845-8-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF17761F18A6@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17761F18A6-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 5, 2012 at 4:01 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:
> Olof Johansson wrote at Thursday, December 22, 2011 5:18 PM:
>> Device tree bindings for the EMC tables on tegra.
> ...
>> diff --git a/Documentation/devicetree/bindings/arm/tegra/emc.txt
> ...
>> +Embedded Memory Controller ram-code table
> ...
>> +- name : Should be emc-tables
>> +- nvidia,ram-code : the binary representation of the ram-code board=
 strappings
>> + =A0for which this node (and children) are valid.
> ...
>> +Embedded Memory Controller configuration table
> ...
>> +- name : Should be emc-table
>> +- compatible : Should contain "nvidia,tegra20-emc-table".
>> +- reg : either an opaque enumerator to tell different tables apart,=
 or
> ...
>
> One more thought:
>
> For consistency, should the "emc-tables" node also require a compatib=
le
> value? I suppose the existence of an "nvidia,ram-code" property is qu=
ite
> likely to be indication enough that the node is compatible, but I won=
der
> if we shouldn't require and check an explicit compatible value at thi=
s
> level too?

I can add it, it's trivial to add another check in
tegra_emc_ramcode_devnode, but I don't think there's much need to
bother. As long as nothing else is added that uses nvidia,ram-code as
a property we'll be OK, and we can control that.


-Olof
