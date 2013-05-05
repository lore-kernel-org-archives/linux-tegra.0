From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: Fwd: Tegra 30 System hangs because of commit "pinctrl: move
 subsystem mutex to pinctrl_dev struct"
Date: Sun, 5 May 2013 21:57:26 +0200
Message-ID: <CACRpkdZdT8==cUtH4=Y3LC-eVu6ntO2ojFC4bSXNuxa4hMJ=ZA@mail.gmail.com>
References: <CAK5ve-KXdS8az=Gtja-mF=Z3_EeZVA7bLYSU0EE2mf5bHmSUKw@mail.gmail.com>
	<CAK5ve-KBDyvjNRVMcXgfnhYcajdcGsuAKaepzCBt+epiXoYvSw@mail.gmail.com>
	<517ED12B.8080502@wwwdotorg.org>
	<20130504133004.GC24282@game.jcrosoft.org>
	<CACRpkdbBVJtWrRO+J=pWjfLXTcVKX++x-eeJQXGeQn_WOURUNQ@mail.gmail.com>
	<20130505112819.GD24282@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130505112819.GD24282-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Patrice CHOTARD <patrice.chotard-qxv4g6HH51o@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, May 5, 2013 at 1:28 PM, Jean-Christophe PLAGNIOL-VILLARD
<plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org> wrote:
> On 22:52 Sat 04 May     , Linus Walleij wrote:
>> On Sat, May 4, 2013 at 3:30 PM, Jean-Christophe PLAGNIOL-VILLARD

>> > same issue on at91sam9g45ek
>>
>> Is it working with mainline (Torvalds) HEAD?
>
> now yes

Thanks! I had some panic there for a while :-)

Yours,
Linus Walleij
