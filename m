From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio-tegra: Do not create the debugfs entry by default
Date: Tue, 17 Nov 2015 15:20:07 +0100
Message-ID: <CACRpkdYO93V0+B_NW6bCoxr1wDHkUgcuyi=pFaL0bTy650u8kQ@mail.gmail.com>
References: <1447690030-26529-1-git-send-email-suzuki.poulose@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1447690030-26529-1-git-send-email-suzuki.poulose@arm.com>
Sender: linux-gpio-owner@vger.kernel.org
To: "Suzuki K. Poulose" <suzuki.poulose@arm.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 16, 2015 at 5:07 PM, Suzuki K. Poulose
<suzuki.poulose@arm.com> wrote:

> The tegra gpio driver creates the debugfs entry irrespective of
> whether the device exists or not. This is enabled on an arm64_defconfig
> and leaves an entry in debugfs on all platforms where it is not
> useful. This patch fixes the issue by creating the entry only when
> a device exists.
>
> Signed-off-by: Suzuki K. Poulose <suzuki.poulose@arm.com>

Patch applied for fixes with Thierry's ACK.

Yours,
Linus Walleij
