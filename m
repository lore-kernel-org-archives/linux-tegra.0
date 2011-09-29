From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v5 2/3] arm/tegra: add support for ventana pinmuxing
Date: Thu, 29 Sep 2011 18:27:52 +0300
Message-ID: <20110929152752.GO21166@tbergstrom-lnx.Nvidia.com>
References: <1317248978-10829-1-git-send-email-pdeschrijver@nvidia.com>
	<1317248978-10829-3-git-send-email-pdeschrijver@nvidia.com>
	<20110929092951.GE23944@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20110929092951.GE23944@n2100.arm.linux.org.uk>
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
Cc: Erik Gilling <konkers@android.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Sep 29, 2011 at 11:29:51AM +0200, Russell King - ARM Linux wrote:
> On Thu, Sep 29, 2011 at 01:29:35AM +0300, Peter De Schrijver wrote:
> > diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Makefile
> > index f11b910..91a07e1 100644
> > --- a/arch/arm/mach-tegra/Makefile
> > +++ b/arch/arm/mach-tegra/Makefile
> > @@ -31,6 +31,7 @@ obj-${CONFIG_MACH_SEABOARD}             += board-seaboard-pinmux.o
> >  
> >  obj-${CONFIG_MACH_TEGRA_DT}             += board-dt.o
> >  obj-${CONFIG_MACH_TEGRA_DT}             += board-harmony-pinmux.o
> > +obj-${CONFIG_MACH_TEGRA_DT}             += board-seaboard-pinmux.o
> 
> Since when did Tegra start using braces instead of parens in its Makefile?
> I note some of Tegra's makefile is using braces and some of it parens.
> What's the reason for this alternative style to the rest of kbuild?

I have no idea. I just followed the style used for the other CONFIG_MACH_TEGRA_DT entries. Colin or Olof, any idea?

Thanks,

Peter.
