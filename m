From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: tegra: Fix build error without CONFIG_DEBUG_FS
Date: Sun, 7 Jul 2019 00:34:36 +0200
Message-ID: <CACRpkdZikRyZtbYajc7gN0N6xRoCQpGGVO9rivwuG6-AeVo1xw@mail.gmail.com>
References: <20190705123220.54008-1-yuehaibing@huawei.com> <CAMpxmJVZHJKQ7bbHo=T9R99qguF315bZ=YVRrCdqti2SyzAnDg@mail.gmail.com>
 <74ffe8ea-e6fb-bd2a-42bd-08392eb27c69@huawei.com> <CAMpxmJUeg1jVZdCeiRqTZykBZNPGAeQkaNfA7qc1zt+sL9HPjA@mail.gmail.com>
 <CAMpxmJU0=w=htiY3CL9GDBU+waBjV0X7yh1UG6ip5BiV3J7nXA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMpxmJU0=w=htiY3CL9GDBU+waBjV0X7yh1UG6ip5BiV3J7nXA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Yuehaibing <yuehaibing@huawei.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, LKML <linux-kernel@vger.kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 5, 2019 at 2:59 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:

> Wait, nevermind. I think that commit a4de43049a1d ("gpio: tegra:
> Clean-up debugfs initialisation") is wrong and we missed that. Linus
> what do you think about reverting it?

OK I reverted it.

Linus
