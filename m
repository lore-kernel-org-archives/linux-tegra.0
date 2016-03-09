From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [tegrarcm PATCH v1 4/4] Increate USB timeout value
Date: Wed, 9 Mar 2016 01:41:20 +0000
Message-ID: <973e4d88a8a24062964655a6ec3b2c71@HQMAIL103.nvidia.com>
References: <1457135087-967-1-git-send-email-jimmzhang@nvidia.com>
 <1457135087-967-5-git-send-email-jimmzhang@nvidia.com>
 <56DDD90B.1040802@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56DDD90B.1040802-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



> -----Original Message-----
> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> Sent: Monday, March 07, 2016 11:40 AM
> To: Jimmy Zhang
> Cc: Allen Martin; Stephen Warren; alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org; linux-
> tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [tegrarcm PATCH v1 4/4] Increate USB timeout value
> 
> On 03/04/2016 04:44 PM, Jimmy Zhang wrote:
> > It has been observed that some times USB time out could occure when a
> > long (3ft) usb cable is connected to recovery mode usb port
> 
> This explanation makes no sense. 3ft is practically the shortest USB cable
> anyone would use. Equally, assuming a compliant correctly functioning cable,
> cable length doesn't affect the time it takes to execute transactions.
> 
> Is the issue more that if a low quality cable is used, then there are lots of
> transfer errors, and the time taken for retries is large? If so, there's not much
> guarantee that a larger timeout would help in general, since there's no
> guarantee of any upper bound on the time it takes for a packet not to get
> corrupted in this case. Still, I suppose it's fine to increase the timeout to
> account for when it accidentally works.
> 
> In summary: a commit description that more accurately represents the
> problem being solved is required.

We have seen this problem since T30/T114. Initially we just retried by downloading again. It may work after a few tries. Later, we found a simple solution is replacing with a shorter cable. Then one day, for testing purpose, when the timeout value was replaced with 0, ie, unlimited timeout, all cables work fine. So, it may worth to figure out the root cause.
   
