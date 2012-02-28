From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v6 15/20] tegra: fdt: Add function to return
 peripheral/clock ID
Date: Tue, 28 Feb 2012 09:46:15 -0800
Message-ID: <CAPnjgZ24vhy7NKj_Dt_dzn0qJ8=rj4nF04WSsY8u9MorAanzVA@mail.gmail.com>
References: <1330375973-10681-1-git-send-email-sjg@chromium.org>
	<1330375973-10681-16-git-send-email-sjg@chromium.org>
	<4F4C149E.3070505@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F4C149E.3070505-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

On Mon, Feb 27, 2012 at 3:41 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wr=
ote:
> On 02/27/2012 01:52 PM, Simon Glass wrote:
>> A common requirement is to find the clock ID for a peripheral. This =
is the
>> second cell of the 'clocks' property (the first being the phandle it=
self).
>
>> +int clock_decode_periph_id(const void *blob, int node)
>
>> + =A0 =A0 valid =3D clock_periph_id_isvalid(id);
>
> clock_periph_id_isvalid() is not the correct function to use here; th=
e
> code should be checking for invalid IDs in the CAR binding, not inval=
id
> IDs in the HW periph ID definition. They're different.
>
> Just to be explicit, the function you need here would be:
>
> int clkid_to_periphid(int clkid)
> {
> =A0 =A0if (clk_id > 95)
> =A0 =A0 =A0 =A0return -1;
> =A0 =A0switch (clk_id) {
> =A0 =A0case 1:
> =A0 =A0case 2:
> =A0 =A0case 7:
> =A0 =A0case 10:
> =A0 =A0case 20:
> =A0 =A0case 30:
> =A0 =A0case 35:
> =A0 =A0case 49:
> =A0 =A0case 56:
> =A0 =A0case 74:
> =A0 =A0case 77:
> =A0 =A0case 78:
> =A0 =A0case 79:
> =A0 =A0case 80:
> =A0 =A0case 81:
> =A0 =A0case 82:
> =A0 =A0case 83:
> =A0 =A0case 91:
> =A0 =A0case 95:
> =A0 =A0 =A0 =A0return -1;
> =A0 =A0default:
> =A0 =A0 =A0 =A0return clkid;
> =A0 =A0}
> }

Ick.

Why is 7 in there, and did you miss 76? Also U-Boot only goes up to 88
at present so should I change the first test to match?

Regards,
Simon

>
> --
> nvpublic
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
