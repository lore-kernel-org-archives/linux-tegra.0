From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] pinctrl: tegra: fix some typos and inconsistencies
Date: Wed, 12 Mar 2014 15:21:53 +0100
Message-ID: <CACRpkda2+hqCF5mojk6qJGj27LGWE2BG55GFo482=GNi0gRGiQ@mail.gmail.com>
References: <1394220137-16351-1-git-send-email-swarren@wwwdotorg.org>
	<531F3C4E.6040708@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <531F3C4E.6040708-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 11, 2014 at 5:39 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 03/07/2014 12:22 PM, Stephen Warren wrote:
>> drive_dev3_pins in pinctrl-tegra114.c wasn't used; delete it.
>>
>> pinctrl-tegra124.c had quite a few typos. Fix those.
>>
>> pinctrl-tegra124.c had a few mismatches between the *_groups[] ararys
>> and the function lists in tegra124_groups[]. Fix those.
>
> Oops. I appear to have sent this first patch separately a couple days
> earlier and accidentally included another identical copy of it in this
> series. This series should have only included patches 2..4.

Hehe no problem, I'll check patches 2 thru 4 and
apply as I go along.

Yours,
Linus Walleij
