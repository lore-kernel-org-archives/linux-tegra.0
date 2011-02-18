From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] mfd: tps6586x: avoid burst writes
Date: Fri, 18 Feb 2011 18:43:54 +0000
Message-ID: <20110218184354.GA21195@opensource.wolfsonmicro.com>
References: <1297764222-29803-1-git-send-email-vwadekar@nvidia.com> <20110217015216.GE5824@sirena.org.uk> <4D5DF973.8080908@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4D5DF973.8080908-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andy Ritger <ARitger-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bharat Nihalani <bnihalani-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 18, 2011 at 10:15:39AM +0530, Varun Wadekar wrote:

> Mark, confirmed with TI and they say that the entire tps6586x family has
> this behavior so this patch seems ok. The entire family has this
> limitation and so we have to write one byte at a time.

OK, that's good to have confirmed - in that case this should go into
2.6.38 as a bugfix since clearly any device which tries to do a bulk
operation is broken at the minute.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
