From: Jean Delvare <khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 2/3] hwmon: (lm90) add support to handle irq
Date: Tue, 9 Jul 2013 08:49:57 +0200
Message-ID: <20130709084957.7bae5d71@endymion.delvare>
References: <1372924670-16355-1-git-send-email-wni@nvidia.com>
	<1372924670-16355-3-git-send-email-wni@nvidia.com>
	<20130709061514.GB17499@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130709061514.GB17499@mithrandir>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org, acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, lm-sensors-GZX6beZjE8VD60Wz+7aTrA@public.gmane.org, linux-kernel-u79uwXL29TZX6JHB/w77yyCwEArCW2h5@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

Thanks for the review, it is greatly appreciated. A couple additions...

On Tue, 9 Jul 2013 08:15:15 +0200, Thierry Reding wrote:
> On Thu, Jul 04, 2013 at 03:57:49PM +0800, Wei Ni wrote:
> > Add support to handle irq. When the temperature touch
> 
> Nit: This first sentence can be dropped. It merely repeats the subject.

Note that I have no problem with that.

> > (...)
> > @@ -1423,6 +1424,18 @@ static void lm90_init_client(struct i2c_client *client)
> >  		i2c_smbus_write_byte_data(client, LM90_REG_W_CONFIG1, config);
> >  }
> >  
> > +static void lm90_alert(struct i2c_client *client, unsigned int flag);
> 
> Any reason why the implementation of lm90_alert() can't be moved here.
> Granted, it'll make the diff larger but at least it'll allow us to get
> rid of the forward declaration.

Yes, please avoid forward declarations as much as possible.

-- 
Jean Delvare
