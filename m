From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 6/9] arm/tegra: emc: convert tegra2_emc to a platform driver
Date: Wed, 4 Jan 2012 15:42:17 -0800
Message-ID: <CAOesGMhE+==YRUbSj9GQ32tRjFR7WcSZ7KifNMmUqrPkHJPGmA@mail.gmail.com>
References: <1324599468-12845-1-git-send-email-olof@lixom.net>
	<1324599468-12845-7-git-send-email-olof@lixom.net>
	<74CDBE0F657A3D45AFBB94109FB122FF17761F158A@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17761F158A-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 4, 2012 at 3:39 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:
> Olof Johansson wrote at Thursday, December 22, 2011 5:18 PM:
>> This is the first step in making it device-tree aware and get rid of=
 the
>> in-kernel EMC tables (of which there are none in mainline, thankfull=
y).
>
>> -void tegra_init_emc(const struct tegra_emc_table *table, int table_=
size)
>> +static int __devinit tegra_emc_probe(struct platform_device *pdev)
>> +{
> ...
>> + =A0 =A0 }
>> +
>> + =A0 =A0 =A0 =A0res =3D platform_get_resource(pdev, IORESOURCE_MEM,=
 0);
>> + =A0 =A0 =A0 =A0if (!res) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "missing register base=
\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENOMEM;
>> + =A0 =A0 =A0 =A0}
>> +
>> + =A0 =A0 if (!request_mem_region(res->start, resource_size(res), "t=
egra_emc")) {
>
> Something is wrong with the indentation there.
>
>> + =A0 =A0 /* Since default max_rate on emc clock is the same as firm=
ware set
>> + =A0 =A0 =A0* it to before booting, raise it up here based on known=
 timings.
>> + =A0 =A0 =A0*/
>> +
>> + =A0 =A0 for (i =3D 0; i < pdata->num_tables; i++)
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (pdata->tables[i].rate > max)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 max =3D pdata->tables[i].r=
ate;
>> +
>> + =A0 =A0 c->max_rate =3D max * 2 * 1000;
>> +
>> + =A0 =A0 list_for_each_entry(user, &c->shared_bus_list, u.shared_bu=
s_user.node)
>> + =A0 =A0 =A0 =A0 =A0 =A0 user->max_rate =3D c->max_rate;
>
> Hmm. I guess that works OK for now. Using some kind of accessor might
> be nice; I'm not sure how that could be implemented once there's a
> common clock framework, and this code can't touch the clock internals=
=2E

Oh dear, that code should have been ripped out in the patch I posted.
It is definitely not to be left in there.

We're going to assume that firmware boots the system at maximum
performance so the above shouldn't be needed. I guess I could add a
warning for cases where different operation is detected.


-Olof
