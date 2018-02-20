From: Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: Re: [PATCH] watchdog: add SPDX identifiers for watchdog subsystem
Date: Tue, 20 Feb 2018 11:15:52 +0100
Message-ID: <5a06150c-6ac4-4836-d8fb-cb0a9a0d9561@microchip.com>
References: <20180220093119.23720-1-marcus.folkesson@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
In-Reply-To: <20180220093119.23720-1-marcus.folkesson@gmail.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+glppe-linuxppc-embedded-2=m.gmane.org@lists.ozlabs.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>, Linus Walleij <linus.walleij@linaro.org>, Support Opensource <support.opensource@diasemi.com>, Baruch Siach <baruch@tkos.co.il>, William Breathitt Gray <vilhelm.gray@gmail.com>, Jimmy Vance <jimmy.vance@hpe.com>, Keguang Zhang <keguang.zhang@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Tomas Winkler <tomas.winkler@intel.com>, Johannes Thumshirn <morbidrsa@gmail.com>, Andreas Werner <andreas.werner@men.de>, Carlo Caione <carlo@caione.org>
Cc: linux-mips@linux-mips.org, linux-samsung-soc@vger.kernel.org, linux-watchdog@vger.kernel.org, patches@opensource.cirrus.com, adi-buildroot-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 20/02/2018 at 10:31, Marcus Folkesson wrote:
> - Add SPDX identifier
> - Remove boiler plate license text
> - If MODULE_LICENSE and boiler plate does not match, go for boiler plate
>    license
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
> 
> Notes:
>      v1: Please have an extra look at meson_gxbb_wdt.c
> 
>   drivers/watchdog/acquirewdt.c          |  6 +---

[..]

>   drivers/watchdog/at91rm9200_wdt.c      |  5 +---
>   drivers/watchdog/at91sam9_wdt.c        |  5 +---
>   drivers/watchdog/at91sam9_wdt.h        |  5 +---

For these 3

[..]

>   drivers/watchdog/sama5d4_wdt.c         |  3 +-

And this one:
Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks, best regards,
-- 
Nicolas Ferre
