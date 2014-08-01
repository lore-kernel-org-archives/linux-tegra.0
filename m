From: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 5/5] platform: Make platform_bus device a platform device
Date: Fri, 01 Aug 2014 18:21:09 +0100
Message-ID: <1406913669.22529.44.camel@hornet>
References: <1406298233-27876-1-git-send-email-pawel.moll@arm.com>
	 <1406298233-27876-5-git-send-email-pawel.moll@arm.com>
	 <20140726201351.GC21870@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140726201351.GC21870-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, "paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org" <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, 2014-07-26 at 21:13 +0100, Greg Kroah-Hartman wrote:
> > @@ -946,12 +946,20 @@ int __init platform_bus_init(void)
> >  
> >  	early_platform_cleanup();
> >  
> > -	error = device_register(&platform_bus);
> > +	dev_set_name(&platform_bus.dev, "%s", platform_bus.name);
> > +	error = device_register(&platform_bus.dev);
> >  	if (error)
> >  		return error;
> >  	error =  bus_register(&platform_bus_type);
> > -	if (error)
> > -		device_unregister(&platform_bus);
> > +	if (!error) {
> > +#ifdef CONFIG_OF
> > +		platform_bus.dev.of_node = of_allnodes;
> > +#endif
> 
> Why are you doing this?  The original code didn't do it and all was
> fine, right?  What changes here?

You mean the #ifdef? It wasn't there, but Olof figured out that it
breaks !CONFIG_OF builds:

http://article.gmane.org/gmane.linux.ports.tegra/18473

as of_allnodes is only defined when CONFIG_OF. I had a choice of
#ifdefing the assignment above or providing a dummy symbol. The latter
doesn't seem sensibly, as there should be no other users for it (the
symbol).

Pawel
