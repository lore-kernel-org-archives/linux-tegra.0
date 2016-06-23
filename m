From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC PATCH 00/13] Add support for Tegra DPAUX pinctrl
Date: Thu, 23 Jun 2016 11:21:05 +0200
Message-ID: <CACRpkdYGT9zwyi2Lsd6tyG5dVnPNH+1w9wo+w3=b7YX1pfBJUw@mail.gmail.com>
References: <1466165027-17917-1-git-send-email-jonathanh@nvidia.com>
 <20160617165611.GO27475@ulmo.ba.sec> <20160617165842.GP27475@ulmo.ba.sec>
 <CACRpkdaEUUCs3UR9U331wuFTkRswU4tFEg6JLoMVkHeSXfS_sA@mail.gmail.com> <20160623080400.GA8136@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160623080400.GA8136-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "open list:DRM PANEL DRIVERS" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jun 23, 2016 at 10:04 AM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Jun 23, 2016 at 09:49:20AM +0200, Linus Walleij wrote:
>> On Fri, Jun 17, 2016 at 6:58 PM, Thierry Reding
>> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>> > Oh wait... there's the pinctrl helper function that is a build-
>> > dependency. Linus, would you be okay if I took that through the
>> > drm-tegra tree along with the DPAUX driver change, and provide a
>> > stable branch for you to resolve conflicts against if needed?
>>
>> I have already applied it, but I can rebase and pull that patch out
>> on a separate immutable branch and then  merge that branch
>> into my devel and then you can pull it too.
>>
>> Would that work?
>
> Yes, that would be just fine.

OK use this:
https://git.kernel.org/cgit/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel-dt-free-map

I merged that into my devel branch too.

Yours,
Linus Walleij
