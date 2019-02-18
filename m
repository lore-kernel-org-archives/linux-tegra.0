From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: next-20190215 build: 2 failures 19 warnings (next-20190215)
Date: Mon, 18 Feb 2019 13:09:21 +0100
Message-ID: <20190218120921.GA11524@kroah.com>
References: <E1gukSa-0003kX-JD@optimist> <20190218113217.GA10794@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190218113217.GA10794@sirena.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Mark Brown <broonie@kernel.org>
Cc: linaro-kernel@lists.linaro.org, kernel-build-reports@lists.linaro.org, Jassi Brar <jaswinder.singh@linaro.org>, linux-next@vger.kernel.org, linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 18, 2019 at 11:32:17AM +0000, Mark Brown wrote:
> On Fri, Feb 15, 2019 at 08:51:48PM +0000, Build bot for Mark Brown wrote:
> 
> The build failure with mbox_fush() in the tegra-tcu driver that was
> initially reported two weeks ago is still present in -next (this report
> is from Friday but it's also present today):
> 
> > 	arm64-allmodconfig
> > ERROR: "mbox_flush" [drivers/tty/serial/tegra-tcu.ko] undefined!
> > 
> > 	arm-allmodconfig
> > ERROR: "mbox_flush" [drivers/tty/serial/tegra-tcu.ko] undefined!
> 
> Is there any progress on getting a fix merged?

I can take the fix in my tty tree if I get an ack from the mbox
maintainer...
