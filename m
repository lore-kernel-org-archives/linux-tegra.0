From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH 2/2] soc/tegra: pmc: Avoid crash for non-wake IRQs
Date: Mon, 3 Jun 2019 10:20:38 +0300
Message-ID: <20190603072038.GB29894@pdeschrijver-desktop.Nvidia.com>
References: <20190529102654.14665-1-thierry.reding@gmail.com>
 <20190529102654.14665-2-thierry.reding@gmail.com>
 <27ffbfe6-1c88-63a1-aee1-7fe6ce252e54@nvidia.com>
 <20190531102858.GA21355@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190531102858.GA21355@ulmo>
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
Cc: linux-tegra@vger.kernel.org, Bitan Biswas <bbiswas@nvidia.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Fri, May 31, 2019 at 12:28:58PM +0200, Thierry Reding wrote:
> On Fri, May 31, 2019 at 10:32:40AM +0100, Jon Hunter wrote:
> > 
> > 
> > On 29/05/2019 11:26, Thierry Reding wrote:
> > > From: Thierry Reding <treding@nvidia.com>
> > > 
> > > For interrupts that are not wakeup sources but that may end up getting
> > > mapped through the PMC as interrupt parent (this can happen for GPIOs),
> > > return early in order to avoid a subsequent crash from an out-of-bounds
> > > access to the register region.
> > 
> > Maybe worth clarifying here what you mean by 'not wakeup sources'
> > because the Tegra GPIO driver does have a set_wake() API to enable
> > wakeup at the LIC IIRC. So maybe GPIOs that are not wakeup sources for
> > what level of suspend?
> 
> Wakeup sources in the context of PMC is always LP0 wakeup sources. At
> that point I don't think LIC is enabled anymore. So LIC is to wake up
> from LP1 (and perhaps LP2), while PMC wakeup sources need to be
> configured in order to wake up from LP0.
> 
> Adding Peter to confirm, I think he's more familiar with the power
> states on earlier chips than I am.

Yes. LIC is in a domain which is off during SC7 so it can't trigger a
wakeup.

Peter.
