From: Jassi Brar <jaswinder.singh@linaro.org>
Subject: Re: next-20190215 build: 2 failures 19 warnings (next-20190215)
Date: Mon, 18 Feb 2019 11:10:14 -0600
Message-ID: <CAJe_ZheryjH8EPy+gmBnnXzYWZZO+gXXCYnR7ysQexa9i4rBcQ@mail.gmail.com>
References: <E1gukSa-0003kX-JD@optimist> <20190218113217.GA10794@sirena.org.uk>
 <20190218120921.GA11524@kroah.com> <20190218150853.GA21119@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190218150853.GA21119@ulmo>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <treding@nvidia.com>
Cc: linaro-kernel@lists.linaro.org, kernel-build-reports@lists.linaro.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mark Brown <broonie@kernel.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Mon, 18 Feb 2019 at 09:08, Thierry Reding <treding@nvidia.com> wrote:
>
> On Mon, Feb 18, 2019 at 01:09:21PM +0100, Greg Kroah-Hartman wrote:
> > On Mon, Feb 18, 2019 at 11:32:17AM +0000, Mark Brown wrote:
> > > On Fri, Feb 15, 2019 at 08:51:48PM +0000, Build bot for Mark Brown wrote:
> > >
> > > The build failure with mbox_fush() in the tegra-tcu driver that was
> > > initially reported two weeks ago is still present in -next (this report
> > > is from Friday but it's also present today):
> > >
> > > >   arm64-allmodconfig
> > > > ERROR: "mbox_flush" [drivers/tty/serial/tegra-tcu.ko] undefined!
> > > >
> > > >   arm-allmodconfig
> > > > ERROR: "mbox_flush" [drivers/tty/serial/tegra-tcu.ko] undefined!
> > >
> > > Is there any progress on getting a fix merged?
> >
> > I can take the fix in my tty tree if I get an ack from the mbox
> > maintainer...
>
Not sure if I was on the CC. Honestly I only look into emails that
pass my very lenient filter. I will add 'mbox' too to it.

> Maybe we can do the below until Jassi picks up the proper fix. There is
> no hardware currently where we'd want to build the TCU driver as a
> loadable module, so that would be fine for now.
>
> It's a bit of churn because I'd want to revert that later on, but it's
> not too bad and would get linux-next back on track.
>
Maybe it should be indeed bool or rather directly selected by your
ARCH because iirc you wanted to send critical debugging messages over
tcu ;)

Anyway, I have sent a pull request with this fix in.

Cheers!
