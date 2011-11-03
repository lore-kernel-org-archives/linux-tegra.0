From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v2 2/8] arm/tegra: prepare early init for multiple
	tegra variants
Date: Thu, 3 Nov 2011 10:02:35 +0000
Message-ID: <20111103100235.GK12913@n2100.arm.linux.org.uk>
References: <1320242948-21061-1-git-send-email-pdeschrijver@nvidia.com>
	<1320242948-21061-3-git-send-email-pdeschrijver@nvidia.com>
	<CAMbhsRSTcR8qgYESmM6OxkXeVeg6vS49woCe_OX6CY4pAj2g_A@mail.gmail.com>
	<20111103092116.GO13358@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20111103092116.GO13358@tbergstrom-lnx.Nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Stephen Warren <swarren@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 03, 2011 at 11:21:16AM +0200, Peter De Schrijver wrote:
> On Wed, Nov 02, 2011 at 07:30:43PM +0100, Colin Cross wrote:
> > On Wed, Nov 2, 2011 at 7:09 AM, Peter De Schrijver
> > <pdeschrijver@nvidia.com> wrote:
> > > This patch splits the early init code in a common and a tegra20 specific part.
> > > L2 cache initialization is generalized and discovers the cache associativity
> > > at runtime.
> > >
> > > Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> > > ---
> > <snip>
> > 
> > > -static __initdata struct tegra_clk_init_table common_clk_init_table[] = {
> > > +void (*arch_reset)(char mode, const char *cmd) = tegra_assert_system_reset;
> > > +
> > This is unrelated to the patch description?
> > 
> 
> This is a left over from the past. Will be removed from the next version.

Please can Tegra move over to hooking the restart via arm_pm_restart()
rather than via arch_reset()?  That would leave arch_reset() for
software-based reboot methods - which I suspect Tegra doesn't use.

That would allow Tegra to dovetail into the arch_reset cleanup work much
better than it would otherwise do.
