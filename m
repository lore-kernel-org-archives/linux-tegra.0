From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC 1/1] driver core: Add dev_*_ratelimited() family
Date: Mon, 14 May 2012 07:40:14 +0200
Message-ID: <20120514.084014.1683295633804914511.hdoyu@nvidia.com>
References: <1336836695.17605.12.camel@joe2Laptop><20120514.080008.1401340884821155549.hdoyu@nvidia.com><1336973155.2656.10.camel@joe2Laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1336973155.2656.10.camel@joe2Laptop>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org" <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org> wrote @ Mon, 14 May 2012 07:25:55 +0200:

> On Mon, 2012-05-14 at 07:00 +0200, Hiroshi Doyu wrote:
> > Hi Joe,
> > 
> > Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org> wrote @ Sat, 12 May 2012 17:31:35 +0200:
> > 
> > > On Sat, 2012-05-12 at 12:52 +0200, Hiroshi Doyu wrote:
> > > > Hi,
> > > > 
> > > > An unclosed "if" statement in the MACRO seems a bit risky, but I don't
> > > > have any better/simple solution for this, ATM. Is there any alternative?
> > > 
> > > maybe something like:
> > > 
> > > #define dev_ratelimited_level(dev, level, fmt, ...)
> > > do {
> > > 	static DEFINE_RATELIMIT_STATE(_rs,				\
> > > 				      DEFAULT_RATELIMIT_INTERVAL,	\
> > > 				      DEFAULT_RATELIMIT_BURST);		\
> > > 	if (__ratelimit(&_rs))						\
> > > 		dev_##level(fmt, ##__VA_ARGS__);			\
> > > } while (0)
> > > 
> > > #define dev_emerg_ratelimited(dev, fmt, ...)				\
> > > 	dev_ratelimited_level(dev, emerg, fmt, ##__VA_ARGS__)
> > > #define dev_alert_ratelimited(dev, fmt, ...)				\
> > > 	dev_ratelimited_level(dev, alert, fmt, ##__VA_ARGS__)
> > > #define dev_crit_ratelimited(dev, fmt, ...)				\
> > > 	dev_ratelimited_level(dev, crit, fmt, ##__VA_ARGS__)
> > > #define dev_err_ratelimited(dev, fmt, ...)				\
> > > 	dev_ratelimited_level(dev, err, fmt, ##__VA_ARGS__)
> > > #define dev_warn_ratelimited(dev, fmt, ...)				\
> > > 	dev_ratelimited_level(dev, warn, fmt, ##__VA_ARGS__)
> > > #define dev_notice_ratelimited(dev, fmt, ...)				\
> > > 	dev_ratelimited_level(dev, notice, fmt, ##__VA_ARGS__)
> > > #define dev_info_ratelimited(dev, fmt, ...)				\
> > > 	dev_ratelimited_level(dev, info, fmt, ##__VA_ARGS__)
> > > #define dev_dbg_ratelimited(dev, fmt, ...)				\
> > > 	dev_ratelimited_level(dev, dbg, fmt, ##__VA_ARGS__)
> > 
> > "dev" isn't handled separately with __VA_ARGS__, and failed to build
> > as below:
> > 
> >   Example:
> >     dev_err_ratelimited(&pdev->dev, "%d\n", __LINE__);
> >   
> >   After preprocessded:
> >     do { ... if (___ratelimit(&_rs, __func__)) dev_err("%d\n", 18); } while (0);
> > 
> 
> Sorry, I was just typing in the email client and
> I missed the "dev" argument.
> 
> Add "dev" to the dev_##level statement like:
> 
> #define dev_ratelimited_level(dev, level, fmt, ...)			\
> do {									\
> 	static DEFINE_RATELIMIT_STATE(_rs,				\
> 				      DEFAULT_RATELIMIT_INTERVAL,	\
> 				      DEFAULT_RATELIMIT_BURST);		\
> 	if (__ratelimit(&_rs))						\
> 		dev_##level(dev, fmt, ##__VA_ARGS__);			\
> } while (0)

Verified that the above works. Would you mind sending the complete version of this patch?
