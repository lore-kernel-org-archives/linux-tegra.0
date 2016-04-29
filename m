From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V5 2/4] gpio: tegra: Make of_device_id compatible data to constant
Date: Fri, 29 Apr 2016 11:00:13 +0200
Message-ID: <CACRpkdYoi-qKPg_opwagGxq14c=DPQ6d0-96APz0YY0CXZxqVw@mail.gmail.com>
References: <1461580714-22479-1-git-send-email-ldewangan@nvidia.com>
	<1461580714-22479-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461580714-22479-3-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 25, 2016 at 12:38 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> The data member of the of_device_id is the constant type
> and hence all static structure which is used for this
> initialisation as static.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Suggested-by: Thierry Reding <treding@nvidia.com>
> Reviewed-by: Stephen Warren <swarren@nvidia.com>

Patch applied.

Yours,
Linus Walleij
