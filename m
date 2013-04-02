From: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] clk: tegra: Export peripheral reset functions
Date: Tue, 02 Apr 2013 10:35:29 -0700
Message-ID: <20130402173529.8177.49420@quantum>
References: <1364502688-5135-1-git-send-email-thierry.reding@avionic-design.de>
 <20130402093426.GZ18519@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130402093426.GZ18519-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Quoting Peter De Schrijver (2013-04-02 02:34:26)
> On Thu, Mar 28, 2013 at 09:31:27PM +0100, Thierry Reding wrote:
> > The tegra_periph_reset_assert() and tegra_periph_reset_deassert()
> > functions can be used by drivers to reset peripherals. In order to allow
> > such drivers to be built as modules, export the functions.
> > 
> > Note that this restores the status quo as the functions were exported
> > before the move to the drivers/clk tree.
> > 
> 
> I guess we should move to the 'reset framework' at some point in the future?
> 

Yes please do.  Peripheral reset stuff should not lurk in the clock
code.  I kind of brought this point up back in June of 2012:
http://article.gmane.org/gmane.linux.ports.tegra/5346/

Back then the discussion was around removing this export from your clock
driver and putting common reset code in clk.h (which is a bad idea).
Now that the reset framework exists this stuff really should be migrated
out of the clock framework entirely.

But as long as this patch is considered an incremental change then it's
OK by me.

Regards,
Mike

> Otherwise:
> 
> Acked-By: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> 
> Cheers,
> 
> Peter.
