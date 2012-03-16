From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH V1 1/2] mfd: tps65910: Use correct variable name for
 regmap config
Date: Fri, 16 Mar 2012 18:53:47 +0100
Message-ID: <20120316175347.GJ20524@sortiz-mobl>
References: <1331126166-3908-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1331126166-3908-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Laxman,

On Wed, Mar 07, 2012 at 06:46:05PM +0530, Laxman Dewangan wrote:
> This was the copy-paste issue in reg cache support code where
> variable name for regmap config was not really starting from
> the device name, it was starting from some other device name.
> Fixing this so that variable name contains actual device name.
Patch applied, thanks.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
