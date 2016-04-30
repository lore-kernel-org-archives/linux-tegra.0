From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2] gpio: tegra: Implement gpio_get_direction callback
Date: Sat, 30 Apr 2016 13:16:30 +0200
Message-ID: <CACRpkdZ6NXnVBNqMSu-erQvhUggf400xUOK8o7Chy1zMUoTehQ@mail.gmail.com>
References: <1461947123-18170-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1461947123-18170-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 29, 2016 at 6:25 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> Implement gpio_get_direction() callback for Tegra GPIO.
> The direction is only valid if the pin is configured as
> GPIO. If pin is not configured in GPIO mode then this
> function return error.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>

Patch applied with Stephen's and Jon's Review/ACK tags.

Yours,
Linus Walleij
