From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [PATCH] mfd: tps65090: Add compatible string for charger subnode
Date: Thu, 11 Apr 2013 00:17:21 +0200
Message-ID: <20130410221721.GM4874@zurbaran>
References: <1365614095-5846-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1365614095-5846-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Rhyland,

On Wed, Apr 10, 2013 at 01:14:55PM -0400, Rhyland Klein wrote:
> This patch adds the of_compatible value for the tps65090 charger
> subnode used when loading the driver to find its properties
> and of_node.
> 
> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/mfd/tps65090.c |    1 +
>  1 file changed, 1 insertion(+)
Applied, thanks. And sorry for taking the wrong version.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
