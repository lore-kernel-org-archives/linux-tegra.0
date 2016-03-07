From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegrarcm PATCH v1 4/4] Increate USB timeout value
Date: Mon, 7 Mar 2016 12:39:55 -0700
Message-ID: <56DDD90B.1040802@wwwdotorg.org>
References: <1457135087-967-1-git-send-email-jimmzhang@nvidia.com>
 <1457135087-967-5-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1457135087-967-5-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/04/2016 04:44 PM, Jimmy Zhang wrote:
> It has been observed that some times USB time out could occure when a long (3ft)
> usb cable is connected to recovery mode usb port

This explanation makes no sense. 3ft is practically the shortest USB 
cable anyone would use. Equally, assuming a compliant correctly 
functioning cable, cable length doesn't affect the time it takes to 
execute transactions.

Is the issue more that if a low quality cable is used, then there are 
lots of transfer errors, and the time taken for retries is large? If so, 
there's not much guarantee that a larger timeout would help in general, 
since there's no guarantee of any upper bound on the time it takes for a 
packet not to get corrupted in this case. Still, I suppose it's fine to 
increase the timeout to account for when it accidentally works.

In summary: a commit description that more accurately represents the 
problem being solved is required.
