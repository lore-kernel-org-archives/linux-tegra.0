From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V5 9/9] ARM: dts: tegra: add the PM configurations of
 PMC
Date: Tue, 02 Apr 2013 14:00:55 -0600
Message-ID: <515B38F7.5050606@wwwdotorg.org>
References: <1364901613-25080-1-git-send-email-josephl@nvidia.com> <1364901613-25080-10-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1364901613-25080-10-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/02/2013 05:20 AM, Joseph Lo wrote:
> Adding the PM configuration of PMC when the platform support suspend
> function.

For this patch, some more boards could be supported, but I think we'll
have to rely on other people (Lucas, Thierry) to send patches for them,
since they know the details of the board. It's fine to leave suspend
disabled on those boards until later.

Aside from the 1 other comment I made on this series, I think it's good
to go once your previous 3-long series is fixed and reposted per my
comments on it.
