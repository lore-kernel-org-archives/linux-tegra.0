From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3] platform: Make platform_bus device a platform device
Date: Wed, 23 Jul 2014 15:26:53 +0100
Message-ID: <1406125613.25343.140.camel@hornet>
References: <20140722173713.GA8959@kroah.com>
	 <1406051719-17354-1-git-send-email-pawel.moll@arm.com>
	 <CAOesGMgya9i=zc_AVO_mgrC_FjYz-RWxwXguNueVA=7gpq=5sA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMgya9i=zc_AVO_mgrC_FjYz-RWxwXguNueVA=7gpq=5sA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 2014-07-22 at 20:46 +0100, Olof Johansson wrote:
> > @@ -946,12 +946,18 @@ int __init platform_bus_init(void)
> >
> >         early_platform_cleanup();
> >
> > -       error =3D device_register(&platform_bus);
> > +       dev_set_name(&platform_bus.dev, "%s", platform_bus.name);
> > +       error =3D device_register(&platform_bus.dev);
> >         if (error)
> >                 return error;
> >         error =3D  bus_register(&platform_bus_type);
> > -       if (error)
> > -               device_unregister(&platform_bus);
> > +       if (!error) {
> > +               platform_bus.dev.of_node =3D of_allnodes;
>=20
> This breaks all non-OF platforms:
>=20
> drivers/base/platform.c: In function 'platform_bus_init':
> drivers/base/platform.c:955:30: error: 'of_allnodes' undeclared (firs=
t
> use in this function)
>    platform_bus.dev.of_node =3D of_allnodes;

Right, of course, my bad. I can't see any other way of getting the tree
root, so an #ifdef it will be...

Thanks for pointing this out!

Pawe=C5=82
