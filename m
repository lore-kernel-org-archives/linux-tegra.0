From: Barry Song <21cnbao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 1/2] ARM:Tegra: Device Tree Support: Initialize the audio
 card from the device tree.
Date: Fri, 3 Jun 2011 10:32:52 +0800
Message-ID: <BANLkTikiaA3CCRAXkB=x56wtt8nNF9dqxA@mail.gmail.com>
References: <20110527205444.21000.90209.stgit@riker> <20110527205706.21000.34832.stgit@riker>
 <BANLkTi=NMjBjWVv_o3PocejhgGr8TdG+1Q@mail.gmail.com> <BANLkTi=PtEhxxmZo2DqvmySCmnEd3LbezQ@mail.gmail.com>
 <BANLkTikWpiY_o27OF-Jxvq7iPeWzrAYOsQ@mail.gmail.com> <20110602160445.GA8373@ponder.secretlab.ca>
 <BANLkTikGp_O-Wd3nMhbV+-RLeXZoWeB6eQ@mail.gmail.com> <20110602214322.GC10532@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110602214322.GC10532-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, John Bonesio <bones-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, olofj-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

2011/6/3 Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>:
> On Fri, Jun 03, 2011 at 12:21:50AM +0800, Barry Song wrote:
>> Arnd has required me to use device tree in our new SoC for the comin=
g
>> upstream. so i am trying to define a property like clock =3D "uart" =
in
>> dts. then in drivers,
>> i get this =C2=A0string by:
>> clk =3D of_get_property(np, "clock", NULL);
>> then request this clock by clk_get().
>
> This is entirely wrong. =C2=A0clk_get() takes two things. =C2=A0It ta=
kes a struct
> device. =C2=A0We should know what the struct device is (provided they=
're named
> in a stable manner.)
>
> The other parameter, the string, is up to the driver. =C2=A0It's not =
a device
> property. =C2=A0It's not a SoC-wide clock name. =C2=A0It's a connecti=
on name for
> the clock on the device. =C2=A0This won't change from one instance of=
 the
> device to another instance of the device - it's effectively a constan=
t.
>
i see :-)

but there is really no an unified rule by now, for exmaple, samsung
just required platform device names matched with the string parameter
to get a clock.
it looks like clk_get in plat-samsung depends on the string more than
device and the clock name is in SoC level.

struct clk *clk_get(struct device *dev, const char *id)
{
        struct clk *p;
        struct clk *clk =3D ERR_PTR(-ENOENT);
        int idno;

        if (dev =3D=3D NULL || !dev_is_platform_device(dev))
                idno =3D -1;
        else
                idno =3D to_platform_device(dev)->id;

        spin_lock(&clocks_lock);

        list_for_each_entry(p, &clocks, list) {
                if (p->id =3D=3D idno &&
                    strcmp(id, p->name) =3D=3D 0 &&
                    try_module_get(p->owner)) {
                        clk =3D p;
                        break;
                }
        }

        /* check for the case where a device was supplied, but the
         * clock that was being searched for is not device specific */

        if (IS_ERR(clk)) {
                list_for_each_entry(p, &clocks, list) {
                        if (p->id =3D=3D -1 && strcmp(id, p->name) =3D=3D=
 0 &&
                            try_module_get(p->owner)) {
                                clk =3D p;
                                break;
                        }
                }

}

same situation for mach-at91/clock.c:

/* clocks cannot be de-registered no refcounting necessary */
struct clk *clk_get(struct device *dev, const char *id)
{
        struct clk *clk;

        list_for_each_entry(clk, &clocks, node) {
                if (strcmp(id, clk->name) =3D=3D 0)
                        return clk;
                if (clk->function && (dev =3D=3D clk->dev) && strcmp(id=
,
clk->function) =3D=3D 0)
                        return clk;
        }

        return ERR_PTR(-ENOENT);
}
EXPORT_SYMBOL(clk_get);


msm required device struct matched:
struct clk *clk_get(struct device *dev, const char *id)
{
        struct clk *clk;

        mutex_lock(&clocks_mutex);

        list_for_each_entry(clk, &clocks, list)
                if (!strcmp(id, clk->name) && clk->dev =3D=3D dev)
                        goto found_it;

        list_for_each_entry(clk, &clocks, list)
                if (!strcmp(id, clk->name) && clk->dev =3D=3D NULL)
                        goto found_it;

        clk =3D ERR_PTR(-ENOENT);
found_it:
        mutex_unlock(&clocks_mutex);
        return clk;
}
EXPORT_SYMBOL(clk_get);

> So there's no point in having the DT describe that name - that's out =
of
> its realm.

yes. i made a mistake. our old codes have an ugly implement of clk
APIs, which is using names with index, for example "uart0", "uart1",
"uart2",  to distinguish clocks for multi-instances of same kind of
devices. so i included this name in dts to bring up and test device
tree functions fast. i believe our clk implementation need clean-up.
but what's the best possible way to bind clocks with dynamic
registerred devices from device tree? people maybe need more
agreement.


>
> One of the problems is that clk_get() hides the mapping of device+con=
nection
> internally, which it has had to as we haven't had a device tree to lo=
ok
> things up.
>
> In essence, clk_get() is looking up a property (the clock connection =
name)
> for the struct device. =C2=A0When clks get converted to the device tr=
ee, the
> DT stuff should hook inside clk_get() to do a property lookup to disc=
over
> which clock the driver wants.
>
> Drivers should definitely not be looking up a property in the device =
tree
> and using that as a connection name into clk_get().
