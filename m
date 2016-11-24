From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] gpio: tegra186: Add support for T186 GPIO
Date: Thu, 24 Nov 2016 12:06:16 +0530
Message-ID: <58368A60.2010702@nvidia.com>
References: <1478083719-14836-1-git-send-email-smangipudi@nvidia.com> <0e3e89a8-a2f1-68c2-0586-58902fb91587@wwwdotorg.org> <20161122173042.GA3239@ulmo.ba.sec> <CACRpkdbfkv7Yt3cOah_BGcgnqVtxvzWOqm2+HH_rkrpnJt0nFA@mail.gmail.com> <20161123194036.GA25876@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161123194036.GA25876-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Suresh Mangipudi <smangipudi-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On Thursday 24 November 2016 01:10 AM, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> On Wed, Nov 23, 2016 at 02:25:51PM +0100, Linus Walleij wrote:
>>
>> This is already possible and several drivers are doing this.
>>
>> Everything, all kernel users and all character device users, end up
>> calling gpiod_request().
> It looks like I stumbled across the only case where this isn't true.
> What I was seeing, and which ultimately led me to implement the compact
> numberspace is that gpiochip_add_data() calls ->get_direction() directly
> without first going through ->request(). We'd have to guard that one
> case as well in order for this to work.
>
In T186, we have 8 pins per PORT and for some of ports, all pins are not 
available. Like Port A has 7 pins valid (0 to 6) and port E have 8 pins 
(0 to 7). The great part is that each port has valid pins start from 0.

So just having the number of valid pins for each port as part of SOC 
data will help to find out whether GPIO exist or not.

        int port = GPIO_PORT(offset);
         int pin = GPIO_PIN(offset);

       if (pin >= tgi->soc->port[port].valid_pins)
                 return false;

Similar logic can be used for APIs which can get called without 
gpio_request().
