From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v3 01/11] regulator: core: add API to get voltage
 constraints
Date: Wed, 7 Feb 2018 16:32:13 +0200
Message-ID: <20180207143213.GB5850@tbergstrom-lnx.Nvidia.com>
References: <1517934852-23255-1-git-send-email-pdeschrijver@nvidia.com>
 <1517934852-23255-2-git-send-email-pdeschrijver@nvidia.com>
 <20180206163544.GI5681@sirena.org.uk>
 <20180207084744.GG7031@tbergstrom-lnx.Nvidia.com>
 <20180207104351.GA6003@sirena.org.uk>
 <20180207123750.GA5850@tbergstrom-lnx.Nvidia.com>
 <20180207141846.GC6003@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180207141846.GC6003@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 07, 2018 at 02:18:46PM +0000, Mark Brown wrote:
> On Wed, Feb 07, 2018 at 02:37:51PM +0200, Peter De Schrijver wrote:
> > On Wed, Feb 07, 2018 at 10:43:51AM +0000, Mark Brown wrote:
> > > On Wed, Feb 07, 2018 at 10:47:44AM +0200, Peter De Schrijver wrote:
> > > > On Tue, Feb 06, 2018 at 04:35:44PM +0000, Mark Brown wrote:
> > > > > On Tue, Feb 06, 2018 at 06:34:02PM +0200, Peter De Schrijver wrote:
> 
> > > > > > Add API to get min/max rail voltage configured from platform for
> > > > > > given rails.
> 
> > > > > because...
> 
> > > > of the next patch where this is used to retrieve the minimum rail voltage.
> 
> > > And that in turn is needed for...?
> 
> > To calculate the required voltage for each frequency.
> 
> You're going to have to provide a much better explanation of what this
> is doing - right now it seems like an abuse of constraints.  Client
> drivers can already determine if a particular voltage they want to set
> is available via regulator_list_voltage() and so on, that's what
> constraints are there to set.  It sounds like you're trying to use them
> for something else but you're really not explaining your use case
> clearly.

There is no way to query what voltage I will actually get for a given input
voltage. If you read drivers/clk/tegra/cvb. (you did do that right?), you
will see that there is a minimum and maximum voltage defined by
charaterization which needs to be capped to the regulator generated voltages
for those points.

Peter.
