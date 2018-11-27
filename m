From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] memory: tegra: Convert to using %pOFn instead of device_node.name
Date: Tue, 27 Nov 2018 10:55:50 -0600
Message-ID: <CAL_JsqLqcA20HB=3bnwYD-g32h=mG=VR7sWiuVocW=5eKLcLzQ@mail.gmail.com>
References: <20181124140725.28593-1-tiny.windzz@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181124140725.28593-1-tiny.windzz@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tiny.windzz@gmail.com
Cc: Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Sat, Nov 24, 2018 at 8:07 AM Yangtao Li <tiny.windzz@gmail.com> wrote:
>
> In preparation to remove the node name pointer from struct device_node,
> convert printf users to use the %pOFn format specifier.
>
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> ---
>  drivers/memory/tegra/mc.c           |  6 +++---
>  drivers/memory/tegra/tegra124-emc.c | 12 ++++++------
>  2 files changed, 9 insertions(+), 9 deletions(-)

Thanks, but I already sent a patch for this and all the others in
drivers/memory/ and have queued it since no one picked it up.

Rob
