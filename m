From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 00/16] Another 16 L2C patches
Date: Mon, 28 Apr 2014 21:00:56 +0200
Message-ID: <1909837.hsUUrWVtDV@diego>
References: <20140428165631.GM26756@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140428165631.GM26756@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, kernel@stlinux.com, Linus Walleij <linus.walleij@linaro.org>, Gregory Clement <gregory.clement@free-electrons.com>, Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh@kernel.org>, linux-samsung-soc@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, bcm-kernel-feedback-list@broadcom.com, Shawn Guo <shawn.guo@freescale.com>, Dinh Nguyen <dinguyen@altera.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Stephen Warren <swarren@wwwdotorg.org>, Hauke Mehrtens <hauke@hauke-m.de>, Matt Porter <mporter@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Maxime Coquelin <maxime.coquelin@st.com>, Barry Song <baohua@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Christian Daudt <bcm@fixthebug.org>, Patric
List-Id: linux-tegra@vger.kernel.org

Am Montag, 28. April 2014, 17:56:31 schrieb Russell King - ARM Linux:
> So, in response to Matt Porter's complaint about breaking prima2, here's
> another 16 patches which changes the way the L2 cache is initialised on
> many platforms.  This series moves towards a situation where the generic
> code initialises the L2 cache itself, with as little help as possible
> from board specific code.

Patches 2/16 ("ARM: l2c: add platform independent core L2 cache
initialisation") and 3/16 ("ARM: l2c:  convert rockchip to generic l2c 
initialisation") applied on a linux-next from 20140428,

Tested-by: Heiko Stuebner <heiko@sntech.de>
