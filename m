From: Hiroshi Doyu <hdoyu@nvidia.com>
Subject: Re: [RFC 1/1] driver core: Add dev_*_ratelimited() family
Date: Mon, 14 May 2012 07:00:08 +0200
Message-ID: <20120514.080008.1401340884821155549.hdoyu@nvidia.com>
References: <20120512.135227.1196366807162247040.hdoyu@nvidia.com><1336836695.17605.12.camel@joe2Laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1336836695.17605.12.camel@joe2Laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: "joe@perches.com" <joe@perches.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hi Joe,

Joe Perches <joe@perches.com> wrote @ Sat, 12 May 2012 17:31:35 +0200:

> On Sat, 2012-05-12 at 12:52 +0200, Hiroshi Doyu wrote:
> > Hi,
> > 
> > An unclosed "if" statement in the MACRO seems a bit risky, but I don't
> > have any better/simple solution for this, ATM. Is there any alternative?
> 
> maybe something like:
> 
> #define dev_ratelimited_level(dev, level, fmt, ...)
> do {
> 	static DEFINE_RATELIMIT_STATE(_rs,				\
> 				      DEFAULT_RATELIMIT_INTERVAL,	\
> 				      DEFAULT_RATELIMIT_BURST);		\
> 	if (__ratelimit(&_rs))						\
> 		dev_##level(fmt, ##__VA_ARGS__);			\
> } while (0)
> 
> #define dev_emerg_ratelimited(dev, fmt, ...)				\
> 	dev_ratelimited_level(dev, emerg, fmt, ##__VA_ARGS__)
> #define dev_alert_ratelimited(dev, fmt, ...)				\
> 	dev_ratelimited_level(dev, alert, fmt, ##__VA_ARGS__)
> #define dev_crit_ratelimited(dev, fmt, ...)				\
> 	dev_ratelimited_level(dev, crit, fmt, ##__VA_ARGS__)
> #define dev_err_ratelimited(dev, fmt, ...)				\
> 	dev_ratelimited_level(dev, err, fmt, ##__VA_ARGS__)
> #define dev_warn_ratelimited(dev, fmt, ...)				\
> 	dev_ratelimited_level(dev, warn, fmt, ##__VA_ARGS__)
> #define dev_notice_ratelimited(dev, fmt, ...)				\
> 	dev_ratelimited_level(dev, notice, fmt, ##__VA_ARGS__)
> #define dev_info_ratelimited(dev, fmt, ...)				\
> 	dev_ratelimited_level(dev, info, fmt, ##__VA_ARGS__)
> #define dev_dbg_ratelimited(dev, fmt, ...)				\
> 	dev_ratelimited_level(dev, dbg, fmt, ##__VA_ARGS__)

"dev" isn't handled separately with __VA_ARGS__, and failed to build
as below:

  Example:
    dev_err_ratelimited(&pdev->dev, "%d\n", __LINE__);
  
  After preprocessded:
    do { ... if (___ratelimit(&_rs, __func__)) dev_err("%d\n", 18); } while (0);
