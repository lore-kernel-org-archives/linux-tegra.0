From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] pinctrl: tegra: move probe to __init section
Date: Thu, 20 Sep 2018 08:16:58 -0700
Message-ID: <CACRpkdYZFt-FEnF86GCKqiLjFa-n3wHYLjFbvwFDWEp+AsGCZw@mail.gmail.com>
References: <20180919012427.12439-1-stefan@agner.ch> <20180919012427.12439-2-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180919012427.12439-2-stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Sep 18, 2018 at 6:24 PM Stefan Agner <stefan@agner.ch> wrote:

> The Tegra pinctrl drivers are always built-in. This allows to use
> platform_driver_probe() and mark several functions as __init.
> This allows the kernel to free about 1KiB of memory if Tegra
> pinctrl drivers are not used.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>

It appears the test robot complains about this patch, so I'll
wait for a v2!

Yours,
Linus Walleij
