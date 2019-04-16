From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 3/3] ARM: Enable Trusted Foundations for multiplatform
 ARM v7
Date: Tue, 16 Apr 2019 07:04:14 -0700
Message-ID: <20190416140414.GD2839@atomide.com>
References: <20190411091848.16949-1-thierry.reding@gmail.com>
 <20190411091848.16949-3-thierry.reding@gmail.com>
 <20190415172357.GC2839@atomide.com> <20190416074444.GA10907@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190416074444.GA10907@ulmo>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

* Thierry Reding <thierry.reding@gmail.com> [190416 07:45]:
> On Mon, Apr 15, 2019 at 10:23:57AM -0700, Tony Lindgren wrote:
> > Hi Thierry,
> > 
> > * Thierry Reding <thierry.reding@gmail.com> [190411 09:19]:
> > > --- a/arch/arm/configs/multi_v7_defconfig
> > > +++ b/arch/arm/configs/multi_v7_defconfig
> > > @@ -141,6 +141,7 @@ CONFIG_ARM_CPUIDLE=y
> > >  CONFIG_ARM_ZYNQ_CPUIDLE=y
> > >  CONFIG_ARM_EXYNOS_CPUIDLE=y
> > >  CONFIG_KERNEL_MODE_NEON=y
> > > +CONFIG_TRUSTED_FOUNDATIONS=y
> > >  CONFIG_NET=y
> > >  CONFIG_PACKET=y
> > >  CONFIG_UNIX=y
> > 
> > I'm updating my branch for make savedefconfig clean-up
> > for multi_v7_defconfig as posted earlier in thread
> > "[PATCHv2 0/2] Update multi_v7_defconfig for dropped
> > and moved options", looks like this commit causes
> > a trivial merge conflict.
> > 
> > Can we consider your branch immutable for commit
> > 8b695aa58cc4 ("ARM: Enable Trusted Foundations for
> > multiplatform ARM v7")?
> 
> In general, the for-next branch from the Tegra tree is not stable. The
> individual branches that make up for-next are. In this case it would be
> for-5.2/arm/defconfig. However...
> 
> > I'd like to merge that one in to avoid an unecessary
> > merge conflict.
> 
> It's slightly tricky because I generated the multi_v7_defconfig on top
> of a different branch (because the TRUSTED_FOUNDATIONS symbol moves
> around in that branch), so if you base your update on top of my branch,
> the symbol will likely get moved around again.
> 
> Perhaps better would be if you provide a stable branch with the update
> and then I can rebase this patch on top.
> 
> Would that work for you?

OK sure, I'll push out a branch against v5.1-rc1 with just the
savedefconfig changes.

Regards,

Tony
