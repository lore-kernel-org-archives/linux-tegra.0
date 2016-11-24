From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] gpio: tegra186: Add support for T186 GPIO
Date: Fri, 25 Nov 2016 00:24:50 +0100
Message-ID: <CACRpkdZV-ZtuceTGNhWCvgPMHdmKxiUR2V2Cw_JjbzXa16Mexg@mail.gmail.com>
References: <1478083719-14836-1-git-send-email-smangipudi@nvidia.com>
 <0e3e89a8-a2f1-68c2-0586-58902fb91587@wwwdotorg.org> <20161122173042.GA3239@ulmo.ba.sec>
 <CACRpkdbfkv7Yt3cOah_BGcgnqVtxvzWOqm2+HH_rkrpnJt0nFA@mail.gmail.com>
 <20161123194036.GA25876@ulmo.ba.sec> <CACRpkdYEpenBbb9u=VPzu4eZOQutk4qP6h5T84=AKi73AJCQHw@mail.gmail.com>
 <20161124163231.GD26657@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161124163231.GD26657-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Suresh Mangipudi <smangipudi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mostly it seems we are in understanding here, looking forward
to the patches...

On Thu, Nov 24, 2016 at 5:32 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Thu, Nov 24, 2016 at 04:08:08PM +0100, Linus Walleij wrote:

>> I don't understand. Userspace should have no concern about the
>> numberspace. Lines can be named from DT or ACPI so you can
>> look up line chip+offset from the names.
>
> Userspace would have to know about the numberspace if it wants to use
> the character device, right?

No it shouldn't really. Adding gpio-line-names = "foo", "bar" etc
and following a reasonable naming policy (such as using the
rail names on the schematic, which is usually helpful) the
GPIO can easily be looked up from its name.

The chardev tries to overcome the hardships in finding the
GPIO you want this way.

Yours,
Linus Walleij
