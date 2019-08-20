From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 8/9] drivers: ata: sata_gemini: use devm_platform_ioremap_resource()
Date: Tue, 20 Aug 2019 15:20:47 +0200
Message-ID: <CACRpkdazbH5pD6eqhM_PWyK1wcjrKzxY24AwEk-TmzpFtmnxqA@mail.gmail.com>
References: <1566304548-19972-1-git-send-email-info@metux.net> <1566304548-19972-8-git-send-email-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566304548-19972-8-git-send-email-info@metux.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jens Axboe <axboe@kernel.dk>, Hans de Goede <hdegoede@redhat.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Aug 20, 2019 at 2:35 PM Enrico Weigelt, metux IT consult
<info@metux.net> wrote:

> Use the new helper that wraps the calls to platform_get_resource()
> and devm_ioremap_resource() together.
>
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
