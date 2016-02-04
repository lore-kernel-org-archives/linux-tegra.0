From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/4] sound/soc: tegra_max98090: rename headphone jack DAPM
Date: Thu, 4 Feb 2016 09:38:05 -0700
Message-ID: <56B37E6D.20009@wwwdotorg.org>
References: <1454563862-1971-1-git-send-email-sctincman@gmail.com>
 <1454563862-1971-3-git-send-email-sctincman@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1454563862-1971-3-git-send-email-sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/03/2016 10:31 PM, Jonathan Tinkham wrote:
> The correct DAPM name for a headphone jack is "Headphone Jack"
> This is also what userspace expects, and this fixes headphone detection.

Why doesn't user-space expect what the kernel actually implements? The 
kernel should be defining the control naming.

Which user-space are you using specifically, and which part of it 
expects particular naming?

Perhaps this series needs to be parametrized based on a flag in DT, 
rather than switching the hard-coded values, so that only Venice2 can be 
affected?
