From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v1] ARM: tegra: Fix sd4 regulator in Jetson TK1 device
 tree
Date: Mon, 22 Sep 2014 13:06:06 -0600
Message-ID: <5420731E.6040104@wwwdotorg.org>
References: <1411408675-32315-1-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411408675-32315-1-git-send-email-vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/22/2014 11:57 AM, Vidya Sagar wrote:
> sd4 is an always on regulator which is turned on at boot time.
> It is externally controller through gpio. This change
> reflects the same in Jetson TK1 device tree

In the schematics, the "Power Sequencing" timing diagram says "S/W 
controlled" for SD4/+1.05V_RUN. I also don't see an "ENABLE1" pin on the 
AS3722, which would be required for ...

> +					ams,ext-control = <1>;

... to be valid.

What's the source of information behind this change?

What symptoms does this patch correct?
