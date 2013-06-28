From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH] clk: tegra: fix ifdef for tegra_periph_reset_assert inline
Date: Fri, 28 Jun 2013 15:29:32 -0700
Message-ID: <20130628222932.14831.47972@quantum>
References: <1372100756-10448-1-git-send-email-swarren@wwwdotorg.org>
 <20130624210333.23972.95491@quantum> <51CCC3B8.80909@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <51CCC3B8.80909@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Quoting Stephen Warren (2013-06-27 15:59:04)
> On 06/24/2013 03:03 PM, Mike Turquette wrote:
> > Quoting Stephen Warren (2013-06-24 12:05:56)
> >> From: Stephen Warren <swarren@nvidia.com>
> >>
> >> Commit 7064f6b "clk: tegra: provide tegra_periph_reset_assert
> >> alternative" added ifdef'd static inline versions of some functions,
> >> but tested ARCH_TEGRA rather than CONFIG_ARCH_TEGRA, thus disabling
> >> these function in all cases. In some cases, this caused HW modules to
> >> misbehave; for example, the Tegra I2C driver BUG()d during boot on
> >> Seaboard.
> >>
> >> Reported-by: Olof Johansson <olof@lixom.net>
> >> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> > 
> > Thanks for the fixup. I had already published the offending commit and
> > can't rebase it, so I just applied this patch on top.
> > 
> > Pulled into clk-next for 3.11.
> 
> Did that get pushed out to the git server? The patch isn't in next-20130627.

It was sitting in my local tree. Sorry about that. Pushed to the public
tree now.

Regards,
Mike
