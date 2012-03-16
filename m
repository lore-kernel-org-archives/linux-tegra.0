From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH V2 2/2] mfd: tps65910: Add support for device sleep
Date: Fri, 16 Mar 2012 18:55:47 +0100
Message-ID: <20120316175547.GK20524@sortiz-mobl>
References: <1331126166-3908-1-git-send-email-ldewangan@nvidia.com>
 <1331126166-3908-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1331126166-3908-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, lrg-l0cyMroinI0@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Laxman,

On Wed, Mar 07, 2012 at 06:46:06PM +0530, Laxman Dewangan wrote:
> Adding support for device sleep through the external
> input control signal "SLEEP".
> Changing the SLEEP signal state can switch the device
> into SLEEP and ACTIVE state.
> Also adding sleep configuration for different resources
> so that they should be keep on during sleep state of
> device.

This one doesn't apply against my for-next branch. Could you please rebase it?

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
