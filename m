From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH -next 29/34] rtc: sunxi: use devm_platform_ioremap_resource()
 to simplify code
Date: Mon, 7 Oct 2019 16:11:38 +0800
Message-ID: <CAGb2v64hUaddO-29=ZP53HDrrOUKqfa52Qk9Q2dGf_RkfwZfyA@mail.gmail.com>
References: <20191006102953.57536-1-yuehaibing@huawei.com> <20191006102953.57536-30-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191006102953.57536-30-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, joel@jms.id.au, andrew@aj.id.au, Nicolas Ferre <nicolas.ferre@microchip.com>, ludovic.desroches@microchip.com, Brian Norris <computersforpeace@gmail.com>, gregory.0xf0@gmail.com, Florian Fainelli <f.fainelli@gmail.com>, "open list:BROADCOM BCM281XX..." <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linus.walleij@linaro.org>, Baruch Siach <baruch@tkos.co.il>, paul@crapouillou.net, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Kevin Hilman <khilman@baylibre.com>, eddie.huang@mediatek.com, Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Patrice Chotard <patrice.chotard@st.com>, Maxime
List-Id: linux-tegra@vger.kernel.org

On Sun, Oct 6, 2019 at 6:39 PM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Chen-Yu Tsai <wens@csie.org>
