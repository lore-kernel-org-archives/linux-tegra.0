From: Will Deacon <will.deacon@arm.com>
Subject: Re: [PATCH 3/6] arm/tegra: prepare early init for multiple tegra
	variants
Date: Fri, 28 Oct 2011 17:19:34 +0100
Message-ID: <20111028161933.GK23539@mudshark.cambridge.arm.com>
References: <1319561644-6160-1-git-send-email-pdeschrijver@nvidia.com>
	<1319561644-6160-4-git-send-email-pdeschrijver@nvidia.com>
	<74CDBE0F657A3D45AFBB94109FB122FF173E1B49B2@HQMAIL01.nvidia.com>
	<20111027201657.GP19187@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20111027201657.GP19187@n2100.arm.linux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Stephen Warren <swarren@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Olof Johansson <olof@lixom.net>, Colin Cross <ccross@android.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Oct 27, 2011 at 09:16:57PM +0100, Russell King - ARM Linux wrote:
> On Thu, Oct 27, 2011 at 01:06:13PM -0700, Stephen Warren wrote:
> > Peter De Schrijver wrote at Tuesday, October 25, 2011 10:54 AM:
> > > -static __initdata struct tegra_clk_init_table common_clk_init_table[] = {
> > > +void (*arch_reset)(char mode, const char *cmd) = tegra_assert_system_reset;
> > 
> > I'm not sure why you moved that, but I suppose it's fine.
> 
> Note that Nicolas has a patch set during KS which cleans the arch_reset
> business out of mach/system.h, and effectively gets rid of arch_reset
> entirely, so this probably conflicts with those changes.

I've spammed the ARM list with this patch series now, so the state of the
conflicts should be evident.

Will
