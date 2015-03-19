From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] pinctrl: tegra: use signed bitfields for optional fields
Date: Thu, 19 Mar 2015 09:21:22 +0100
Message-ID: <CACRpkdaQnrQWci0feJsG93tdfaGGveZUVtwWdYk745JJRpYjow@mail.gmail.com>
References: <1426542154-31072-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1426542154-31072-1-git-send-email-stefan@agner.ch>
Sender: linux-gpio-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Mar 16, 2015 at 10:42 PM, Stefan Agner <stefan@agner.ch> wrote:

> Optional fields are set to -1 by various preprocessor macros. Make
> sure the fields can actually store them.
>
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Patch applied with Stephen's ACK/Test tags.

Yours,
Linus Walleij
