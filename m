From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 00/12] gpio: Tight IRQ chip integration and Tegra186 support
Date: Thu, 13 Apr 2017 14:23:35 +0200
Message-ID: <CACRpkdZE7oD47axgd4yBxAs_1vBJoWR0BruOBhQ5EKifNvF9Xg@mail.gmail.com>
References: <20170403160532.20282-1-thierry.reding@gmail.com> <20170406223449.GH27728@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170406223449.GH27728-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 7, 2017 at 12:34 AM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Apr 03, 2017 at 06:05:20PM +0200, Thierry Reding wrote:
>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Hi Linus,
>>
>> here's a first draft of patches to make GPIOLIB_IRQCHIP flexible enough
>> to support the Tegra186 use-case. Instead of just fixing the bugs that I
>> had pointed out earlier, this goes one step further and completely
>> integrates IRQ chip registration into GPIO chip registration. The idea
>> is that drivers will initialize a set of fields (collected in a new
>> struct gpio_irq_chip) before calling gpiochip_add() (or derivatives) and
>> gpiolib will internally set up an IRQ domain and register the IRQ chip.
>>
>> Currently this makes use of the new infrastructure only in the Tegra186
>> driver, but I plan to convert a couple of others once we can agree that
>> this is a direction that you're comfortable with.
>
> Linus,
>
> any comments on this?

Just overworked and snowed under as usual, sorry for that.

The patches as such cannot be merged at this point in the development
cycle but becomes material for the next kernel cycle due to changing
API in all the drivers using the infrastructure.

Yours,
Linus Walleij
