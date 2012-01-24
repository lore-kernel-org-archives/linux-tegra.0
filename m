From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: tegra: Switch to new pinctrl driver
Date: Wed, 25 Jan 2012 00:13:06 +0100
Message-ID: <CACRpkdayNsOFkOwLZNO_pJnNmM=NmSZhkJtAwkHxQvHovdF0uw@mail.gmail.com>
References: <1327083746-31430-1-git-send-email-swarren@nvidia.com>
	<1327083746-31430-3-git-send-email-swarren@nvidia.com>
	<CACRpkdZ_hBviswq7pXoLozC8gjzvowCBrj9yjw1xJT79b5rtwQ@mail.gmail.com>
	<CAOesGMjuewhO2H+QFQtAX+xFb5hyNn8Q65Cuup4vaXWAFvX87w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAOesGMjuewhO2H+QFQtAX+xFb5hyNn8Q65Cuup4vaXWAFvX87w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 24, 2012 at 11:44 PM, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org> wrote:

> Yup, I've just been waiting on things to settle,
> bindings/implementation wise. Will look at it over the next day or two
> and get back.

The only bindings you need to look into for this patch set should be
for the driver itself, the other muxmap bindings discussion I would
*very* much like to keep orthogonal to the review of this driver.

I'm pretty scared of how device tree bindings seem to suck in
every discussion like a black hole and then explode in a myriad
fragmented discussions like a supernova :-P

Yours,
Linus Walleij
