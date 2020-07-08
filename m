From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v1 5/5] gpio: max77620: Move variable declaration
Date: Wed, 8 Jul 2020 11:47:17 +0300
Message-ID: <CAHp75VeMhb6BH9LnZxM+_-6nNzDErKN70T_QuuuW_dmLwcpoHg@mail.gmail.com>
References: <20200708082634.30191-1-digetx@gmail.com> <20200708082634.30191-6-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20200708082634.30191-6-digetx@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, linux-tegra@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 8, 2020 at 11:29 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Let's move the virq variable declaration to a top-level scope just to
> make the code a bit more visually appealing.

To me it sounds like unneeded churn, but it's up to maintainers.

-- 
With Best Regards,
Andy Shevchenko
