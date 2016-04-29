From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V2 1/3] gpio: tegra: Don't open code of_device_get_match_data()
Date: Fri, 29 Apr 2016 10:56:32 +0200
Message-ID: <CACRpkdZq7DoihXxxDUvV4qhRCidJge6BvnFBgWQk+oXALzhKzQ@mail.gmail.com>
References: <1461059020-25373-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461059020-25373-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 19, 2016 at 11:43 AM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> Use of_device_get_match_data() for getting matched data
> instead of implementing this locally.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Reviewed-by: Stephen Warren <swarren@nvidia.com>

Patch applied with Thierry's ACK.

Yours,
Linus Walleij
