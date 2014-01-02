From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 4/6] ARM: tegra: rework fuse.c
Date: Thu, 2 Jan 2014 18:03:42 +0100
Message-ID: <CACRpkdZzaiU-BAmkBS1usLRVKxVEyiTuciNpKATK7k+zA3YKZg@mail.gmail.com>
References: <1387468474-26521-1-git-send-email-pdeschrijver@nvidia.com>
	<1387468474-26521-5-git-send-email-pdeschrijver@nvidia.com>
	<CACRpkdbXc_yH-=WgpQyVwHC_TSPfbfx=tHwziNhmB6t0HuSfRw@mail.gmail.com>
	<20140102143221.GR26588@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140102143221.GR26588-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Danny Huang <dahuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 2, 2014 at 3:32 PM, Peter De Schrijver
<pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> On Thu, Jan 02, 2014 at 01:37:43PM +0100, Linus Walleij wrote:
>> On Thu, Dec 19, 2013 at 4:54 PM, Peter De Schrijver
>> <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>
>> > Reduce fuse.c to the minimum functionality required for the early bootstages.
>> > Also export tegra_read_straps() for use by the fuse driver.
>> >
>> > Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Aha, but why?
>>
>
> The efuse driver in patch 2 of this series, adds the randomness, so we don't
> need to add it here then?

Aha I wasn't CC:ed on patch 2 so I didn't see that...

> Yes, it's done in the efuse driver now, do you think that's too late?

Don't know but I don't think so. The important part is that it's done
before drivers needing good randomness (as opposed to good
entropy). The only Tegra driver I'm aware of that needs this is the
crypto driver (which I patched a bit) and I think that will only come
into play when you do something like set up a VPN tunnel or
similar which will be waaaaay later, so no problem AFAICT.

Yours,
Linus Walleij
