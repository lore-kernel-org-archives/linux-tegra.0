From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] i2c/tegra: I2C driver uses the
 suspend_noirq/resume_noirq
Date: Thu, 22 Sep 2011 18:01:54 +0100
Message-ID: <20110922170154.GD1045@sirena.org.uk>
References: <1312586102-27907-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1312586102-27907-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Dilan Lee <dilee-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Aug 05, 2011 at 05:15:02PM -0600, Stephen Warren wrote:
> From: Dilan Lee <dilee-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> We found the register settings of wm8903(an audio codec) can't be modified
> in snd_soc_suspend since I2C bus has been suspended before snd_soc_suspend.
> 
> Pop noise will occur when system resume from LP0 if the register settings of wm8903
> haven't be modified correctly in snd_soc_suspend.
> 
> So, we use the suspend_noirq/resume_noirq callbacks to make sure I2C bus still
> operates while running snd_soc_suspend.
> 
> Signed-off-by: Dilan Lee <dilee-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

At Stephen's request

Reviewed-by: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
