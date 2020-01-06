From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] mmc: tegra: fix SDR50 tuning override
Date: Mon, 6 Jan 2020 13:27:45 +0100
Message-ID: <20200106122745.GA3414443@kroah.com>
References: <245d569e4c258063dbd78bd30c7027638b30f059.1577960737.git.mirq-linux@rere.qmqm.pl>
 <20200106120718.GA1955714@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200106120718.GA1955714@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Lucas Stach <dev@lynxeye.de>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Jan 06, 2020 at 01:07:18PM +0100, Thierry Reding wrote:
> On Thu, Jan 02, 2020 at 11:30:50AM +0100, Michał Mirosław wrote:
> > Commit 7ad2ed1dfcbe inadvertently mixed up a quirk flag's name and
> > broke SDR50 tuning override. Use correct NVQUIRK_ name.
> > 
> > Fixes: 7ad2ed1dfcbe ("mmc: tegra: enable UHS-I modes")
> > Depends-on: 4f6aa3264af4 ("mmc: tegra: Only advertise UHS modes if IO regulator is present")
> > Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
> > ---
> >  drivers/mmc/host/sdhci-tegra.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Oh my... good catch!
> 
> Reviewed-by: Thierry Reding <treding@nvidia.com>
> 
> I also ran this through our internal test system and all tests pass, so
> also:
> 
> Tested-by: Thierry Reding <treding@nvidia.com>
> 
> I'm not sure if that "Depends-on:" tag is anything that's recognized
> anywhere. It might be better to turn that into an additional "Fixes:"
> line. Adding Greg to see if he has a standard way of dealing with this
> kind of dependency.
> 
> Greg, what's your preferred way to handle these situations? I think the
> intention here was to describe that the original error was introduced by
> commit 7ad2ed1dfcbe ("mmc: tegra: enable UHS-I modes"), but then commit
> 4f6aa3264af4 ("mmc: tegra: Only advertise UHS modes if IO regulator is
> present") moved that code around, so this patch here will only be back-
> portable until the latter commit, but should be backported until the
> former.

The stable kernel rules document says how to handle this, but the
"depends on" commit id in the comment to the right of the stable@k.o cc:
line in the changelog area.

thanks,

greg k-h
