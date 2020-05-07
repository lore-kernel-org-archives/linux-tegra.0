From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Subject: Re: [PATCH 2/5] i2c: tegra: Restore pinmux on system resume
Date: Thu, 7 May 2020 14:20:35 +0200
Message-ID: <20200507122035.GA5408@qmqm.qmqm.pl>
References: <20200506193358.2807244-1-thierry.reding@gmail.com>
 <20200506193358.2807244-3-thierry.reding@gmail.com>
 <20200506224336.GA23423@qmqm.qmqm.pl>
 <20200507100315.GA2890327@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200507100315.GA2890327@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, May 07, 2020 at 12:03:15PM +0200, Thierry Reding wrote:
> On Thu, May 07, 2020 at 12:43:36AM +0200, mirq-test-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org wrote:
> > On Wed, May 06, 2020 at 09:33:55PM +0200, Thierry Reding wrote:
> > [...]
> > > --- a/drivers/i2c/busses/i2c-tegra.c
> > > +++ b/drivers/i2c/busses/i2c-tegra.c
> > > @@ -1769,10 +1769,14 @@ static int tegra_i2c_remove(struct platform_device *pdev)
> > >  static int __maybe_unused tegra_i2c_suspend(struct device *dev)
> > >  {
> > >  	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
> > > +	int err = 0;
> > >  
> > >  	i2c_mark_adapter_suspended(&i2c_dev->adapter);
> > >  
> > > -	return 0;
> > > +	if (!pm_runtime_status_suspended(dev))
> > > +		err = tegra_i2c_runtime_suspend(dev);
> > > +
> > > +	return err;
> > >  }
> > >  
> > >  static int __maybe_unused tegra_i2c_resume(struct device *dev)
> > > @@ -1788,9 +1792,11 @@ static int __maybe_unused tegra_i2c_resume(struct device *dev)
> > >  	if (err)
> > >  		return err;
> > >  
> > > -	err = tegra_i2c_runtime_suspend(dev);
> > > -	if (err)
> > > -		return err;
> > > +	if (pm_runtime_status_suspended(dev)) {
> > [...]
> > Shouldn't this be negated as in suspend? I would assume that inbetween
> > suspend and resume nothing changes the stored state.
> 
> I know this is confusing because I have now twice had the same doubts
> after looking at the patch after I sent it out and thought I had sent
> out a wrong version.
> 
> However, I think it starts to make more sense when you look at the
> resulting code, which I'll reproduce below:
> 
> 	static int __maybe_unused tegra_i2c_resume(struct device *dev)
> 	{
> 		struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
> 		int err;
> 
> 		err = tegra_i2c_runtime_resume(dev);
> 		if (err)
> 			return err;
> 
> 		err = tegra_i2c_init(i2c_dev, false);
> 		if (err)
> 			return err;
> 
> 		if (pm_runtime_status_suspended(dev)) {
> 			err = tegra_i2c_runtime_suspend(dev);
> 			if (err)
> 				return err;
> 		}
> 
> 		i2c_mark_adapter_resumed(&i2c_dev->adapter);
> 
> 		return 0;
> 	}
> 
> So the purpose here is to runtime resume the I2C controller temporarily
> so that the register context can be reprogrammed because it was lost
> during suspend. Now, if the controller was runtime suspended prior to
> system suspend, we want to put it back into suspend after the context
> was loaded again. Conversely, if it was not runtime suspended, then we
> want to keep it on.
> 
> If it helps I can sprinkle some comments throughout this function to try
> and explain why exactly this is being done.

Now it makes sense. Thanks!

The full function is the missing context. What you wrote here 
put in commit message should also do the job.

Best Regards,
Micha³ Miros³aw
