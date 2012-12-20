From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra30: tegra30 gpio is not compatible with tegra20
 gpio
Date: Thu, 20 Dec 2012 11:46:57 +0530
Message-ID: <50D2AD59.8070901@nvidia.com>
References: <1355929032-26549-1-git-send-email-ldewangan@nvidia.com> <50D1F385.7000506@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50D1F385.7000506-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 19 December 2012 10:34 PM, Stephen Warren wrote:
> On 12/19/2012 07:57 AM, Laxman Dewangan wrote:
>> tegra30 gpio controller is not compatible with the tegra20 due to
>> their bank stride i.e. Tegra20 bank stride is 0x80 where Tegra30
>> bank stride is 0x100.
> Thanks, I've been meaning to clean this up for a while, but never got
> around to it. I can apply after the merge window is closed; I don't
> think it's important enough to warrant going into 3.8 or earlier, since
> it doesn't cause any active problems.
>
> Have you checked all the other devices to make sure they're all correct to?

Not yet, I  am going one by one for finding if anything we are missing 
on IO drivers or not and then came across this.
