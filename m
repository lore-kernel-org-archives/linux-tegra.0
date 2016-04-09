From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH v1] Enhance sign script
Date: Fri, 8 Apr 2016 23:29:23 -0600
Message-ID: <57089333.2020809@wwwdotorg.org>
References: <1460167893-10803-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1460167893-10803-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/08/2016 08:11 PM, Jimmy Zhang wrote:
> 1. Add parameter <soc> to sign tegra124 bootimage. Previously it can only sign
>     for tegra210
> 2. Automatically generated signed bct. A signed bct is needed during flashing.
>
> Jimmy Zhang (1):
>    Add more features

When there is just one patch, or even when there are multiple patches 
but there's no need for a series-level explanation, please don't send a 
cover letter since it adds no information.

When sending a cover letter, please name it "PATCH 0/n", and name the 
patches "m/n". "git format-patch" and "git format-patch --cover-letter" 
will do this automatically, so it's less work to do the right thing:-)
