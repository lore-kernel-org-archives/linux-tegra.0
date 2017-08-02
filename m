From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] gpio: tegra: Remove unnecessary check
Date: Wed, 2 Aug 2017 14:15:40 +0200
Message-ID: <CACRpkdZbgpcS-1sRdj9wZnv40UeGXO52-os4=zVyQpA1fTDptw@mail.gmail.com>
References: <20170724145508.7388-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <20170724145508.7388-1-thierry.reding@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 24, 2017 at 4:55 PM, Thierry Reding
<thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> of_device_get_match_data() can never return NULL, therefore the check
> for NULL values is unnecessary.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch applied with Jon's ACK.

Yours,
Linus Walleij
