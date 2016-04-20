From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 2/3] gpio: tegra: Remove the need of keeping device handle
 for gpio driver
Date: Wed, 20 Apr 2016 10:16:15 +0900
Message-ID: <CAAVeFuLdaHhfYxDgPCE3joLRXkZMfDGOzEoDwGNy1bfcQTpw3Q@mail.gmail.com>
References: <1460969178-20914-1-git-send-email-ldewangan@nvidia.com> <1460969178-20914-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1460969178-20914-2-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 18, 2016 at 5:46 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:
> Remove the file static device handle variable as this is just
> required for prints. The required handle can be stored in
> tegra_gpio_chip and hence it become redundancy.

Small but still worthy change. "dev" in the file's global namespace is
scary and prone to conflict with local variables declarations.

Acked-by: Alexandre Courbot <acourbot@nvidia.com>

Now I hope you will take care of "regs" and the other static variables
as Stephen rightfully suggested. :)
