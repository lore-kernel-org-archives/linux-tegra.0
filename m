From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] gpio: tegra: fix debugfs compile error
Date: Mon, 8 Jul 2019 15:19:28 +0200
Message-ID: <CAK8P3a3NBrBRuRQawJqZr+awRVfqNsMmDw7qw7oRjWKhKOjPkg@mail.gmail.com>
References: <20190708123843.3302581-1-arnd@arndb.de> <d30c122c-297e-3370-86d6-039388b48cea@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <d30c122c-297e-3370-86d6-039388b48cea@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 8, 2019 at 3:06 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> 08.07.2019 15:38, Arnd Bergmann пишет:
>
> The offending patch should be reverted already, please see [1].
>
> [1] https://patchwork.ozlabs.org/patch/1128007/#2210871

Ok,  sounds good. With my patch on top, the other version is a little
nicer, but the revert is correct as well, and probably the safe choice
during the merge window.

         Arnd
