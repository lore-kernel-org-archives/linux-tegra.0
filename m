From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH 6/6] clk: tegra: Add Tegra132 ccplex clocks
Date: Wed, 16 Jul 2014 11:30:42 +0300
Message-ID: <20140716083042.GL23218@tbergstrom-lnx.Nvidia.com>
References: <1405437890-6468-1-git-send-email-pdeschrijver@nvidia.com>
 <1405437890-6468-7-git-send-email-pdeschrijver@nvidia.com>
 <53C5908C.5000009@nvidia.com> <53C591B1.4080302@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <53C591B1.4080302@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Joseph Lo <josephl@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Tuomas Tynkkynen <ttynkkynen@nvidia.com>, Kumar Gala <galak@codeaurora.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Alex Courbot <acourbot@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 15, 2014 at 10:40:17PM +0200, Rhyland Klein wrote:
> On 7/15/2014 4:35 PM, Rhyland Klein wrote:
> > On 7/15/2014 11:24 AM, Peter De Schrijver wrote:
> >> Add support for the ccplex clocks in Tegra132.
> >>
> >> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> >> ---
> >>  drivers/clk/tegra/Makefile |    2 ++
> >>  1 files changed, 2 insertions(+), 0 deletions(-)
> >>
> >> diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
> >> index f7dfb72..4231865 100644
> >> --- a/drivers/clk/tegra/Makefile
> >> +++ b/drivers/clk/tegra/Makefile
> >> @@ -15,3 +15,5 @@ obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         += clk-tegra20.o
> >>  obj-$(CONFIG_ARCH_TEGRA_3x_SOC)         += clk-tegra30.o
> >>  obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= clk-tegra114.o
> >>  obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= clk-tegra124.o
> >> +obj-$(CONFIG_ARCH_TEGRA_132_SOC)	+= clk-tegra124.c
> >> +obj-$(CONFIG_ARCH_TEGRA_132_SOC)	+= clk-tegra132-ccplex.c
> 
> Also, shouldn't both these be .o not .c ?
> 
> -rhyland

Yes, obviously :)

Cheers,

Peter.
