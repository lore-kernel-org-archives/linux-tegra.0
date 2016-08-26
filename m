From: Shardar Mohammed <smohammed-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v8 1/3] i2c: tegra: use readx_poll_timeout after
 config_load reg programmed
Date: Fri, 26 Aug 2016 09:19:40 +0000
Message-ID: <362fc8af7f8d411c8af36b34c6165c1b@bgmail102.nvidia.com>
References: <1464356224-10339-1-git-send-email-smohammed@nvidia.com>
 <20160619172136.GE2933@tetsubishi>
 <6d21b4bd199844e3a359cc52823045db@bgmail102.nvidia.com>
 <20160825193952.GC1614@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160825193952.GC1614@katana>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org" <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> -----Original Message-----
> From: Wolfram Sang [mailto:wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org]
> Sent: Friday, August 26, 2016 1:10 AM
> To: Shardar Mohammed
> Cc: Laxman Dewangan; swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org;
> thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org;
> linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [PATCH v8 1/3] i2c: tegra: use readx_poll_timeout after
> config_load reg programmed
> 
> * PGP Signed by an unknown key
> 
> 
> > > > +		err = readx_poll_timeout(readl, i2c_dev->base + reg_offset,
> > > > +					 val, val == 0, 1000,
> > > > +					 I2C_CONFIG_LOAD_TIMEOUT);
> > >
> > > Any reason we can't use readl_poll_timeout() here?
> > [Shardar] Can be used, will change and push the new patchset.
> 
> Still interested? Should be an easy change, but I am reluctant to fix it here
> with no testing.
[Shardar] Will push the change by tomorrow.
> 
> 
> * Unknown Key
> * 0x14A029B6
