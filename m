From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: Re: [PATCH 0/6] drivers/dma: drop modular code from non modular
 drivers
Date: Wed, 9 Dec 2015 19:17:42 -0500
Message-ID: <20151210001741.GT22885@windriver.com>
References: <1449703322-17762-1-git-send-email-paul.gortmaker@windriver.com>
 <7162994.ydt4N8UgZZ@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <7162994.ydt4N8UgZZ@wuerfel>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Vinod Koul <vinod.koul@intel.com>, linux-kernel@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>, dmaengine@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Daniel Mack <daniel@zonque.org>, linux-tegra@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Robert Jarzmik <robert.jarzmik@free.fr>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

[Re: [PATCH 0/6] drivers/dma: drop modular code from non modular drivers] On 10/12/2015 (Thu 00:29) Arnd Bergmann wrote:

> On Wednesday 09 December 2015 18:21:56 Paul Gortmaker wrote:
> > This series of commits is a slice of a larger project to ensure
> > people don't have dead code for module removal in non-modular
> > drivers.  Overall there is roughly 5k lines of dead code in the
> > kernel due to this.
> > 
> > There is a quasi-separate theme, in that some of the drivers were
> > allowing an unbind implicitly since it is enabled by default.  But
> > for core DMA infrastructure drivers, this doesn't seem useful -- so
> > we also disable that here which allows us to delete any ".remove"
> > functions from the drivers that would otherwise be called during the
> > (impossible to trigger) module removal.
> > 
> > Since ARM covers these files the best of all architectures, each
> > file was build tested for allmodconfig on ARM, which at the same
> > time confirms that the files are not built with "CC [M]" -- hence
> > genuinely non-modular.
> > 
> > My testing and the larger patch series in general has been done
> > against the latest linux-next tree.
> > 
> > 
> 
> We are in the process of changing the DMA drivers to a new way of
> passing the "filter" function around. We can soon build them
> all as loadable modules again.

Hi Arnd,

Thanks for the feedback -- just to clarify, you are suggesting I hold
on the series until I see what emerges in the next merge window?

Paul.
--

> 
> 	Arnd
