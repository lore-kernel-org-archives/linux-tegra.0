From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V5 4/4] gpio: tegra: Add support for gpio debounce
Date: Fri, 29 Apr 2016 11:03:44 +0200
Message-ID: <CACRpkdZz3KG0AP_EMnmvrBVqWymwMyzPCWNVmbg_jCBoPpsknw@mail.gmail.com>
References: <1461580714-22479-1-git-send-email-ldewangan@nvidia.com>
	<1461580714-22479-5-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461580714-22479-5-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 25, 2016 at 12:38 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> NVIDIA's Tegra210 support the HW debounce in the GPIO controller
> for all its GPIO pins.
>
> Add support for setting debounce timing by implementing the
> set_debounce callback of gpiochip.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Reviewed-by: Stephen Warren <swarren@nvidia.com>

Patch applied, also added Alex' review tag.

Yours,
Linus Walleij
