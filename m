From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gpio: max77620: Use correct unit for debounce times
Date: Fri, 4 Oct 2019 23:58:41 +0200
Message-ID: <CACRpkdYS+nH5jVixrJbxV4wqPgibp_JS+q=YCVwTMMND6ccwKQ@mail.gmail.com>
References: <20191002122825.3948322-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002122825.3948322-1-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Timo Alho <talho@nvidia.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Oct 2, 2019 at 2:28 PM Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> The gpiod_set_debounce() function takes the debounce time in
> microseconds. Adjust the switch/case values in the MAX77620 GPIO to use
> the correct unit.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied for fixes.

Yours,
Linus Walleij
