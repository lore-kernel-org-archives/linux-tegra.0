From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: powergate: Don't error out if new
 state == old state
Date: Fri, 29 Mar 2013 08:50:03 +0800
Message-ID: <1364518203.2809.4.camel@jlo-ubuntu-64.nvidia.com>
References: <1364502904-5284-1-git-send-email-thierry.reding@avionic-design.de>
	 <1364502904-5284-2-git-send-email-thierry.reding@avionic-design.de>
	 <5154D106.40608@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5154D106.40608-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, 2013-03-29 at 07:23 +0800, Stephen Warren wrote:
> On 03/28/2013 02:35 PM, Thierry Reding wrote:
> > Don't treat it as an error if a partition is already in the same power
> > state when a user wants to power it on or off. This allows code to
> > proceed if no state change is required.
> 
> Joseph, I think you had argued specifically against making this change
> in the past. Are you OK with this?

Oh, that is because I use the same function for CPU hot plug power
control, and I need to know the power status when doing power control.
But I moved all the CPU power control function into PMC driver. So I am
OK with this change.

Thanks,
Joseph
