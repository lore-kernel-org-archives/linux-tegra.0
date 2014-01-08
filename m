From: Mike Turquette <mturquette@linaro.org>
Subject: Re: pull request for some small fixes
Date: Wed, 08 Jan 2014 08:27:57 -0800
Message-ID: <20140108162757.27803.23767@quantum>
References: <20131223162705.GE3378@tbergstrom-lnx.Nvidia.com>
 <20140106054322.26907.37296@quantum>
 <20140107125122.GC26588@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20140107125122.GC26588@tbergstrom-lnx.Nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

Quoting Peter De Schrijver (2014-01-07 04:51:22)
> On Mon, Jan 06, 2014 at 06:43:22AM +0100, Mike Turquette wrote:
> > Quoting Peter De Schrijver (2013-12-23 08:27:05)
> > > The following changes since commit 62ce7cd62f534023224912dc9b909963f26a38da:
> > > 
> > >   clk: tegra: fix __clk_lookup() return value checks (2013-11-28 15:09:22 +0200)
> > > 
> > > are available in the git repository at:
> > >   git://nv-tegra.nvidia.com/user/pdeschrijver/linux.git clk-tegra-next-1
> > 
> > Hi Peter,
> > 
> > Do you intend for this to go as fixes for 3.13-rc8? The fixes are based
> 
> Yes.
> 
> > off of a commit from my clk-next branch.
> > 
> Do you want me to rebase them on 3.13-rc7?

Please do. I hope to send off a pull request today.

Thanks,
Mike

> 
> Cheers,
> 
> Peter.
