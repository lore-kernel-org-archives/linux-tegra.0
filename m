From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 3/4] reset: tegra: check BPMP response return code
Date: Tue, 17 Oct 2017 12:52:17 +0200
Message-ID: <1508237537.6854.8.camel@pengutronix.de>
References: <cover.1504776489.git.talho@nvidia.com>
         <00e7714871d7568e9fc848dc5f76d14e07984a1e.1504776489.git.talho@nvidia.com>
         <20171017104043.GB30589@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171017104043.GB30589@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

On Tue, 2017-10-17 at 12:40 +0200, Thierry Reding wrote:
> On Thu, Sep 07, 2017 at 12:31:03PM +0300, Timo Alho wrote:
> > Add checks for return code in BPMP response message.
> > 
> > Signed-off-by: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/reset/tegra/reset-bpmp.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> Hi Philipp,
> 
> Would you provide an Acked-by on this so that I can take it into the
> Tegra tree? There's a build dependency on patch 1/4 in the series.

Acked-by: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>

to take this via the Tegra tree.

> Quoting in full since you were not previously on Cc, unfortunately.
> 
> Timo, please remember to always Cc the relevant maintainers.
> 
> Thierry
> 
> > diff --git a/drivers/reset/tegra/reset-bpmp.c b/drivers/reset/tegra/reset-bpmp.c
> > index 5daf2ee..fac2db6 100644
> > --- a/drivers/reset/tegra/reset-bpmp.c
> > +++ b/drivers/reset/tegra/reset-bpmp.c
> > @@ -23,6 +23,7 @@ static int tegra_bpmp_reset_common(struct reset_controller_dev *rstc,
> >  	struct tegra_bpmp *bpmp = to_tegra_bpmp(rstc);
> >  	struct mrq_reset_request request;
> >  	struct tegra_bpmp_message msg;
> > +	int err;
> >  
> >  	memset(&request, 0, sizeof(request));
> >  	request.cmd = command;
> > @@ -33,7 +34,13 @@ static int tegra_bpmp_reset_common(struct reset_controller_dev *rstc,
> >  	msg.tx.data = &request;
> >  	msg.tx.size = sizeof(request);
> >  
> > -	return tegra_bpmp_transfer(bpmp, &msg);
> > +	err = tegra_bpmp_transfer(bpmp, &msg);
> > +	if (err < 0)
> > +		return err;
> > +	else if (msg.rx.ret < 0)
> > +		return -EINVAL;

I don't really understand why you complicate the call sites like this
instead of just letting tegra_bmp_transfer return -EINVAL if msg.rx.ret
< 0, but I haven't seen the other patches.

regards
Philipp
