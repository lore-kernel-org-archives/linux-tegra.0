From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2] regulator: fixed: Support for open drain gpio pin
Date: Tue, 3 Apr 2012 10:47:46 +0530
Message-ID: <4F7A87FA.9050507@nvidia.com>
References: <1331116113-22565-1-git-send-email-ldewangan@nvidia.com> <20120402221853.GL3160@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120402221853.GL3160-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ldewanagn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org" <ldewanagn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 03 April 2012 03:48 AM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Wed, Mar 07, 2012 at 03:58:33PM +0530, Laxman Dewangan wrote:
>> Adding flag on fixed regulator board configuration structure
>> to specify whether gpio is open drain type or not.
> Applied, but I had to fix up some conflicts caused by other development
> that had happened in the meantime.  Please check that I resolved those
> correctly.

Verified that the patch applied correctly.

Thanks,
Laxman
