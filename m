From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 6/8] ARM: tegra: device tree changes
Date: Tue, 9 Apr 2013 17:55:04 +0200
Message-ID: <201304091755.04661.arnd@arndb.de>
References: <1365181426-11547-1-git-send-email-swarren@wwwdotorg.org>
 <1365181426-11547-6-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1365181426-11547-6-git-send-email-swarren@wwwdotorg.org>
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
Cc: linux-tegra@vger.kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Friday 05 April 2013, Stephen Warren wrote:
> This branch contains the majority of the device tree changes for Tegra.
> Highlights include:
> 
> * Many changes for Tegra114, and the Dalmore board, to enable pinctrl,
>   SDHCI/MMC, PWM, DMA, I2C, KBC, SPI, battery, regulators.
> * Adding or enabling suspend wakeup sources on many boards, and adding
>   suspend timing parameters, to support the system suspend patches.
> * Adding clocks to the audio-related nodes, so that in 3.11, the audio
>   driver can pull these clocks from device tree rather than hard-coding
>   clock names.
> * Some small DT fixes/cleanup.
> 
> This branch is based on the previous clk pull request.

I ended up doing a next/dt2 branch for this, since the mxs tree has the
same kind of dependency.

	Arnd
