From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
Subject: Re: [PATCH] mmc: tegra: fix SDR50 tuning override
Date: Tue, 7 Jan 2020 10:53:59 +0100
Message-ID: <20200107095359.GA3515@qmqm.qmqm.pl>
References: <245d569e4c258063dbd78bd30c7027638b30f059.1577960737.git.mirq-linux@rere.qmqm.pl>
 <20200106120718.GA1955714@ulmo>
 <20200106122745.GA3414443@kroah.com>
 <20200106133703.GE1955714@ulmo>
 <20200107093715.GB1028311@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200107093715.GB1028311@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Lucas Stach <dev@lynxeye.de>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 07, 2020 at 10:37:15AM +0100, Greg Kroah-Hartman wrote:
> On Mon, Jan 06, 2020 at 02:37:03PM +0100, Thierry Reding wrote:
> > On Mon, Jan 06, 2020 at 01:27:45PM +0100, Greg Kroah-Hartman wrote:
> > > On Mon, Jan 06, 2020 at 01:07:18PM +0100, Thierry Reding wrote:
> > > > On Thu, Jan 02, 2020 at 11:30:50AM +0100, Micha³ Miros³aw wrote:
> > > > > Commit 7ad2ed1dfcbe inadvertently mixed up a quirk flag's name and
> > > > > broke SDR50 tuning override. Use correct NVQUIRK_ name.
> > > > > 
> > > > > Fixes: 7ad2ed1dfcbe ("mmc: tegra: enable UHS-I modes")
> > > > > Depends-on: 4f6aa3264af4 ("mmc: tegra: Only advertise UHS modes if IO regulator is present")
> > > > > Signed-off-by: Micha³ Miros³aw <mirq-linux@rere.qmqm.pl>
> > > > > ---
> > > > >  drivers/mmc/host/sdhci-tegra.c | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > Oh my... good catch!
> > > > 
> > > > Reviewed-by: Thierry Reding <treding@nvidia.com>
> > > > 
> > > > I also ran this through our internal test system and all tests pass, so
> > > > also:
> > > > 
> > > > Tested-by: Thierry Reding <treding@nvidia.com>
> > > > 
> > > > I'm not sure if that "Depends-on:" tag is anything that's recognized
> > > > anywhere. It might be better to turn that into an additional "Fixes:"
> > > > line. Adding Greg to see if he has a standard way of dealing with this
> > > > kind of dependency.
> > > > 
> > > > Greg, what's your preferred way to handle these situations? I think the
> > > > intention here was to describe that the original error was introduced by
> > > > commit 7ad2ed1dfcbe ("mmc: tegra: enable UHS-I modes"), but then commit
> > > > 4f6aa3264af4 ("mmc: tegra: Only advertise UHS modes if IO regulator is
> > > > present") moved that code around, so this patch here will only be back-
> > > > portable until the latter commit, but should be backported until the
> > > > former.
> > > 
> > > The stable kernel rules document says how to handle this, but the
> > > "depends on" commit id in the comment to the right of the stable@k.o cc:
> > > line in the changelog area.
> > 
> > That only mentions "static" prerequisites needed by the patch, but what
> > if the prerequisites change depending on version?
> > 
> > Could I do something like this:
> > 
> > 	Cc: <stable@vger.kernel.org> # 4.4.x: abcdef: ...
> > 	Cc: <stable@vger.kernel.org> # 4.9.x: bcdefa: ...
> > 	Cc: <stable@vger.kernel.org>
> 
> Yes.
> 
> > Would that mean that the patch is selected for all stable releases
> > (because of the last line with no version prerequisite) but when applied
> > for stable-4.4 the abcdef patch gets pulled in and for stable-4.9 the
> > bcdefa dependency is applied before the patch?
> 
> Yes.
> 
> > I suppose this is perhaps a bit of an exotic case, but it might be good
> > to document it specifically because it might be fairly rare. I can draft
> > a change if you think this is useful to add.
> 
> I thought this was already in there, as others have done it in the past.
> 
> It's a _very_ exotic case, I wouldn't worry about it, just document it
> like this, and if I have problems applying the patches to stable I'll be
> sure to let you know and you can always tell me then.  That's usually
> the easiest thing to do anyway :)

I understood the wording in stable-kernel-rules.rst as meaning that
comments on Cc: lines make mentioned commit pulled in (cherry-picked).
In this case I think this is ok, but in case the pulled-in patch changes
something else (the dependency is only because of touching nearby code),
how would I specify this and avoid the hint to include the other patch?

Best Regards,
Micha³ Miros³aw
