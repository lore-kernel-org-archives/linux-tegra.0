From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 1/3] net: rfkill-gpio: add device tree support
Date: Mon, 13 Feb 2012 11:36:09 -0800
Message-ID: <CAOesGMgJW7bRZn84VSZNVvc3G6z4S6HPzFEv3MJ8DcNYVsV2uQ@mail.gmail.com>
References: <1ec0e63a7453072689618430ebc2bdd7b62542a2.1329073559.git.marvin24@gmx.de>
	<1329161159.22948.3.camel@rklein-linux>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1329161159.22948.3.camel@rklein-linux>
Sender: linux-wireless-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>, Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 13, 2012 at 11:25 AM, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:
> On Sun, 2012-02-12 at 11:13 -0800, Marc Dietrich wrote:
>> This adds device tree support for rfkill-gpio. The optional platform
>> paramters gpio_runtime_close and gpio_runtime_setup are not implemen=
ted.
>>
>> Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
>> Cc: "John W. Linville" <linville-2XuSBdqkA4R54TAoqtyWWQ@public.gmane.org>
>> Cc: Johannes Berg <johannes-cdvu00un1VgdHxzADdlk8Q@public.gmane.org>
>> Cc: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
>> +
>> =A0static int rfkill_gpio_probe(struct platform_device *pdev)
>> =A0{
>> =A0 =A0 =A0 struct rfkill_gpio_data *rfkill;
>> =A0 =A0 =A0 struct rfkill_gpio_platform_data *pdata =3D pdev->dev.pl=
atform_data;
>> + =A0 =A0 struct device_node *np =3D pdev->dev.of_node;
>> =A0 =A0 =A0 int ret =3D 0;
>> =A0 =A0 =A0 int len =3D 0;
>>
>> + =A0 =A0 if (np)
>> + =A0 =A0 =A0 =A0 =A0 =A0 pdata =3D rfkill_gpio_parse_pdata(pdev);
>> +
>
> The only concern I have is the precedence of devicetree settings vs
> platform data settings? If there is pdata passed in from board file
> initialization, and there is a device tree (a corner case but I think=
 a
> valid one) then I believe the order would be that defined pdata would
> override the devicetree settings. That way if someone wanted to make =
a
> quick update, they wouldn't need to change the boot loader as well.

Yes, that is how other drivers tend to be coded -- only of pdata is
null will the driver try to fill in from the DT.


-Olof
--
To unsubscribe from this list: send the line "unsubscribe linux-wireles=
s" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
