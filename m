From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V5 3/4] gpio: tegra: Get rid of all file scoped global variables
Date: Fri, 29 Apr 2016 11:01:44 +0200
Message-ID: <CACRpkdZqyJ5kFsdWPbRirHQ16eS3j00nRdjHkacSWhb9MqydEg@mail.gmail.com>
References: <1461580714-22479-1-git-send-email-ldewangan@nvidia.com>
	<1461580714-22479-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461580714-22479-4-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 25, 2016 at 12:38 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> Move the file scoped multiple global variable from Tegra GPIO
> driver to the structure and make this as gpiochip data which
> can be referred from GPIO chip callbacks.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Reviewed-by: Stephen Warren <swarren@nvidia.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Patch applied.

Yours,
Linus Walleij
