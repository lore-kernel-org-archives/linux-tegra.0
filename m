From: Yuehaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next 01/30] pinctrl: pxa25x: use
 devm_platform_ioremap_resource() to simplify code
Date: Mon, 4 Nov 2019 09:17:07 +0800
Message-ID: <c8b14d9b-253b-47a1-641f-e89d2cc79686@huawei.com>
References: <20191017122640.22976-1-yuehaibing@huawei.com>
 <20191017122640.22976-2-yuehaibing@huawei.com>
 <CACRpkdb8D_zxHfzY=+ramnNjXVsN9MMO8Q-3=iZFLS2A_ZDQuw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CACRpkdb8D_zxHfzY=+ramnNjXVsN9MMO8Q-3=iZFLS2A_ZDQuw@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Neil Armstrong <narmstrong@baylibre.com>, Baruch Siach <baruch@tkos.co.il>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Jesper Nilsson <jesper.nilsson@axis.com>, Florian Fainelli <f.fainelli@gmail.com>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@axis.com, Jon Hunter <jonathanh@nvidia.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, MSM <linux-arm-msm@vger.kernel.org>, Ray Jui <rjui@broadcom.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Lars
List-Id: linux-tegra@vger.kernel.org

On 2019/11/4 8:18, Linus Walleij wrote:
> On Thu, Oct 17, 2019 at 2:48 PM YueHaibing <yuehaibing@huawei.com> wrote:
> 
>> Use devm_platform_ioremap_resource() to simplify the code a bit.
>> This is detected by coccinelle.
>>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> 
> These are too many patches changing too little.
> One patch should be one technical step.
> 
> I'd say squash them all into one big patch and resend.
> 
> You can collect the ACKs you received, but don't put
> too many people on CC, they will be annoyed.

Ok, will do that, thanks!

> 
> Yours,
> Linus Walleij
> 
> .
> 
