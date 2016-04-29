From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH V5 0/4] gpio: tegra: Cleanups and support for debounce
Date: Fri, 29 Apr 2016 11:07:42 +0200
Message-ID: <CACRpkda7HqPLSRLzaSdO-7chjUBL9C2VAMB0nyVZUw=PSGL3VQ@mail.gmail.com>
References: <1461580714-22479-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1461580714-22479-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 25, 2016 at 12:38 PM, Laxman Dewangan <ldewangan@nvidia.com> wrote:

> Add support for the debounce as Tegra210 support debounce in HW.
> Also do the clenaups to remove all global variables.

OK this v5 is applied.

Laxman does this GPIO also have open drain and/or open source
handling?

Then you might want to look into supporting that too as I just added
support for native single-endedness to gpiolib, c.f.:
http://marc.info/?l=linux-gpio&m=146011780301280&w=2

It would be nice if you also implement .get_direction() which
makes debugfs and initial reading of the state of the lines
more accurate.

Yours,
Linus Walleij
