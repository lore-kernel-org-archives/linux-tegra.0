From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/9] irqdomain: Introduce __irq_create_mapping()
Date: Thu, 26 Sep 2013 12:57:25 +0200
Message-ID: <CACRpkdYzcb1F1-YK5ivxGpskZyVxN3qfUGn8sqq9RnfOU-EzEQ@mail.gmail.com>
References: <1379320326-13241-1-git-send-email-treding@nvidia.com>
	<1379320326-13241-3-git-send-email-treding@nvidia.com>
	<CACRpkdYo8knzZ+Z-tc7fyEGwX5bt4RvMU3TR3k3UrOj0KRJocw@mail.gmail.com>
	<20130923202935.GA5216@ulmo>
	<CACRpkdZMM9RUkRCWG0mYbF9PL-fOdDncpY05xG3F5BF55hn5ug@mail.gmail.com>
	<20130924182820.GA9911@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130924182820.GA9911@mithrandir>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Sep 24, 2013 at 8:28 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Given that linux-next might not be with us for much longer before the
> 3.12 release, I'm thinking of deferring the series until then. Or at
> least trying to get it merged. Otherwise we'll probably have to deal
> with a lot of fall out during the merge window.

Hm, how unfortunate. Typically this is the kind of topic branch
that should go in separately to linux-next.

> In any case, it'd be nice to get some feedback on the general idea of
> the patch series from other people involved. I'd hate to do all the
> conversions just to have it NAKed at the last minute.

With the direction we've discussed here atleast I won't be
doing any NACKing if it's of any help...

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
