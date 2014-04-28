From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 00/16] Another 16 L2C patches
Date: Mon, 28 Apr 2014 11:12:14 -0600
Message-ID: <535E8BEE.1000100@wwwdotorg.org>
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
To: Russell King - ARM Linux <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org
Cc: Andrew Lunn <andrew@lunn.ch>, kernel@stlinux.com, Linus Walleij <linus.walleij@linaro.org>, Gregory Clement <gregory.clement@free-electrons.com>, Thierry Reding <thierry.reding@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, linux-samsung-soc@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, bcm-kernel-feedback-list@broadcom.com, Dinh Nguyen <dinguyen@altera.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Hauke Mehrtens <hauke@hauke-m.de>, Matt Porter <mporter@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-tegra@vger.kernel.org, Shawn Guo <shawn.guo@freescale.com>, Maxime Coquelin <maxime.coquelin@st.com>, Barry Song <baohua@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Christian Daudt <bcm@fixthebug.org>, Patrice Chotard <patrice.chotard@st.com>, Sascha
List-Id: linux-tegra@vger.kernel.org

On 04/28/2014 10:56 AM, Russell King - ARM Linux wrote:
> So, in response to Matt Porter's complaint about breaking prima2, here's
> another 16 patches which changes the way the L2 cache is initialised on
> many platforms.  This series moves towards a situation where the generic
> code initialises the L2 cache itself, with as little help as possible
> from board specific code.
> 
> A number of platforms are left alone because they're more complex -
> these should still eventually be converted.
> 
> At some point in the near future, I will see about sorting out their
> ordering wrt the previous patch set.  For the time being, they apply
> on top of the existing l2c changes.

Are "the existing l2c changes" in next-20140428? If not, is there a git
branch I can pull to test the whole thing, rather than tracking down and
applying "the existing l2c changes" first?
