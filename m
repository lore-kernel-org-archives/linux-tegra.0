From: Joe Perches <joe@perches.com>
Subject: Re: [RFC 1/1] driver core: Add dev_*_ratelimited() family
Date: Sat, 12 May 2012 08:31:35 -0700
Message-ID: <1336836695.17605.12.camel@joe2Laptop>
References: <20120512.135227.1196366807162247040.hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120512.135227.1196366807162247040.hdoyu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hiroshi Doyu <hdoyu@nvidia.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, 2012-05-12 at 12:52 +0200, Hiroshi Doyu wrote:
> Hi,
> 
> An unclosed "if" statement in the MACRO seems a bit risky, but I don't
> have any better/simple solution for this, ATM. Is there any alternative?

maybe something like:

#define dev_ratelimited_level(dev, level, fmt, ...)
do {
	static DEFINE_RATELIMIT_STATE(_rs,				\
				      DEFAULT_RATELIMIT_INTERVAL,	\
				      DEFAULT_RATELIMIT_BURST);		\
	if (__ratelimit(&_rs))						\
		dev_##level(fmt, ##__VA_ARGS__);			\
} while (0)

#define dev_emerg_ratelimited(dev, fmt, ...)				\
	dev_ratelimited_level(dev, emerg, fmt, ##__VA_ARGS__)
#define dev_alert_ratelimited(dev, fmt, ...)				\
	dev_ratelimited_level(dev, alert, fmt, ##__VA_ARGS__)
#define dev_crit_ratelimited(dev, fmt, ...)				\
	dev_ratelimited_level(dev, crit, fmt, ##__VA_ARGS__)
#define dev_err_ratelimited(dev, fmt, ...)				\
	dev_ratelimited_level(dev, err, fmt, ##__VA_ARGS__)
#define dev_warn_ratelimited(dev, fmt, ...)				\
	dev_ratelimited_level(dev, warn, fmt, ##__VA_ARGS__)
#define dev_notice_ratelimited(dev, fmt, ...)				\
	dev_ratelimited_level(dev, notice, fmt, ##__VA_ARGS__)
#define dev_info_ratelimited(dev, fmt, ...)				\
	dev_ratelimited_level(dev, info, fmt, ##__VA_ARGS__)
#define dev_dbg_ratelimited(dev, fmt, ...)				\
	dev_ratelimited_level(dev, dbg, fmt, ##__VA_ARGS__)
