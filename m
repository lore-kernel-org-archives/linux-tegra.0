From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: tegra: Make lockdep class file-scoped
Date: Wed, 8 Jun 2016 13:41:05 +0200
Message-ID: <CACRpkdadWc68-vqZejwBwTA2agFCSxAzxA1V5s4KcwSZFwarCg@mail.gmail.com>
References: <20160606165627.32676-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20160606165627.32676-1-thierry.reding@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Laxman Dewangan <ldewangan@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 6, 2016 at 6:56 PM, Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> Commit b546be0db955 ("gpio: tegra: Get rid of all file scoped global
> variables") moved all file scoped variables into the driver-private
> structure to allow potentially multiple instances of the driver. The
> change also included turning the lockdep class into a driver-private
> field, which doesn't work and produces error messages such as this:
>
>         [    0.142310] BUG: key ffff8000fb3f7ab0 not in .data!
>
> Make the lockdep class file-scoped again to fix this issue.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied for fixes.

Yours,
Linus Walleij
