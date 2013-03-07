From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 06/10] ARM: dts: tegra: add the PM configurations of PMC
Date: Thu, 7 Mar 2013 19:18:43 +0800
Message-ID: <1362655123.1890.30.camel@jlo-ubuntu-64.nvidia.com>
References: <1362397259-5888-1-git-send-email-josephl@nvidia.com>
	 <51364024.3070203@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51364024.3070203-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 2013-03-06 at 02:57 +0800, Stephen Warren wrote:
> On 03/04/2013 04:40 AM, Joseph Lo wrote:
> > Adding the PM configuration of PMC when the platform support suspend
> > function.
> 
> I think this patch should come after the current patch 9/10. The reason
> is that this patch enables system suspend using LP2 mode on the boards,
> yet patches 8/10 and 9/10 are required for system suspend to operate
> correctly.
Yes.
Will re-order that.

Thanks,
Joseph
