From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] mfd: tps6586x: avoid burst writes
Date: Thu, 17 Feb 2011 01:52:16 +0000
Message-ID: <20110217015216.GE5824@sirena.org.uk>
References: <1297764222-29803-1-git-send-email-vwadekar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1297764222-29803-1-git-send-email-vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ARitger-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bnihalani-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 15, 2011 at 03:33:42PM +0530, vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org wrote:
> tps6586 does not support burst writes. i2c writes have to be
> 1 byte at a time.

Don't know if there's ever block writes big enough to care but
presumably some of the devices in this series do support this so perhaps
the fallback to byte at a time should be conditional to avoid hurting
those that can use block writes?
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
