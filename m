From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegrarcm PATCH v1 6/8] tegrarcm: increase USB timeout
Date: Thu, 19 Mar 2015 13:35:32 -0600
Message-ID: <550B2504.9010606@wwwdotorg.org>
References: <1426639141-12060-1-git-send-email-jimmzhang@nvidia.com> <1426639141-12060-8-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426639141-12060-8-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/17/2015 06:38 PM, Jimmy Zhang wrote:
> From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Increase USB timeout from 1ms to 3ms to avoid flashing failure
> happened when a long USB cable (5ft ?) is used.

This really doesn't make any sense; cable length isn't going to make 
more than some ns of timing difference, unless corrupted packets cause 
lots of retries. I'd suggest replacing the bad cable if that's really 
the cause.
