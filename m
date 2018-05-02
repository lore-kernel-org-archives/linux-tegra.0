From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 0/4] Restore ULPI USB on Tegra20
Date: Wed, 2 May 2018 14:58:25 +0200
Message-ID: <CACRpkdbp7mZKQPuUqYNYc121oYrkbUm=tKGKm15-VKUvGwEvdg@mail.gmail.com>
References: <20180426235818.10018-1-digetx@gmail.com> <20180430094821.GC2476@ulmo>
 <20180430112804.GA5770@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180430112804.GA5770@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Dmitry Osipenko <digetx@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Marcel Ziswiler <marcel@ziswiler.com>, Marc Dietrich <marvin24@gmx.de>, linux-clk <linux-clk@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 30, 2018 at 1:28 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:

> Marc just pointed out to me on IRC that this fixes a regression that was
> introduced in v4.17-rc1.
>
> Can you guys pick this up into your -fixes branches?

OK I will pick mine independently to my fixes.

> Again, I volunteer
> to collect these into a separate branch and submit via ARM SoC (the DTS
> patch is crucial in enabling the fix) with your Acked-bys if that's the
> preferred option.

No need for me at least.

Yours,
Linus Walleij
