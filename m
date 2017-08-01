From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [RFC/RFT PATCH 2/3] gpio: pxa: remove gpio_to_irq() from hw irq handlers
Date: Tue, 01 Aug 2017 20:41:51 +0200
Message-ID: <871sovqgeo.fsf@belgarion.home>
References: <20170708224413.18281-1-grygorii.strashko@ti.com>
        <20170708224413.18281-3-grygorii.strashko@ti.com>
        <CACRpkdZMgd7hSc6LwO5MbPb3vetd+qZ_5mXB1P9SM-HR+h_Pqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdZMgd7hSc6LwO5MbPb3vetd+qZ_5mXB1P9SM-HR+h_Pqg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
        (Linus Walleij's message of "Tue, 1 Aug 2017 09:47:56 +0200")
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-gpio@vger.kernel.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel@vger.kernel.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra@vger.kernel.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org> writes:

> On Sun, Jul 9, 2017 at 12:44 AM, Grygorii Strashko
> <grygorii.strashko-l0cyMroinI0@public.gmane.org> wrote:
>
>> gpio_to_irq() API expected to be used by GPIO consumers and
>> not drivers and there are no guarantee that its gpiolib implementation
>> is irq safe.
>>
>> Signed-off-by: Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>
>
> Patch applied.
>
> This is the right thing to do.
>
> PXA developers: please test.

Hi Linus,

Currently pxa25x and pxa27x are broken because of a .data section misalignment
(issue cross arm architectures), so testing is a bit hard for me right now. I'll
wait to have a working again tree to test, and then report.

Cheers.

--
Robert
