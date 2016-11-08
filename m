From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] gpio: tegra186: Add support for T186 GPIO
Date: Mon, 7 Nov 2016 17:42:33 -0800
Message-ID: <CAOesGMgJUepmq2JTT7imKh74BsnGobcpBWFuNp94WnX1WtzEjA@mail.gmail.com>
References: <1478083719-14836-1-git-send-email-smangipudi@nvidia.com>
 <CACRpkdZpPHLDGeBb8kb=LYmuT0PKPf_quK+OF2peaV+8dxr5vQ@mail.gmail.com> <20161107132127.GE12559@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161107132127.GE12559-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Suresh Mangipudi <smangipudi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 7, 2016 at 5:21 AM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Nov 07, 2016 at 08:53:37AM +0100, Linus Walleij wrote:
>> On Wed, Nov 2, 2016 at 11:48 AM, Suresh Mangipudi <smangipudi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>
>> > Add GPIO driver for T186 based platforms.
>> > Adds support for MAIN and AON GPIO's from T186.
>> >
>> > Signed-off-by: Suresh Mangipudi <smangipudi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Stephen/Thierry/Alexandre:
>> Can I get your review on this Tegra thing?
>
> Can we hold off on this for a bit? I've got my own implementation of
> this in my Tegra186 tree because I thought nobody else was working on
> it. From a brief look they seem mostly similar but there are a couple
> of differences that I need to take a closer look at (and do some more
> intensive testing on).

Be careful about discouraging other developers internally from
participating upstream, Thierry.

Please don't become a bottleneck for your company's contributions.
Rewriting stuff on your own isn't a scalable model.


-Olof
