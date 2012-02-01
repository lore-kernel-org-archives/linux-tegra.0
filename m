From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: tegra: Switch to new pinctrl driver
Date: Wed, 1 Feb 2012 00:16:18 -0800
Message-ID: <20120201081618.GJ7399@quad.lixom.net>
References: <1327083746-31430-1-git-send-email-swarren@nvidia.com>
 <1327083746-31430-3-git-send-email-swarren@nvidia.com>
 <CACRpkdZ_hBviswq7pXoLozC8gjzvowCBrj9yjw1xJT79b5rtwQ@mail.gmail.com>
 <CAOesGMjuewhO2H+QFQtAX+xFb5hyNn8Q65Cuup4vaXWAFvX87w@mail.gmail.com>
 <CACRpkdayNsOFkOwLZNO_pJnNmM=NmSZhkJtAwkHxQvHovdF0uw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdayNsOFkOwLZNO_pJnNmM=NmSZhkJtAwkHxQvHovdF0uw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 25, 2012 at 12:13:06AM +0100, Linus Walleij wrote:
> On Tue, Jan 24, 2012 at 11:44 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:
> 
> > Yup, I've just been waiting on things to settle,
> > bindings/implementation wise. Will look at it over the next day or two
> > and get back.
> 
> The only bindings you need to look into for this patch set should be
> for the driver itself, the other muxmap bindings discussion I would
> *very* much like to keep orthogonal to the review of this driver.

Yup, it's more that I grouped the discussions together mentally and passed on
all of them for a while. :)

> I'm pretty scared of how device tree bindings seem to suck in
> every discussion like a black hole and then explode in a myriad
> fragmented discussions like a supernova :-P

Yeah, welcome to the ugly side of device trees. Some things are easier and
nicer to do there. Some things... are not.


-Olof
