From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH v2] mfd: tps6586x: avoid burst writes
Date: Mon, 28 Feb 2011 02:23:49 +0100
Message-ID: <20110228012348.GG2749@sortiz-mobl>
References: <1298522893-2465-1-git-send-email-vwadekar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1298522893-2465-1-git-send-email-vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ARitger-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bnihalani-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, stable-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On Thu, Feb 24, 2011 at 10:18:13AM +0530, vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org wrote:
> tps6586 does not support burst writes. i2c writes have to be
> 1 byte at a time.
Patch applied to my for-next and for-linus branches, thanks.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
