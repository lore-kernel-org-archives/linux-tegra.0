From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH V1] mfd: tps65910: Initialize irq platform data properly
Date: Mon, 20 Feb 2012 17:45:06 +0100
Message-ID: <20120220164506.GZ5387@sortiz-mobl>
References: <1326898156-11293-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1326898156-11293-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Laxman,

On Wed, Jan 18, 2012 at 08:19:16PM +0530, Laxman Dewangan wrote:
> irq_base of the tps65910 irq platform data should be
> initialized with the board provided irq_base data.
Thanks, patch applied to both my for-next and for-linus branches.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
