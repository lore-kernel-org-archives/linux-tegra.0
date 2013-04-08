From: Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Subject: Re: [Patch V4 1/2] mfd: tps65090: Fix enum in header file
Date: Mon, 8 Apr 2013 18:01:09 +0200
Message-ID: <20130408160109.GZ24058@zurbaran>
References: <1363897842-19835-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1363897842-19835-1-git-send-email-rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Rhyland,

On Thu, Mar 21, 2013 at 04:30:41PM -0400, Rhyland Klein wrote:
> The enum is missing the definition for the first bit, which makes all
> the rest off by one. Add definition for the TPS65090_IRQ_INTERRUPT bit
> which at 0.
> 
> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v4:
>  - no changes since v1
> 
>  include/linux/mfd/tps65090.h |    1 +
>  1 file changed, 1 insertion(+)
Applied, thanks.

Cheers,
Samuel.

-- 
Intel Open Source Technology Centre
http://oss.intel.com/
