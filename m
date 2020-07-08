From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 5/5] gpio: max77620: Move variable declaration
Date: Wed, 8 Jul 2020 12:24:18 +0300
Message-ID: <204bc417-02cf-1b8f-da99-a598056ff7e4@gmail.com>
References: <20200708082634.30191-1-digetx@gmail.com>
 <20200708082634.30191-6-digetx@gmail.com>
 <CAHp75VeMhb6BH9LnZxM+_-6nNzDErKN70T_QuuuW_dmLwcpoHg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAHp75VeMhb6BH9LnZxM+_-6nNzDErKN70T_QuuuW_dmLwcpoHg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Shevchenko <andy.shevchenko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bartosz Golaszewski <bgolaszewski-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "open list:GPIO SUBSYSTEM" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

08.07.2020 11:47, Andy Shevchenko пишет:
> On Wed, Jul 8, 2020 at 11:29 AM Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>> Let's move the virq variable declaration to a top-level scope just to
>> make the code a bit more visually appealing.
> 
> To me it sounds like unneeded churn, but it's up to maintainers.
> 

I agree that this is an unnecessary change, but I couldn't resist :)
Alright, I'll skip the patches 3-5 in the v2. Thank you very much for
the review!
